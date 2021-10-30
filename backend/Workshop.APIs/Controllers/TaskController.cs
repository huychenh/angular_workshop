using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Net;
using Workshop.APIs.Models;
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

        [HttpPut]
        [Route("delete")]
        public TaskResponse Delete(TaskViewModel.Delete model)
        {
            var response = new TaskResponse();
            var list = new ListDictionary();

            try
            {
                if (ModelState.IsValid)
                {
                    var obj = new TaskModel
                    {
                        Id = model.Id,
                        ModifiedBy = model.ModifiedBy
                    };

                    bool result = _taskRepository.Delete(obj);
                    if (result)
                    {
                        response.Notification = new NotificationDto
                        {
                            NotificationCode = HttpStatusCode.OK,
                            InfoMessage = "Delete sucessfully - Id: " + model.Id + "."
                        };
                    }
                    else
                    {
                        response.Notification = new NotificationDto
                        {
                            NotificationCode = HttpStatusCode.NotFound,
                            InfoMessage = "Delete unsucessfully - Id: " + model.Id + "."
                        };
                    }
                }
                else
                {
                    IEnumerable<Error> lst = AllErrors();
                    foreach (var item in lst)
                    {
                        //Check exist keys, if not we will add into list.
                        if (!list.Contains(item.Key))
                        {
                            var errors = lst.Where(p => p.Key == item.Key).Select(p => p.Message).ToList();
                            list.Add(item.Key, errors);
                        }
                    }

                    response.Notification = new NotificationDto
                    {
                        NotificationCode = HttpStatusCode.BadRequest,
                        ErrorMessage = "",
                        DetailErrorMessage = list
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
        public TaskResponse Create(TaskViewModel.Create model)
        {
            var response = new TaskResponse();
            var list = new ListDictionary();

            try
            {
                //Validate model
                if (string.IsNullOrEmpty(model.Title))
                {
                    ModelState.AddModelError("Title", "Title required");
                }

                if (ModelState.IsValid)
                {
                    var obj = new TaskModel 
                    {
                        Title = model.Title,
                        Description = model.Description,
                        Status = model.Status
                    };

                    obj.CreatedBy = User.Identity.IsAuthenticated ? User.Identity.Name : "System";

                    int id = _taskRepository.Insert(obj);
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
                }
                else
                {
                    IEnumerable<Error> lst = AllErrors();
                    foreach (var item in lst)
                    {
                        //Check exist keys, if not we will add into list.
                        if (!list.Contains(item.Key))
                        {
                            var errors = lst.Where(p => p.Key == item.Key).Select(p => p.Message).ToList();
                            list.Add(item.Key, errors);
                        }
                    }

                    response.Notification = new NotificationDto
                    {
                        NotificationCode = HttpStatusCode.BadRequest,
                        ErrorMessage = "",
                        DetailErrorMessage = list
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
        public TaskResponse Edit(TaskViewModel.Edit model)
        {
            var response = new TaskResponse();
            var list = new ListDictionary();

            try
            {
                //Validate model
                if (model.Id <= 0)
                {
                    ModelState.AddModelError("NotFound", "Task not found");
                }

                if (string.IsNullOrEmpty(model.Title))
                {
                    ModelState.AddModelError("Title", "Title required");
                }

                if (ModelState.IsValid)
                {
                    //Get Task by Id
                    var obj = _taskRepository.GetById(model.Id);
                    if(obj != null)
                    {
                        obj.Title = model.Title;
                        obj.Description = model.Description;
                        obj.Status = model.Status;
                        obj.ModifiedBy = User.Identity.IsAuthenticated ? User.Identity.Name : "System";

                        bool result = _taskRepository.Update(obj);
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
                                NotificationCode = HttpStatusCode.NotFound,
                                InfoMessage = "Update unsucessfully - Id: " + model.Id + "."
                            };
                        }
                    }

                    
                }
                else
                {
                    IEnumerable<Error> lst = AllErrors();
                    foreach (var item in lst)
                    {
                        //Check exist keys, if not we will add into list.
                        if (!list.Contains(item.Key))
                        {
                            var errors = lst.Where(p => p.Key == item.Key).Select(p => p.Message).ToList();
                            list.Add(item.Key, errors);
                        }
                    }

                    response.Notification = new NotificationDto
                    {
                        NotificationCode = HttpStatusCode.BadRequest,
                        ErrorMessage = "",
                        DetailErrorMessage = list
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

        /// <summary>
        /// Get all errors with keys from ModelState.
        /// </summary>
        /// <returns>Enumerable</returns>
        private IEnumerable<Error> AllErrors()
        {
            var result = new List<Error>();
            var errorArr = ModelState.Where(ms => ms.Value.Errors.Any()).Select(x => new { x.Key, x.Value.Errors });

            foreach (var error in errorArr)
            {
                var key = error.Key;
                var fieldErrors = error.Errors.Select(error => new Error(key, error.ErrorMessage));
                result.AddRange(fieldErrors);
            }

            return result;
        }
    }
}
