using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace interviewMobile.Models
{
    public class CandidateScore
    {
        public int Id { get; set; }
        public int CandId { get; set; }
        public int Basic { get; set; }
        public int Dress { get; set; }
        public int Practical { get; set; }
        public int Oral { get; set; }
        public int Comp { get; set; }
        public string Reporter { get; set; }
        public string Date { get; set; }
        public int Diction { get; set; }
        public int Comportment { get; set; }
        public int Written { get; set; }
        public int Experience { get; set; }
        public string Comment { get; set; }

    }
}
