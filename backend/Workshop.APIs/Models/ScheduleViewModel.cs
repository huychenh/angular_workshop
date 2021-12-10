using System;

namespace Workshop.APIs.Models
{
    public class ScheduleViewModel
    {
        /// <summary>
        /// ViewModel for Create
        /// </summary>
        public class Create
        {
            public string Title { get; set; }

            public string Creator { get; set; }

            public string Description { get; set; }

            public string Location { get; set; }

            public string TimeStart { get; set; }

            public string TimeEnd { get; set; }

            public int WsUserId { get; set; }

            public string CreatedBy { get; set; }
        }

        /// <summary>
        /// ViewModel for Edit
        /// </summary>
        public class Edit : Create
        {
            public int Id { get; set; }

            public bool IsActive { get; set; }

            public bool IsDeleted { get; set; }

            public string ModifiedBy { get; set; }
        }

        /// <summary>
        /// ViewModel for Delete
        /// </summary>
        public class Delete
        {
            public int Id { get; set; }

            public string ModifiedBy { get; set; }
        }
    }
}
