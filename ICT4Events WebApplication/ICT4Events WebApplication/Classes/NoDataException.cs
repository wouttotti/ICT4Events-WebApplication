using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ICT4Events_WebApplication.Classes
{
    public class NoDataException : Exception
    {
        public NoDataException(string message)
            :base(message)
        {

        }
    }
}