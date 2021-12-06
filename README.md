
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Indice Biologique Diatomées en Lac (IBDL) <img src='man/figures/logo.png' align="right" height="139" />

<!-- badges: start -->

[![Lifecycle:experimental](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![packageversion](https://img.shields.io/badge/Package%20version-0.0.1-orange.svg?style=flat-square)](commits/master)
[![Licence](https://img.shields.io/badge/licence-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)
<!-- [![R build status](https://github.com/SebastienBoutry/IBDL/workflows/R-CMD-check/badge.svg)](https://github.com/SebastienBoutry/IBDL/actions) -->
<!-- badges: end -->

# Installation de `{IBDL}`

La version du paquet `{IBDL}` peut se télécharger via le site Github
pour cela on aura besoin du paquet `{remotes}`:

``` r
remotes::install_github("SebastienBoutry/IBDL")
```

*NB : Le logiciel RTools est parfois nécessaire sur les machines Windows
pour pouvoir installer le package `{remotes}`, puisque l’installation
ici se fait depuis un dépôt de développement (Github) et non un dépôt
officiel R. Vous pouvez l’installer ici :
[Rtools](https://cran.r-project.org/bin/windows/Rtools/)*

Une fois installé, vous pouvez charger le package avec :

``` r
library(IBDL)
```

# Objectif

L’objectif de ce package `{IBDL}` est de fournir les fonctions
nécessaires pour calculer l’Indice Biologique Diatomées en Lacs.

*NB : L’IBDL a été développé par l’équipe ECOVEA (INRAE, unité EABX)
dans le projet Phytobenthos plan d’eau financé par l’OFB-Pôle ECLA.*

# Utilisation

Le package `{IBDL}` sert à calculer l’indice biologique diatomées en lac
afin de donner une valeur et une classe d’état écologique du plan d’eau
étudié (conforme à la Directive Cadre Européenne sur l’Eau (Directive
2000)).

## Les besoins

En utilisant le protocole d’échantillonnage (Morin et al. 2018), on
importe deux fichiers :

-   le premier contient les listes floristiques (id\_prelevement,
    taxons, ab),
-   le second renseigne sur les données de contexte liées au site
    d’étude (id\_prelevement, id\_uo, nature\_substrat, code\_gene,
    date).

### Données internes embarquées

Les jeux de données internes embarquées correspondent aux jeux de
données dit de référence. Ils sont décrits ci-dessous :

**`table_transcodage`** : Table de transcodage permettant de faire
correspondre le code\_taxon 4 lettres (type OMNIDIA) à son entité
taxonomique qui a été considérée pour la construction de l’IBDL. Le
choix pour l’indice est d’harmoniser les taxons à un rang taxonomique de
l’espèce. On a pris en compte la synonymie et l’héritage taxonomique.

Dans l’extrait ci-dessous, les deux premières colonnes correspondent au
code taxon et le nom scientifique associé. Les trois dernières colonnes
sont les informations définies lors de la construction de l’indice. Le
rang taxonomique à l’espèce a été ciblé. Le tableau ci-dessous
correspond à tous les taxons ayant un code taxon (indice) pour valeur
CBCU (*Cymbopleura cuspidata*).

<div id="jtohyjcjvp" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#jtohyjcjvp .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#jtohyjcjvp .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#jtohyjcjvp .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#jtohyjcjvp .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#jtohyjcjvp .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#jtohyjcjvp .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#jtohyjcjvp .gt_col_heading {
  color: #FFFFFF;
  background-color: #275662;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#jtohyjcjvp .gt_column_spanner_outer {
  color: #FFFFFF;
  background-color: #275662;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#jtohyjcjvp .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#jtohyjcjvp .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#jtohyjcjvp .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#jtohyjcjvp .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#jtohyjcjvp .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#jtohyjcjvp .gt_from_md > :first-child {
  margin-top: 0;
}

#jtohyjcjvp .gt_from_md > :last-child {
  margin-bottom: 0;
}

#jtohyjcjvp .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#jtohyjcjvp .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#jtohyjcjvp .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#jtohyjcjvp .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#jtohyjcjvp .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#jtohyjcjvp .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#jtohyjcjvp .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#jtohyjcjvp .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#jtohyjcjvp .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#jtohyjcjvp .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#jtohyjcjvp .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#jtohyjcjvp .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#jtohyjcjvp .gt_left {
  text-align: left;
}

#jtohyjcjvp .gt_center {
  text-align: center;
}

#jtohyjcjvp .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#jtohyjcjvp .gt_font_normal {
  font-weight: normal;
}

#jtohyjcjvp .gt_font_bold {
  font-weight: bold;
}

#jtohyjcjvp .gt_font_italic {
  font-style: italic;
}

#jtohyjcjvp .gt_super {
  font-size: 65%;
}

#jtohyjcjvp .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 65%;
}
</style>
<table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="5" class="gt_heading gt_title gt_font_normal" style>Taxons correspondant à l'espèce <em>Cymbopleura cuspidata</em> (CBCU)</th>
    </tr>
    <tr>
      <th colspan="5" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>(extrait de la table de transcodage)</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">code_taxon</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">nom scientifique</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3">
        <span class="gt_column_spanner">Harmonisation indicielle</span>
      </th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">nom scientifique (indice)</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">code_taxon (indice)</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">rang taxonomique (indice)</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left">CABK</td>
<td class="gt_row gt_left" style="font-style: italic;">Cymbopleura apiculata var. baicalensis</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">Cymbopleura cuspidata</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">CBCU</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">sp</td></tr>
    <tr><td class="gt_row gt_left">CBAP</td>
<td class="gt_row gt_left" style="font-style: italic;">Cymbopleura apiculata</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">Cymbopleura cuspidata</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">CBCU</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">sp</td></tr>
    <tr><td class="gt_row gt_left">CBCU</td>
<td class="gt_row gt_left" style="font-style: italic;">Cymbopleura cuspidata</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">Cymbopleura cuspidata</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">CBCU</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">sp</td></tr>
    <tr><td class="gt_row gt_left">CCAN</td>
<td class="gt_row gt_left" style="font-style: italic;">Cymbella cuspidata var. anglica</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">Cymbopleura cuspidata</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">CBCU</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">sp</td></tr>
    <tr><td class="gt_row gt_left">CCBO</td>
<td class="gt_row gt_left" style="font-style: italic;">Cymbella cuspidata f. borealis</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">Cymbopleura cuspidata</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">CBCU</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">sp</td></tr>
    <tr><td class="gt_row gt_left">CCIP</td>
<td class="gt_row gt_left" style="font-style: italic;">Cymbella cuspidata f. impressa</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">Cymbopleura cuspidata</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">CBCU</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">sp</td></tr>
    <tr><td class="gt_row gt_left">CCSC</td>
<td class="gt_row gt_left" style="font-style: italic;">Cymbella cuspidata var. schulzii</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">Cymbopleura cuspidata</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">CBCU</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">sp</td></tr>
    <tr><td class="gt_row gt_left">CCUS</td>
<td class="gt_row gt_left" style="font-style: italic;">Cymbella cuspidata</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">Cymbopleura cuspidata</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">CBCU</td>
<td class="gt_row gt_left" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">sp</td></tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="5">Table créée à partir du fichier d'Omnidia (Michel Coste)</td>
    </tr>
  </tfoot>
  
</table>
</div>

**`table_taxons_alertes`** Table binaire indiquant si le taxon est
considéré comme indiciel et/ou d’alerte selon les paramètres (DBO5, MES,
NKJ et Ptot).

<div id="qcgepafjvn" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#qcgepafjvn .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#qcgepafjvn .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#qcgepafjvn .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#qcgepafjvn .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#qcgepafjvn .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#qcgepafjvn .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#qcgepafjvn .gt_col_heading {
  color: #FFFFFF;
  background-color: #275662;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#qcgepafjvn .gt_column_spanner_outer {
  color: #FFFFFF;
  background-color: #275662;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#qcgepafjvn .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#qcgepafjvn .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#qcgepafjvn .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#qcgepafjvn .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#qcgepafjvn .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#qcgepafjvn .gt_from_md > :first-child {
  margin-top: 0;
}

#qcgepafjvn .gt_from_md > :last-child {
  margin-bottom: 0;
}

#qcgepafjvn .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#qcgepafjvn .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#qcgepafjvn .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#qcgepafjvn .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#qcgepafjvn .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#qcgepafjvn .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#qcgepafjvn .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#qcgepafjvn .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#qcgepafjvn .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#qcgepafjvn .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#qcgepafjvn .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#qcgepafjvn .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#qcgepafjvn .gt_left {
  text-align: left;
}

#qcgepafjvn .gt_center {
  text-align: center;
}

#qcgepafjvn .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#qcgepafjvn .gt_font_normal {
  font-weight: normal;
}

#qcgepafjvn .gt_font_bold {
  font-weight: bold;
}

#qcgepafjvn .gt_font_italic {
  font-style: italic;
}

#qcgepafjvn .gt_super {
  font-size: 65%;
}

#qcgepafjvn .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 65%;
}
</style>
<table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Table des taxons d'alertes</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>(extrait des 6 premières lignes)</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">code_taxon</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">indiciel</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">DBO5</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">MES</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">NKJ</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">Ptot</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left">AAMB</td>
<td class="gt_row gt_right">1</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right">0</td></tr>
    <tr><td class="gt_row gt_left">ABRT</td>
<td class="gt_row gt_right">1</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right">0</td></tr>
    <tr><td class="gt_row gt_left">ABRY</td>
<td class="gt_row gt_right">1</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right">0</td></tr>
    <tr><td class="gt_row gt_left">ACAF</td>
<td class="gt_row gt_right">1</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right">0</td></tr>
    <tr><td class="gt_row gt_left">ACLI</td>
<td class="gt_row gt_right">1</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">1</td></tr>
    <tr><td class="gt_row gt_left">ACOP</td>
<td class="gt_row gt_right">1</td>
<td class="gt_row gt_right" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">1</td>
<td class="gt_row gt_right" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">1</td>
<td class="gt_row gt_right" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">1</td>
<td class="gt_row gt_right" style="background-color: #66C1BF; color: #FFFFFF; font-style: italic;">1</td></tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">Sortie de l'analyse Titan</td>
    </tr>
  </tfoot>
  
</table>
</div>

**`table_reference`**

<div id="pyhclzwurv" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#pyhclzwurv .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#pyhclzwurv .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pyhclzwurv .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#pyhclzwurv .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#pyhclzwurv .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pyhclzwurv .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pyhclzwurv .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#pyhclzwurv .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#pyhclzwurv .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#pyhclzwurv .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#pyhclzwurv .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#pyhclzwurv .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#pyhclzwurv .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#pyhclzwurv .gt_from_md > :first-child {
  margin-top: 0;
}

#pyhclzwurv .gt_from_md > :last-child {
  margin-bottom: 0;
}

#pyhclzwurv .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#pyhclzwurv .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#pyhclzwurv .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pyhclzwurv .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#pyhclzwurv .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pyhclzwurv .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#pyhclzwurv .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#pyhclzwurv .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pyhclzwurv .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pyhclzwurv .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#pyhclzwurv .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pyhclzwurv .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#pyhclzwurv .gt_left {
  text-align: left;
}

#pyhclzwurv .gt_center {
  text-align: center;
}

#pyhclzwurv .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#pyhclzwurv .gt_font_normal {
  font-weight: normal;
}

#pyhclzwurv .gt_font_bold {
  font-weight: bold;
}

#pyhclzwurv .gt_font_italic {
  font-style: italic;
}

#pyhclzwurv .gt_super {
  font-size: 65%;
}

#pyhclzwurv .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 65%;
}
</style>
<table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="5" class="gt_heading gt_title gt_font_normal" style>Table de référence.</th>
    </tr>
    <tr>
      <th colspan="5" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>(extrait des 6 premières lignes)</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Paramètre</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Classe d'alcalinité</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Substrat</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">Mtype</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">SDtype</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left">DBO5</td>
<td class="gt_row gt_left">LA</td>
<td class="gt_row gt_left">dur</td>
<td class="gt_row gt_right">0.98</td>
<td class="gt_row gt_right">0.02</td></tr>
    <tr><td class="gt_row gt_left">DBO5</td>
<td class="gt_row gt_left">MA</td>
<td class="gt_row gt_left">dur</td>
<td class="gt_row gt_right">0.88</td>
<td class="gt_row gt_right">0.12</td></tr>
    <tr><td class="gt_row gt_left">DBO5</td>
<td class="gt_row gt_left">HA</td>
<td class="gt_row gt_left">dur</td>
<td class="gt_row gt_right">0.77</td>
<td class="gt_row gt_right">0.23</td></tr>
    <tr><td class="gt_row gt_left">DBO5</td>
<td class="gt_row gt_left">LA</td>
<td class="gt_row gt_left">végétal</td>
<td class="gt_row gt_right">0.98</td>
<td class="gt_row gt_right">0.02</td></tr>
    <tr><td class="gt_row gt_left">DBO5</td>
<td class="gt_row gt_left">MA</td>
<td class="gt_row gt_left">végétal</td>
<td class="gt_row gt_right">0.90</td>
<td class="gt_row gt_right">0.16</td></tr>
    <tr><td class="gt_row gt_left">DBO5</td>
<td class="gt_row gt_left">HA</td>
<td class="gt_row gt_left">végétal</td>
<td class="gt_row gt_right">0.83</td>
<td class="gt_row gt_right">0.23</td></tr>
  </tbody>
  
  
</table>
</div>

**`table_lacs`** Table regroupant les informations sur la classification
des lacs selon l’alcalinité et le nombre théoriques d’unités
d’observation à échantillonner sur le plan d’eau selon leur superficie
(Afnor 2010).

Les classes d’alcalinité des plans d’eau sont définis comme ceci :

-   LA : alcalinité &lt;0.2 meq.l-1;
-   MA : 0.2 meq.l-1 &lt; alcalinité &lt; 1 meq.l-1;
-   HA : alcalinité &gt;1 meq.l-1.

<div id="zemluqpbhs" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#zemluqpbhs .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#zemluqpbhs .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#zemluqpbhs .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#zemluqpbhs .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#zemluqpbhs .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zemluqpbhs .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#zemluqpbhs .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#zemluqpbhs .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#zemluqpbhs .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#zemluqpbhs .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#zemluqpbhs .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#zemluqpbhs .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#zemluqpbhs .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#zemluqpbhs .gt_from_md > :first-child {
  margin-top: 0;
}

#zemluqpbhs .gt_from_md > :last-child {
  margin-bottom: 0;
}

#zemluqpbhs .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#zemluqpbhs .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#zemluqpbhs .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#zemluqpbhs .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#zemluqpbhs .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#zemluqpbhs .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#zemluqpbhs .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#zemluqpbhs .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zemluqpbhs .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#zemluqpbhs .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#zemluqpbhs .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#zemluqpbhs .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#zemluqpbhs .gt_left {
  text-align: left;
}

#zemluqpbhs .gt_center {
  text-align: center;
}

#zemluqpbhs .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#zemluqpbhs .gt_font_normal {
  font-weight: normal;
}

#zemluqpbhs .gt_font_bold {
  font-weight: bold;
}

#zemluqpbhs .gt_font_italic {
  font-style: italic;
}

#zemluqpbhs .gt_super {
  font-size: 65%;
}

#zemluqpbhs .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 65%;
}
</style>
<table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="5" class="gt_heading gt_title gt_font_normal" style>Table de la classification des plans d'eau selon la typologie européenne à partir de l'alcalinité.</th>
    </tr>
    <tr>
      <th colspan="5" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>(extrait des 6 premières lignes)</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">code_pe</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">nom_lac</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">code_gene</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">Classe d'alcalinité</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">Nombre minimum d'UO</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left">ABB39</td>
<td class="gt_row gt_left">Abbaye (l' )</td>
<td class="gt_row gt_left">V2415023</td>
<td class="gt_row gt_center">HA</td>
<td class="gt_row gt_right">3</td></tr>
    <tr><td class="gt_row gt_left">AGE23</td>
<td class="gt_row gt_left">Age (l' ) [complexe de l'Age]</td>
<td class="gt_row gt_left">L42-4103</td>
<td class="gt_row gt_center">MA</td>
<td class="gt_row gt_right">3</td></tr>
    <tr><td class="gt_row gt_left">AIG15</td>
<td class="gt_row gt_left">Aigle (de l' )</td>
<td class="gt_row gt_left">P0--5013</td>
<td class="gt_row gt_center">MA</td>
<td class="gt_row gt_right">6</td></tr>
    <tr><td class="gt_row gt_left">AIG73</td>
<td class="gt_row gt_left">Aiguebelette</td>
<td class="gt_row gt_left">V1535003</td>
<td class="gt_row gt_center">HA</td>
<td class="gt_row gt_right">6</td></tr>
    <tr><td class="gt_row gt_left">AIL02</td>
<td class="gt_row gt_left">Ailette (barrage de l' )</td>
<td class="gt_row gt_left">H0227103</td>
<td class="gt_row gt_center">HA</td>
<td class="gt_row gt_right">3</td></tr>
    <tr><td class="gt_row gt_left">ALB85</td>
<td class="gt_row gt_left">Albert (retenue d' )  [complexe de Mervent]</td>
<td class="gt_row gt_left">N7105103</td>
<td class="gt_row gt_center">HA</td>
<td class="gt_row gt_right">3</td></tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="5">LA : low alkalinity ; MA : moderate alkalinity ; HA : higth alkalinity</td>
    </tr>
  </tfoot>
  
</table>
</div>

(la table des taxons d’alertes, la table de transcodage, la table de
classification des plans d’eau, la table des valeurs de référence).

<div align="center">

<img src = "man/figures/1_script_IBDL_besoins.png" align="center" height="600"/>

</div>

## Les étapes

On trouvera les fonctions utiles selon le cheminement (-ref-) afin
d’évaluer la qualité écologique de la masse d’eau à partir des
communautées de diatomées benthiques.

Certaines fonctions permettent de :

-   harmoniser les données,
-   qualifier/valider les données ou les métriques,
-   calculer les métriques selon un grain spatial (prélèvement, unité
    d’observation et lac).

Toutes les fonctions seront détaillées dans la vignette du package.

<div align="center">

<img src = "man/figures/2_phases_programmation.png" label="steps" align="center" height="600"/>

</div>

# Contact

<div align="center">

   :e-mail:
[Email](mailto:sebastien.boutry@inrae.fr)   \|   :speech\_balloon:
[Twitter](https://twitter.com/SebBoutry)   \|   :necktie:
[LinkedIn](https://www.linkedin.com/in/s%C3%A9bastien-boutry-4a77ba10/)

<!--
Quick Link
-->

</div>

# Références

ref article ref rapport OFB

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-afnorXP" class="csl-entry">

Afnor. 2010. “XP T90-328 Qualité de l’eau Echantillonnage Des
Communautés de Macrophytes En Plans d’eau.”

</div>

<div id="ref-directive2000water" class="csl-entry">

Directive, Water Framework. 2000. “Water Framework Directive.” *Journal
Reference OJL* 327: 1–73.

</div>

<div id="ref-Morin2018" class="csl-entry">

Morin, Soizic, Damien Valade, Juliette Rosebery, and Vincent Bertrin.
2018. “Echantillonnage Des Communautés de Phytobenthos En Plans d’eau.”
Technical report. Irstea.

</div>

</div>
