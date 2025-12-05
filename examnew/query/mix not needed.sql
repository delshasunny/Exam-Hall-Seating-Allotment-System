SELECT
    *
from
    room
where
    id not in (
        select
            exam_room_id
        from
            exam_summary
        where
            (
                is_mix_needed = false
                and exam_date = '2023-02-01'
                and (
                    (
                        TIME(exam_start) >= TIME('10:00')
                        and TIME(exam_start) <= TIME('16:00')
                    )
                ) || (
                    (
                        TIME(exam_end) >= TIME('10:00')
                        and TIME(exam_end) <= TIME('16:00')
                    )
                )
            )
    )
order by
    name