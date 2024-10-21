# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_10_19_170318) do
  create_table "evaluations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "form_key", null: false
    t.string "teams_organized_based_on_platform_technology", default: "unchecked", null: false
    t.string "defined_and_documented_process", default: "unchecked", null: false
    t.string "one_backlog_per_team", default: "unchecked", null: false
    t.string "adopt_agile_methodologies", default: "unchecked", null: false
    t.string "remove_team_boundaries", default: "unchecked", null: false
    t.string "extended_team_collaboration", default: "unchecked", null: false
    t.string "remove_boundary_dev_ops", default: "unchecked", null: false
    t.string "common_process_for_all_changes", default: "unchecked", null: false
    t.string "cross_team_continuous_improvement", default: "unchecked", null: false
    t.string "teams_responsible_all_the_way_to_production", default: "unchecked", null: false
    t.string "cross_functional_teams", default: "unchecked", null: false
    t.string "centralized_version_control", default: "unchecked", null: false
    t.string "automated_build_scripts", default: "unchecked", null: false
    t.string "no_management_of_artifacts", default: "unchecked", null: false
    t.string "manual_deployment", default: "unchecked", null: false
    t.string "environments_are_manually_provisioned", default: "unchecked", null: false
    t.string "polling_ci_builds", default: "unchecked", null: false
    t.string "any_build_can_be_re_created_from_source_control", default: "unchecked", null: false
    t.string "management_of_build_artifacts", default: "unchecked", null: false
    t.string "automated_deployment_scripts", default: "unchecked", null: false
    t.string "automated_provisioning_of_environments", default: "unchecked", null: false
    t.string "commit_hook_ci_builds", default: "unchecked", null: false
    t.string "build_fails_if_quality_is_not_met_code_analysis_performance_etc", default: "unchecked", null: false
    t.string "push_button_deployment_and_release_of_any_releasable_artifact_to_any_environment", default: "unchecked", null: false
    t.string "standard_deployment_process_for_all_environments", default: "unchecked", null: false
    t.string "team_priorities_keeping_codebase_deployable_over_doing_new_work", default: "unchecked", null: false
    t.string "builds_are_not_left_broken", default: "unchecked", null: false
    t.string "orchestrated_deployments", default: "unchecked", null: false
    t.string "blue_green_deployments", default: "unchecked", null: false
    t.string "zero_touch_continuous_deployments", default: "unchecked", null: false
    t.string "infrequent_and_unreliable_releases", default: "unchecked", null: false
    t.string "manual_process", default: "unchecked", null: false
    t.string "painful_infrequent_but_reliable_releases", default: "unchecked", null: false
    t.string "infrequent_but_fully_automated_and_reliable_releases_in_any_environment", default: "unchecked", null: false
    t.string "frequent_fully_automated_releases", default: "unchecked", null: false
    t.string "deployment_disconnected_from_release", default: "unchecked", null: false
    t.string "canary_releases", default: "unchecked", null: false
    t.string "no_rollbacks_always_roll_forward", default: "unchecked", null: false
    t.string "data_migrations_are_performed_manually_no_scripts", default: "unchecked", null: false
    t.string "data_migrations_using_versioned_scripts_performed_manually", default: "unchecked", null: false
    t.string "automated_and_versioned_changes_to_datastores", default: "unchecked", null: false
    t.string "changes_to_datastores_automatically_performed_as_part_of_the_deployment_process", default: "unchecked", null: false
    t.string "automatic_datastore_changes_and_rollbacks_tested_with_every_deployment", default: "unchecked", null: false
    t.string "automated_unit_tests", default: "unchecked", null: false
    t.string "separate_test_environment", default: "unchecked", null: false
    t.string "automatic_integration_tests", default: "unchecked", null: false
    t.string "static_code_analysis", default: "unchecked", null: false
    t.string "test_coverage_analysis", default: "unchecked", null: false
    t.string "automatic_functional_tests", default: "unchecked", null: false
    t.string "manual_performance_security_tests", default: "unchecked", null: false
    t.string "fully_automatic_acceptance", default: "unchecked", null: false
    t.string "automatic_performance_security_tests", default: "unchecked", null: false
    t.string "manual_exploratory_testing_based_on_risk_based_testing_analysis", default: "unchecked", null: false
    t.string "verify_expected_business_value", default: "unchecked", null: false
    t.string "defects_found_and_fixed_immediately_roll_forward", default: "unchecked", null: false
    t.string "baseline_process_metrics", default: "unchecked", null: false
    t.string "manual_reporting", default: "unchecked", null: false
    t.string "visible_to_report_runner", default: "unchecked", null: false
    t.string "measure_the_process", default: "unchecked", null: false
    t.string "automatic_reporting", default: "unchecked", null: false
    t.string "visible_to_team", default: "unchecked", null: false
    t.string "automatic_generation_of_release_notes", default: "unchecked", null: false
    t.string "pipeline_traceability", default: "unchecked", null: false
    t.string "reporting_history", default: "unchecked", null: false
    t.string "visible_to_cross_silo", default: "unchecked", null: false
    t.string "report_trend_analysis", default: "unchecked", null: false
    t.string "real_time_graphs_on_deployment_pipeline_metrics", default: "unchecked", null: false
    t.string "dynamic_self_service_of_information", default: "unchecked", null: false
    t.string "customizable_dashboards", default: "unchecked", null: false
    t.string "cross_reference_across_organizational_boundaries", default: "unchecked", null: false
    t.index ["form_key"], name: "index_evaluation_form_key"
  end
end
