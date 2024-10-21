class CdmmController < ApplicationController
    def index
        @table = evaluation_table
    end

    def show()
        @form = Evaluation.find_by(form_key: params[:form_key])
        if @form
            @table = evaluation_table(@form)
        else
            render_not_found
        end
    end

    def save()
        form_key = params[:form_key]
        if form_key == ""
            form_key = generate_unique_form_key
            ev = Evaluation.new(evaluation_params.merge(form_key: form_key))
        else
            ev = Evaluation.find_by(form_key: params[:form_key])
            if ev
                ev.attributes = evaluation_params # Update attributes for existing record
            else
                render_not_found # Handle case where form_key doesn't exist
                return # Prevent further execution
            end
        end

        if ev.save
            redirect_to evaluation_show_path(ev.form_key), notice: 'Evaluation was successfully created.'
        else
            # Handle errors (e.g., re-render the form with errors)
            render_internal_server_error
        end
    end

    private

    def load_form_value(cell, form_data)
        cell[:value] = form_data[cell[:key]]
    end

    def evaluation_table(form_data = nil)
        table = {
            :col_headers => [ "Initial", "Managed", "Defined", "Qualitatively Managed", "Optimizing" ],
            :row_headers => [ "Culture & Organization", "Build & Deploy", "Release", "Data Management", "Test & Verification", "Information & Reporting" ],
            :rows => [
                [
                    [
                        {
                            :key => "teams_organized_based_on_platform_technology",
                            :label => "Teams organized based on platform/technology",
                            :description => "ทีมจัดตั้งตามแพลตฟอร์ม/เทคโนโลยี",
                            :value => "unchecked"
                        },
                        {
                            :key => "defined_and_documented_process",
                            :label => "Defined and documented process",
                            :description => "มีการกำหนดกระบวนการทำงานชัดเจนและเป็นลายลักษณ์อักษร",
                            :value => "unchecked"
                        },
                    ],
                    [
                        {
                            :key => "one_backlog_per_team",
                            :label => "One backlog per team",
                            :description => "ทีมมีหนึ่ง product backlog",
                            :value => "unchecked"
                        },
                        {
                            :key => "adopt_agile_methodologies",
                            :label => "Adopt agile methodologies",
                            :description => "มีการนำกระบวนการทำงานแบบ agile ไปใช้",
                            :value => "unchecked"
                        },
                        {
                            :key => "remove_team_boundaries",
                            :label => "Remove team boundaries",
                            :description => "ไม่มีการแบ่งความรับผิดชอบระหว่างทีม",
                            :value => "unchecked"
                        },
                    ],
                    [
                        {
                            :key => "extended_team_collaboration",
                            :label => "Extended team collaboration",
                            :description => "มีการประสานงานกันระหว่างทีม",
                            :value => "unchecked"
                        },
                        {
                            :key => "remove_boundary_dev_ops",
                            :label => "Remove boundary dev/ops",
                            :description => "ไม่มีการแบ่งความรับผิดชอบระหว่าง dev และ ops",
                            :value => "unchecked"
                        },
                        {
                            :key => "common_process_for_all_changes",
                            :label => "Common process for all changes",
                            :description => "ใช้กระบวนการจัดการเหมือนกันสำหรับทุกความเปลี่ยนแปลง",
                            :value => "unchecked"
                        },
                    ],
                    [
                        {
                            :key => "cross_team_continuous_improvement",
                            :label => "Cross-team continuous improvement",
                            :description => "มีกระบวนการปรับปรุงอย่างต่อเนื่องกันทั่วทุกทีม",
                            :value => "unchecked"
                        },
                        {
                            :key => "teams_responsible_all_the_way_to_production",
                            :label => "Teams responsible all the way to production",
                            :description => "ทีมรับผิดชอบทุกอย่างในการนำของขึ้นสู่ production",
                            :value => "unchecked"
                        },
                    ],
                    [
                        {
                            :key => "cross_functional_teams",
                            :label => "Cross functional teams",
                            :description => "ทีมสามารถทำงานข้ามฟังก์ชั่นกันได้",
                            :value => "unchecked"
                        },
                    ]
                ],
                [
                    [
                        {
                            :key => "centralized_version_control",
                            :label => "Centralized version control",
                            :description => "ใช้ version control แบบ centralized",
                            :value => "unchecked"
                    },
                        {
                            :key => "automated_build_scripts",
                            :label => "Automated build scripts",
                            :description => "ใช้สคริปท์ในการ build แบบอัตโนมัติ",
                            :value => "unchecked"
                    },
                        {
                            :key => "no_management_of_artifacts",
                            :label => "No management of artifacts",
                            :description => "ไม่มีการจัดการของที่ถูก build",
                            :value => "unchecked"
                    },
                        {
                            :key => "manual_deployment",
                            :label => "Manual deployment",
                            :description => "deploy แบบ manual",
                            :value => "unchecked"
                    },
                        {
                            :key => "environments_are_manually_provisioned",
                            :label => "Environments are manually provisioned",
                            :description => "เตรียม environment ต่าง ๆ แบบ manual",
                            :value => "unchecked"
                    },
                    ],
                    [
                        {
                            :key => "polling_ci_builds",
                            :label => "Polling CI builds",
                            :description => "ใช้วิธีการ poll ในการเริ่ม build บน CI",
                            :value => "unchecked"
                        },
                        {
                            :key => "any_build_can_be_re_created_from_source_control",
                            :label => "Any build can be re-created from source control",
                            :description => "Build ต่าง ๆ สามารถสร้างขึ้นใหม่ได้จาก source control",
                            :value => "unchecked"
                        },
                        {
                            :key => "management_of_build_artifacts",
                            :label => "Management of build artifacts",
                            :description => "มีการจัดการของที่ถูก build",
                            :value => "unchecked"
                        },
                        {
                            :key => "automated_deployment_scripts",
                            :label => "Automated deployment scripts",
                            :description => "ใช้สคริปท์ในการ deploy แบบอัตโนมัติ",
                            :value => "unchecked"
                        },
                        {
                            :key => "automated_provisioning_of_environments",
                            :label => "Automated provisioning of environments",
                            :description => "สร้าง environment ต่าง ๆ แบบอัตโนมัติ",
                            :value => "unchecked"
                        },
                    ],
                    [
                        {
                            :key => "commit_hook_ci_builds",
                            :label => "Commit hook CI builds",
                            :description => "ใช้ commit hook ในการเริ่ม build บน CI",
                            :value => "unchecked"
                        },
                        {
                            :key => "build_fails_if_quality_is_not_met_code_analysis_performance_etc",
                            :label => "Build fails if quality is not met (code analysis, performance, etc.)",
                            :description => "Build จะล้มเหลวถ้าตรวจสอบคุณภาพไม่ผ่าน เช่น การวิเคราะห์โค้ด การตรวจสอบประสิทธิภาพ เป็นต้น",
                            :value => "unchecked"
                        },
                        {
                            :key => "push_button_deployment_and_release_of_any_releasable_artifact_to_any_environment",
                            :label => "Push button deployment and release of any releasable artifact to any environment",
                            :description => "มีปุ่มให้กดเพื่อทำการ deploy และ release ของที่ build แล้วไปยัง environment ใด ๆ",
                            :value => "unchecked"
                        },
                        {
                            :key => "standard_deployment_process_for_all_environments",
                            :label => "Standard deployment process for all environments",
                            :description => "มีวิธีการ deploy เป็นมาตรฐานเดียวกันกับทุก ๆ environment",
                            :value => "unchecked"
                        },
                    ],
                    [
                        {
                            :key => "team_priorities_keeping_codebase_deployable_over_doing_new_work",
                            :label => "Team priorities keeping codebase deployable over doing new work",
                            :description => "ทีมให้ความสำคัญกับการทำให้โค้ดสามารถ deploy ได้มากกว่าไปเริ่มงานอื่น",
                            :value => "unchecked"
                        },
                        {
                            :key => "builds_are_not_left_broken",
                            :label => "Builds are not left broken",
                            :description => "Build จะต้องไม่ถูกปล่อยให้พัง",
                            :value => "unchecked"
                        },
                        {
                            :key => "orchestrated_deployments",
                            :label => "Orchestrated deployments",
                            :description => "มีการ deploy แบบหลายเครื่อง หลาย environment พร้อม ๆ กัน",
                            :value => "unchecked"
                        },
                        {
                            :key => "blue_green_deployments",
                            :label => "Blue Green Deployments",
                            :description => "มีการ deploy โดยการใช้ Blue/Green deployment",
                            :value => "unchecked"
                        },
                    ],
                    [
                        {
                            :key => "zero_touch_continuous_deployments",
                            :label => "Zero touch Continuous Deployments",
                            :description => "ทุก commit ถูก build และ deploy ไปยัง production โดยอัตโนมัติ",
                            :value => "unchecked"
                        },
                    ]
                ],
                [
                    [
                        {
                            :key => "infrequent_and_unreliable_releases",
                            :label => "Infrequent and unreliable releases",
                            :description => "Release ไม่บ่อย และบางครั้งไม่สำเร็จ",
                            :value => "unchecked"
                    },
                        {
                            :key => "manual_process",
                            :label => "Manual process",
                            :description => "Release แบบ manual",
                            :value => "unchecked"
                    },
                    ],
                    [
                        {
                            :key => "painful_infrequent_but_reliable_releases",
                            :label => "Painful infrequent but reliable releases",
                            :description => "Release ไม่บ่อย แต่สำเร็จอย่างยากลำบาก",
                            :value => "unchecked"
                        },
                    ],
                    [
                        {
                            :key => "infrequent_but_fully_automated_and_reliable_releases_in_any_environment",
                            :label => "Infrequent but fully automated and reliable releases in any environment",
                            :description => "Release ไม่บ่อย แต่ทำได้อย่างอัตโนมัติ และสำเร็จทุกครั้งในทุก ๆ environment",
                            :value => "unchecked"
                        },
                    ],
                    [
                        {
                            :key => "frequent_fully_automated_releases",
                            :label => "Frequent fully automated releases",
                            :description => "Release บ่อย ด้วยวิธีอัตโนมัติ",
                            :value => "unchecked"
                        },
                        {
                            :key => "deployment_disconnected_from_release",
                            :label => "Deployment disconnected from release",
                            :description => "การ deploy กับ release แยกออกจากกัน",
                            :value => "unchecked"
                        },
                        {
                            :key => "canary_releases",
                            :label => "Canary releases",
                            :description => "Release ด้วยวิธี canary release",
                            :value => "unchecked"
                        },
                    ],
                    [
                        {
                            :key => "no_rollbacks_always_roll_forward",
                            :label => "No rollbacks, always roll forward",
                            :description => "ไม่มีการ rollback ใช้ roll forward เสมอ",
                            :value => "unchecked"
                        },
                    ]
                ],
                [
                    [
                        {
                            :key => "data_migrations_are_performed_manually_no_scripts",
                            :label => "Data migrations are performed manually, no scripts",
                            :description => "การย้ายข้อมูลใช้วิธี manual ไม่มีการใช้ script",
                            :value => "unchecked"
                    },
                    ],
                    [
                        {
                            :key => "data_migrations_using_versioned_scripts_performed_manually",
                            :label => "Data migrations using versioned scripts, performed manually",
                            :description => "การย้ายข้อมูลใช้ script ที่มีการควบคุม version แต่รันแบบ manual",
                            :value => "unchecked"
                        },
                    ],
                    [
                        {
                            :key => "automated_and_versioned_changes_to_datastores",
                            :label => "Automated and versioned changes to datastores",
                            :description => "มีการควบคุมเวอร์ชั่นของการเปลี่ยนแปลงข้อมูลใด ๆ แบบอัตโนมัติ",
                            :value => "unchecked"
                        },
                    ],
                    [
                        {
                            :key => "changes_to_datastores_automatically_performed_as_part_of_the_deployment_process",
                            :label => "Changes to datastores automatically performed as part of the deployment process",
                            :description => "การเปลี่ยนแปลงของข้อมูลทำไปอย่างอัตโนมัติพร้อมกับการ deploy",
                            :value => "unchecked"
                        },
                    ],
                    [
                        {
                            :key => "automatic_datastore_changes_and_rollbacks_tested_with_every_deployment",
                            :label => "Automatic datastore changes and rollbacks tested with every deployment",
                            :description => "การเปลี่ยนแปลงของข้อมูล รวมถึงการ rollback มีการทดสอบอย่างอัตโนมัติด้วยในทุก ๆ การ deploy",
                            :value => "unchecked"
                        },
                    ]
                ],
                [
                    [
                        {
                            :key => "automated_unit_tests",
                            :label => "Automated unit tests",
                            :description => "มีการรัน unit test แบบอัตโนมัติ",
                            :value => "unchecked"
                    },
                        {
                            :key => "separate_test_environment",
                            :label => "Separate test environment",
                            :description => "มีการแยก test environment ออกมา",
                            :value => "unchecked"
                    },
                    ],
                    [
                        {
                            :key => "automatic_integration_tests",
                            :label => "Automatic Integration Tests",
                            :description => "มีการทดสอบแบบ integration แบบอัตโนมัติ",
                            :value => "unchecked"
                        },
                        {
                            :key => "static_code_analysis",
                            :label => "Static code analysis",
                            :description => "มีการทำ static code analysis",
                            :value => "unchecked"
                        },
                        {
                            :key => "test_coverage_analysis",
                            :label => "Test coverage analysis",
                            :description => "มีการทำ test coverage analysis",
                            :value => "unchecked"
                        },
                    ],
                    [
                        {
                            :key => "automatic_functional_tests",
                            :label => "Automatic functional tests",
                            :description => "มีการทำ functional test แบบอัตโนมัติ",
                            :value => "unchecked"
                        },
                        {
                            :key => "manual_performance_security_tests",
                            :label => "Manual performance/security tests",
                            :description => "มีการทำ performance test และ security test แบบ manual",
                            :value => "unchecked"
                        },
                    ],
                    [
                        {
                            :key => "fully_automatic_acceptance",
                            :label => "Fully automatic acceptance",
                            :description => "มีการทำ acceptance test แบบอัตโนมัติเต็มรูปแบบ",
                            :value => "unchecked"
                        },
                        {
                            :key => "automatic_performance_security_tests",
                            :label => "Automatic performance/security tests",
                            :description => "มีการทำ performance test และ security test แบบอัตโนมัติ",
                            :value => "unchecked"
                        },
                        {
                            :key => "manual_exploratory_testing_based_on_risk_based_testing_analysis",
                            :label => "Manual exploratory testing based on risk based testing analysis",
                            :description => "มีการทำ exploratory test โดยอิงจากการวิเคราะห์จากความเสี่ยง",
                            :value => "unchecked"
                        },
                    ],
                    [
                        {
                            :key => "verify_expected_business_value",
                            :label => "Verify expected business value",
                            :description => "มีการยืนยัน business value ที่คาดหวัง",
                            :value => "unchecked"
                        },
                        {
                            :key => "defects_found_and_fixed_immediately_roll_forward",
                            :label => "Defects found and fixed immediately (roll forward)",
                            :description => "ปัญหาที่พบถูกแก้ไขทันที (roll forward)",
                            :value => "unchecked"
                        },
                    ]
                ],
                [
                    [
                        {
                            :key => "baseline_process_metrics",
                            :label => "Baseline process metrics",
                            :description => "มีการกำหนดตัวชี้วัดกระบวนการทำงาน",
                            :value => "unchecked"
                    },
                        {
                            :key => "manual_reporting",
                            :label => "Manual reporting",
                            :description => "รายงานต่าง ๆ ถูกสร้างแบบ manual",
                            :value => "unchecked"
                    },
                        {
                            :key => "visible_to_report_runner",
                            :label => "Visible to report runner",
                            :description => "คนทำรายงานจะต้องเข้าถึงรายงานได้",
                            :value => "unchecked"
                    },
                    ],
                    [
                        {
                            :key => "measure_the_process",
                            :label => "Measure the process",
                            :description => "มีการวัดผลกระบวนการ",
                            :value => "unchecked"
                        },
                        {
                            :key => "automatic_reporting",
                            :label => "Automatic reporting",
                            :description => "รายงานต่าง ๆ ถูกสร้างอย่างอัตโนมัติ",
                            :value => "unchecked"
                        },
                        {
                            :key => "visible_to_team",
                            :label => "Visible to team",
                            :description => "ทีมจะต้องสามารถเข้าถึงรายงานได้",
                            :value => "unchecked"
                        },
                    ],
                    [
                        {
                            :key => "automatic_generation_of_release_notes",
                            :label => "Automatic generation of release notes",
                            :description => "Release note ถูกสร้างอย่างอัตโนมัติ",
                            :value => "unchecked"
                        },
                        {
                            :key => "pipeline_traceability",
                            :label => "Pipeline traceability",
                            :description => "Pipeline จะต้องสามารถถูกตรวจสอบการทำงานได้",
                            :value => "unchecked"
                        },
                        {
                            :key => "reporting_history",
                            :label => "Reporting history",
                            :description => "สามารถดูรายงานย้อนหลังได้",
                            :value => "unchecked"
                        },
                        {
                            :key => "visible_to_cross_silo",
                            :label => "Visible to cross-silo",
                            :description => "ทีมอื่น ๆ สามารถเข้าถึงรายงานได้",
                            :value => "unchecked"
                        },
                    ],
                    [
                        {
                            :key => "report_trend_analysis",
                            :label => "Report trend analysis",
                            :description => "มีรายงานการวิเคราะห์แนวโน้มต่าง ๆ",
                            :value => "unchecked"
                        },
                        {
                            :key => "real_time_graphs_on_deployment_pipeline_metrics",
                            :label => "Real time graphs on deployment pipeline metrics",
                            :description => "แสดงกราฟของตัวชี้วัดต่าง ๆ ใน pipeline ของการ deploy",
                            :value => "unchecked"
                        },
                    ],
                    [
                        {
                            :key => "dynamic_self_service_of_information",
                            :label => "Dynamic self-service of information",
                            :description => "มีข้อมูลให้เลือกดูได้เอง",
                            :value => "unchecked"
                        },
                        {
                            :key => "customizable_dashboards",
                            :label => "Customizable dashboards",
                            :description => "สามารถปรับแต่ง dashboard ได้",
                            :value => "unchecked"
                        },
                        {
                            :key => "cross_reference_across_organizational_boundaries",
                            :label => "Cross-reference across organizational boundaries",
                            :description => "มีการอ้างอิงถึงข้อมูลจากหน่วยงานอื่น ๆ ในองค์กร",
                            :value => "unchecked"
                        },
                    ]
                ]
            ]
        }

        if form_data
            table[:rows].each do |row|
                row.each do |cell|
                    cell.each do |cap|
                        load_form_value(cap, form_data) # Use helper method to load values
                    end
                end
            end
        end
      
        table
    end

    def evaluation_form
        [
            :teams_organized_based_on_platform_technology,
            :defined_and_documented_process,
            :one_backlog_per_team,
            :adopt_agile_methodologies,
            :remove_team_boundaries,
            :extended_team_collaboration,
            :remove_boundary_dev_ops,
            :common_process_for_all_changes,
            :cross_team_continuous_improvement,
            :teams_responsible_all_the_way_to_production,
            :cross_functional_teams,
            :centralized_version_control,
            :automated_build_scripts,
            :no_management_of_artifacts,
            :manual_deployment,
            :environments_are_manually_provisioned,
            :polling_ci_builds,
            :any_build_can_be_re_created_from_source_control,
            :management_of_build_artifacts,
            :automated_deployment_scripts,
            :automated_provisioning_of_environments,
            :commit_hook_ci_builds,
            :build_fails_if_quality_is_not_met_code_analysis_performance_etc,
            :push_button_deployment_and_release_of_any_releasable_artifact_to_any_environment,
            :standard_deployment_process_for_all_environments,
            :team_priorities_keeping_codebase_deployable_over_doing_new_work,
            :builds_are_not_left_broken,
            :orchestrated_deployments,
            :blue_green_deployments,
            :zero_touch_continuous_deployments,
            :infrequent_and_unreliable_releases,
            :manual_process,
            :painful_infrequent_but_reliable_releases,
            :infrequent_but_fully_automated_and_reliable_releases_in_any_environment,
            :frequent_fully_automated_releases,
            :deployment_disconnected_from_release,
            :canary_releases,
            :no_rollbacks_always_roll_forward,
            :data_migrations_are_performed_manually_no_scripts,
            :data_migrations_using_versioned_scripts_performed_manually,
            :automated_and_versioned_changes_to_datastores,
            :changes_to_datastores_automatically_performed_as_part_of_the_deployment_process,
            :automatic_datastore_changes_and_rollbacks_tested_with_every_deployment,
            :automated_unit_tests,
            :separate_test_environment,
            :automatic_integration_tests,
            :static_code_analysis,
            :test_coverage_analysis,
            :automatic_functional_tests,
            :manual_performance_security_tests,
            :fully_automatic_acceptance,
            :automatic_performance_security_tests,
            :manual_exploratory_testing_based_on_risk_based_testing_analysis,
            :verify_expected_business_value,
            :defects_found_and_fixed_immediately_roll_forward,
            :baseline_process_metrics,
            :manual_reporting,
            :visible_to_report_runner,
            :measure_the_process,
            :automatic_reporting,
            :visible_to_team,
            :automatic_generation_of_release_notes,
            :pipeline_traceability,
            :reporting_history,
            :visible_to_cross_silo,
            :report_trend_analysis,
            :real_time_graphs_on_deployment_pipeline_metrics,
            :dynamic_self_service_of_information,
            :customizable_dashboards,
            :cross_reference_across_organizational_boundarie
        ]
    end

    def evaluation_params
        params.permit(
            :form_key, # Make sure to permit form_key
            *evaluation_form
        )
    end

    def generate_unique_form_key
        loop do
            form_key = SecureRandom.alphanumeric(16)
            break form_key unless Evaluation.exists?(form_key: form_key)
        end
    end

    def render_internal_server_error
        respond_to do |format|
            format.html { render file: "#{Rails.root}/public/500.html", layout: false, status: :internal_server_error }
            format.any  { head :internal_server_error }
        end
    end

    def render_not_found
        respond_to do |format|
            format.html { render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found }
            format.any  { head :not_found }
        end
    end
end
