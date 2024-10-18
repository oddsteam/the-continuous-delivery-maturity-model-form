class HomeController < ApplicationController
    def index
        @table = {
            :col_headers => [ "Initial", "Managed", "Defined", "Qualitatively Managed", "Optimizing" ],
            :row_headers => [ "Culture & Organization", "Build & Deploy", "Release", "Data Management", "Test & Verification", "Information & Reporting" ],
            :rows => [
                [
                    [
                        {
                            :label => "Teams organized based on platform/technology",
                            :description => "ทีมจัดตั้งตามแพลตฟอร์ม/เทคโนโลยี"
                        },
                        {
                            :label => "Defined and documented process",
                            :description => "มีการกำหนดกระบวนการทำงานชัดเจนและเป็นลายลักษณ์อักษร"
                        },
                    ],
                    [
                        {
                            :label => "One backlog per team",
                            :description => "ทีมมีหนึ่ง product backlog"
                        },
                        {
                            :label => "Adopt agile methodologies",
                            :description => "มีการนำกระบวนการทำงานแบบ agile ไปใช้"
                        },
                        {
                            :label => "Remove team boundaries",
                            :description => "ไม่มีการแบ่งความรับผิดชอบระหว่างทีม"
                        },
                    ],
                    [
                        {
                            :label => "Extended team collaboration",
                            :description => "มีการประสานงานกันระหว่างทีม"
                        },
                        {
                            :label => "Remove boundary dev/ops",
                            :description => "ไม่มีการแบ่งความรับผิดชอบระหว่าง dev และ ops"
                        },
                        {
                            :label => "Common process for all changes",
                            :description => "ใช้กระบวนการจัดการเหมือนกันสำหรับทุกความเปลี่ยนแปลง"
                        },
                    ],
                    [
                        {
                            :label => "Cross-team continuous improvement",
                            :description => "มีกระบวนการปรับปรุงอย่างต่อเนื่องกันทั่วทุกทีม"
                        },
                        {
                            :label => "Teams responsible all the way to production",
                            :description => "ทีมรับผิดชอบทุกอย่างในการนำของขึ้นสู่ production"
                        },
                    ],
                    [
                        {
                            :label => "Cross functional teams",
                            :description => "ทีมสามารถทำงานข้ามฟังก์ชั่นกันได้"
                        },
                    ]
                ],
                [
                    [
                        {
                            :label => "Centralized version control",
                            :description => "ใช้ version control แบบ centralized"
                    },
                        {
                            :label => "Automated build scripts",
                            :description => "ใช้สคริปท์ในการ build แบบอัตโนมัติ"
                    },
                        {
                            :label => "No management of artifacts",
                            :description => "ไม่มีการจัดการของที่ถูก build"
                    },
                        {
                            :label => "Manual deployment",
                            :description => "deploy แบบ manual"
                    },
                        {
                            :label => "Environments are manually provisioned",
                            :description => "เตรียม environment ต่าง ๆ แบบ manual"
                    },
                    ],
                    [
                        {
                            :label => "Polling CI builds",
                            :description => "ใช้วิธีการ poll ในการเริ่ม build บน CI"
                        },
                        {
                            :label => "Any build can be re-created from source control",
                            :description => "Build ต่าง ๆ สามารถสร้างขึ้นใหม่ได้จาก source control"
                        },
                        {
                            :label => "Management of build artifacts",
                            :description => "มีการจัดการของที่ถูก build"
                        },
                        {
                            :label => "Automated deployment scripts",
                            :description => "ใช้สคริปท์ในการ deploy แบบอัตโนมัติ"
                        },
                        {
                            :label => "Automated provisioning of environments",
                            :description => "สร้าง environment ต่าง ๆ แบบอัตโนมัติ"
                        },
                    ],
                    [
                        {
                            :label => "Commit hook CI builds",
                            :description => "ใช้ commit hook ในการเริ่ม build บน CI"
                        },
                        {
                            :label => "Build fails if quality is not met (code analysis, performance, etc.)",
                            :description => "Build จะล้มเหลวถ้าตรวจสอบคุณภาพไม่ผ่าน เช่น การวิเคราะห์โค้ด การตรวจสอบประสิทธิภาพ เป็นต้น"
                        },
                        {
                            :label => "Push button deployment and release of any releasable artifact to any environment",
                            :description => "มีปุ่มให้กดเพื่อทำการ deploy และ release ของที่ build แล้วไปยัง environment ใด ๆ"
                        },
                        {
                            :label => "Standard deployment process for all environments",
                            :description => "มีวิธีการ deploy เป็นมาตรฐานเดียวกันกับทุก ๆ environment"
                        },
                    ],
                    [
                        {
                            :label => "Team priorities keeping codebase deployable over doing new work",
                            :description => "ทีมให้ความสำคัญกับการทำให้โค้ดสามารถ deploy ได้มากกว่าไปเริ่มงานอื่น"
                        },
                        {
                            :label => "Builds are not left broken",
                            :description => "Build จะต้องไม่ถูกปล่อยให้พัง"
                        },
                        {
                            :label => "Orchestrated deployments",
                            :description => "มีการ deploy แบบหลายเครื่อง หลาย environment พร้อม ๆ กัน"
                        },
                        {
                            :label => "Blue Green Deployments",
                            :description => "มีการ deploy โดยการใช้ Blue/Green deployment"
                        },
                    ],
                    [
                        {
                            :label => "Zero touch Continuous Deployments",
                            :description => "ทุก commit ถูก build และ deploy ไปยัง production โดยอัตโนมัติ"
                        },
                    ]
                ],
                [
                    [
                        {
                            :label => "Infrequent and unreliable releases",
                            :description => "Release ไม่บ่อย และบางครั้งไม่สำเร็จ"
                    },
                        {
                            :label => "Manual process",
                            :description => "Release แบบ manual"
                    },
                    ],
                    [
                        {
                            :label => "Painful infrequent but reliable releases",
                            :description => "Release ไม่บ่อย แต่สำเร็จอย่างยากลำบาก"
                        },
                    ],
                    [
                        {
                            :label => "Infrequent but fully automated and reliable releases in any environment",
                            :description => "Release ไม่บ่อย แต่ทำได้อย่างอัตโนมัติ และสำเร็จทุกครั้งในทุก ๆ environment"
                        },
                    ],
                    [
                        {
                            :label => "Frequent fully automated releases",
                            :description => "Release บ่อย ด้วยวิธีอัตโนมัติ"
                        },
                        {
                            :label => "Deployment disconnected from release",
                            :description => "การ deploy กับ release แยกออกจากกัน"
                        },
                        {
                            :label => "Canary releases",
                            :description => "Release ด้วยวิธี canary release"
                        },
                    ],
                    [
                        {
                            :label => "No rollbacks, always roll forward",
                            :description => "ไม่มีการ rollback ใช้ roll forward เสมอ"
                        },
                    ]
                ],
                [
                    [
                        {
                            :label => "Data migrations are performed manually, no scripts",
                            :description => "การย้ายข้อมูลใช้วิธี manual ไม่มีการใช้ script"
                    },
                    ],
                    [
                        {
                            :label => "Data migrations using versioned scripts, performed manually",
                            :description => "การย้ายข้อมูลใช้ script ที่มีการควบคุม version แต่รันแบบ manual"
                        },
                    ],
                    [
                        {
                            :label => "Automated and versioned changes to datastores",
                            :description => "มีการควบคุมเวอร์ชั่นของการเปลี่ยนแปลงข้อมูลใด ๆ แบบอัตโนมัติ"
                        },
                    ],
                    [
                        {
                            :label => "Changes to datastores automatically performed as part of the deployment process",
                            :description => "การเปลี่ยนแปลงของข้อมูลทำไปอย่างอัตโนมัติพร้อมกับการ deploy"
                        },
                    ],
                    [
                        {
                            :label => "Automatic datastore changes and rollbacks tested with every deployment",
                            :description => "การเปลี่ยนแปลงของข้อมูล รวมถึงการ rollback มีการทดสอบอย่างอัตโนมัติด้วยในทุก ๆ การ deploy"
                        },
                    ]
                ],
                [
                    [
                        {
                            :label => "Automated unit tests",
                            :description => "มีการรัน unit test แบบอัตโนมัติ"
                    },
                        {
                            :label => "Separate test environment",
                            :description => "มีการแยก test environment ออกมา"
                    },
                    ],
                    [
                        {
                            :label => "Automatic Integration Tests",
                            :description => "มีการทดสอบแบบ integration แบบอัตโนมัติ"
                        },
                        {
                            :label => "Static code analysis",
                            :description => "มีการทำ static code analysis"
                        },
                        {
                            :label => "Test coverage analysis",
                            :description => "มีการทำ test coverage analysis"
                        },
                    ],
                    [
                        {
                            :label => "Automatic functional tests",
                            :description => "มีการทำ functional test แบบอัตโนมัติ"
                        },
                        {
                            :label => "Manual performance/security tests",
                            :description => "มีการทำ performance test และ security test แบบ manual"
                        },
                    ],
                    [
                        {
                            :label => "Fully automatic acceptance",
                            :description => "มีการทำ acceptance test แบบอัตโนมัติเต็มรูปแบบ"
                        },
                        {
                            :label => "Automatic performance/security tests",
                            :description => "มีการทำ performance test และ security test แบบอัตโนมัติ"
                        },
                        {
                            :label => "Manual exploratory testing based on risk based testing analysis",
                            :description => "มีการทำ exploratory test โดยอิงจากการวิเคราะห์จากความเสี่ยง"
                        },
                    ],
                    [
                        {
                            :label => "Verify expected business value",
                            :description => "มีการยืนยัน business value ที่คาดหวัง"
                        },
                        {
                            :label => "Defects found and fixed immediately (roll forward)",
                            :description => "ปัญหาที่พบถูกแก้ไขทันที (roll forward)"
                        },
                    ]
                ],
                [
                    [
                        {
                            :label => "Baseline process metrics",
                            :description => "มีการกำหนดตัวชี้วัดกระบวนการทำงาน"
                    },
                        {
                            :label => "Manual reporting",
                            :description => "รายงานต่าง ๆ ถูกสร้างแบบ manual"
                    },
                        {
                            :label => "Visible to report runner",
                            :description => "คนทำรายงานจะต้องเข้าถึงรายงานได้"
                    },
                    ],
                    [
                        {
                            :label => "Measure the process",
                            :description => "มีการวัดผลกระบวนการ"
                        },
                        {
                            :label => "Automatic reporting",
                            :description => "รายงานต่าง ๆ ถูกสร้างอย่างอัตโนมัติ"
                        },
                        {
                            :label => "Visible to team",
                            :description => "ทีมจะต้องสามารถเข้าถึงรายงานได้"
                        },
                    ],
                    [
                        {
                            :label => "Automatic generation of release notes",
                            :description => "Release note ถูกสร้างอย่างอัตโนมัติ"
                        },
                        {
                            :label => "Pipeline traceability",
                            :description => "Pipeline จะต้องสามารถถูกตรวจสอบการทำงานได้"
                        },
                        {
                            :label => "Reporting history",
                            :description => "สามารถดูรายงานย้อนหลังได้"
                        },
                        {
                            :label => "Visible to cross-silo",
                            :description => "ทีมอื่น ๆ สามารถเข้าถึงรายงานได้"
                        },
                    ],
                    [
                        {
                            :label => "Report trend analysis",
                            :description => "มีรายงานการวิเคราะห์แนวโน้มต่าง ๆ"
                        },
                        {
                            :label => "Real time graphs on deployment pipeline metrics",
                            :description => "แสดงกราฟของตัวชี้วัดต่าง ๆ ใน pipeline ของการ deploy"
                        },
                    ],
                    [
                        {
                            :label => "Dynamic self-service of information",
                            :description => "มีข้อมูลให้เลือกดูได้เอง"
                        },
                        {
                            :label => "Customizable dashboards",
                            :description => "สามารถปรับแต่ง dashboard ได้"
                        },
                        {
                            :label => "Cross-reference across organizational boundaries",
                            :description => "มีการอ้างอิงถึงข้อมูลจากหน่วยงานอื่น ๆ ในองค์กร"
                        },
                    ]
                ]
            ]
        }

    end
end
