using System.Collections.Generic;
using Workshop.Common.Models;

namespace Workshop.Common.Responses
{
    public class ConmpanyUserResponse : BaseResponse
    {
        /// <summary>
        /// List
        /// </summary>
        public IEnumerable<CompanyUserModel> Users { get; set; }

        /// <summary>
        /// Object
        /// </summary>
        public CompanyUserModel User { get; set; }
    }
}
