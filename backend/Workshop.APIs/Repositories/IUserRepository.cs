using System.Collections.Generic;
using Workshop.Common.Models;

namespace Workshop.APIs.Repositories
{
    public interface IUserRepository
    {
        public IEnumerable<UserModel> GetAll();

        public UserModel GetById(int id);

        public bool Delete(UserModel model);

        public int Insert(UserModel model);

        public bool Update(UserModel model);
    }
}
