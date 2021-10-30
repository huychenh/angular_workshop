namespace Workshop.APIs.Models
{
    public class TaskViewModel
    {

        /// <summary>
        /// ViewModel for CreateTask
        /// </summary>
        public class Create
        {
            public string Title { get; set; }

            public string Description { get; set; }

            public string Status { get; set; }            
        }

        /// <summary>
        /// ViewModel for EditTask
        /// </summary>
        public class Edit : Create
        {
            public int Id { get; set; }

            public string CreatedBy { get; set; }

            public bool IsActive { get; set; }

            public bool IsDeleted { get; set; }

            public string ModifiedBy { get; set; }
        }

        /// <summary>
        /// ViewModel for DeleteTask
        /// </summary>
        public class Delete
        {
            public int Id { get; set; }

            public string ModifiedBy { get; set; }
        }
    }
}
