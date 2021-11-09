using System.Collections.Generic;
using Workshop.Common.Models;

namespace Workshop.Common.Responses
{
    public class ScheduleResponse : BaseResponse
    {
        /// <summary>
        /// List
        /// </summary>
        public IEnumerable<ScheduleModel> Users { get; set; }

        /// <summary>
        /// Object
        /// </summary>
        public ScheduleModel User { get; set; }
    }
}
