class Admin::Budgets::IndexComponent < ApplicationComponent
  include Header
  attr_reader :budgets

  def initialize(budgets)
    @budgets = budgets
  end

  def title
    t("admin.budgets.index.title")
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

    def dates(budget)
      Admin::Budgets::DurationComponent.new(budget).dates
    end

    def duration(budget)
      Admin::Budgets::DurationComponent.new(budget).duration
    end
end
