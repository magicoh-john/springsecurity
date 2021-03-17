<!-- Modal -->
               <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                   aria-labelledby="exampleModalLabel" aria-hidden="true" th:fragment="modalContents">
                   <div class="modal-dialog" role="document">
                       <div class="modal-content">
                           <div class="modal-header">
                               <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                               <button type="button" class="close" data-dismiss="modal"
                                   aria-label="Close">
                                   <span aria-hidden="true">&times;</span>
                               </button>
                           </div>
                           <div class="modal-body">
                               <p th:if="${product_name != null}" th:text="${product_name}" />
                               <p th:unless="${product_name == null}" >area == null</p>
                           </div>
                           <div class="modal-footer">
                               <button type="button" class="btn btn-secondary"
                                   data-dismiss="modal">Close</button>
                               <button type="button" class="btn btn-primary">Save
                                   changes</button>
                           </div>
                       </div>
                   </div>
               </div>