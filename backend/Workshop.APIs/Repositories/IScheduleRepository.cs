using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Workshop.Common.Models;

namespace Workshop.APIs.Repositories
{
    public interface IScheduleRepository
    {
        public IEnumerable<ScheduleModel> GetAll();

        public ScheduleModel GetById(int id);

        public bool Delete(ScheduleModel model);

        public int Insert(ScheduleModel model);

        public bool Update(ScheduleModel model);
    }
}
