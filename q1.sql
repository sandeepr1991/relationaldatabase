select VillaID from V_features where FeaName='Jacuzzi' 
MINUS
select VillaId from V_features where
FeaName='pets allowed'