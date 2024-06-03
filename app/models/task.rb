class Task < ApplicationRecord
    # It checks the validation as well
    belongs_to :user
    enum status: { to_do: 0, in_progress: 1, pending: 2, done: 3 }
    validates :user_id, :title, presence: { message: "must be given" }
    before_create :new_to_do_task_within_limit, if: -> { status == 'to_do' }

    private

    def new_to_do_task_within_limit
        total_tasks = Task.where(user_id: user_id).count
        limit = total_tasks / 2.0
      
        if Task.where(status: :to_do, user_id: user_id).count >= limit
          errors.add(:status, "cannot be 'to_do' as it would exceed 50% of all tasks")
        end
    end
      
end
