﻿using System.ComponentModel.DataAnnotations;

namespace Workshop.Authentication.Models
{
    public class LoginInputModel
    {
        [Required]
        public string Username { get; set; }

        [Required]
        public string Password { get; set; }

        public bool RememberLogin { get; set; }
        public string ReturnUrl { get; set; }
    }
}
