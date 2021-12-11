using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Workshop.Authentication.Models;
using Workshop.Common.Models;

namespace Workshop.APIs.Repositories.Implement
{
    public class ScheduleRepository : IScheduleRepository
    {
        private readonly DatabaseContext _context;

        public ScheduleRepository(DatabaseContext context)
        {
            _context = context;
        }

        public bool Delete(ScheduleModel model)
        {
            bool result = false;
            try
            {
                var obj = _context.Schedules.FirstOrDefault(k => k.IsActive == true && k.IsDeleted == false && k.Id == model.Id);
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

        public IEnumerable<ScheduleModel> GetAll()
        {
            try
            {
                return _context.Schedules.Where(k => k.IsActive == true && k.IsDeleted == false).ToList();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public IEnumerable<ScheduleModel> GetAllByUserId(int userId)
        {
            try
            {
                return _context.Schedules.Where(k => k.IsActive == true && k.IsDeleted == false && k.WsUserId == userId).ToList();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public ScheduleModel GetById(int id)
        {
            try
            {
                var schedule = _context.Schedules.FirstOrDefault(k => k.IsActive == true && k.IsDeleted == false && k.Id == id);
                if (schedule != null)
                {
                    var wsUser = _context.WsUsers.FirstOrDefault(k => k.IsActive == true && k.IsDeleted == false && k.Id == schedule.WsUserId);
                    schedule.WsUser = wsUser;
                }
                return schedule;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int Insert(ScheduleModel model)
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
                    var wsUser = _context.WsUsers.FirstOrDefault(k => k.Id == model.WsUserId);
                    var creator = wsUser != null ? wsUser.FullName : "";

                    SqlParameter[] @params =
                    {
                        new SqlParameter("@Title", model.Title),
                        new SqlParameter("@Creator", creator),
                        new SqlParameter("@Description", model.Description),
                        new SqlParameter("@Location", model.Location),
                        new SqlParameter("@TimeStart", model.TimeStart),
                        new SqlParameter("@TimeEnd", model.TimeEnd),
                        new SqlParameter("@WsUserId", model.WsUserId),
                        new SqlParameter("@CreatedBy", model.CreatedBy),
                        new SqlParameter("@Id", System.Data.SqlDbType.Int) { Direction = System.Data.ParameterDirection.Output }
                    };

                    _context.Database.ExecuteSqlRaw("Usp_InsertSchedule @Title, @Creator, @Description, @Location, @TimeStart, @TimeEnd, @WsUserId, @CreatedBy, @Id OUT", @params);
                    _context.SaveChanges();
                    var obj = @params[8].Value.ToString();
                    result = !string.IsNullOrEmpty(obj) ? Convert.ToInt32(obj) : 0;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return result;
        }

        public bool Update(ScheduleModel model)
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
                    var wsUser = _context.WsUsers.FirstOrDefault(k => k.Id == model.WsUserId);
                    var creator = wsUser != null ? wsUser.FullName : "";

                    SqlParameter[] @params =
                    {
                        new SqlParameter("@Id", model.Id),
                        new SqlParameter("@Title", model.Title),
                        new SqlParameter("@Creator", creator),
                        new SqlParameter("@Description", model.Description),
                        new SqlParameter("@Location", model.Location),
                        new SqlParameter("@TimeStart", model.TimeStart),
                        new SqlParameter("@TimeEnd", model.TimeEnd),
                        new SqlParameter("@WsUserId", model.WsUserId),
                        new SqlParameter("@IsActive", model.IsDeleted == true? false : model.IsActive),
                        new SqlParameter("@IsDeleted", model.IsDeleted),
                        new SqlParameter("@ModifiedBy", model.ModifiedBy)
                    };

                    int obj = _context.Database.ExecuteSqlRaw("Usp_UpdateSchedule @Id, @Title, @Creator, @Description, @Location, @TimeStart, @TimeEnd, @WsUserId, @IsActive, @IsDeleted, @ModifiedBy", @params);
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
