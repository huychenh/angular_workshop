using Microsoft.AspNetCore.Mvc;
using System;
using System.Net;
using Workshop.APIs.Repositories;
using Workshop.Common.Models;
using Workshop.Common.Responses;
using Workshop.Common.Responses.Objects;

namespace Workshop.APIs.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TaskController : ControllerBase
    {
        private readonly ITaskRepository _taskRepository;

        public TaskController(ITaskRepository task)
        {
            _taskRepository = task;
        }

        [HttpGet]
        [Route("list")]
        public TaskResponse Get()
        {
            var response = new TaskResponse();

            try
            {
                response.Tasks = _taskRepository.GetAll();
            }
            catch (Exception ex)
            {
                response.Notification = new NotificationDto
                {
                    NotificationCode = HttpStatusCode.InternalServerError,
                    ErrorMessage = ex.Message
                };
            }

            return response;
        }

        [HttpGet]
        [Route("listByStatus/{status}")]
        public TaskResponse GetListByStatus(string status)
        {
            var response = new TaskResponse();

            try
            {
                response.Tasks = _taskRepository.GetAllByStatus(status);
            }
            catch (Exception ex)
            {
                response.Notification = new NotificationDto
                {
                    NotificationCode = HttpStatusCode.InternalServerError,
                    ErrorMessage = ex.Message
                };
            }

            return response;
        }

        [HttpGet]
        [Route("details/{id}")]
        public TaskResponse Get(int id)
        {
            var response = new TaskResponse();

            try
            {
                response.Task = _taskRepository.GetById(id);
            }
            catch (Exception ex)
            {
                response.Notification = new NotificationDto
                {
                    NotificationCode = HttpStatusCode.InternalServerError,
                    ErrorMessage = ex.Message
                };
            }

            return response;
        }

        [HttpDelete]
        [Route("delete")]
        public TaskResponse Delete(TaskModel model)
        {
            var response = new TaskResponse();
            try
            {
                bool result = _taskRepository.Delete(model);
                if (result)
                {
                    response.Notification = new NotificationDto
                    {
                        NotificationCode = HttpStatusCode.OK,
                        InfoMessage = "Delete successfully - Id: " + model.Id + "."
                    };
                }
            }
            catch (Exception ex)
            {
                response.Notification = new NotificationDto
                {
                    NotificationCode = HttpStatusCode.InternalServerError,
                    ErrorMessage = ex.Message
                };
            }

            return response;
        }

        [HttpPost]
        [Route("create")]
        public TaskResponse Create(TaskModel model)
        {
            var response = new TaskResponse();
            try
            {
                int id = _taskRepository.Insert(model);
                if (id > 0)
                {
                    response.Notification = new NotificationDto
                    {
                        NotificationCode = HttpStatusCode.OK,
                        InfoMessage = "Insert sucessfully - Id: " + id + "."
                    };

                    response.Task = new TaskModel()
                    {
                        Id = id
                    };
                }
                else
                {
                    response.Notification = new NotificationDto
                    {
                        NotificationCode = HttpStatusCode.InternalServerError,
                        InfoMessage = "Insert unsucessfully."
                    };
                }
            }
            catch (Exception ex)
            {
                response.Notification = new NotificationDto
                {
                    NotificationCode = HttpStatusCode.InternalServerError,
                    ErrorMessage = ex.Message
                };
            }

            return response;
        }

        [HttpPut]
        [Route("edit")]
        public TaskResponse Edit(TaskModel model)
        {
            var response = new TaskResponse();
            try
            {
                bool result = _taskRepository.Update(model);
                if (result)
                {
                    response.Notification = new NotificationDto
                    {
                        NotificationCode = HttpStatusCode.OK,
                        InfoMessage = "Update sucessfully - Id: " + model.Id + "."
                    };
                }
                else
                {
                    response.Notification = new NotificationDto
                    {
                        NotificationCode = HttpStatusCode.InternalServerError,
                        InfoMessage = "Update unsucessfully."
                    };
                }
            }
            catch (Exception ex)
            {
                response.Notification = new NotificationDto
                {
                    NotificationCode = HttpStatusCode.InternalServerError,
                    ErrorMessage = ex.Message
                };
            }

            return response;
        }
    }
}
