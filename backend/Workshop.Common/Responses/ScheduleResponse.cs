using System.Collections.Generic;
using Workshop.Common.Models;

namespace Workshop.Common.Responses
{
    public class ScheduleResponse : BaseResponse
    {
        /// <summary>
        /// List
        /// </summary>
        public IEnumerable<ScheduleModel> Schedules { get; set; }

        /// <summary>
        /// Object
        /// </summary>
        public ScheduleModel Schedule { get; set; }
    }
}
