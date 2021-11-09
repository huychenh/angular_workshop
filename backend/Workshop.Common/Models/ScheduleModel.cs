using System;

namespace Workshop.Common.Models
{
    public class ScheduleModel : BaseModel
    {
        public string Title { get; set; }

        public string Creator { get; set; }

        public string Description { get; set; }

        public string Location { get; set; }

        public DateTime TimeStart { get; set; }

        public DateTime TimeEnd { get; set; }

        public int UserId { get; set; }
    }
}
