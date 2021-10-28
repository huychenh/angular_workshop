using System.Collections.Generic;
using Workshop.Common.Models;

namespace Workshop.APIs.Repositories
{
    public interface ITaskRepository
    {
        public IEnumerable<TaskModel> GetAll();

        public IEnumerable<TaskModel> GetAllByStatus(string status);

        public TaskModel GetById(int id);

        public bool Delete(TaskModel model);

        public int Insert(TaskModel model);

        public bool Update(TaskModel model);
    }
}
