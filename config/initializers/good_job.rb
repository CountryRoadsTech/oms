Rails.application.configure do
    config.good_job.preserve_job_records = true
    config.good_job.cleanup_discarded_jobs = false
    config.good_job.cleanup_preserved_jobs_before_seconds_ago = Float::INFINITY
  end
