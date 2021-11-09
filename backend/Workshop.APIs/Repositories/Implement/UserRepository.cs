﻿using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using Workshop.Authentication.Models;
using Workshop.Common.Models;

namespace Workshop.APIs.Repositories.Implement
{
    public class UserRepository : IUserRepository
    {
        private readonly DatabaseContext _context;

        public UserRepository(DatabaseContext context)
        {
            _context = context;
        }

        public bool Delete(UserModel model)
        {
            bool result = false;
            try
            {
                var obj = _context.WsUsers.FirstOrDefault(k => k.IsActive == true && k.IsDeleted == false && k.Id == model.Id);
                if (obj != null)
                {
                    obj.IsActive = false;
                    obj.IsDeleted = true;
                    obj.ModifiedBy = model.ModifiedBy;
                    obj.ModifiedDate = DateTime.Now;
                }
                _context.SaveChanges();
                result = true;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            return result;
        }

        public IEnumerable<UserModel> GetAll()
        {
            try
            {
                return _context.WsUsers.Where(k => k.IsActive == true && k.IsDeleted == false).ToList();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        
        public UserModel GetById(int id)
        {
            try
            {
                return _context.WsUsers.FirstOrDefault(k => k.IsActive == true && k.IsDeleted == false && k.Id == id);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int Insert(UserModel model)
        {
            int result;
            try
            {
                if (model == null)
                {
                    result = 0;
                }
                else
                {

                    SqlParameter[] @params =
                    {
                        new SqlParameter("@Fullname", model.Fullname ?? (object)DBNull.Value),
                        new SqlParameter("@JobRole", model.JobRole ?? (object)DBNull.Value),                        
                        new SqlParameter("@CreatedBy", model.CreatedBy ?? (object)DBNull.Value),
                        new SqlParameter("@Id", System.Data.SqlDbType.Int) { Direction = System.Data.ParameterDirection.Output }
                    };

                    _context.Database.ExecuteSqlRaw("Usp_InsertUser @Fullname, @JobRole, @CreatedBy, @Id OUT", @params);
                    _context.SaveChanges();
                    var obj = @params[3].Value.ToString();
                    result = !string.IsNullOrEmpty(obj) ? Convert.ToInt32(obj) : 0;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return result;
        }

        public bool Update(UserModel model)
        {
            bool result;
            try
            {
                if (model == null || model.Id < 0)
                {
                    result = false;
                }
                else
                {
                    SqlParameter[] @params =
                    {
                        new SqlParameter("@Id", model.Id),
                        new SqlParameter("@Fullname", model.Fullname ?? (object)DBNull.Value),
                        new SqlParameter("@JobRole", model.JobRole ?? (object)DBNull.Value),                        
                        new SqlParameter("@IsActive", model.IsActive),
                        new SqlParameter("@IsDeleted", model.IsDeleted),
                        new SqlParameter("@ModifiedBy", model.ModifiedBy ?? (object)DBNull.Value)
                    };

                    int obj = _context.Database.ExecuteSqlRaw("Usp_UpdateTask @Id, @Fullname, @JobRole, @IsActive, @IsDeleted, @ModifiedBy", @params);
                    _context.SaveChanges();
                    result = obj > 0;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return result;
        }
    }
}
