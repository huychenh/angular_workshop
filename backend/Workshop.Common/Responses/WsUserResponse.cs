using System.Collections.Generic;
using Workshop.Common.Models;

namespace Workshop.Common.Responses
{
    public class WsUserResponse : BaseResponse
    {
        /// <summary>
        /// List
        /// </summary>
        public IEnumerable<WsUserModel> WsUsers { get; set; }

        /// <summary>
        /// Object
        /// </summary>
        public WsUserModel WsUser { get; set; }
    }
}
