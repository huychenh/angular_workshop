using System.Collections.Generic;
using Workshop.Common.Models;

namespace Workshop.Common.Responses
{
    public class UserResponse : BaseResponse
    {
        /// <summary>
        /// List
        /// </summary>
        public IEnumerable<UserModel> Users { get; set; }

        /// <summary>
        /// Object
        /// </summary>
        public UserModel User { get; set; }
    }
}
