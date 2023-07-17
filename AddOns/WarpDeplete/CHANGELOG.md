# WarpDeplete

## [v2.6.0](https://github.com/happenslol/WarpDeplete/tree/v2.6.0) (2023-07-15)
[Full Changelog](https://github.com/happenslol/WarpDeplete/compare/v2.5.1...v2.6.0) [Previous Releases](https://github.com/happenslol/WarpDeplete/releases)

- Add ptBR locale (#52)  
    Co-authored-by: Fellipe Medeiros <fellipe.medeiros1@gmail.com>  
- feat: Record objective completion timings and show differences (#46)  
    * add gitignore  
    * Outsource AceDB initialization into own file  
    This is a preparation step for recording best-kill-times  
    of bosses. Since we need the database for that kind of  
    data too, it no longer just belongs to the options "namespace".  
    To keep things clean we move it into its own file.  
    * Record objective completion timings and allow to display differences  
    * Apply requested changes  
- Add koKR locale (#49)  
