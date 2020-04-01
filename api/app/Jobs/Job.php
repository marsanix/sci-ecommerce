<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

abstract class Job implements ShouldQueue
{
    /*
    |--------------------------------------------------------------------------
    | Queueable Jobs
    |--------------------------------------------------------------------------
    |
    | This job base class provides a central location to place any logic that
    | is shared across all of your jobs. The trait included with the class
    | provides access to the "queueOn" and "delay" queue helper methods.
    |
    */

    use InteractsWithQueue, Queueable, SerializesModels;

    public function push($job, $data = '', $queue = null)
    {
            return $this->pushToDatabase($queue, $this->createPayload($job, $data));
    }

    protected function pushToDatabase($queue, $payload, $delay = 0, $attempts = 0)
    {
            return $this->database->table($this->table)->insertGetId($this->buildDatabaseRecord(
                $this->getQueue($queue), $payload, $this->availableAt($delay), $attempts
            ));
    }

    protected function buildDatabaseRecord($queue, $payload, $availableAt, $attempts = 0)
    {
            return [
                'queue' => $queue,
                'payload' => $payload,
                'attempts' => $attempts,
                'reserved_at' => null,
                'available_at' => $availableAt,
                'created_at' => $this->currentTime(),
            ];
    }

}
