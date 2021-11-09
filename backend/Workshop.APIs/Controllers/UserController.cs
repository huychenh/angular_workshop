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
    public class UserController : ControllerBase
    {
        private readonly IUserRepository _userRepository;

        public UserController(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        [HttpGet]
        [Route("list")]
        public UserResponse Get()
        {
            var response = new UserResponse();

            try
            {
                response.Users = _userRepository.GetAll();
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
        public UserResponse Get(int id)
        {
            var response = new UserResponse();

            try
            {
                response.User = _userRepository.GetById(id);
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
        public UserResponse Delete(UserViewModel.Delete model)
        {
            var response = new UserResponse();
            var list = new ListDictionary();

            try
            {
                if (ModelState.IsValid)
                {
                    var obj = new UserModel
                    {
                        Id = model.Id,
                        ModifiedBy = model.ModifiedBy
                    };

                    bool result = _userRepository.Delete(obj);
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
        public UserResponse Create(UserViewModel.Create model)
        {
            var response = new UserResponse();
            var list = new ListDictionary();

            try
            {
                //Validate model
                if (string.IsNullOrEmpty(model.Fullname))
                {
                    ModelState.AddModelError("Fullname", "Fullname required");
                }

                if (ModelState.IsValid)
                {
                    var obj = new UserModel
                    {
                        Fullname = model.Fullname,
                        JobRole = model.JobRole
                    };

                    obj.CreatedBy = User.Identity.IsAuthenticated ? User.Identity.Name : "System";

                    int id = _userRepository.Insert(obj);
                    if (id > 0)
                    {
                        response.Notification = new NotificationDto
                        {
                            NotificationCode = HttpStatusCode.OK,
                            InfoMessage = "Insert sucessfully - Id: " + id + "."
                        };

                        response.User = new UserModel()
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
        public UserResponse Edit(UserViewModel.Edit model)
        {
            var response = new UserResponse();
            var list = new ListDictionary();

            try
            {
                //Validate model
                if (model.Id <= 0)
                {
                    ModelState.AddModelError("NotFound", "User not found");
                }

                if (string.IsNullOrEmpty(model.Fullname))
                {
                    ModelState.AddModelError("Fullname", "Fullname required");
                }

                if (ModelState.IsValid)
                {
                    //Get Task by Id
                    var obj = _userRepository.GetById(model.Id);
                    if (obj != null)
                    {
                        obj.Fullname = model.Fullname;
                        obj.JobRole = model.JobRole;
                        
                        obj.ModifiedBy = User.Identity.IsAuthenticated ? User.Identity.Name : "System";

                        bool result = _userRepository.Update(obj);
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
