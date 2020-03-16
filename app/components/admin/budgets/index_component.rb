class Admin::Budgets::IndexComponent < ApplicationComponent
  attr_reader :budgets

  def initialize(budgets)
    @budgets = budgets
  end

  private

    def phase_progress_text(budget)
      t("admin.budgets.index.table_phase_progress",
        current_phase_number: current_enabled_phase_number(budget),
        total_phases: budget.phases.enabled.count)
    end

    def current_enabled_phase_number(budget)
      budget.phases.enabled.order(:id).pluck(:kind).index(budget.phase) + 1
    end

    def start_date(budget)
      formatted_date(budget.starts_at)
    end

    def end_date(budget)
      formatted_date(budget.ends_at - 1.minute)
    end

    def formatted_date(time)
      time_tag(time, format: :long) if time.present?
    end

    def duration(budget)
      distance_of_time_in_words(budget.starts_at, budget.ends_at)
    end
end
