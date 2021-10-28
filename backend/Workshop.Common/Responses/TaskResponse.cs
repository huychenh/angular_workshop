using System.Collections.Generic;
using Workshop.Common.Models;

namespace Workshop.Common.Responses
{
  public class TaskResponse: BaseResponse
  {
    /// <summary>
    /// List
    /// </summary>
    public IEnumerable<TaskModel> Tasks { get; set; }

    /// <summary>
    /// Object
    /// </summary>
    public TaskModel Task { get; set; }
  }
}
