using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Workshop.APIs.Models;
using Workshop.APIs.Repositories;
using Workshop.Common.Models;
using Workshop.Common.Responses;
using Workshop.Common.Responses.Objects;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Workshop.APIs.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ScheduleController : ControllerBase
    {
        private readonly IScheduleRepository _scheduleRepository;

        public ScheduleController(IScheduleRepository scheduleRepository)
        {
            _scheduleRepository = scheduleRepository;
        }

        [HttpGet]
        [Route("list")]
        public ScheduleResponse Get()
        {
            var response = new ScheduleResponse();

            try
            {
                response.Schedules = _scheduleRepository.GetAll();
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
        public ScheduleResponse Get(int id)
        {
            var response = new ScheduleResponse();

            try
            {
                response.Schedule = _scheduleRepository.GetById(id);
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
        public ScheduleResponse Delete(ScheduleViewModel.Delete model)
        {
            var response = new ScheduleResponse();
            var list = new ListDictionary();

            try
            {
                if (ModelState.IsValid)
                {
                    var obj = new ScheduleModel
                    {
                        Id = model.Id,
                        ModifiedBy = model.ModifiedBy
                    };

                    bool result = _scheduleRepository.Delete(obj);
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
        public ScheduleResponse Create(ScheduleViewModel.Create model)
        {
            var response = new ScheduleResponse();
            var list = new ListDictionary();

            try
            {
                //Validate model
                if (string.IsNullOrEmpty(model.Title))
                {
                    ModelState.AddModelError("Title", "Title required");
                }

                if (string.IsNullOrEmpty(model.Creator))
                {
                    ModelState.AddModelError("Creator", "Creator required");
                }

                if (string.IsNullOrEmpty(model.Location))
                {
                    ModelState.AddModelError("Location", "Location required");
                }

                if (ModelState.IsValid)
                {
                    var obj = new ScheduleModel
                    {
                        Title = model.Title,
                        Creator = model.Creator,
                        Description = model.Description,
                        Location = model.Location,
                        TimeStart = Convert.ToDateTime(model.TimeStart),
                        TimeEnd = Convert.ToDateTime(model.TimeEnd),
                        WsUserId = model.WsUserId
                    };

                    obj.CreatedBy = User.Identity.IsAuthenticated ? User.Identity.Name : "System";

                    int id = _scheduleRepository.Insert(obj);
                    if (id > 0)
                    {
                        response.Notification = new NotificationDto
                        {
                            NotificationCode = HttpStatusCode.OK,
                            InfoMessage = "Insert sucessfully - Id: " + id + "."
                        };

                        response.Schedule = new ScheduleModel()
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
        public ScheduleResponse Edit(ScheduleViewModel.Edit model)
        {
            var response = new ScheduleResponse();
            var list = new ListDictionary();

            try
            {
                //Validate model
                if (model.Id <= 0)
                {
                    ModelState.AddModelError("NotFound", "Schedule not found");
                }

                if (string.IsNullOrEmpty(model.Title))
                {
                    ModelState.AddModelError("Title", "Title required");
                }

                if (string.IsNullOrEmpty(model.Creator))
                {
                    ModelState.AddModelError("Creator", "Creator required");
                }

                if (string.IsNullOrEmpty(model.Location))
                {
                    ModelState.AddModelError("Location", "Location required");
                }

                if (ModelState.IsValid)
                {
                    //Get Task by Id
                    var obj = _scheduleRepository.GetById(model.Id);
                    if (obj != null)
                    {
                        obj.Title = model.Title;
                        obj.Creator = model.Creator;
                        obj.Description = model.Description;
                        obj.Location = model.Location;
                        obj.TimeStart = Convert.ToDateTime(model.TimeStart);
                        obj.TimeEnd = Convert.ToDateTime(model.TimeEnd);
                        obj.WsUserId = model.WsUserId;
                        obj.ModifiedBy = User.Identity.IsAuthenticated ? User.Identity.Name : "System";
                        obj.IsActive = model.IsActive;
                        obj.IsDeleted = model.IsDeleted;

                        bool result = _scheduleRepository.Update(obj);
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
