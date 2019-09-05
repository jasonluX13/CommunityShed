﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CommunityShed.Data
{
    using BCrypt.Net;

    public class Hashing
    {
        private static string GetRandomSalt()
        {
            return BCrypt.GenerateSalt(12);
        }

        public static string HashPassword(string password)
        {
            return BCrypt.HashPassword(password, GetRandomSalt());
        }

        public static bool ValidatePassword(string password, string correctHash)
        {
            return BCrypt.Verify(password, correctHash);
        }
    }
}