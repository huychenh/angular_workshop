using System.Collections.Generic;
using Workshop.Common.Models;

namespace Workshop.APIs.Repositories
{
    public interface IWsUserRepository
    {
        public IEnumerable<WsUserModel> GetAll();

        public WsUserModel GetById(int id);

        public bool Delete(WsUserModel model);

        public int Insert(WsUserModel model);

        public bool Update(WsUserModel model);
    }
}
