using {demo} from '..//db//schema';

service ProjectService {
entity Users as select from demo.Users;
entity SrvUsers  as projection on demo.Users
                                where
                                        id > 1000
                                    and id < 4000;

entity Projects as select from demo.Projects;

entity User1             as
        select
            id,
            name,
            gender,
            case when gender = 'female'
                then
                    'FEMALE'
                else
                    'MALE'
            end as CalculatedColumn:String(10)
 
    from demo.Users;
 
    entity UserContactDetail as
        projection on demo.Users
        excluding {
            name,
            gender
        };


}
