namespace Workshop.APIs.Models
{
    public class WsUserViewModel
    {
        /// <summary>
        /// ViewModel for CreateUser
        /// </summary>
        public class Create
        {
            public string Fullname { get; set; }

            public string JobRole { get; set; }
        }

        /// <summary>
        /// ViewModel for EditUser
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
        /// ViewModel for DeleteUser
        /// </summary>
        public class Delete
        {
            public int Id { get; set; }

            public string ModifiedBy { get; set; }
        }
    }
}
