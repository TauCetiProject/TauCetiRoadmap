# Roadmap: potential automorphy infrastructure

**Summary.** This roadmap supplies the arithmetic infrastructure between the cohomology of arithmetic locally symmetric spaces for `GLₙ` over a CM field and the automorphy lifting theorems of Allen–Calegari–Caraiani–Gee–Helm–Le Hung–Newton–Scholze–Taylor–Thorne: integral coefficient systems and the splitting of `GLₙ` cohomology off the Siegel boundary of a unitary group, degree shifting and local–global compatibility at `p` in the Fontaine–Laffaille and ordinary cases, Hida theory with derived ordinary parts, the arithmetic deformation–Hecke maps, and the verification of the hypotheses of derived patching, ending in the two automorphy lifting theorems of Layer 5. It also owns the soluble base change, auxiliary-field and rank-two compatible-system lemmas that potential automorphy arguments reuse (Layer 2), and the integral representation-theoretic and local Hecke inputs that the Tau Ceti roadmaps it builds on do not state: integral dual Weyl modules with their Levi splitting and bottom-alcove duality, Hecke algebras of positive monoids, smooth modules over open monoids, the image of a residually multiplicity-free pair, forms of products of `PGL₂`, the residual Iwahori Hecke algebra at Taylor–Wiles places and the irreducibility of pure unramified principal series.

This roadmap builds the arithmetic comparisons that let torsion cohomology produce automorphy lifting theorems for `GLₙ` over CM fields, and the transport lemmas that let potential automorphy arguments reuse them. Its central objects are integral coefficient systems, localized boundary cohomology, ordinary completed cohomology, arithmetic deformation–Hecke maps and paired patched complexes. Its two main lifting results are the Fontaine–Laffaille and ordinary theorems of Allen–Calegari–Caraiani–Gee–Helm–Le Hung–Newton–Scholze–Taylor–Thorne. Neither result assumes a polarization of the rank-n representation. Layer 2 provides soluble base change and descent, residual-image preservation, and rank-two compatible-system tools used by symmetric-power arguments.

The constructions retain coefficient rings, levels, twists, labelled weights and degree shifts. Each patching application exhibits its algebraic data. Support describes primes at which a module is nonzero; it does not identify integral deformation and Hecke rings. Rank-one characters and the stated higher-rank `p`-bounds remain distinct branches.

The suggested file states the light definitions that the pinned libraries can already carry — equivariant retracts, the unitary weight dictionary, Siegel Kostant shuffles, the CTG predicate, the weight-zero and oddness conditions, the positive torus monoid, the lowest-weight and ordinary characters in unit/valuation coordinates, the Iwahori and Taylor–Wiles congruence levels, relative Bruhat cells and the orientation character — with discriminating examples, and the milestones whose carriers exist there: `shifted_partition_recovery`, `simple_galois_composita`, the minimal-representative property of Kostant shuffles, the two diamond quotients, the Taylor–Wiles index, the character prescriptions and their coordinate change, and the longest-cell lengths. Every arithmetic definition and theorem is stated in this document only, because its carriers (arithmetic cohomology, Hecke algebras, Galois representations of number fields, automorphic representations, deformation rings, patched complexes, integral dual Weyl modules) require the arithmetic APIs specified below.

## Scope and ownership

The arithmetic locally symmetric spaces, their Borel–Serre compactification, groupoid and sheaf cohomology, derived Hecke actions, finite-level duality and the Matsushima comparison belong to **ArithmeticLocallySymmetricSpaces** (ALS.1–ALS.5b). **HodgeTateAndCanonicalSubgroups** supplies canonical subgroups and the Hodge–Tate foundations; **PerfectoidShimuraVarieties**, Layers 1–3, supplies the Siegel charts, Hodge-type image compactifications and period maps; **TorsionCohomologyInfrastructure**, Layers 2, 3b and 4, supplies completed compact-support comparison, classical Hecke continuity and interpolated torsion determinants. **IgusaVarietiesAndTorsionConcentration** supplies partial Igusa compactifications, compactified period fibres, semiperversity, residual systems (IG.6.6a–IG.6.6b), the boundary-length obstruction (IG.6.7) and generic vanishing (IG.7.5–IG.7.8). Layer 0 consumes those objects on the specified unitary PEL datum. It owns the arithmetic group, coefficient and all-place Hecke comparisons in §§0.7a–0.7b, rather than their geometric or determinant constructions. Section 1.0 specializes the supplied middle-degree export to the Siegel coefficients and ordinary towers. Layer 3 adds the positive-monoid and residual-summand comparisons for the fixed-exponent smooth towers (§§3.13, 3.21).

Scalar Fontaine–Laffaille theory belongs to **FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.3. The common labelled coefficient category and covariant realization belong to **LocalGaloisDeformationRings**, §1.6; its automorphic interval-twist specialization belongs to **AutomorphicGaloisRepresentations**, §1.5a. Rational crystalline comparisons belong to **PadicHodgeTheory**, §§3.2–3.6 and 6.1, with the numerical Hodge-sign transport of AG2.0, and the Galois representations attached to Hecke algebras and automorphic representations, with their local–global compatibility away from `p`, to **AutomorphicGaloisRepresentationsPartII** (AG2.0–AG2.7). Local and global deformation rings belong to **LocalGaloisDeformationRings** (§§1.12–1.13, 2.15, 3.7, 6.24 and 7.1–7.6) and **GlobalGaloisDeformations** (G7, G8). Perfect-complex reconstruction, ultrapatching and the abstract support theorem belong to **DeformationAndDerivedPatchingAlgebra** (Layers 7–9). Layers 4 and 5 verify the arithmetic inputs to those results.

Compatible-system carriers, operations and the de Rham rank-one classification belong to **PotentialModularityAndCompatibleSystems** (Layer 1 and §§2.12–2.16). Layer 2 supplies the applications of Henniart's rational abelian classification and Larsen's maximality theorem needed before all-member de Rhamness is known; these do not follow from that owner's stronger weak-system hypotheses. Frobenius recognition of semisimple representations belongs to **ArithmeticGaloisRepresentations** (§§5.1–5.3), as do finite-image enormousness and the scalar calculations (§§7.7 and 7.10–7.12). Cyclic automorphic base change and descent belong to **AutomorphicSpectralTheory**, §7.1, with the all-place comparison of **EndoscopicTransferAndUnitaryTraceComparison**, §§6.12 and 6.24, and local factors to **AutomorphicLFunctionsAndLocalFactors**, AL.3; Layer 2 owns their compatibility with the specified Galois representations and labelled weights. The Artinian ordinary projector of **PadicFamilies**, Layer `0a`, is imported.

From Tau Ceti's own roadmaps, **SmoothRepresentationsOfLocalGroups** supplies the smooth category of a locally profinite group over a commutative ring and its derived category (SR.0, SR.0d), Hecke algebras over rings with the positive Hecke homomorphism, the restriction–integration map and the strongly positive localisation of ACC Lemmas 2.1.12–2.1.13 (SR.1.4), the Bernstein presentation (SR.1.5), smooth induction with Frobenius reciprocity and parabolic induction (SR.2), the Iwahori block (SR.3.4) and the stable-operator predicate `StableOperator` with the identification of a stable image with a localisation (SR.6.5). **IntegralHeckeAndGaloisDeterminants** supplies determinants, their kernels and base change (Layer 0), semisimple reconstruction and the henselian one-block theorem (Layer 1), and Hecke images in the derived category with the telescope, the factorial-power idempotent and ordinary finiteness (§2.3). **ReductiveGroups** supplies roots, Weyl groups, parabolics and pinned split group schemes over `ℤ` (Layers 7 and 9); **ReductiveGroupsPartII** supplies Weil restriction (RG2.0a), the level subgroups `LevelSubgroups.iwahori` and `proPIwahori` (RG2.3) and Bruhat–Iwahori decompositions (RG2.4); **Chebotarev** supplies the Dirichlet-density Chebotarev theorem (Layer 10); **ClassFieldTheory** supplies local Tate duality (Layer 5) and global reciprocity and existence (Layers 11–12). Finite local-extension solubility and continuous abelian first cohomology are supplied by the pinned Tau Ceti modules listed in Exact supplier contracts.

Several inputs of the arguments are not stated by those roadmaps and are targets here, in the layer that first uses them: integral dual Weyl modules of `GLₙ` and of the unitary group, their Levi splitting and their duality in the bottom alcove, and the monoid statements of ACC Lemmas 2.1.10, 2.1.11 and 2.1.14 with the evaluation splitting (Layer 0); the image of a residually multiplicity-free pair of representations (Layer 1); forms of products of `PGL₂` and the irreducibility of pure unramified principal series (Layer 2); smooth modules over open monoids and their injectives (Layer 3); and the residual Iwahori Hecke algebra at Taylor–Wiles places (Layer 5). The ordinary summand of Layer 3 adds the arithmetic level, diamond action and Hecke image to the generic stable-image theory of SR.6.5 and IHG §2.3. The Siegel cells add compact integral charts and place-indexed relative lengths to RG2.4, and the Iwahori tower refines the Iwahori subgroup of RG2.3 by two congruence depths and adelic diamonds. The highest-weight theory of RepresentationTheory/LieHighestWeight, Standing conventions and Layer 4 is over algebraically closed fields of characteristic zero and supplies no integral lattice.

Mathlib's `CategoryTheory.PresheafOfGroups.H1` in `Mathlib.CategoryTheory.Sites.NonabelianCohomology.H1` is the quotient of Čech cocycles for a family of objects. The continuous Galois cocycles with noncommutative coefficients needed for forms of `PGL₂` use a different carrier, specified in Layer 2. For abelian coefficients, use the existing `TauCeti.ContCohomology.H1` in `TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree` and `explicitH1AddEquivContinuousCohomology` in its `CohomologyComparison` module: the latter compares underlying additive groups for a topological group acting continuously on a discrete abelian group. These pinned declarations supply the abelian comparison; no discreteness of the inherited quotient topology is assumed.

Applications to Dwork families, construction of potential automorphy witnesses, abelian surfaces and their separate real-multiplication large-image arguments remain with their own roadmaps. This roadmap supplies the lifting and transport interfaces they use.

## Conventions

Write `F⁺` for the maximal totally real subfield of an imaginary CM field `F`, `c` for complex conjugation, and `f=[F⁺:Q]`. Arithmetic ranks `n` are positive; rank zero is allowed in the separate finite combinatorial and matrix-congruence signatures. Frobenius and Artin reciprocity are geometric, and `HT(ε)={−1}`. Dominant `GLₙ` rows are descending. For an algebraic weight `λ` the labelled Hodge–Tate multiset is `{λτ,i+n−i : 1≤i≤n}`. The rank-`n` ordinary diagonal character indexed by `i` uses `λτ,n−i+1`, so its order is part of the convention.

`O` is the ring of integers of a finite `p`-adic field `E` containing the required embeddings, `varpi` (also written `ϖ`) is its coefficient uniformizer, and `k` its residue field. A local field uniformizer `ϖv` is a separate choice. Write `Sₚ` for places of `F` above `p` and `S̄ₚ` for places of `F⁺` above `p`. Chosen lifts above `p` identify the split rank-`2n` unitary factors with `GL₂ₙ`; choose `ϖ_{vᶜ}=c(ϖ_v)` compatibly with conjugation. The unitary group is `G̃`, its Siegel parabolic is `P=GU`, and `G` is the `GLₙ` Levi viewed over `F⁺`. At other parabolics the unipotent radical is written `N`. All derived categories and tensor products retain the coefficient ring in their subscript.

Put `d=n²f`, so `dim Xₖ=d−1`. For rational `GLₙ` cohomology put `qGL=n(n−1)f/2` and `ℓ₀=nf−1`. Its range is `[qGL,qGL+ℓ₀]`. The dual arithmetic complex is `RHom(RΓ,O)[−d]`. After extending scalars to `E`, its `i`-th cohomology is `Hom_E(Hᵈ⁻ⁱ(RΓ⊗_O E),E)`; over `O` retain derived Hom, including its Ext contributions. Consequently its rational range is `[qpatch,qpatch+ℓ₀]`, where `qpatch=qGL+1` and `2qGL+ℓ₀=d−1`. The `q₀` in the abstract patching hypotheses below means `qpatch`. It is unrelated to the number `q` of Taylor–Wiles places or to a residue cardinality `qv`.

For arbitrary compact open levels use arithmetic groupoids. A good level means a neat product of compact open local factors, as in ALS and ACC §2.1.1. At arbitrary levels a finite free cellular complex requires trivial stabilizers, or the specified invertibility and free diamond-action conditions. Hecke images are images in endomorphisms of the stated derived object; changing that object, the coefficient ring or the localization requires a comparison theorem. Superscripts “ord” refer to the ordinary action with its stated normalization. Character twists include both their unit values and their values at the chosen local uniformizers.

When a deformation ring `R` acts only through a surjection `R → T/I` with `I` nilpotent, support over `R` means the spectral support of DP:Layer 9: transport the cohomological `T`-support along `Spec(T/I) ≅ Spec(T)`, then take its image in `Spec R`. It does not assert an `R`-module structure on the original cohomology, since `I` may act nontrivially there. For the derived Hecke image the support is `V(ker(R → T/I))`; nilpotence preserves the underlying spectrum, not module lengths.

For `n=2` and `f=2, d=8, qGL=2` and `ℓ₀=3`: rational cohomology in degrees 2–5 dualizes to degrees 3–6, hence `qpatch=3`. A single free term in degree 0 dualized and shifted by `−d` lies in degree `d`. Over `O`, the torsion module `O/ϖ` in degree 0 contributes `Ext¹_O(O/ϖ,O)` to the dual, so the integral answer cannot use ordinary Hom. The duality, amplitude and Hida-dual targets below retain these coefficients. All local arithmetic rings here are mixed-characteristic `p`-adic integer rings; the matrix congruence signatures over arbitrary commutative rings assert only their algebraic congruences. A local uniformizer need not equal `p` in a ramified extension.

The source references used here are ACC (the ten-author CM-field paper), Qian, BLGGT, BCGNT (Bianchi modular forms), BCGP (potential modularity of abelian surfaces), Chenevier and KT (Khare–Thorne). Precise editions and public links are at the end. A source result with a repaired normalization or a restricted conclusion is stated in that form throughout; the stated hypotheses determine its scope.

## Good-level arithmetic hypotheses

The two good-level profiles below are abbreviations only. Targets outside these profiles list their own hypotheses. In particular the global lifting theorems in Layer 5 have fewer field and level restrictions, achieved using Layer 2.

### Fontaine–Laffaille good level

Let `F` be imaginary CM. Choose data and impose the following conditions:

(1) `n≥2`, and `p` is a prime with `p>n²`.

(2) `S` is a finite set of finite places of `F` with `Sₚ⊆S`.

(3) `R⊆S` consists of places away from `p; R` may be empty.

(4) `π` is cuspidal on `GLₙ(𝔸F)`, regular algebraic with weight `λ`.

(5) Fix `ι:Q̄ₚ≅C`.

(6) Each rational prime ramified in `F` or lying below `S` splits in an imaginary quadratic subfield of `F`. Hence the places of `S` split over `F⁺`, and `F/F⁺` is everywhere unramified.

(7) The prime `p` is unramified in `F`.

(8) At every embedding `τ:F↪C, λτ,1+λτc,1−λτ,n−λτc,n<p−2n`.

(9) For each `v∈Sₚ` let `v̄=v|F⁺`. There is a different `v̄′|p` such that `Σv̄″≠v̄,v̄′[F⁺v̄″:Qₚ]>f/2`.

(10) The residual representation `r̄ι(π)` is absolutely irreducible.

(11) Every `πv` with `v|p` is unramified.

(12) For `v∈R` the Iwahori-fixed subspace `πvᴵʷᵛ` is nonzero.

(13) At `v∈S−(R∪Sₚ), πv` is unramified, `v∉Rᶜ`, and `H²(Fv,ad r̄ι(π))=0`.

(14) The set `S−(R∪Sₚ)` includes two places whose residue characteristics differ.

(15) At all finite `v` outside `S, πv` is unramified.

(16) At `v∈R` one has `qv≡1 mod p` and `r̄ι(π)|GFv` trivial.

(17) The representation `r̄ι(π)` is decomposed generic (ACC Definition 4.3.1) and its restriction to `GF(ζp)` has enormous image (Definition 6.2.29).

Define `K=∏v` Kv: use `GLₙ(OFv)` outside `S` and at `v|p`, Iwv at `v∈R`, and the pro-v Iwahori Iwv,1 at `v∈S−(R∪Sₚ)`. These are the hypotheses of ACC §6.5.1, pp. 1062–1063.

### Ordinary good level

Let `F` be imaginary CM. The data and assumptions are:

(1) `n≥2`, and `p` is prime with `p>n`.

(2) `S` is a finite set of finite places containing `Sₚ`.

(3) `R⊆S` contains only places away from `p` and may be empty.

(4) `π` is a regular algebraic cuspidal representation of `GLₙ(𝔸F)`, with weight `μ`.

(5) Fix `ι:Q̄ₚ≅C`.

(6) Every rational prime below `S` or ramified in `F` splits in an imaginary quadratic subfield of `F`.

(7) The representation `r̄ι(π)` is absolutely irreducible.

(8) For each `v|p, πv` has a nonzero `Iwv(1,1)-fixed` vector and is `ι-ordinary` at `v`.

(9) For `v∈R, πv` has a nonzero Iwahori-fixed vector.

(10) At `v∈S−(R∪Sₚ), πv` is unramified, `v∉Rᶜ`, and `H²(Fv,ad r̄ι(π))=0`.

(11) There are two places in `S−(R∪Sₚ)` of different residue characteristics.

(12) All finite `πv` with `v∉S` are unramified.

(13) For `v∈R, qv≡1 mod p` and `r̄ι(π)|GFv` is trivial.

(14) The representation `r̄ι(π)` is decomposed generic, and its image on `GF(ζp)` is enormous.

(15) For each `v|p, [Fv:Qₚ]>n(n+1)/2+1` and `r̄ι(π)|GFv` is trivial.

Set `K=∏v` Kv with `GLₙ(OFv)` outside `S, Iwv(1,1)` at `v|p`, Iwv at `R` and pro-v Iwahori Iwv,1 at the other places of `S`. Lemma 6.5.2 gives neatness, hence goodness, using the two auxiliary residue characteristics. This is ACC §6.6.1, pp. 1074–1075.

### Supplier abbreviations

The compact owner prefixes below expand the prerequisite identifiers used in the layers. For example `AG:AG2.7` means `AutomorphicGaloisRepresentationsPartII:AG2.7`. The prefixes SR, IHG and RG name Tau Ceti roadmaps, whose layer identifiers (SR.1.4, IHG §2.3, RG2.3, …) are the headings of their READMEs; the others name the supplying roadmaps.

| Prefix | Roadmap |
| --- | --- |
| `ALS` | `ArithmeticLocallySymmetricSpaces` |
| `AS` | `AutomorphicSpectralTheory` |
| `SR` | `SmoothRepresentationsOfLocalGroups` (Tau Ceti roadmap) |
| `FF` | `FiniteFlatGroupsAndIntegralPadicHodgeTheory` |
| `AC` | `AutomorphicGaloisRepresentations` |
| `PH` | `PadicHodgeTheory` |
| `AG` | `AutomorphicGaloisRepresentationsPartII` |
| `IHG` | `IntegralHeckeAndGaloisDeterminants` (Tau Ceti roadmap) |
| `LGD` | `LocalGaloisDeformationRings` |
| `GGD` | `GlobalGaloisDeformations` |
| `DP` | `DeformationAndDerivedPatchingAlgebra` |
| `CS` | `PotentialModularityAndCompatibleSystems` |
| `AGR` | `ArithmeticGaloisRepresentations` |
| `PF` | `PadicFamilies` |
| `ET` | `EndoscopicTransferAndUnitaryTraceComparison` |
| `AL` | `AutomorphicLFunctionsAndLocalFactors` |
| `RG` | `ReductiveGroupsPartII` (Tau Ceti roadmap) |

The main-roadmap short names expand as follows:

- Tau Ceti ReductiveGroups L7: `ReductiveGroups`, Layer 7.
- Tau Ceti ReductiveGroups L9: `ReductiveGroups`, Layer 9.
- Tau Ceti Chebotarev L10: `Chebotarev`, Layer 10.
- Tau Ceti ClassFieldTheory L5: `ClassFieldTheory`, Layer 5.
- Tau Ceti ClassFieldTheory L11 and L12: the global reciprocity map and the global existence theorem of `TauCetiRoadmap/ClassFieldTheory`.

Suggested theorem names without a namespace prefix lie in `TauCetiRoadmap.PotentialAutomorphyInfrastructure`; the definition and API namespaces are printed explicitly. Internal prerequisites refer to the stated layer and its construction route. Within each thematic subsection the statements specify the particular levels, coefficients, functors or previous theorem being used.

## Exact supplier contracts

### From Mathlib

Use Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following existing declarations are foundations, with the indicated scope:

| Declaration | Module | Scope of use |
| --- | --- | --- |
| `CategoryTheory.Retract`, `CategoryTheory.Retract.map` | `Mathlib.CategoryTheory.Retract` | Split maps and their functorial transport; equivariance is additional data in Layer 0. |
| `DerivedCategory`, `DerivedCategory.Q` | `Mathlib.Algebra.Homology.DerivedCategory.Basic` | Localization of cochain complexes of an abelian category at quasi-isomorphisms. |
| `Module.support` | `Mathlib.RingTheory.Support` | Primes with nonzero localization; the support target is not a ring isomorphism. |
| `Matrix.charpoly` | `Mathlib.LinearAlgebra.Matrix.Charpoly.Basic` | `det(XI−M)` over a commutative coefficient ring. |
| `Subgroup.goursat_surjective` | `Mathlib.GroupTheory.Goursat` | A subdirect subgroup gives an isomorphism of quotient groups; arithmetic composita require Layer 2's field step. |
| `Equiv.Perm.permGroup` | `Mathlib.Algebra.Group.End` | Permutation multiplication by composition, with the inverse convention used by left Levi shuffles. |
| `finAddFlip` | `Mathlib.Logic.Equiv.Fin.Basic` | Exchange of the two finite blocks. |
| `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple` | `Mathlib.LinearAlgebra.Projectivization.PSL.PSL2` | Simplicity of `PSL₂` over a finite field with at least four elements. |
| `IntermediateField.LinearDisjoint`, `IsGalois`, `IsSimpleGroup` | `Mathlib.FieldTheory.LinearDisjoint`, `Mathlib.FieldTheory.Galois.Basic`, `Mathlib.GroupTheory.Subgroup.Simple` | Linear disjointness of intermediate fields, finite Galois extensions and simple groups, for `simple_galois_composita`. |
| `CategoryTheory.Retract.refl` | `Mathlib.CategoryTheory.Retract` | The identity retract underlying `EquivariantRetract.refl`. |

The arithmetic and analytic extensions are specified by the owning layer in each target's prerequisites and in the supplier interfaces below. A reference of the form `Roadmap:Layer/declaration` asks for that precise declaration of the layer; named main-roadmap layers identify their corresponding README sections. Internal prerequisites name their build layer; subsection introductions specify the construction route.

### From Tau Ceti

- `TauCeti.LocalFieldsRamification.isSolvable_algEquiv` in `TauCeti.NumberTheory.LocalField.Solvable` supplies solvability of the automorphism group of any finite extension of nonarchimedean local fields. Its hypotheses are valued topological fields `K` and `L`, `IsNonarchimedeanLocalField` on both, `Algebra K L`, `ValuativeExtension K L` and `Module.Finite K L`. Applied to a Galois extension, this supplies the soluble local towers used in §2.5.
- `TauCeti.ContCohomology.H1` in `TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree` is the continuous cocycle quotient for abelian coefficients. `TauCeti.ContCohomology.explicitH1AddEquivContinuousCohomology` in `TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologyComparison` identifies it with derived continuous cohomology as an additive group for a topological group acting continuously on a discrete abelian group. Section 2.10 adds noncommutative coefficients and uses this export for its abelian comparison.

### From the supplying roadmaps

The targets import general theories from their owners. The rows below give, for each owner, exactly what is used and with which hypotheses. Where an owner states less than the argument needs, the missing statement is a target of this roadmap, named in the row.

| Owner and layer | Required export and consumers |
| --- | --- |
| `ArithmeticLocallySymmetricSpaces:ALS.1`, `ALS.2.3–ALS.2.4`, `ALS.5a.1` | Actual algebraic coefficient lattices in groupoid/sheaf cohomology, coefficient reduction, compact smooth Borel–Serre quotients with corners and their rounded manifold-with-boundary models. Apply the smooth triangulation export in the next row to discharge ALS.2.4, then lift one finite cellular model along normal neat covers to get free `O[Δ]-cells`. Layer 0 gives this application and the tower bounds; two pro-v Iwahori factors of distinct residue characteristics justify neatness through ACC Lemma 6.5.2. |
| `GeometricTopology`, Layer 11 and “The smoothing-and-triangulation comparison”, item 1 | Smooth triangulations and the PL realization of a smooth manifold (Whitehead); with the collar of ALS.5a.1, use the relative boundary version on the rounded compact Borel–Serre manifold. Compactness makes a locally finite triangulation finite. The application to these arithmetic pairs is `arithmetic_finite_cell_models` in §0.1. No triangulability of arbitrary topological manifolds is used. |
| `ArithmeticLocallySymmetricSpaces:ALS.0.11` | `LocallySymmetric.isNeat_of_two_proUnipotent`: two pro-v Iwahori factors of distinct residue characteristics make the level neat. Section 5.13 chooses suitable places and applies this criterion. |
| `ArithmeticLocallySymmetricSpaces:ALS.4` | Localized Siegel stratum with induced coefficients and split coefficient evaluation in ACC (2.4.7); determinant pushforward and local-system descent in Lemma 5.4.16. Sections 0.7a–0.7b specialize IgusaVarietiesAndTorsionConcentration IG.6.6a–IG.6.6b to the all-finite-coefficient general linear and residual-unitary inputs of ALS.4.12–ALS.4.13, including the admissible-set extension stated there; the characteristic-zero `GaloisInput` of §0.1 does not supply these instances. |
| `HodgeTateAndCanonicalSubgroups`, §§2.1–2.3, 2.8–2.13, 3.4–3.8, 4.1–4.3 | `ShimuraTower.pLevel`, `infiniteLevel`, `TauCeti.HodgeTate.openTowerHodgeTateMap`, `canonicalSubgroup` and `quotientHasseRadius` for the chosen symplectic embedding. Retain the cyclotomic base, fractional powers and strict `0≤ε<1/2` weak/strong radius hypotheses. Section 0.7a identifies their PEL specializations, with the same finite-level maps and multiplier. |
| `PerfectoidShimuraVarieties`, §§1.2, 1.28–1.30, 2.1–2.3, 2.5, 2.8, 3.6–3.9 | `HodgeTower.imageCompactification`, `minToImage`, the open, image, genuine minimal and induced-fan toroidal representatives, compactified period maps and the all-prime Scholze finite-precision sections. Use the same neat tame level inside principal `N≥3` prime to the geometric prime. Section 0.7a identifies charts, completed plus rings, boundary ideals and the cyclotomically twisted coefficient pullback; no image-chart ring formula is transferred to the genuine minimal tower. |
| `TorsionCohomologyInfrastructure`, §§2.1, 2.4, 2.6–2.8, 3b.1–3b.2, 4.3–4.6 | `perfectoidComparison`, `completedCohomology_vanishing`, `heckeContinuity`, `finiteLevelDescent`, `classicalAmbientDeterminant`, `unitarySimilitudeBoundaryAdapter`, `finiteTorsionDeterminant` and `residualRepresentation`. Coefficient prime is `p` here; fixed exponent precedes the coefficient inverse limit. Use the unconditional CM branch on its imaginary-quadratic and rationally saturated bad-set range. Sections 0.7a–0.7b retain the extension to ACC's admissible sets and finite smooth coefficients; their comparison uses the actual restricted Hecke images, not a restriction homomorphism from the full similitude algebra. |
| `IgusaVarietiesAndTorsionConcentration`, IG.0.3–IG.0.6, IG.2, IG.3.21–IG.3.25, IG.4.7–IG.4.10, IG.6.6a–IG.6.7, IG.7.1, IG.7.4–IG.7.8 | `UnitarySimilitudeDatum`, `heckeRestrict`, `boundaryGLResidualRepresentation`, `unitaryTorsionResidual`, partial compactifications and fibre/semiperversity comparisons; then the boundary-length obstruction, one-sided vanishing and ACC middle-degree export. Rename its geometric `p` to `l` and coefficient `ℓ` to `p`. Transport through the multiplier-one component and the operator-algebra localization of IG.0.4–IG.0.6. Sections 0.13 and 1.0 are specializations, with `d=n²[F⁺:ℚ]`, length at most two and weak decomposed genericity; neither assumes residual irreducibility. |
| `ArithmeticLocallySymmetricSpaces:ALS.5a` | Hecke-adjoint Poincaré–Lefschetz/Verdier duality with the orientation system, coefficient dual/twist and degree `d−1−q`, including stabilizer hypotheses and determinant-component exterior pairings. Its perfect-complex form uses the triangulability input of ALS.2.4. This prefix supplies Layer 1 duality independently of Matsushima theory. |
| `AutomorphicSpectralTheory:5.10`, `5.12`, `5.14/franke_input` | All three clauses of ALS.5b.4's `FrankeInput`: complex cohomology comparison, decomposition by cuspidal support, and the Kostant weights of proper-support eigensystems. Apply to `Res_{F/Q} GLₙ` and `Res_{F⁺/Q} U(n,n)`, irreducible complex algebraic coefficients, their dual-annihilator central ideal, split-central balancing character and full `K∞`. §0.1's `arithmetic_franke_inputs` extends the good-level comparison to arbitrary compact open levels by finite-quotient descent. |
| `ArithmeticLocallySymmetricSpaces:ALS.5b.8–ALS.5b.9` | Automorphic realization and rational concentration from ACC Theorems 2.4.10–2.4.11, pp. 948–953: original `GLₙ` range `[qGL,qGL+ℓ₀]`, dual range `[qpatch,qpatch+ℓ₀]`. Discharge `FrankeInput` by the preceding row and `GaloisInput` by AG2.4 `(GLₘ)` and AG2.2/AG2.3/AG2.6 (unitary), for every Levi rank `m≤n`. Preserve residual absolute irreducibility for `GLₙ` and the two-constituent and Siegel-weight conditions for `U(n,n)`. The patching application does not assume mod-p `GLₙ` concentration. |
| `SmoothRepresentationsOfLocalGroups`, SR.0 and SR.0d | The smooth category of a locally profinite group over any commutative ring, here `O/varpi^m`, is Grothendieck abelian and so has enough injectives (`SmoothRep.instIsGrothendieckAbelian`); restriction to a compact open subgroup preserves injectives. Smooth modules over the open monoids `Δₚ` and `B⁺` and restriction to a closed compact subgroup are not stated there; they are the Layer 3 target `SmoothMonoidModules` (ACC (5.2.2)–(5.2.3) and Lemma 5.2.4, p. 992). |
| `SmoothRepresentationsOfLocalGroups`, SR.1.4 and SR.1.5 | For an open compact subgroup with an Iwahori decomposition: the positive Hecke homomorphism `t`, the restriction–integration map `S = r_M∘r_P` with `t∘S` and `S∘t` multiplication by `∣δ_P(m)∣⁻¹` on basis elements, and localisation at a strongly positive central element over a ring in which `q` is a unit (ACC Lemmas 2.1.12–2.1.13, pp. 914–915, as stated in SR.1.4); the Bernstein presentation of the Iwahori–Hecke algebra over a ring containing `q^{1/2}` (SR.1.5). The monoid statements of ACC Lemmas 2.1.10, 2.1.11 and 2.1.14 are the Layer 0 target `positive_monoid_hecke_restriction`; the residual Iwahori Hecke algebra at `q_v ≡ 1 mod p` of KT §5 is the Layer 5 target `taylor_wiles_residual_iwahori_hecke`. |
| `SmoothRepresentationsOfLocalGroups`, SR.2.1 and SR.2.2 | Smooth induction from a closed subgroup is right adjoint to restriction (`SmoothRep.frobeniusReciprocity`), so it preserves injectives; induction from a parabolic with compact quotient is exact. The Bruhat-cell functors `I_{≥i}, I_w` and `I_w°` on compact charts are the Layer 3 target `BruhatCellInduction`. |
| `SmoothRepresentationsOfLocalGroups`, SR.3.4 | The Iwahori block of `GLₙ(F_v)` consists of the subquotients of unramified principal series. The irreducibility of a pure unramified principal series, used in BCGNT Lemma 6.1.4, p. 59, is the Layer 2 target `pure_unramified_principal_series_irreducible`; the normalisation of `rec^T` is fixed by AG2.0. |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`; `LocalGaloisDeformationRings:§1.6`; `AutomorphicGaloisRepresentations:§1.5a` | The scalar contravariant theory, common labelled coefficient category and covariant realization, and automorphic interval twists, respectively. For unramified `K/ℚₚ`, `p>2`, the jump interval is `[aτ,aτ+p−2]`, with `Fil^{aτ+p−1}=0`, independent of rank. The covariant realization uses the linear lattice dual and Pontryagin torsion dual of the scalar functor, with transported coefficient actions, labelled factors and Frobenius permutation. Exactness, reductions, lattice quotients, strict kernels and finite-torsion subquotients are retained; subquotients need not be projective over an additional coefficient algebra. Section 1.9a fixes the ACC normalization used in §§1.10–1.16. |
| `PadicHodgeTheory:§§3.2–3.6,6.1`; `AutomorphicGaloisRepresentationsPartII:AG2.0` | Rational crystalline and labelled Hodge–Tate comparisons, then the adapter from the supplier’s positive numerical cyclotomic convention to `HT(ε)=−1`. Negate numerical Hodge labels while preserving the actual representation and its period comparison maps. Section 1.9a fixes the filtration labels and character twists used in ACC Theorem 4.5.1. |
| `AutomorphicGaloisRepresentationsPartII:AG2.0` | Weight and reciprocity dictionaries; prescribed crystalline global character with an arbitrary integer exponent on units (including exponent 1 for the second alternative of ACC Theorem 4.5.1); algebraic Hecke-character realization and compatibility with `π⊗(ψ∘det)`. |
| `AutomorphicGaloisRepresentationsPartII:AG2.2`, `AG2.3`, `AG2.6` | Degree-2n unitary Galois attachment with its split-place polynomials and algebraic twists; removal of the auxiliary geometric regularity restriction by the owner's interpolation/descent; crystallinity and precise labelled unitary weights at hyperspecial unramified `p` places for Proposition 4.4.6, pp. 979–981. Layer 1 deduces the nonselfdual rank-n comparison from these inputs. The independent characteristic-zero ordinary refinement at Iwahori levels and its Hecke-image assembly are `unitary_ordinary_refinement` (§3.41b), preceded by `unitary_rational_ordinary_hecke_semisimple` (§3.41a); Hodge/WD comparison alone supplies no ordered flag. |
| `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems` | Continuous semisimple good-place attachment to every regular algebraic cuspidal `GLₘ` representation over the CM field `F`, for all `1≤m≤n`, without polarization. Together with AG2.0's geometric reciprocity and Hecke-polynomial dictionary this proves ALS.5b.7's `GaloisInput.GL(F,m)`; the `m=1` branch is class field theory. |
| `AutomorphicGaloisRepresentationsPartII:AG2.5` | Inertial comparison at `R` and away from `p` (ACC Theorem 3.1.1), and rational local–global Weil–Deligne comparison for final unramified descent. The Varma semisimplification comparison used in BCGNT Lemma 6.1.4 is also required. |
| `AutomorphicGaloisRepresentationsPartII:AG2.6` | ACC Lemmas 7.1.9–7.1.10, pp. 1091–1093: decomposed genericity yields very weak compatibility, and `GL₂` supplies irreducibility and genericity. The weight-zero automorphic `GL₂` system must be odd. |
| `AutomorphicGaloisRepresentationsPartII:AG2.7` | Residual automorphic representations, decomposed genericity and the existence of a completely split generic rational prime. The named genericity exports feed the twisting and field-restriction arguments. |
| `IntegralHeckeAndGaloisDeterminants`, Layer 0 (§0.3) | For any `A→B`, the image of `ker D` lies in `ker D_B`, so `B⊗_A(A[G]/ker D)` surjects onto `B[G]/ker D_B`; no surjectivity or flatness of `A→B` is assumed (Chenevier §1.17 and Lemma 1.18(iii), PDF p. 16). |
| `IntegralHeckeAndGaloisDeterminants`, Layer 1 (§§1.2–1.3) | Semisimple reconstruction of a determinant over an algebraically closed field (Chenevier Theorem 2.12, PDF p. 28) and, over a henselian local ring, the one-block theorem and the generalized-matrix-algebra structure of a residually multiplicity-free determinant (Chenevier Theorem 2.22, PDF p. 34). The two-block statement that the image is `Mₙ(B)×Mₙ(B)` is the Layer 1 target `residually_distinct_split_image`. |
| `LocalGaloisDeformationRings:§§1.12–1.13,3.7,6.24,7.4–7.6` | Fontaine–Laffaille framed local dimensions `n²+[K:Qₚ]n(n−1)/2`; ACC Lemma 6.2.11's ordered full-flag criterion from both polynomial and ordered product identities; flat reduced trivial-residual ordinary rings and components under `[K:Qₚ]>n(n+1)/2+1`. |
| `LocalGaloisDeformationRings:§§7.1–7.6` | Determinant-ordinary functor, universal unit characters and closed points, with component and dimension comparisons over the chosen minimal prime of the completed torus algebra. |
| `LocalGaloisDeformationRings:§2.15` | At `R` with trivial residual representation and `qv≡1 mod p`: equality modulo `varpi` of the unipotent and pairwise-distinct `χ-type` conditions, irreducibility of the `χ-type` ring in characteristic zero, unique maximal-dimensional generic lifts and the dimension/drop bounds of ACC Assumption 6.3.6. |
| `GlobalGaloisDeformations:G7`, `G8` | Enormous Taylor–Wiles sets, local diamonds and framed presentations with the required field splitting and ordered eigenvalues; the two global problems with the same framings, variable global determinant, local-to-global reductions and diamond-linear universal representations. A fixed global determinant variant needs a new dimension calculation. |
| `DeformationAndDerivedPatchingAlgebra:Layer 7` | Derived idempotent splitting, finite-perfect dual/tensor/reduction comparisons and compatible perfect inverse-limit reconstruction for `Λ₁,c`. Import the minimal-complex machinery; prove the arithmetic uniform bounds needed to use it. |
| `DeformationAndDerivedPatchingAlgebra:Layer 8` | ACC §6.4 at one fixed nonprincipal ultrafilter: uniform minimal ranks, paired reductions, common Hecke images, compatible quotient deformation actions, bounded nilpotent ideals and derived augmentation/specialization. Remark 6.4.13, p. 1059, concerns transition-map choices; it does not assert independence of the ultrafilter. |
| `DeformationAndDerivedPatchingAlgebra:Layer 9` | Complete perfect-pair support contract of ACC §6.3.5, Assumption 6.3.6, Proposition 6.3.8 and Corollary 6.3.9, pp. 1051–1053, including unique generic lifts, strict lower-component dimensions and characteristic-zero augmentation support. Layer 4 verifies local hypotheses; Layer 5 supplies the pair. |
| `PotentialModularityAndCompatibleSystems:§§1.3–1.4,1.7,1.9,1.12` | Coefficient enlargement, restriction, induction, direct sums and twists for extremely weak systems. Its §1.9 converse realizes finitely ramified de Rham characters; apply it only after `rational_abelian_is_locally_algebraic` (§2.8). Its §§1.18–1.20 assume stronger weak compatibility and are not used to supply maximality here: `extremely_weak_rational_maximality` (§2.12) makes the rationalization and connected-component reduction explicitly. |
| `PotentialModularityAndCompatibleSystems:§§1.1–1.13` | System operations for very/extremely weak data, canonical Hodge metadata, integral lattices/reductions and local WD transport. Reconcile a weak carrier with all-member de Rham/Hodge clauses with the weakened-data carrier before using weakening maps. Extremely weak compatibility asserts the determinant weights, not arbitrary full-member weights. |
| `PotentialModularityAndCompatibleSystems:§1.9` | Realization of algebraic Hecke characters once constructed, crystalline normalization, and the converse for finitely ramified de Rham rank-one characters. This supplies rank-one branches of compatibility and lifting. |
| `ArithmeticGaloisRepresentations:§§5.1–5.3` | Frobenius density and `GaloisRep.iso_of_frobenius_charpoly_eq`: continuous semisimple representations over a Hausdorff topological field are isomorphic when their characteristic polynomials agree on a density-one set of unramified places. No finite ramification set or characteristic-zero hypothesis is required. Section 2.16 transports the supplier's arithmetic Frobenius convention to geometric Frobenius and retains the characteristic-polynomial formulation for residual coefficients. |
| `ArithmeticGaloisRepresentations:§7.6` | The characteristic-zero algebraic two-factor product-or-graph theorem for `PGL₂`, the algebraic monodromy predicates and the connected-monodromy characterization of absolute strong irreducibility. Sections 2.11–2.12 iterate these exports over a finite product and add form descent. |
| `ArithmeticGaloisRepresentations:§7.10, Enormous symmetric powers`, `§7.12, Taylor–Wiles image conditions` | The finite-image symmetric-power and scalar calculations used by ACC Lemmas 7.1.4 and 7.1.6. Layer 2 imports these rather than rebuilding their general finite-group theory. |
| `PadicFamilies:Layer 0a`, `ArithmeticGaloisRepresentations:§§4.3–4.7,7.7,7.10–7.12`, Layer 2 auxiliary CM extension construction | Respectively the Artinian ordinary projector, finite-group image calculations, and soluble local prescriptions or split cyclic CM auxiliaries. |
| `ReductiveGroups`, Layer 7, `ReductiveGroups`, Layer 9 | General roots, Weyl groups, parabolics, Levi decompositions and pinned split integral group schemes. Layer 1 adds Siegel shuffles and the linkage bounds. Integral dual Weyl modules, their Levi splitting and lowest-weight projections are the Layer 0 targets `IntegralDualWeylModule`, `dual_weyl_levi_splitting` and `dual_weyl_bottom_alcove_duality`. |
| `ReductiveGroupsPartII`, RG2.0a | Weil restriction of a reductive group along a finite separable extension, its splitting over a normal closure as a product indexed by embeddings, and the Galois permutation of the factors (ACC Lemma 7.1.3, fact (6), p. 1088). |
| Forms of products of `PGL₂` | Facts (4), (7) and (8) of ACC Lemma 7.1.3, pp. 1088–1089, are the Layer 2 target `pgl2_product_forms`; it uses the classification of forms by Galois cohomology (Platonov–Rapinchuk–Rapinchuk, Theorem 2.15, p. 78) and RG2.0a. Abstract Goursat and split-group theory do not give this descent. |
| `EndoscopicTransferAndUnitaryTraceComparison:§§6.12,6.24; AutomorphicSpectralTheory:§7.1` | Arthur–Clozel cyclic prime-degree base change/descent, Chapter 3, Theorems 4.2 and 5.1, retaining regular algebraic weights and local automorphic base change at every finite place. Section 2.2a constructs its full Weil–Deligne compatibility from ET §§10.20,10.30 and AS §7.0b. The source application is ACC Proposition 6.5.13, pp. 1070–1072. |
| `Chebotarev`, Layer 10 | Each conjugacy class of a finite Galois extension of a number field is the Frobenius class of a set of primes of positive Dirichlet density, applied to composita for joint residual and cyclotomic classes. Frobenius recognition is supplied by AGR §5.3, specialized in §2.16; the degree-one auxiliary places are constructed in `neatness_auxiliary_places`. |
| `ClassFieldTheory`, Layer 5, Layers 11–12 | Local Tate duality for finite Galois modules of a `p`-adic field (`tateDualityPairing_perfect_mixed`): `H²(E_v,M)` is dual to `H⁰(E_v,Hom(M,μ))`. For `M = ad ρ̄` with scalar residual Frobenius and `q_v ≢ 1 mod p` this gives `H²(E_v, ad ρ̄)=0`, using the trace pairing on the full endomorphism module (no division by `n`); the deduction is part of `neatness_auxiliary_places`. Global reciprocity (Layer 11) and existence (Layer 12) are used for auxiliary extensions. |
| `PotentialModularityAndCompatibleSystems:§§2.12–2.16` | Generating Frobenius primes, avoidance by split places, finite local-character extension (`cht_character_extension`) and soluble prescribed-completion extensions (`cht_soluble_prescribed_completions`). The soluble extension has the specified Galois completions and can enlarge the global degree. Section 2.5 adds prescribed cyclic degree and the conjugation-compatible CM refinement. |
| `AutomorphicLFunctionsAndLocalFactors:Representation prerequisites, Archimedean GLₙ parameters; Layer AL.3` | Archimedean parameter comparisons and number-field strong multiplicity one for cuspidal representations; the finite-place reciprocity dictionary is AG2.5. |

The ordinary source calculations are specified in §§3.46–3.47 using Geraghty's March 2010 author manuscript, Lemmas 5.1.1 and 5.1.6, pp. 59–61. Its numbering differs from the 2019 edition cited by Qian and ACC; locators below always identify the edition. The Jacquet comparison uses `δ_B⁻¹`, and nonsplit base change uses the full local argument, not just the split case.

The two conditional ALS inputs are discharged in §0.1: smooth triangulation for the actual rounded arithmetic pair, and AS's `franke_input` for the actual rational groups and algebraic coefficients. These are applications of the named owner exports, not additional assumptions on the lifting theorems.

The two extremely weak comparison targets in §§2.8 and 2.12 retain their weaker hypotheses. Henniart's E-rational abelian classification is used in the precise published formulation of ERA 979, Theorem 5.5, p. 48; Larsen's maximality is Theorem 3.17, author p. 25. Neither argument assumes that every original member is de Rham. The full Hodge metadata of an extremely weak system is not recovered merely from its determinant weights.

The ordinary determinant transfer has an additional local proof requirement. ACC Theorem 5.4.3 provides a map onto the Satake image. To obtain Proposition 5.4.18 over the larger `GLₙ` Hecke algebra, prove a polynomial-law/kernel argument over the O-flat unitary algebra and carry the identities through base change to every relevant group-algebra element. A map onto the image alone does not supply that argument. Layer 3's all-degree characteristic data and local–global theorem depend on this completion.

Uniform free diamond-cell models, common bounds on minimal ranks and compatible derived reconstruction are required before the perfect arithmetic towers can be used in Layer 5. Their existence is not inferred for arbitrary non-neat compact open quotients. The suggested file types local cores; this README states the arithmetic definitions, APIs, checks and theorem contracts.

## How to read the build

Layer 0 fixes the integral coefficients: the arithmetic cohomology models, equivariant retracts, the unitary weight dictionary, integral dual Weyl modules with their Levi splitting and bottom-alcove duality, and the Hecke algebras of positive monoids; it then splits `GLₙ` cohomology off the Siegel boundary and descends the Satake map. Layer 1 establishes Fontaine–Laffaille compatibility, using Kostant shuffles, degree shifting into the unitary middle degree and the image of a residually multiplicity-free pair. Layer 2 constructs the field transport and the rank-two compatible-system tools independently of automorphy lifting, including forms of products of `PGL₂` and the irreducibility of pure unramified principal series, using AGR's density-one recognition theorem with the convention comparison of §2.16. Layer 3 builds smooth modules over open monoids, ordinary parts, completed cohomology, the Bruhat filtration and ordinary local–global compatibility, using the transport of Layer 2 when the split-field restrictions are removed. Layer 4 constructs the Hida dual and weight twist, then the arithmetic deformation actions and the conditional support criterion. Layer 5 adds the residual Iwahori Hecke algebra at Taylor–Wiles places, constructs the patched pairs, verifies that criterion and proves both lifting theorems. The conditional criterion takes a patched pair as input; it does not construct that pair or assume the lifting theorem.

The supplying order is HodgeTateAndCanonicalSubgroups → PerfectoidShimuraVarieties → TorsionCohomologyInfrastructure → IgusaVarietiesAndTorsionConcentration → this roadmap. Within Layer 0 consume residual systems before the supplied boundary-length obstruction and generic-vanishing results.

Within Layer 2, consume AGR §5.3, `GaloisRep.iso_of_frobenius_charpoly_eq`, with the geometric Frobenius normalization of §2.16 before proving §§2.8–2.9 and their rank-two applications. Section order is expository for this prerequisite.

## Layer 0: Integral coefficients and boundary comparison

**Integral models and equivariant splittings**

Begin with the actual arithmetic coefficient systems. The groupoid model handles arbitrary compact open levels; the finite free model requires the separate stabilizer and diamond-action hypotheses. An equivariant retract then transports a Hecke action through a genuine split inclusion.

<a id="integral-model-comparison"></a>

### 0.1 Integral cohomology comparison

Prove `integral_model_comparison`. For `F` CM, the `GL_n` space and the split-at-p unitary space with their arithmetic coefficient local systems, the groupoid derived-invariants and sheaf-cohomology models represent the same `RΓ` object at arbitrary compact open levels. At good levels they also agree with the finite cellular model under the stated freeness hypotheses. The arbitrary-level comparison extends ALS's good-level comparison by taking derived invariants of a finite quotient after a normal good refinement; it retains stabilizer cohomology. On a finite projective `O` coefficient lattice `V`, derived reductions to `O/varpi^m`, pullback/trace at finite normal levels and Hecke away from `S` commute with these identifications. For a normal refinement of a good level with finite quotient `Δ` and free cell action the cellular complex is finite free over `O[Δ]`. Before freeness is proved retain the groupoid model; no finite free assertion is made with nontrivial `p`-stabilizers.

([ACC](#source-acc), §2.1.2, Lemma 2.1.7 and proof, pp. 911–912; §2.2; §6.5.1, pp. 1064–1069). *Needs:* `ALS:ALS.1`; `ALS:ALS.2.3–ALS.2.4`; `ALS:ALS.3`; `ALS:ALS.5a.1`; Tau Ceti GeometricTopology Layer 11 and its smoothing-and-triangulation comparison, item 1; `mathlib:DerivedCategory.Q`.

First prove the arithmetic application `arithmetic_finite_cell_models`. For each neat `K` for either `Res_{F/Q} GLₙ` or `Res_{F⁺/Q} U(n,n)`, the pair `(X̄_K,∂X̄_K)` has a finite triangulated model. For `K′` normal in `K, Δ=K/K′` and an `O`-free finite-rank arithmetic coefficient lattice `V`, its lifted cellular cochain complexes, including the relative boundary complex for compact support, have finite free `O[Δ]-terms`. All three complexes are perfect. Finite projective `V` gives finite projective terms instead; freeness uses that `O` is a DVR. This assertion concerns these smooth arithmetic pairs, not arbitrary topological manifolds.

*Route.* ALS.2.3 gives compactness and the smooth corner structure. ALS.5a.1 rounds corners, preserving the boundary pair and its collar. Apply GeometricTopology's smooth-to-PL triangulation theorem, relative to the smooth boundary (equivalently use a collar and the doubled smooth manifold). Choose a locally finite boundary-compatible smooth triangulation; compactness leaves finitely many simplices. This supplies the hypothesis of ALS.2.4. Lift the base triangulation to each finite neat cover: its deck action is free, and a choice of one cell per orbit trivializes the local system on that cell. Its coefficient term is a copy of `O[Δ]⊗_O V`. Use the relative complex for compact support and the boundary subcomplex for boundary cohomology. This proves perfectness without requiring a single canonical triangulation compatible with every Hecke correspondence. Pullback, trace and Hecke maps come from ALS's cohomology comparisons, using common finite covers or refinements. For tower bounds fix the base cells and coefficient rank first; the numbers of orbit generators and the degree bounds are then independent of `Δ`. Derived coefficient reduction and DP:Layer 7 give the corresponding finite models over `O/ϖ^m` and the reconstruction comparisons.

Next prove `arithmetic_franke_inputs`. For the same two rational groups and the complex coefficient representations `V_{ιλ}` and `Ṽ_{ιλ̃}`, ALS.5b.4's three `FrankeInput` clauses hold, with its unramified Hecke action and finite-level pullback. At neat level apply `AS:5.10/franke_comparison, AS:5.12/franke_schwermer_support` and `AS:5.14/franke_input` to the irreducible algebraic complex coefficient, `J=Ann_Z(V∨)`, its prescribed split-central character `ζ_V, 𝔪_G=𝔤/𝔞_G` and the full `K∞`. For `GLₙ` retain that balancing character; the unitary group has no rational split centre. The proper-parabolic clause uses unnormalized induction of `σ=δ_P^(1/2)π` with Levi highest weight `w(λ+ρ)−ρ`, not the weight of `π` before this modulus conversion. For an arbitrary compact open level choose a normal good refinement and take finite-quotient invariants; over `ℂ` averaging is exact. Hecke correspondences use common neat refinements, so the descended comparison remains Hecke compatible. Finally transport the complex statement along `ι` and extend the `O` lattice to `Q̄_p`. No integral or mod-p Franke comparison is inferred. ([ACC](#source-acc), §2.4.9, proof of Theorem 2.4.10, pp. 949–951, and Theorem 2.4.11, pp. 951–953; the general comparison and proper-support weight theorem are owned by AS:5.10–AS:5.14.)

For ALS.5b.8 instantiate `GaloisInput.GL(F,m)` for every `1≤m≤n` using AG2.4's HLTT existence and AG2.0's good-place convention. For ALS.5b.9 also instantiate `GaloisInput.unitary(F,m)` from AG2.2's discrete unitary assembly, AG2.3's removal of auxiliary restrictions and AG2.6's de Rham weights, with AG2.5's required split-place comparison. The `m=1` GL branch uses algebraic Hecke characters. Thus the inputs are supplied for all proper Levi blocks as well as for the ambient rank. Residual absolute irreducibility eliminates proper support for `GLₙ`. In the unitary case retain the two rank-n absolutely irreducible residual constituents and the exclusion of every cuspidal Siegel-Levi Kostant weight in ALS.5b.9; CTG in Layer 1 supplies that exclusion by the purity-weight condition. The two-constituent hypothesis alone does not eliminate the Siegel class.

**Checks.**

- `arithmetic_finite_cell_models.cover`: a base cell with coefficient lattice `O²` lifts to `|Δ|` cells and a free `O[Δ]-term` of rank 2. Monodromy changes the differentials, not this rank. If `V=0` the perfect complex is zero; perfectness alone does not give the nonzero input of Layer 5.
- `arithmetic_finite_cell_models.stabilizer`: a point with stabilizer `C_p` has mod-p group cohomology in arbitrarily high degrees, so compactness without neatness cannot supply the finite free assertion. For a noncompact smooth manifold, smooth triangulability alone does not imply a finite triangulation.
- For `GL₂` with trivial coefficients, unnormalized induction from trivial Levi characters has polynomial `(X−q_v)(X−1)`, with Hecke trace `1+q_v`. Omitting the cyclotomic twist gives `(X−1)²`. At `q_v=5` their traces are 6 and 2. This eigensystem is excluded only after the non-Eisenstein hypothesis is imposed.
- `arithmetic_franke_inputs.siegel`: for `U(1,1)` the only proper parabolic is Siegel; its two rank-one Galois pieces satisfy the two-constituent condition. The separate Kostant-weight exclusion is therefore necessary even at rank one.

<a id="equivariant-retract"></a>

### 0.2 Equivariant direct summands

Define `EquivariantRetract`. For a category `C`, objects A,B and an indexed family of endomorphisms `f_A(r), f_B(r)`, an EquivariantRetract is a Mathlib Retract A `B` with `f_A(r)` followed by `i = i` followed by `f_B(r)`, and `f_B(r)` followed by the retraction `=` the retraction followed by `f_A(r)`, for every `r`. For `C=D(S)` and `S`-algebra actions of `R` this is the source’s `R`-equivariant direct summand: the complementary idempotent splits in `D(S)`. The general categorical carrier records no additional ring laws; actual arithmetic applications pass `S`-algebra homomorphisms.

([ACC](#source-acc), §4.2, after Theorem 4.2.1, p. 969). *Needs:* `mathlib:CategoryTheory.Retract`; `mathlib:CategoryTheory.Retract.map`; `DP:Layer 7`.

Its interface includes:

- `EquivariantRetract.toRetract`: Forgetting the commuting equations gives CategoryTheory.Retract A `B`.
- `EquivariantRetract.inclusion_comm_eq`: For every `r, f_A(r)` followed by `i` equals `i` followed by `f_B(r)`.
- `EquivariantRetract.retraction_comm_eq`: For every `r, f_B(r)` followed by the retraction equals the retraction followed by `f_A(r)`.
- `EquivariantRetract.map`: A functor carries the retract to the image retract, with the image endomorphisms; it preserves both commuting equations.
- `EquivariantRetract.idempotent`: The endomorphism of `B` given by retraction followed by inclusion is an idempotent commuting with every action operator.
- `EquivariantRetract.refl`: Identity inclusion and retraction give an equivariant retract for any indexed action on A; forgetting it gives Retract.refl A.
- `EquivariantRetract.ext`: Two equivariant retracts for the same objects and indexed actions are equal if their inclusion and retraction maps are equal.

**Checks.**

- `EquivariantRetract.identity` (degenerate): Identity maps on A give an equivariant retract of A into itself.
- The forgotten retract of the identity construction is Mathlib Retract.refl.
- `EquivariantRetract.incompatible_actions` (non-example): Identity inclusion/retraction cannot form an equivariant retract between `Z` with multiplication-by-1 and multiplication-by-2 as the same indexed operator.

<a id="unitary-levi-weight-dictionary"></a>

### 0.3 Unitary weight dictionary

Define `UnitaryLeviWeight`. For descending Levi rows `λ_τ` and `λ_{τc}` of length `n` and a chosen lift `τ` above an embedding of `F⁺`, define the unitary row by concatenating `−reverse(λ_{τc})` with `λ_τ`. For `n>0` it is descending exactly when `−λ_{τc,1}≥λ_{τ,1}`; the rank-zero row is empty. This is the character-lattice identification (ACC (2.2.2)); it does not assert that the integral dual-Weyl lattice is the dual of the integral lattice of the dual weight.

([ACC](#source-acc), §2.2.1 equation (2.2.2), pp. 918–919). *Needs:* Mathlib integer arithmetic and finite collections.

Its interface includes:

- `UnitaryLeviWeight.first_block`: The i-th entry of the first block is `−λ_{τc,n−1−i}` for `0≤i<n` with zero-based indexing.
- `UnitaryLeviWeight.second_block`: The i-th entry of the second block is `λ_{τ,i}`.
- `UnitaryLeviWeight.dominant_iff`: For `n>0` and descending input rows, dominance is equivalent to `−λ_{τc,1}≥λ_{τ,1}`.
- `UnitaryLeviWeight.inverse`: Recover `λ_τ` from the second block and `λ_{τc}` by negating and reversing the first block.

**Checks.**

- For `λ_τ=(2), λ_{τc}=(−3)`, the unitary row is (3,2).
- Zero Levi rows give the zero unitary row.
- For `λ_τ=(2,1), λ_{τc}=(−3,−4)`, the unitary row is (4,3,2,1).
- `UnitaryLeviWeight.non_dominant`: For `n=1` and both Levi rows `(1)`, the unitary row is `(−1,1)` and is not dominant. Its induced `GL₂` module is zero, whereas the Levi module has rank one, so no coefficient embedding exists.

**Integral dual Weyl modules and Hecke algebras of positive monoids**

The coefficient lattices are the integral dual Weyl modules, not arbitrary stable lattices; their splitting along a Levi and their duality in the bottom alcove are integral statements that rational highest-weight theory does not give. The positive-monoid Hecke algebras carry the restriction maps used by the Satake descent.

<a id="integral-dual-weyl-module"></a>

### 0.4 Integral dual Weyl modules

Define `IntegralDualWeylModule`. Let `𝒢` be a split reductive group scheme over `O` with maximal torus `T`, Borel subgroup `B ⊇ T` and opposite Borel `B⁻`, and let `λ ∈ X*(T)` be dominant for `B`. The integral dual Weyl module `A(𝒢;λ)` is the `O`-module of algebraic induction from `B⁻, (ind_{B⁻}^{𝒢} λ)(O)`: the functions `f` in `O[𝒢] ⊗ O(λ)` with f(gb) `= λ(b)⁻¹f(g)` for all points `b` of `B⁻`, with `𝒢(O)` acting by left translation. For `GLₙ` over `O` with the upper Borel and descending `λ`, write `V_λ = A(GLₙ;λ)`; for `λ ∈ (ℤⁿ₊)^{Hom(F,E)}` put `V_λ = ⊗_τ V_{λ_τ}`, a finite free `O`-module with an action of `∏_{v|p} GLₙ(O_{F_v})`, and define `V_λ̃` for `G̃` in the same way through the split isomorphisms at the places above `p`. Rationally `V_λ ⊗ E` is the irreducible representation of highest weight `λ`; integrally `V_λ` is this particular lattice (Geraghty's `M_λ`), and the duality and splitting statements below are about it.

([ACC](#source-acc), §2.2.1, p. 918; [Newton–Thorne](#source-nt16), §2.2.7, arXiv pp. 12–13, citing Jantzen I.3.3, I.5.12 and II.4.5). *Needs:* Tau Ceti ReductiveGroups L9 (pinned split group schemes and base change); Tau Ceti ReductiveGroups, Layer 1 (comodules); IHG §6.4 (the case `GL₂` over `ℤ` and its sign convention).

Its interface includes:

- `IntegralDualWeylModule.free``: A(𝒢;λ)` is finite free over `O`, of rank given by Weyl's dimension formula.
- `IntegralDualWeylModule.base_change`: for every `O`-algebra `R` the natural map `A(𝒢;λ) ⊗_O R → (ind_{B⁻}^{𝒢}λ)(R)` is an isomorphism; in particular `V_λ/ϖ^m` is the induced module over `O/ϖ^m`.
- `IntegralDualWeylModule.rational``: A(𝒢;λ) ⊗_O E` is absolutely irreducible of highest weight `λ`.
- `IntegralDualWeylModule.weights`: the T-weights of `A(𝒢;λ)` lie in the convex hull of `Wλ`, the weight `λ` has multiplicity one and its weight line is fixed by the unipotent radical of `B`; projection onto the lowest weight space `O(w₀λ)` is `B`-equivariant (used by `LowestWeightCharacter`).
- `IntegralDualWeylModule.tensor``: V_λ` for `λ ∈ (ℤⁿ₊)^{Hom(F,E)}` is the tensor product over embeddings, and the `GLₙ(O_{F_v})` action factors through the embeddings inducing `v`.
- `IntegralDualWeylModule.closed_alcove_simple`: for a descending `GLₙ` weight with `λ₁ − λₙ + n − 1 ≤ p`, the reduction `V_λ ⊗ k` is simple. For two such weights `λ, μ`, `IntegralDualWeylModule.closed_alcove_ext_one` gives `Ext¹` between their reductions equal to zero in the category of algebraic `GLₙ/k` representations. These are the closed-bottom-alcove statements of Jantzen II.5.5–5.6 and the remark after Corollary II.5.6, pp. 220–221, used in ACC's proof of Lemma 4.2.2(2), p. 971; they retain the endpoint needed when `p = 2n−1`.

**Checks.**

- `IntegralDualWeylModule.trivial` (degenerate): `λ = 0` gives `O` with the trivial action.
- `IntegralDualWeylModule.standard` (computation): for `GLₙ, λ =` (1,0,…,0) gives the standard representation `Oⁿ` and `λ = (0,…,0,−1)` its dual; a definition inducing from `B` instead of `B⁻` would give zero for both of these B-dominant weights when `n ≥ 2`, since it is nonzero only on anti-dominant weights.
- `IntegralDualWeylModule.non_dominant` (non-example): for `GL₂` and `λ =` (0,1) the induced module is zero.
- `IntegralDualWeylModule.symmetric_power_lattice` (non-example): for `GL₂` over `ℤ_p` and `λ = (p,0), V_λ` is `Sym^p(ℤ_p²)`; its reduction contains the two-dimensional submodule spanned by `x^p` and `y^p`, so `V_λ ⊗ 𝔽_p` is reducible although `V_λ ⊗ ℚ_p` is irreducible, and `V_λ` is not the divided-power lattice.
- `IntegralDualWeylModule.alcove_wall`: for `GL₂` and `λ = (p−1,0)`, the closed-alcove pairing is `p` and `Sym^{p−1}(k²)` is the simple Steinberg module. This endpoint is permitted by the closed-alcove API even though it fails the strict inequality of `dual_weyl_bottom_alcove_duality` below.

<a id="dual-weyl-levi-splitting"></a>

### 0.5 Levi splitting of dual Weyl modules

Prove `dual_weyl_levi_splitting`. Let `P = M ⋉ N` be a parabolic subgroup of `𝒢` containing `B`, with Levi `M ⊇ T`, and `λ` dominant. Then, as O[M(O)]-modules, `A(𝒢;λ) = A(M;λ) ⊕ K`, where `A(M;λ)` is the sum of the T-weight spaces of weights `λ − μ` with `μ` a non-negative integral combination of the simple roots of `M; N(O)` acts trivially on `A(M;λ)`, which therefore lies in `A(𝒢;λ)^{N(O)}`. The decomposition is compatible with tensor products over embeddings. For the Siegel parabolic `P =` GU of `G̃` at the split places above `p` and `λ̃` the unitary weight of `λ` (`UnitaryLeviWeight`), assume `λ̃` is dominant, equivalently `−λ_{τc,1}≥λ_{τ,1}` at every chosen embedding. Then the summand `A(M;λ̃)` is `V_λ`; hence `V_λ → V_λ̃^{K̃_U}` is a `K̃_P-equivariant` embedding that splits K-equivariantly.

([Newton–Thorne](#source-nt16), §2.2.7, Proposition 2.10(2) and Corollary 2.11, arXiv pp. 13–14; [ACC](#source-acc), §2.4.1, proof of Theorem 2.4.4, p. 945). *Needs:* `IntegralDualWeylModule`; `UnitaryLeviWeight`; Tau Ceti ReductiveGroups L7.

The proof decomposes `A(𝒢;λ)` into T-weight spaces over `O`, checks M-stability and triviality of `N` on the first summand after inverting `p`, and identifies it with `A(M;λ)` integrally: Frobenius reciprocity gives a nonzero M-map to `A(M;λ)`, and it is injective modulo `ϖ` because the B-socle of the reduction is the highest weight line.

<a id="dual-weyl-bottom-alcove-duality"></a>

### 0.6 Bottom-alcove duality of dual Weyl modules

Prove `dual_weyl_bottom_alcove_duality`. Let `λ` be a descending weight of `GLₙ` with `λ₁ − λₙ + n − 1 < p`, where `p` is the residue characteristic of `O` (that is, `⟨λ+ρ, β^∨⟩ < p` for every positive root `β`), and put `λ^∨ = (−λₙ, …, −λ₁)`. Then `V_λ ⊗ k` is simple and `Hom_O(V_λ, O) ≅ V_{λ^∨}` as `O[GLₙ(O)]`-modules. For `λ ∈ (ℤⁿ₊)^{Hom(F,E)}` the same holds when the bound holds at every embedding. Without the bound the integral statement fails (`IntegralDualWeylModule.symmetric_power_lattice`), although `V_λ^∨ ⊗ E ≅ V_{λ^∨} ⊗ E` always.

([Jantzen](#source-jantzen), Part II, 5.5–5.6, pp. 220–221; [ACC](#source-acc), §2.2.1, p. 918, and proof of Corollary 4.4.8, p. 983). *Needs:* `IntegralDualWeylModule`.

`Hom_O(V_λ, O)` is the Weyl module of highest weight `λ^∨`. The canonical map from it to `V_{λ^∨}` is an isomorphism after inverting `p`, and modulo `ϖ` its image is the simple module `L(λ^∨)`; under the bound `V_{λ^∨} ⊗ k = L(λ^∨)` by Jantzen II.5.6, so the map is an isomorphism modulo `ϖ` and hence over `O` by Nakayama.

**Checks.**

- For `GL₂` over `ℤ_p` and `λ = (p−2, 0)`, the bound holds and `Hom(Sym^{p−2}, ℤ_p) ≅ Sym^{p−2} ⊗ det^{−(p−2)}`; for `λ = (p, 0)` it fails, and the dual of `Sym^p` is the divided-power lattice, not `Sym^p ⊗ det^{−p}`.

<a id="positive-monoid-hecke-restriction"></a>

### 0.7 Hecke algebras of positive monoids

Prove `positive_monoid_hecke_restriction`. Let `G` be a reductive group over a nonarchimedean local field with residue cardinality `q, P =` MN a parabolic subgroup with opposite `P̄ = MN̄`, and `U` an open compact subgroup with an Iwahori decomposition: the products `U_N × U_M × U_N̄ → U` and `U_N̄ × U_M × U_N → U` are bijective. Let `Δ_M` be the set of `m ∈ M` with `m U_N m⁻¹ ⊆ U_N` and `U_N̄ ⊆ m U_N̄ m⁻¹`, and `Δ = U_N Δ_M U_N̄`. Then: (1) `Δ_M` and `Δ` are open submonoids of `M` and `G, UΔU = Δ` and `Δ ∩ M = Δ_M`, so the Hecke algebras `H(Δ,U), H(Δ_P,U_P)` with `Δ_P = Δ ∩ P`, and `H(Δ_M,U_M)` of functions supported on the monoids are subalgebras of the full Hecke algebras. (2) Restriction to `P, r_P: H(Δ,U) → H(Δ_P,U_P)`, and integration along `U_N, r_M: H(Δ_P,U_P) → H(Δ_M,U_M)`, are algebra homomorphisms, with `r_P[UmU] = [U_P m U_P]` and `r_M r_P[UmU] = #(U_N/mU_Nm⁻¹)[U_M m U_M] = ∣δ_P(m)∣⁻¹[U_M m U_M]` for `m ∈ Δ_M`. (3) For a ring `R`, an R[P]-module `W` and `V = Ind_P^G W`, evaluation at 1 is a map `V^U → r_P^*W^{U_P}` of `H(Δ,U)⊗``R`-modules; as `R`-modules `V^U` is the direct sum, over representatives `g_1 = 1, g_2, …` of `P\G/U`, of the invariants `W^{g_iUg_i⁻¹∩P}`, and evaluation is the projection onto the first summand, so it is split functorially in `W`. The splitting is not Hecke-equivariant.

([ACC](#source-acc), §2.1.9, Lemmas 2.1.10, 2.1.11 and 2.1.14, pp. 913–915). *Needs:* `SR:SR.1.4`; `SR:SR.2.1`.

The global consequence used in this layer (ACC §2.1.9, p. 916) is a Hecke-equivariant map from the cohomology of the induced boundary stratum to that of the Siegel stratum, split in the derived category of `R`-modules: the splitting need not be equivariant, but the map is a surjection of Hecke modules on cohomology, which suffices to descend the Satake map.

**The Siegel boundary and Satake descent**

The boundary triangle and non-Eisenstein Siegel localization identify the stratum on which the Levi coefficients occur. Restriction to the trivial unipotent subgroup supplies the retraction; this is compatible with the Satake action before taking cohomology.

### 0.7a Residual unitary Galois inputs

Use `unitary_torsion_tower_geometry` as the specialization of PerfectoidShimuraVarieties §§2.1–2.3, 2.5, 2.8 and 3.8 to the Hodge-type unitary similitude datum of IgusaVarietiesAndTorsionConcentration IG.0.3, together with its multiplier-one component IG.0.6. Fix half-rank `a≥1`, geometric prime `l`, a self-dual PEL lattice, a symplectic embedding with the same multiplier, a tame level inside principal `N≥3` prime to `l`, and a complete algebraically closed local reflex-field extension `C`. Its open, image, genuine minimal and toroidal limit diamonds are the supplied limits of these very finite-level models. The image charts and their completed integral-colimit rings and strongly closed boundaries are those of PerfectoidShimuraVarieties §2.3; the extended period map is §3.8's map. The toroidal perfectoid representative uses precisely §3.8(c)'s smooth projective fan pair induced from an initial strictly compatible closed Siegel embedding. Its finite-precision Hodge–Tate sections are §3.9's all-prime Scholze form, together with TorsionCohomologyInfrastructure §1.2's approximation atlas. These are identifications with the supplied objects, not additional constructions.

Prove the arithmetic adapter `unitary_similitude_tower_comparison`. Write `Gˢⁱᵐ` for IG.0.3's rational-similitude group and `ν` for its multiplier; identify `ker ν = Res_{F⁺/ℚ} G̃` with the split skew-hermitian `U(a,a)` used here, through a rational isometry with ACC's matrix `J_a`. Transport the PEL lattice and the actual compact opens along this isometry; use integral identifications of the hyperspecial subgroups at good places and common good refinements at the remaining places. The self-dual trace lattice is not assumed globally free over `O_F`. For a neat similitude level `Kˢⁱᵐ`, put `K̃=Kˢⁱᵐ∩ker ν(𝔸_f)`. For the positive archimedean component `X⁰` of IG.0.3, the open arithmetic component and its Borel–Serre pair identify with IG.0.6's `X⁰_{K̃}` and its pair. These identifications commute with normal good refinements, restriction, trace and tame unitary correspondences. On the geometric towers they identify the multiplier-one subsystem with the corresponding fixed-pairing subsystem of the supplied full tower over `C`; this closed infinite pairing fibre is not assumed open. On every image flag chart they identify the completed plus ring and reduced boundary ideal. Thus `unitary_torsion_tower_geometry` equals the restriction of the supplied tower package under this comparison.

For the dual-Weyl coefficient lattice `V_λ̃`, choose an integral highest weight for `Gˢⁱᵐ` restricting to `λ̃`, after the required coefficient extension, and identify the restricted dual-Weyl lattice with `V_λ̃`; retain the chosen central character. For a general finite free algebraic lattice use the finite-coefficient cover and descent of IG.7.6 to compare its reductions, without assuming that an arbitrary integral lattice extends to the similitude group. The same restriction on `O/ϖ^m` local systems identifies the cohomology complexes of §0.1, including compact supports and boundary, with the corresponding component complexes. Any ineffective central kernel must act trivially before coefficient descent. For the Hodge line retain PerfectoidShimuraVarieties §§3.6–3.8's opposite/dual dictionary and central-cocharacter Tate torsor: in Hodge `μ`-degree `b` the twist is `−b`. A chosen Tate generator transports the linearization rather than discarding that twist. Use HodgeTateAndCanonicalSubgroups §§3.4–3.8's actual canonical subgroup and quotient-radius maps on these same Siegel charts, with their weak/strong hypotheses; no new radius estimate is asserted here.

At split rational primes use IG.0.4's `heckeRestrict` from its operator algebra to the unitary algebra, with `T_{i,v}↦T⁰_{i,v}`. Localizations agree as in IG.0.5; passage from full-algebra support uses its finite-torsion decomposition over ideals above the operator ideal. At other unramified places use TorsionCohomologyInfrastructure §3b.1a's inclusion of the unitary algebra into the similitude algebra and its commuting unnormalized Satake square. Pure multiplier Hecke operators retain the central character. Neither function restriction on the full algebra nor division by a component count defines these comparisons.

([ACC](#source-acc), §2.2.1, pp. 916–919, and proof of Theorem 2.3.3, pp. 936–937; [Scholze](#source-scholze-torsion), Theorem IV.1.1; [Caraiani–Scholze](#source-cs-noncompact), Lemma 2.1.1 and §§2.5–2.6.) *Needs:* HodgeTateAndCanonicalSubgroups §§2.1–2.13, 3.4–3.8; PerfectoidShimuraVarieties §§1.2, 2.1–2.3, 2.5, 2.8, 3.6–3.9; TorsionCohomologyInfrastructure §§1.2, 3b.1a; IgusaVarietiesAndTorsionConcentration IG.0.3–IG.0.6; `integral_model_comparison`.

**Checks.**

- At `a=1` over `Q(i)`, a cusp maps to a rational isotropic line. Removing the boundary would lose this value of the extended period map.
- A point of the image-compactified tower has its flag in an affinoid flag chart, whose preimage is affinoid perfectoid and descends to an affinoid at all sufficiently small finite levels. An abstract inverse-limit diamond without these chart assertions does not meet the contract.
- The genuine minimal and image compactifications have a finite comparison at finite level; a finite map alone does not identify their integral rings. The image-chart completion formula cannot be transferred to the genuine minimal tower by that argument.

- A pure multiplier double coset and its inverse both restrict as functions to zero on `ker ν`, although their product restricts to one. Only the operator subalgebra admits IG.0.4's restriction isomorphism.
- The self-dual trace lattice `O_F^a ⊕ 𝔡_F^{−1,a}` can involve a nonprincipal different. A rational identification of groups does not identify it with the standard free integral lattice; the level comparison retains the transported local compact opens.
- In Hodge degree one the Levi comparison retains `ℚ_l(−1)`; the tensor unit has degree zero and no twist. Trivializing the Tate line does not make its Galois linearization trivial.
- If a finite multiplier component set has order divisible by the coefficient prime, evaluation at the chosen component still splits constant pullback for the restricted unitary action; averaging would not be integral.

Prove `residual_unitary_galois_inputs`. Let `F` be CM, `n≥1`, and `S=Sᶜ` contain the places above `p` and those ramified over `F⁺`. Require that for each rational prime `l` below a place outside `S`, either `l` is unramified in `F` and no `l`-adic place belongs to `S`, or `l` splits in an imaginary quadratic subfield of `F`. For every `0<a<n`, every good `U(a,a)` level `L` hyperspecial outside `S`, every finite residue-field extension `k′/k` and every finite-dimensional smooth `k′[L_S]`-module `B`, each supported maximal Hecke ideal `η` admits a continuous semisimple rank-`2a` representation over its finite residue field. Its geometric Frobenius polynomial at every `v∉S` is `Σ_j(−1)^j q_v^{j(j−1)/2} T̃_{v,j}X^{2a−j} mod η`, with the unitary operators of ALS.4.13, including inert places. Include all good refinements, subquotient coefficients and dual orientation twists. This constructs `LocallySymmetric.ResidualUnitaryGaloisInput(F,n,O,S)`.

([ACC](#source-acc), Theorem 2.3.8 and proof, pp. 939–940; [Newton–Thorne](#source-nt16), Theorem 5.7; [Scholze](#source-scholze-torsion), Theorem IV.3.1.) *Needs:* IgusaVarietiesAndTorsionConcentration IG.6.6b; `admissible_torsion_hecke_comparison`; `unitary_similitude_tower_comparison`.

On the common field, level and coefficient range, define this instance by transport of IgusaVarietiesAndTorsionConcentration IG.6.6b's `unitaryTorsionResidual` and its `coefficientChange`, `removeAuxiliaryPrime` and `frobenius` exports. Thus the resulting representation is isomorphic, over the supported ideal's finite residue field, to `unitaryTorsionResidual` under `unitary_similitude_tower_comparison`. Its construction uses TorsionCohomologyInfrastructure's `perfectoidComparison`, `heckeContinuity`, `finiteLevelDescent` and `classicalAmbientDeterminant` on the same compact-support complex. Almost errors and nilpotent Hecke kernels retain their distinct meanings. No period-fibre, boundary-length or generic-vanishing result is an input.

Prove the remaining adapter `admissible_torsion_hecke_comparison`, for every field and admissible `S` above, every half-rank `a≥1`, and every good level and finite smooth coefficient system quantified above. Include the corresponding `GL_m` finite-coefficient systems for every `m≥1`, with their degree-`m` polynomials as in §0.7b; the ambient bound `a<n` is imposed only when forming the smaller-unitary ALS instance. It extends this identification from IG.6.6b's rationally saturated bad sets and split-place polynomials to ACC's admissible `S` and all the ALS.4.13 polynomials. At each `v∉S`, identify the degree-`2a` polynomial through unramified base change, using TorsionCohomologyInfrastructure §§3b.1–3b.1a's full hyperspecial Satake comparison. At an inert place `v=vᶜ`, use `q_v=q_{v⁺}²`, not `q_{v⁺}`, and retain the conjugate-dual block. In the normalized coordinates `e_j=q_v^{−j(2a−j)/2}T̃_{v,j}`, the supplied ambient determinant has coefficient `(−1)^j q_v^{j/2}e_j`; the supplied twist `ε^{1−a}` makes it `(−1)^j q_v^{j(j−1)/2}T̃_{v,j}`. This is the twist already made in IG.6.6b, so it is not applied a second time. The comparison descends from a temporary square root to the integral coefficients displayed here.

The extension outside IG.6.6b's field and rationally saturated bad-set range is part of this adapter: for every admissible `F,S` above, the restricted classical unitary Hecke actions used by the supplied completed comparison receive continuous degree-`2a` determinants with these good-place polynomials, and their residual specializations agree with the transported `unitaryTorsionResidual` wherever both are defined. This is the classical-action specialization underlying ACC Theorem 2.3.8 and Newton–Thorne Theorem 5.7. Use TorsionCohomologyInfrastructure's completed comparison, continuity and descent, and IHG Layer 4's interpolation after establishing this classical-action statement at the actual `S`. AG2.2–AG2.3 supplies the constituent attachments on its stated range; the remaining field and good-place extension is a requirement of this adapter, not an assumed export or an unconditional application of the conditional general determinant branch. Retain the characteristic-zero good-place hypotheses: at a rational prime either all factors are unramified and no place is in `S`, or choose the imaginary quadratic subfield in which that prime splits. At a small normal refinement use the same restricted classical action and its determinant; the two auxiliary-prime descents of `unitaryTorsionResidual.removeAuxiliaryPrime` remove only their added ramification. This is an admissible-set extension of the supplied arithmetic application, not a new interpolation or compact-support theorem.

For finite smooth `B`, use IG.6.6a's `coefficientCover` support argument and IG.6.6b's `coefficientChange`: trivialize `B` at a normal good refinement inside `S` and take derived invariants. The Hecke-equivariant filtration shows that any downstairs occurring ideal occurs upstairs, including for subquotients and `B^∨⊗o_L`; pullback need not be injective. Descend the representation to the finite residue field by its Frobenius coefficients and finite-field Brauer triviality, as in ACC Theorem 2.3.8. The resulting ALS predicate equals the predicate obtained by applying these transported supplied residual systems to every factor, level and coefficient in its quantifiers.

([ACC](#source-acc), §2.2.5, (2.2.7), p. 922, Theorems 2.3.5 and 2.3.8, pp. 937–940, and proof of Theorem 2.4.2, pp. 942–945; [Newton–Thorne](#source-nt16), Theorem 5.7.) *Needs:* IgusaVarietiesAndTorsionConcentration IG.0.4–IG.0.6, IG.6.6a–IG.6.6b; TorsionCohomologyInfrastructure §§2.1, 2.6–2.8, 3b.1–3b.2; `unitary_similitude_tower_comparison`; `ALS:ALS.1,ALS.3,ALS.5a`; `AG:AG2.0–AG2.3`; `IHG:Layers 0–1,4`.

**Checks.**

- For `n=1` the smaller-unitary input is vacuous. For `n=2` it includes `U(1,1)` and its rank-two polynomial `X²−T̃_{v,1}X+q_vT̃_{v,2}`; a rank-one attachment cannot replace it.
- A nontrivial finite `B` is trivial only after a level refinement. If all localized upstairs trivial-coefficient cohomology groups vanish, Hochschild–Serre forces downstairs cohomology with `B` to vanish as well.
- The Levi `GL₁×U(1,1)` in `U(2,2)` contributes ranks `1+2+1`. Its middle factor requires the residual-unitary attachment even when every general linear factor already has Galois type.

- At half-rank `a=2`, the coefficient exponent is `j(1−4+j)/2+j = j(j−1)/2`; `unitary_ambient_twist_exponent` records this identity for arbitrary rank and index. A second `ε⁻¹` twist would change every positive-index coefficient again.
- At an inert place of residue degree two above cardinality `3`, use `q_v=9`. Already the rank-two constant coefficient is `9T̃_{v,2}`, not `3T̃_{v,2}`.
- The supplied theorem at a larger rationally saturated bad set gives no unramifiedness or polynomial at a removed place. The admissible-set comparison must include that place in its classical action before descent.

### 0.7b General linear Galois type with finite coefficients

Prove `finite_coefficient_gln_galois_inputs`. Under the field and `S` hypotheses of §0.7a, for every `1≤m≤n`, every good `GL_m` factor level hyperspecial outside `S`, every finite residue-field extension and every finite smooth local coefficient module `B`, each supported maximal ideal has a continuous semisimple rank-`m` Galois representation with the geometric polynomial `P_v(X)` of AG2.0 at `v∉S`. Include the dual orientation coefficient systems. These are the `Spherical.IsGaloisType` instances used by ALS.4.12–ALS.4.13.

On the common range, this is the ALS instance obtained by transporting IgusaVarietiesAndTorsionConcentration IG.6.6a's `boundaryGLResidualRepresentation`, `frobenius`, `coefficientCover` and `compactDual`. Its realizing representation is isomorphic to that supplied representation, and the two `Spherical.IsGaloisType` predicates are equal after the coefficient and Hecke identifications. Use TorsionCohomologyInfrastructure §§4.3 and 4.6's `finiteTorsionDeterminant` and `residualRepresentation`, with its §3b.1 polynomial conversion, rather than constructing another unitary determinant or extracting the Levi again.

Precisely, if the supplied determinant representation `σ` has `det(1−Xσ(Frob_v))=P_Sch(X)`, then IG.6.6a's representation is `ρ=σ⊗ε` and `P_Sch(X)=reverse(P_v)(q_vX)`. Thus `det(Y−ρ(Frob_v))=P_v(Y)` in AG2.0's convention. Retain the same geometric Frobenius throughout. The finite smooth coefficient, finite-field and admissible-`S` extension is `admissible_torsion_hecke_comparison`, applied also to the supplied rank-`m` Levi determinant with this polynomial substitution. The supplied finite-cover filtration treats all the stated coefficient subquotients and dual orientation twists, without division by the deck-group order. These inputs precede ALS.4.12–ALS.4.13 and IG.6.7; no localized-boundary or generic-vanishing theorem is used to construct them.

([Scholze](#source-scholze-torsion), Theorem V.4.1 and Corollary V.4.3; [ACC](#source-acc), Theorem 2.3.5, pp. 937–938, and proof of Theorem 2.4.2, pp. 942–945.) *Needs:* IgusaVarietiesAndTorsionConcentration IG.6.6a; TorsionCohomologyInfrastructure §§3b.1, 4.3, 4.6; `admissible_torsion_hecke_comparison`; `ALS:ALS.1–ALS.3,ALS.5a`; `AG:AG2.0`.

**Checks.**

- For `m=1` the attachment is the residual class-field character, with polynomial `X−T_{v,1}`.
- At `m=2` the constant Eisenstein eigensystem has polynomial `(X−q_v)(X−1)`; Galois type alone does not imply residual irreducibility.
- Nontrivial finite coefficients and `B^∨⊗o_L` require the refined-level argument; a characteristic-zero attachment for algebraic cuspidal coefficients does not give these instances.

- For `m=1, q_v=3, T_{v,1}=2`, the supplied polynomial is `1−6X`; twisting by `ε` gives the monic `Y−2`, not `Y−6`. This is `gln_torsion_polynomial_rank_one` in the suggested file.
- For `m=2, q_v=2, T_{v,1}=3, T_{v,2}=5`, substitution `X↦X/2` changes `1−6X+40X²` to `1−3X+10X²`; it retains the standard constant coefficient `q_vT_{v,2}=10`.

<a id="boundary-level-coefficient-comparison"></a>

### 0.8 Boundary level coefficient comparison

Prove `boundary_level_coefficient_comparison`. For the same finite-projective coefficient lattice and good compact levels, the compact-support `→` interior `→` Borel–Serre-boundary triangle commutes with derived reduction `O→O/varpi^m` and finite-level pullback/trace. Under the field and `S` hypotheses of §0.7a, localizing at the paired `GL_n/unitary` non-Eisenstein ideals isolates the Siegel stratum, with the Satake action on each triangle map. Maps are constructed using the arithmetic correspondences and stratum comparison, not assumed merely because a retract exists.

([ACC](#source-acc), §2.4.1, Theorems 2.4.2 and 2.4.4, pp. 941–946). *Needs:* `Layer 0`; `ALS:ALS.4`; `ALS:ALS.3`; `residual_unitary_galois_inputs`; `finite_coefficient_gln_galois_inputs`.

*Route.* Use the ALS boundary triangle and stratum localization. Apply the coefficient and level comparisons to all three terms and compare their connecting maps. Use the Siegel evaluation maps and double-coset formulas to identify the Satake-twisted Hecke actions.

<a id="siegel-coefficient-retract"></a>

### 0.9 Siegel coefficient splitting

Prove `siegel_coefficient_retract`. Under the field and `S` hypotheses of §0.7a, let `K̃` be a good subgroup decomposed with respect to the Siegel parabolic `P =` GU, so that `K̃_P = K̃_U ⋊ K` with `K = K̃ ∩ G(𝔸^∞_{F⁺})`, let `λ` be dominant and assume its unitary weight `λ̃` is dominant, equivalently `−λ_{τc,1}≥λ_{τ,1}` at every chosen embedding above `F⁺`, and fix `m ≥ 1`. Then the pullback of `RΓ(X_K, V_λ/ϖ^m)` to the Siegel stratum is a direct summand of `RΓ(X^P_{K̃_P}, V_λ̃/ϖ^m)` in the derived category of modules over `H(P^S × K̃_{P,S}, K̃_P) ⊗ O/ϖ^m`, and the Satake map `𝒮 = r_G∘r_P` descends to a homomorphism from the image of `T̃^S` acting on the Siegel-stratum complex to the image of `T^S` acting on `RΓ(X_K, V_λ/ϖ^m)`, as in ACC (2.4.7). The summand is built in three steps. First, the Siegel-stratum complex is computed as the `K̃^S_P × K_S-equivariant` derived sections, over the `GLₙ` symmetric space inflated to `P`, of the derived `K̃_{U,S}-invariants` of `V_λ̃/ϖ^m`, following Newton–Thorne's comparison. Second, the inclusion of the summand is the reduction of the embedding `V_λ → V_λ̃^{K̃_{U,S}}` of `dual_weyl_levi_splitting`, followed by the edge map from invariants to derived invariants. Third, the retraction is restriction of derived invariants to the trivial subgroup followed by the `K`-equivariant projection `V_λ̃ → V_λ` of that splitting, reduced modulo `ϖ^m`.

([ACC](#source-acc), §2.4.1, proof of Theorem 2.4.4, (2.4.7), pp. 945–946; [Newton–Thorne](#source-nt16), Corollary 2.11, arXiv p. 14). *Needs:* `boundary_level_coefficient_comparison`; `residual_unitary_galois_inputs`; `finite_coefficient_gln_galois_inputs`; `dual_weyl_levi_splitting`; `EquivariantRetract`; `ALS:ALS.4`; Tau Ceti ReductiveGroups L9.

*Route.* Use the lowest-weight Levi summand of the dual-Weyl coefficient lattice and evaluation at the identity. Apply the right-derived unipotent invariants functor to its inclusion and retraction; use the non-Eisenstein boundary-stratum comparison.

**Checks.**

- For `n=1` and both Levi weights `1`, `λ̃=(−1,1)` fails the dominance hypothesis: the target coefficient module is zero and cannot contain the rank-one Levi lattice.
- For `n=1`, `λ_τ=2` and `λ_{τc}=−3` give dominant `λ̃=(3,2)`; the coefficient inclusion followed by projection is the identity, including after reduction modulo `ϖ^m`.
- For zero Levi weights, `λ̃=0` is dominant and the coefficient splitting is the identity on the trivial lattice. Dominance permits equality across the two blocks.

<a id="coefficient-satake-descent"></a>

### 0.10 Coefficient Satake descent

Prove `coefficient_satake_descent`. Under the field and `S` hypotheses of §0.7a, let `K̃` be a good subgroup of `G̃(𝔸^∞_{F⁺})` decomposed with respect to `P =` GU and `K = K̃ ∩ G(𝔸^∞_{F⁺})`; let `λ ∈ (ℤⁿ₊)^{Hom(F,E)}` be dominant with unitary weight `λ̃` dominant for `G̃`; let `𝔪 ⊂ T^S(K,λ)` be a non-Eisenstein maximal ideal and `𝔪̃ = 𝒮*(𝔪) ⊂ T̃^S`. Then the Satake map `𝒮: T̃^S → T^S` induces a homomorphism from the image of `T̃^S` acting on the localized boundary complex `RΓ(∂X̃_K̃, V_λ̃)_𝔪̃` to the image of `T^S` acting on `RΓ(X_K, V_λ)_𝔪`.

([ACC](#source-acc), §2.4.1, Theorem 2.4.4 with (2.4.5)–(2.4.7), pp. 945–946). *Needs:* `boundary_level_coefficient_comparison`; `residual_unitary_galois_inputs`; `finite_coefficient_gln_galois_inputs`; `siegel_coefficient_retract`; `positive_monoid_hecke_restriction`; `SR:SR.1.4`.

Localization at the non-Eisenstein ideal isolates the Siegel stratum of the boundary; the split Hecke-equivariant comparisons of `positive_monoid_hecke_restriction` and `siegel_coefficient_retract` show that an operator killing the boundary complex kills the `GLₙ` complex after applying `𝒮`, so `𝒮` descends to the Hecke images.

<a id="ramified-satake-descent"></a>

### 0.11 Ramified Satake descent

Prove `ramified_satake_descent`. Keep `K̃` and `K` as in `coefficient_satake_descent`, take trivial coefficients, a non-Eisenstein maximal ideal `𝔪 ⊂ T^S(K,0)` and `𝔪̃ = 𝒮*(𝔪)`. Let `R ⊆ S` consist of places prime to `p` that split over `F⁺`. At the place `v̄` below `v ∈ R`, require the unitary level to lie between the pro-v Iwahori and the Iwahori subgroup when `v` and `v^c` both lie in `R`, and between the parahoric subgroups `p̃_{v,1} ⊆ q̃_v ⊆ p̃_v` of ACC §2.4.1 when only `v` lies in `R`. Put `T = S − (R^c − R)`. Let `T̃^T_R` be the O-subalgebra of `H(G̃(𝔸^∞_{F⁺}), K̃) ⊗ O` generated by `T̃^S` and the operators `t_{v,i}(σ)` for `v ∈ R` and `e_{v,i}(σ)` for `v ∈ R^c − R (σ ∈ W_{F_v})`, and `T^T_R` the O-subalgebra of `H(GLₙ(𝔸^∞_F), K) ⊗ O` generated by `T^T` and the `t_{v,i}(σ)` for `v ∈ R`; both are commutative. Then `𝒮` extends to a map `T̃^T_R → T^T_R` that descends to an `O`-algebra homomorphism from the image of `T̃^T_R` on `RΓ(∂X̃_K̃, O)_𝔪̃` to the image of `T^T_R` on `RΓ(X_K, O)_𝔪`.

([ACC](#source-acc), §2.4.1, Theorem 2.4.8, pp. 946–948; the operators `t_{v,i}(σ)` and `e_{v,i}(σ)` are defined before Proposition 2.2.9, p. 925, through the Iwahori–Hecke algebra of `GLₙ(F_v)`). *Needs:* `coefficient_satake_descent`; `positive_monoid_hecke_restriction`; `SR:SR.1.4`.

*Route.* Extend the unramified Satake map by the explicit Iwahori operators at `R`. Check the double-coset formulas before descent to the two localized boundary Hecke images; trivial coefficients are required here.

**Unipotent cohomology with trivial coefficients**

The exterior-algebra computation supplies the degree and orientation convention used by both weight routes. Keep the integral coefficient ring and the Levi action in the comparison.

<a id="unipotent-exterior-cohomology"></a>

### 0.12 Unipotent exterior cohomology

Prove `unipotent_exterior_cohomology`. Let `v̄ ∈ S̄_p, K = F^+_v̄` (a local field here), `m ≥ 1`. For each `i ≥ 0` there is a `G(O_K)-equivariant` isomorphism `H^i(U(O_K), O/ϖ^m) ≅ Hom_{Z_p}(∧^i_{Z_p} U(O_K), O/ϖ^m) = Hom_O(∧^i_O(U(O_K) ⊗_{Z_p} O), O/ϖ^m)`, with `G(O_K)` acting on the right through its conjugation action on `U(O_K) ≅ Z_p^{n²[K:Q_p]}` (continuous group cohomology; the map is the cup-product extension of `H^1 = Hom`).

([ACC](#source-acc), §4.2, Lemma 4.2.2(1), p. 970). *Needs:* `Layer 0`.

*Route.* Identify the additive unipotent group with `Z_p^{n²[K:Q_p]}`. Use continuous cohomology of a free `Z_p`-module and cup-product Künneth; check conjugation on the dual exterior powers.

### 0.13 Integral geometric generic vanishing

Prove `integral_caraiani_scholze_vanishing`. Let `F=F⁺F₀` be CM with `F₀` imaginary quadratic, `f=[F⁺:Q]>1`, `n≥1` and `d=n²f`. For the noncompact quasi-split `U(n,n)` Shimura variety at good level and a finite free algebraic coefficient lattice `V_λ̃`, let `𝔪̃` have a semisimple residual Galois representation of length at most two. Impose the field/`S` admissibility of §0.7a and decomposed genericity: a rational prime `l≠p`, completely split in `F`, at which every local residual representation is unramified and its eigenvalues satisfy `α_i≠lα_j` for `i≠j`. Then `H^i(X̃,V_λ̃/ϖ)_𝔪̃=0` for `i<d` and `H_c^i(X̃,V_λ̃/ϖ)_𝔪̃=0` for `i>d`.

Define this name as the specialization of IgusaVarietiesAndTorsionConcentration IG.7.5–IG.7.6 to `V_λ̃/ϖ`, through `integral_model_comparison` and `unitary_similitude_tower_comparison`. The vanishing assertions equal the supplied ones under these cohomology isomorphisms. Rename its geometric `p` to `l` and coefficient `ℓ` to `p`; extend `𝔽_p` to `k` and use the finite coefficient-system descent of IG.7.6. Its `d=n²f` is the same complex dimension, and IG.7.1 uses precisely AG2.7's weak decomposed genericity, including repeated eigenvalues. A generic auxiliary prime can avoid the bad levels and all the finite auxiliary choices in its trace-comparison setting.

Consume IG.2's partial compactifications and affineness, IG.3.21–IG.3.25's compactified period fibres and IG.4.7–IG.4.10's semiperversity and opposing degree bounds on those same spaces. Feed the residual systems of IG.6.6a–IG.6.6b, transported by §§0.7a–0.7b, into the supplied boundary-length obstruction IG.6.7 before applying IG.7.3–IG.7.5's generic concentration and level descent IG.7.4. This preserves the order residual attachments → boundary length → generic vanishing. No partial compactification, fibre theorem, semiperversity or Igusa trace-to-torsion argument is a construction of this roadmap.

The coefficient and group identifications use IG.0.4's operator algebra, IG.0.5's finite-torsion localization and IG.0.6's unitary component. For compact support apply IG.5.1's dual-ideal dictionary: `ρ̄^∨⊗ε^{1−2n}` has eigenvalues `l^{2n−1}α_i⁻¹` at the split geometric prime; weak genericity and length are preserved. Algebraic `O/ϖ^m` coefficients are trivialized at deeper coefficient-prime level, followed by derived descent; no exact fixed-vector functor for a `p`-group is assumed.

([Caraiani–Scholze](#source-cs-noncompact), Theorem 1.1 and Remarks 1.4–1.5, pp. 5–6, and proof in §2.8, pp. 35–36.) *Needs:* IgusaVarietiesAndTorsionConcentration IG.0.4–IG.0.6, IG.6.6a–IG.6.7, IG.7.1, IG.7.4–IG.7.6; `residual_unitary_galois_inputs`; `finite_coefficient_gln_galois_inputs`; `unitary_similitude_tower_comparison`; `integral_model_comparison`; `AG:AG2.7`.

**Checks.**

- The two-term complex `[k →⁰ k]` has zero alternating class and nonzero cohomology in both degrees. Thus rational Igusa trace cancellation cannot replace the integral geometric argument.
- Length two permits a Siegel boundary contribution. The conclusions give opposite one-sided bounds for the two support conventions, rather than boundary vanishing.
- The auxiliary period-map prime is `l≠p`; the coefficient residue characteristic is `p`. The genericity inequalities use `l`, and require no pairwise-distinct eigenvalues beyond `α_i≠lα_j`.

### Examples

The rank-one and rank-two coefficient rows fix the conjugate reversal. The identity retract and the incompatible multiplication-by-1 and multiplication-by-2 actions distinguish a split map from an equivariant split map. For `GL₂` over `ℤ_p`, the dual Weyl module of weight (1,0) is the standard representation and that of weight (0,1) is zero; the weight `(p,0)` gives `Sym^p`, whose reduction is reducible and whose dual is not `Sym^p ⊗ det^{−p}`, while the weight `(p−2,0)` lies in the bottom alcove and its dual is `Sym^{p−2} ⊗ det^{−(p−2)}`.

### Dependencies

Mathlib retracts and derived categories; ALS.1/ALS.3/ALS.4; SR.1.4 and SR.2.1; Tau Ceti ReductiveGroups L7 and L9 and IHG §6.4 for the integral dual Weyl modules; HodgeTateAndCanonicalSubgroups §§2–4, PerfectoidShimuraVarieties Layers 1–3, TorsionCohomologyInfrastructure Layers 2–4 and IgusaVarietiesAndTorsionConcentration IG.6.6a–IG.7.6, through the arithmetic comparisons of §§0.7a–0.7b and 0.13.

## Layer 1: Fontaine–Laffaille compatibility

The arithmetic cohomology targets in this layer assume that `p` is unramified in `F` and that `F` contains an imaginary quadratic field in which `p` splits, as in ACC's standing hypothesis for §4, p. 965. In particular every `F⁺_v̄/ℚ_p` at `p` is unramified and the unitary factors used here are split. These assumptions apply to §§1.4, 1.7–1.8, 1.11–1.13 and 1.15–1.16; the local algebraic statements and combinatorial definitions state their own hypotheses.

<a id="unitary-generic-vanishing"></a>

### 1.0 Unitary generic vanishing and middle-degree maps

Prove `unitary_generic_vanishing`. Let `F` be CM containing an imaginary quadratic field, `f=[F⁺:ℚ]>1`, `n≥1`, `d=n²f`, and `K̃` a good level of the quasi-split unitary group of signature `(n,n)` at every real place. Let `V_λ̃` be its finite free algebraic `O`-coefficient lattice and `𝔪̃` a maximal ideal of its away-from-`S` Hecke image with semisimple residual representation of length at most two. Assume decomposed genericity in the sense of AG2.7 and the following condition: whenever `v∉S` has residue characteristic `l`, either `l` is unramified in `F` and no place above `l` lies in `S`, or `l` splits in an imaginary quadratic subfield of `F`. Then localized cohomology without supports vanishes below `d`, compactly supported cohomology vanishes above `d`, middle cohomology is `O`-torsion-free, and its map to boundary cohomology in degree `d` is surjective. The two vanishing bounds hold with both integral and finite `O/ϖ^m` coefficients; torsion-freeness concerns the integral middle group. ([ACC](#source-acc), Theorem 4.3.3 and proof, pp. 973–974.)

This name specializes IgusaVarietiesAndTorsionConcentration IG.7.8's ACC middle-degree export, together with IG.7.5–IG.7.6's one-sided bounds, to the same finite free coefficient lattice and Hecke image. Under the cohomology identification of §0.1 and `unitary_similitude_tower_comparison`, its injection is the supplied rationalization map and its surjection is the supplied boundary restriction; these equalities retain the actual maps, not only their source and target dimensions. The coefficient prime and geometric witness prime are exchanged as in §0.13. Finite coefficient extension, the finite-smooth-coefficient support comparison of §§0.7a–0.7b and IG.7.6's level descent identify the localized ideals and local systems. The image-compactified geometric tower does not replace the Borel–Serre boundary in this statement.

Use IG.7.6 for the integral consequences and successive extensions of `V/ϖ` for the finite `O/ϖ^m` bounds. The coefficient long exact sequence has `H^{d−1}(X̃,V/ϖ)=0 → H^d(X̃,V)[ϖ]`, giving the supplied torsion-freeness and injection; the boundary sequence gives the supplied surjection. These maps precede the Hida projector and remain compatible with the later ordinary summands.

*Needs:* IgusaVarietiesAndTorsionConcentration IG.7.5–IG.7.8; `integral_caraiani_scholze_vanishing` (§0.13); `unitary_similitude_tower_comparison`; ArithmeticLocallySymmetricSpaces ALS.1, ALS.4 and ALS.5a; AutomorphicGaloisRepresentationsPartII AG2.7; `integral_model_comparison`.

**Checks.**

- A free `O`-module maps injectively to its rationalization, whereas `O/ϖ` maps to zero. Thus the middle-degree injection excludes torsion and supplies the flat Hecke image required in §§1.7–1.8 and 3.37.
- Two residual rank-`n` constituents are allowed. Such a residual system can meet the Siegel boundary, so the conclusion does not assert boundary vanishing or concentration of both support conventions in degree `d`.
- The boundary long exact sequence has `H^d → H^d_∂ → H_c^{d+1}`; vanishing of the last term gives exactly the stated surjection. Reversing the two support bounds would not give it.

**Siegel shuffles and integral Kostant theory**

Use minimal representatives for left Levi cosets. The inverse-increasing condition fixes the convention needed for the dot action. Integral Kostant decomposition and formality turn the coefficient splitting into a direct summand in each indicated degree.

<a id="kostant-shuffles"></a>

### 1.1 Kostant representatives

Define `KostantShuffle`. For the Siegel Levi `GL_n×GL_n` in `GL_{2n}`, define `KostantShuffle(n)` as permutations `w` of `{0,…,2n−1}` whose inverse is increasing on each block `{0,…,n−1}` and `{n,…,2n−1}`. These are the minimal representatives for `(S_n×S_n)∖S_{2n}`; length is the number of inversions of `w`. For `Res_{F⁺/Q}` use one shuffle per embedding and sum lengths. General Weyl groups, roots, dominant weights and highest-weight modules are imported, not defined here.

([ACC](#source-acc), §1.2 Notation, pp. 905–906). *Needs:* `Tau Ceti ReductiveGroups L7`; `mathlib:Equiv.Perm.permGroup`; `mathlib:finAddFlip`.

Its interface includes:

- `KostantShuffle.val`: The underlying permutation lies in `S_{2n}`.
- `KostantShuffle.mem_iff`: Membership is precisely strict increase of the inverse on each of the two Levi blocks.
- `KostantShuffle.length`: Length is the cardinality of {`(i,j):i<j` and `w(j)<w(i)`}.
- `KostantShuffle.minimal_representative`: The shuffle is the unique minimum-length representative of its left Levi coset.

**Checks.**

- For `n=1` the two shuffles have lengths 0 and 1.
- For `n=0` the unique shuffle has length 0.
- The permutation exchanging the two blocks, preserving order inside each block, is a shuffle of length `n²`.
- For `n=2` the transposition (0 1) is not a shuffle.

<a id="integral-kostant-decomposition"></a>

### 1.2 Integral Kostant decomposition

Prove `integral_kostant_decomposition`. Let `v̄ ∈ S̄_p, K = F^+_v̄` unramified over `ℚ_p`, and assume `p ≥ 2n − 1`. For `w ∈ W^P_v̄` put `λ_w = w(ρ_v̄) − ρ_v̄ ∈ (Z^n_+)^{Hom_{Q_p}(F⊗_{F^+}F^+_v̄, E)}` (via (ACC (2.2.2))). For each `i ≥ 0` there is a `G(O_K)-equivariant` isomorphism `Hom_O(∧^i_O(U(O_K) ⊗_{Z_p} O), O) ≅ ⊕_{w ∈ W^P_v̄, l(w) = i} V_{λ_w}` (`V_{λ_w}` the integral dual Weyl module lattice).

([ACC](#source-acc), §4 standing hypotheses, p. 965, and §4.2, Lemma 4.2.2(2), pp. 970–971). *Needs:* `KostantShuffle`; `unipotent_exterior_cohomology`; `IntegralDualWeylModule.closed_alcove_simple`; `IntegralDualWeylModule.closed_alcove_ext_one`; Tau Ceti ReductiveGroups L7 and L9.

**Checks.**

- The unramified hypothesis retains the integral embedding decomposition used in the source. For `p` odd and `K = ℚ_p(√p)`, reduction of `O_K ⊗_{ℤ_p} O` contains the nonzero nilpotent given by `√p`, whereas a product of residue fields is reduced. Thus the integral decomposition by embeddings used here cannot be extended to this ramified `K`. This checks the hypothesis of the route; it does not assert failure of every possible ramified Kostant theorem.

*Route.* Use the integral lattices and closed-alcove API of Layer 0, with the unramified embedding decomposition. For `p ≥ 2n−1` the relevant `GL_n` weights stay in the closed bottom alcove; compute the characteristic-zero Kostant constituents. Simplicity and absence of extensions modulo the coefficient maximal ideal lift the direct decomposition integrally by universal coefficients.

<a id="unipotent-derived-formality"></a>

### 1.3 Unipotent derived formality

Prove `unipotent_derived_formality`. Let `v̄ ∈ S̄_p, K = F^+_v̄` unramified over `ℚ_p, m ≥ 1` and `p > n²`. There is a natural isomorphism, inducing the identity on cohomology, `R Γ(U(O_K), O/ϖ^m) ≅ ⊕_{i=0}^{n²[K:Q_p]} H^i(U(O_K), O/ϖ^m)[−i]` in `D(O/ϖ^m[G(O_K)])`.

([ACC](#source-acc), §4 standing hypotheses, p. 965, and §4.2, Lemma 4.2.3, pp. 971–972). *Needs:* `Layer 0`.

**Checks.**

- For unramified `K`, the residue-field embeddings distinguish the central-torus characters used to split the positive cohomological degrees. For ramified `K = ℚ_p(√p)`, the two characteristic-zero embeddings coincide on the residue field, so that character-separation argument does not give the stated integral equivariant splitting. Keep the unramified hypothesis rather than infer a ramified version from the exterior cohomology calculation.

*Route.* Split `H⁰` first using invariants. Separate the remaining exterior degrees using central-torus characters and the inequalities `0 ≤ i_σ ≤ n² < p`. If `p = n²+1` causes the extreme central character collision, the `H⁰` splitting already removes it; assemble identity maps on cohomology.

<a id="boundary-degree-retract"></a>

### 1.4 Boundary degree shifting

Prove `boundary_degree_retract`. Assume `p > n²` and `p` unramified in `F`. Write `W^P_v̄` for the product, over the embeddings of `F⁺_v̄` into `E`, of the Siegel Kostant shuffles (`KostantShuffle`), `l` for the summed length, and `ρ_v̄` for the sum over those embeddings of the half-sums of positive roots of `GL_{2n}`. Let `K̃ ⊂ G̃(𝔸^∞_{F⁺})` be a good subgroup decomposed with respect to `P` whose unipotent part at each `v̄ ∈ S̄_p` is all of `U(O_{F⁺_v̄}), K = K̃ ∩ G(𝔸^∞_{F⁺}), 𝔪 ⊂ T^S` non-Eisenstein and `𝔪̃ = 𝒮*(𝔪)`. Split `S̄_p = S̄₁ ⊔ S̄₂` and let `λ` and `λ̃` be dominant weights of `G` and `G̃` such that `λ̃_v̄` is the unitary weight of `λ_v̄` for `v̄ ∈ S̄₁` (`UnitaryLeviWeight`), `λ̃_v̄ = 0` for `v̄ ∈ S̄₂`, and for each `v̄ ∈ S̄₂` there is `w_v̄ ∈ W^P_v̄` with `λ_v̄ = w_v̄(ρ_v̄) − ρ_v̄`. Put `w_v̄ = 1` for `v̄ ∈ S̄₁` and `w = (w_v̄)`. Then for every `m ≥ 1` the shifted complex `RΓ(X_K, V_λ/ϖ^m)_𝔪[−l(w)]` is a direct summand of `RΓ(∂X̃_K̃, V_λ̃/ϖ^m)_𝔪̃`, equivariantly for `T̃^S` acting on the first through `𝒮`.

([ACC](#source-acc), §4.2, Theorem 4.2.1, pp. 968–970). *Needs:* `Layer 0`; `Layer 1`; `mathlib:DerivedCategory`.

*Route.* Use the coefficient Siegel retract and the derived unipotent formality decomposition. Apply the integral Kostant formula separately at places in `S₁` and `S₂`; the chosen constituent has shift `−l(w)`. Pass to the localized boundary using the ALS stratum comparison, retaining the exact coefficient lattice and Hecke action.

**Cuspidal weights and the middle degree**

Cuspidal-triviality exclusion is a predicate on the computed Kostant weight table. It is then combined with the imported unitary torsion concentration theorem. The perturbation and degree-shifting arguments retain their local degree and residue-characteristic bounds.

<a id="ctg-weight"></a>

### 1.5 Cuspidal-triviality exclusion for Kostant weights

Define `CTGWeight`. Given the actual finite set `W^P` of Siegel shuffles, the embedding involution `τ↦τc` and the Levi weight table `μ(w,τ,i)=λ_{w,τ,i}`, define `CTGWeight(μ)` by: for every `w∈W^P` and `a∈Z` there exists `τ` for which the vector `(μ(w,τ,i)+μ(w,τc,n−1−i))_i` is not the constant a vector. Here `λ_w=w(λ̃+ρ)−ρ` and the conjugate dual row is `−reverse(λ_{w,τc})`. This predicate on the computed table is `CTGWeight`; it uses the Kostant weight calculation, rather than an arbitrary table of parallel-trace inequalities.

([ACC](#source-acc), §4.3, Definition 4.3.5 and following paragraph, p. 974). *Needs:* `Layer 1`; `Layer 0`.

Its interface includes:

- `CTGWeight.iff_witness`: CTG is equivalent to `∀w,a, ∃τ,i, μ(w,τ,i)+μ(w,τc,n−1−i)≠a`.
- `CTGWeight.reindex`: Equivariant bijections of embeddings and bijections of `W` preserve the predicate.
- `CTGWeight.not_parallel`: If one `w` and a give that same constant vector at every `τ`, the table is not CTG.
- `CTGWeight.no_cuspidal_levi_weight`: For the weight table calculated from `λ̃`, CTG excludes a regular algebraic cuspidal `GL_n` representation of any weight `λ_w`, by the imported purity lemma.

**Checks.**

- `CTGWeight.zero` (non-example): For nonempty `W` and `n>0` the zero table is not CTG.
- With `W` empty the predicate is true.
- `CTGWeight.rank_one_pair` (computation): For `n=1`, one `w` and embeddings `a,aᶜ,b,bᶜ`, with `μ(a)=0, μ(aᶜ)=0, μ(b)=1, μ(bᶜ)=0`, the table is CTG: the conjugate sums are 0 and 1.

<a id="ctg-one-embedding-perturbation"></a>

### 1.6 Ctg one embedding perturbation

Prove `ctg_one_embedding_perturbation`. Assume `[F^+:Q] > 1`. Let `λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)}` and `τ_0: F^+ ↪ E`. There is `λ̃' ∈ (Z^{2n}_+)^{Hom(F^+,E)}` with `λ̃'_τ = λ̃_τ` for all `τ ≠ τ_0` and `λ̃'` CTG; one may take `λ̃'_{τ_0} = λ̃_{τ_0} +` (a, 0, …, 0) with a `∈ Z_{≥0}` sufficiently large (depending on `λ̃`).

([ACC](#source-acc), §4.3, Lemma 4.3.6 and (4.3.7), pp. 974–975). *Needs:* `Layer 1`.

*Route.* Change the first coordinate at a single embedding by a sufficiently large integer preserving dominance. Use the corrected sufficient criterion: the sums `Σ_i(μ_{w,τ,i}+μ_{w,τc,i})` differ at two embeddings. If CTG failed all these sums would equal na. Perturbing the first coordinate at `τ₀` changes one sum by ±a for every shuffle; finitely many forbidden a can be excluded. The printed minus sign in (4.3.7) is incorrect.

<a id="middle-degree-satake"></a>

### 1.7 Middle degree Satake

Prove `middle_degree_satake`. Assume `[F^+:Q] > 1`. Let `K̃ ⊂ G̃(A^∞_{F^+})` be good and decomposed with respect to `P (K = K̃ ∩ G)`, with `K̃_{U,v̄} = U(O_{F^+_v̄})` for each `v̄ ∈ S̄_p, λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)}` and `S̄_p = S̄_1 ⊔ S̄_2` with (1) `λ̃_v̄ = 0` for `v̄ ∈ S̄_2`; (2) for every finite place `w ∉ S` of `F` with residue characteristic `l`, either `S` contains no `l`-adic place of `F` and `l` is unramified in `F`, or `l` splits in some imaginary quadratic field `F_0 ⊂ F`; (3) `p > n²` (`p` unramified in `F`). Let `w ∈ W^P_{S̄_2}, λ_w = w(λ̃+ρ) − ρ ∈ (Z^n_+)^{Hom(F,E)}, m ⊂ T^S` non-Eisenstein in the support of `H^*(X_K, V_{λ_w}), m̃ = S^*(m)`, and assume `ρ̄_m̃` decomposed generic. Then `S: T̃^S → T^S` descends to a homomorphism `T̃^S(H^d(X̃_K̃, V_λ̃))_m̃ → T^S(H^{d−l(w)}(X_K, V_{λ_w}))_m`.

([ACC](#source-acc), §4.3, Proposition 4.3.4, pp. 973–974). *Needs:* `Layer 1`; `unitary_generic_vanishing` (§1.0); `AG:AG2.0`; `ALS:ALS.5b`.

*Route.* Apply §1.0 concentration and its torsion-free middle-degree consequence. Compose the map to boundary cohomology with the shifted retract of Theorem 4.2.1. Descend the Satake action to the middle and shifted Hecke images; only the rational injection claimed by the source is used.

<a id="fontaine-laffaille-degree-shifting"></a>

### 1.8 Fontaine–Laffaille degree shifting

Fix `𝔪⊂T^S` and `𝔪̃=𝒮*(𝔪)`. In §§1.8–1.16 use the cohomological Hecke images

```text
A(K,λ,q)   = image(T^S → End_O H^q(X_K,V_λ)_𝔪),
A(K,λ,q,m) = image(T^S → End_{O/ϖ^m} H^q(X_K,V_λ/ϖ^m)_𝔪),
Ã(K̃,λ̃)    = image(T̃^S → End_O H^d(X̃_K̃,V_λ̃)_𝔪̃).
```

These differ from the Hecke image on a whole derived complex. No natural map `A(K,λ,q)→A(K,λ,q,m)` is assumed. ([ACC](#source-acc), §4.4, p. 975.)

Prove `fontaine_laffaille_degree_shifting`. Let `λ ∈ (Z^n_+)^{Hom(F,E)}` and let `v̄ ≠ v̄'` be `p`-adic places of `F^+` (so `F^+ ≠ Q`). Fix `m ≥ 1` and a good `K̃ ⊂ G̃(A^∞_{F^+}) (K = K̃ ∩ G)`. Assume: (1) `−λ_{τc,1} − λ_{τ,1} ≥ 0` for every `τ: F ↪ E` inducing `v̄`; (2) `Σ_{v̄'' ∈ S̄_p, v̄'' ≠ v̄, v̄'} [F^+_{v̄''}:Q_p] > ½[F^+:Q]`; (3) `U(O_{F^+_{v̄''}}) ⊂ K̃_{v̄''} ⊂ {g ≡ (1_n *; 0 1_n) mod ϖ^m_{v̄''}}` for every `p`-adic `v̄'' ≠ v̄`, and `K̃_v̄ = G̃(O_{F^+_v̄})`; (4) `p > n²`; (5) for every finite place `w ∉ S` of `F` with residue characteristic `l`, either `S` contains no `l`-adic place of `F` and `l` is unramified in `F`, or `l` splits in some imaginary quadratic field `F_0 ⊂ F`; (6) `m ⊂ T^S` is non-Eisenstein and `ρ̄_m̃` is decomposed generic. Define `λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)}` by `λ̃_τ = 0` if `τ` induces neither `v̄` nor `v̄', λ̃_τ = (−λ_{τ̃c,n}, …, −λ_{τ̃c,1}, λ_{τ̃,1}, …, λ_{τ̃,n})` if `τ` induces `v̄` (dominant by (1)), and `λ̃_τ ∈ Z^{2n}_+` arbitrary if `τ` induces `v̄'`. For `m' ≥ m` let `K̃(m')_{v̄''} = K̃_{v̄''} ∩ {g ≡ (1_n *; 0 1_n) mod ϖ^{m'}_{v̄''}}` for `p`-adic `v̄'' ≠ v̄` and `K̃(m')_{v̄''} = K̃_{v̄''}` otherwise `(K̃ = K̃(m))`. Let `q ∈ [⌊d/2⌋, d−1]`. Then there is `N=N(n,[F⁺:Q])≥1` such that for the given data and coefficient exponent `m` there exist `m'≥m` and an ideal `J⊂A(K,λ,q,m)` with `J^N=0`, and a commutative square `T̃^S → Ã(K̃(m'), λ̃) → A(K,λ,q,m)/J, T̃^S →^S T^S → A(K,λ,q,m)/J`.

([ACC](#source-acc), §4.4, Proposition 4.4.1 (with Hypothesis 4.4.2 and (4.4.3)–(4.4.5) in its proof), pp. 975–978). *Needs:* `Layer 1`; `unitary_generic_vanishing` (§1.0).

*Route.* Choose the local Kostant constituent of length `d−q`; apply the boundary-degree retract and §1.0 middle-degree concentration. Use the universal-coefficient torsion sequence and multiply annihilator ideals, tracking the recurrence `N′ = 1+(d−q−1)N`. Use Hochschild–Serre to descend from the finer level; the exponent depends only on `n` and `[F⁺:Q]`, not on `m` or the fine level.

**Checks.**

- The definitions of `A(K,λ,q,m)` and `Ã(K̃,λ̃)` use single cohomology groups in degrees `q` and `d`; a Hecke action on the entire derived complex can have a larger image.
- Torsion in degree `q+1` contributes to `H^q(V/ϖ^m)` by universal coefficients. Thus integral degree-`q` cohomology alone cannot define its Hecke image by reduction.
- With `n,F` fixed and `m` unbounded, no fixed `m′` satisfies `m′≥m`. Only `N` is uniform; the finer level depends on the given coefficient exponent.

**Integral Fontaine–Laffaille transfer**

Transfer the polarized unitary representation to the rank-n summand using determinant kernels and multiplicity-free reconstruction. This step must work for an arbitrary coefficient homomorphism. Degree reflection uses finite-level duality with the actual orientation and coefficient twists.

<a id="residually-distinct-split-image"></a>

### 1.9 Image of a residually multiplicity-free pair

Prove `residually_distinct_split_image`. Let `B` be a henselian local ring with residue field `k` (in the application a finite Artinian local `O`-algebra), `G` a group and `ρ, ρ′: G → GLₙ(B)` representations whose reductions `ρ̄, ρ̄′` are absolutely irreducible and not isomorphic. Then the `B`-algebra map `B[G] → Mₙ(B) × Mₙ(B)` given by `(ρ, ρ′)` is surjective, with kernel `ker(det∘ρ) ∩ ker(det∘ρ′)`. If `D` is a determinant of dimension `2n` on `B[G]` with `D ⊗ k = det∘ρ̄ · det∘ρ̄′` whose kernel contains that intersection, then `B[G]/ker D = Mₙ(B) × Mₙ(B)`.

([Chenevier](#source-chenevier), Theorem 2.22(i)–(ii), PDF p. 34; [ACC](#source-acc), §4.4, proof of Proposition 4.4.6, p. 980). *Needs:* `IHG:Layer 1` (semisimple reconstruction and the henselian generalized-matrix-algebra structure); `IHG:Layer 0`.

Over `k`, Burnside's theorem and the non-isomorphism of `ρ̄` and `ρ̄′` make `k[G] → Mₙ(k) × Mₙ(k)` surjective, and Nakayama's lemma lifts surjectivity to `B`. A faithful Cayley–Hamilton quotient of a residually multiplicity-free determinant is a generalized matrix algebra of type `(n, n)`, and a quotient of `Mₙ(B) × Mₙ(B)` of that type is the whole algebra.

**Checks.**

- For `n = 1` and characters `χ, χ′` with distinct reductions, `B[G] → B × B` is surjective; for `χ = χ′` the image is the diagonal copy of `B`, so the non-isomorphism hypothesis is needed.

### 1.9a Coefficient Fontaine–Laffaille normalization

Prove `fontaine_laffaille_normalization`. For unramified `K/ℚₚ`, `p>2` and splitting coefficient field `E`, use LGD §1.6's common coefficient category and its covariant realization, with AC §1.5a's interval twists, to identify the functor `Gᵃ` of ACC §4.1 on `[aτ,aτ+p−2]`. Preserve coefficient-algebra actions, labelled filtrations, the Frobenius permutation, exact sequences, coefficient extension, reduction, lattice quotients and finite-torsion subquotients. Here a constant labelled jump `i` realizes `ε^{−i}` and has Hodge–Tate label `i`. Translate a supplier's numerical label `−i` to `i` by AG2.0's sign dictionary; the representation is unchanged. The passage from the scalar contravariant functor to the covariant coefficient functor uses the actual linear lattice dual or Pontryagin torsion dual and transports its actions; it is a separate operation from this numerical translation.

For `a=(aτ)`, let `ψ_a∘Art_K(u)=∏τ τ(u)^{−aτ}` on units and `ψ_a∘Art_K(p)=1`. The shifted object has `Fil^j M(a)_τ=Fil^{j+aτ}M_τ` and the correspondingly shifted divided Frobenius, and `Gᵃ(M)=G⁰(M(a))⊗ψ_a`. Supply independence of the allowable interval, the tensor identity when the tensor object remains in the safe interval, and the lattice criterion: a lattice in a crystalline representation with all labelled weights in `[aτ,aτ+p−2]` lies in the essential image. The residual multiset `FLτ` records these filtration jumps with multiplicity. This is the normalization in every use of `Gᵃ`, `G` and `FLτ` below.

([ACC](#source-acc), §4.1, pp. 965–966, including (4.1.1); AC §1.5a.) *Needs:* `LGD:§1.6`; `AC:§1.5a`; `AG:AG2.0`; `PH:§§3.2–3.6,6.1`.

**Checks.**

- A jump-one line realizes `ε⁻¹`, with our Hodge label `1`. Negating a supplier's numerical label leaves this character intact; taking its actual dual would give `ε`.
- The linear dual into `ℤₚ` of a finite nonzero torsion realization is zero. Its Pontryagin dual is nonzero and commutes with lattice reduction, as required by the coefficient functor.
- `UnitaryLeviWeight.fontaine_laffaille_endpoint`: for `n=2`, `p=7`, `λτ=(0,0)` and `λτc=(0,−2)`, the unitary row is `(2,0,0,0)` and its shifted multiset is `{5,2,1,0}`. Both §1.11 inequalities hold. This lies in `[0,5]` and fails `[0,4]`; the allowed interval has no rank correction.
- A jump `aτ+p−1` fails `Fil^{aτ+p−1}=0`; endpoint inclusion stops at `aτ+p−2`.

<a id="nilpotent-fontaine-laffaille-transfer"></a>

### 1.10 Nilpotent Fontaine–Laffaille transfer

Prove `nilpotent_fontaine_laffaille_transfer`. Let Ã be a finite flat `O`-algebra, `D̃` a continuous 2n-dimensional determinant of `G_{F,S}` valued in Ã, and `M = Ã[G_{F,S}]/ker D̃`. Assume the finite `O`-module `M`, restricted to each `G_{F_v}` with `v | v̄`, lies in the essential image of the integral Fontaine–Laffaille functor `G^a` in the stated interval. Let Ã `→ B` be an `O`-algebra homomorphism, where `B` is a finite Artinian local `O`-algebra killed by `ϖ^m` for some `m ≥ 1`. Suppose `D̃_B = det(ρ ⊕ ρ′)` for continuous `ρ, ρ′: G_{F,S} → GL_n(B)`, whose residual representations over the residue field of `B` are absolutely irreducible and non-isomorphic. Then there is a surjection `B ⊗_Ã M ↠ B[G_{F,S}]/ker D̃_B`, and the latter algebra is isomorphic to `M_n(B) × M_n(B)`. Consequently `ρ|_{G_{F_v}}` belongs to the essential image of `G^a`. The coefficient map Ã `→ B` need not be surjective. Kernel inclusion under arbitrary scalar extension, rather than equality under flat scalar extension, gives the displayed surjection; the split matrix-algebra identification requires the residually multiplicity-free reconstruction and faithful determinant argument.

([ACC](#source-acc), §4.4, proof of Proposition 4.4.6, pp. 980–981 (determinant-kernel transfer); [Chenevier](#source-chenevier), §1.17 and Lemma 1.18(iii), PDF p. 16; Theorem 2.22, PDF p. 34). *Needs:* `LGD:§1.6`; `AC:§1.5a`; `fontaine_laffaille_normalization`; `IHG:Layer 0`; `residually_distinct_split_image`.

*Route.* Use Chenevier Lemma 1.18(iii): the image of `ker D̃` lies in `ker D̃_B`. Therefore scalar extension of `M` surjects onto `B[G]/ker D̃_B`, without assuming that Ã `→ B` is surjective or flat. Residual absolute irreducibility and non-isomorphism give surjectivity of the joint representation onto `M_n(B) × M_n(B)` by Burnside and Nakayama. The kernel of the representation is contained in the determinant kernel; the descended product determinant is faithful, giving equality of these kernels. Import this precise split specialization from IHG.1, not the stronger assertion that every multiplicity-free generalized matrix algebra is a product. Since `B` is finite over Ã, `B ⊗_Ã M` is a quotient of a finite direct sum of copies of `M`. Fontaine–Laffaille stability under finite sums and subquotients applies. Projection onto the first matrix factor and then one column gives the rank-n representation `ρ` as a quotient.

<a id="middle-range-fontaine-laffaille"></a>

### 1.11 Middle range Fontaine–Laffaille

Prove `middle_range_fontaine_laffaille`. Let `λ, v̄ ≠ v̄', m ≥ 1` and a good `K̃` satisfy (1) `−λ_{τc,1} − λ_{τ,1} ≥ 0` and `−λ_{τc,n} − λ_{τ,n} ≤ p − 2n − 1` for every `τ` inducing `v̄`, and (2)–(6) of `fontaine_laffaille_degree_shifting`. Let `q ∈ [⌊d/2⌋, d−1]`, and for assertion `(c)` assume `A(K,λ,q,m) ≠ 0`. Then there exist `N ≥ 1`, depending only on [F:Q] and `n`, an ideal `J ⊂ A(K,λ,q,m)` with `J^N = 0` and a continuous `ρ_m: G_{F,S} → GL_n(A(K,λ,q,m)/J)` with (a) `char(ρ_m(Frob_v)) =` image of `P_v(X)` for `v ∉ S; (b)` for each `v | v̄, ρ_m|_{G_{F_v}}` is in the essential image of `G^a`, a `= (λ_{τ,n})_{τ ∈ Hom_{Q_p}(F_v,E)}; (c)` for each `v | v̄` there is `N̄ ∈ MF_k` with `ρ̄_m̃|_{G_{F_v}} ≅ G(N̄)` and `FL_τ(N̄) = {−λ_{τc,n}+2n−1, …, −λ_{τc,1}+n, λ_{τ,1}+n−1, …, λ_{τ,n}}` for every `τ ∈ Hom_{Q_p}(F_v,E)`, where `ρ̄_m̃ = ρ̄_m ⊕ ρ̄_m^{c,∨}ε^{1−2n}`.

([ACC](#source-acc), §4.4, Proposition 4.4.6, pp. 979–981). *Needs:* `Layer 1`; `LGD:§1.6`; `AC:§1.5a`; `fontaine_laffaille_normalization`; `unitary_generic_vanishing` (§1.0); `PH:§§3.2–3.6,6.1`; `AG:AG2.0`; `AG:AG2.2`; `AG:AG2.3`; `AG:AG2.6`.

*Route.* Use the degree-shifting Hecke quotient and the unitary crystalline representation supplied by AG2. Apply the integral Fontaine–Laffaille interval bound at `v` and CTG at `v′`. Apply nilpotent-fontaine-laffaille-transfer to the finite Artinian quotient and the two absolutely irreducible non-isomorphic residual summands; obtain the rank-n Fontaine–Laffaille subquotient.

<a id="degree-reflection-duality"></a>

### 1.12 Degree reflection duality

Prove `degree_reflection_duality`. For a good level `K`, `m≥1`, `R=O/ϖ^m`, a finite free algebraic coefficient lattice `V` and `0≤q′≤d−1`, the general finite-coefficient duality is

```text
H_c^{d−1−q′}(X_K,V^∨⊗o_K⊗R) ≅ Hom_R(H^{q′}(X_K,V⊗R),R).
```

Here `o_K` is the orientation system and the pairing makes inverse double cosets adjoint. In particular the complementary compact-support and ordinary Hecke images identify under this involution, with the corresponding dual maximal ideals. The ring `R` is self-injective, so this finite-coefficient statement uses an exact dual; integral `O`-duality retains derived Hom and its Ext terms.

For the ordinary-to-ordinary reflection impose the Layer 1 standing assumptions and all six field, level, weight, residue-characteristic and genericity hypotheses of `all_degree_fontaine_laffaille` (§1.15), and require `𝔪` non-Eisenstein and supported on `H^{q′}(X_K,V_λ/ϖ^m)`. At the refined level assume `K` is the principal congruence subgroup of level `ϖ_v^m` at the `p`-adic places away from `v̄`, and `λ` vanishes there. For using the upper-range theorem require `q′<⌊d/2⌋`, so `d−1−q′≥⌊d/2⌋`; the Hecke-image duality itself holds throughout `0≤q′≤d−1`. The weight inequalities give `V_{λ^∨}≅Hom_O(V_λ,O)` by `dual_weyl_bottom_alcove_duality`. Put `n₀=(2n+1−p)/2` and `μ₀,τ=(n₀,…,n₀)`. The weight `λ^∨+μ₀` satisfies the same local bound at `v̄`. Boundary vanishing at the supported non-Eisenstein ideals identifies compact and ordinary cohomology, and the coefficient-twist comparison identifies the dual system with this weight. Thus `𝔪^∨(ε^{−n₀})` is supported in complementary degree and the map

```text
[K^S g K^S] ↦ ε(Art_F(det g))^{−n₀}[K^S g⁻¹ K^S]
```

induces an isomorphism `f` from the Hecke image on `H^{d−1−q′}(X_K,V_{λ^∨+μ₀}/ϖ^m)_{𝔪^∨(ε^{−n₀})}` onto `A(K,λ,q′,m)`. If the source has a representation `ρ′` satisfying `(a)–(c)` of `middle_range_fontaine_laffaille`, then `ρ=(f∘ρ′)^∨⊗ε^{1−2n+(p−1)/2}` has those properties on the target. The upper-range application uses decomposed genericity of the unitary sum, obtained from `genericity_making_character_twist` when necessary.

([ACC](#source-acc), Propositions 2.2.21 and 2.2.23 and proof of Corollary 4.4.8, pp. 983–984; [Newton–Thorne](#source-nt16), Theorem 4.2.) *Needs:* `dual_weyl_bottom_alcove_duality`; `ALS:ALS.5a`; `ALS:ALS.4`; `ALS:ALS.3`; `fontaine_laffaille_normalization`.

*Route.* Use the finite-level orientation pairing and its adjoint Hecke action. Apply ALS.4's general linear boundary-Eisenstein theorem with the field/Hecke hypotheses in §1.15 before replacing compact supports by ordinary cohomology. Then apply the cyclotomic coefficient twist and transport the filtration labels with §1.9a. The hypotheses of §1.15 are an explicit package here, independent of that theorem's conclusion.

**Checks.**

- For `n=2`, `p=5`, `O=ℤ₅`, `m=1`, `F=ℚ(i,√6)` and `λ=0`, one has `d=8` and `n₀=0`. At an Eisenstein ideal occurring in constants, `H⁰` is nonzero while `H⁷=0` because every component is a noncompact orientable seven-manifold. The compact-support `H_c⁷` pairs with `H⁰`; ordinary reflection is unavailable.
- A supported non-Eisenstein ideal has zero localized boundary cohomology under the stated admissibility hypotheses, so the support triangle identifies `H_c` with `H` in every degree. Merely being supported does not yield this identification.
- If `q′<⌊d/2⌋`, then `d−1−q′≥⌊d/2⌋`. For `d=8`, degrees `0,1,2,3` reflect to `7,6,5,4`, respectively.
- Over `O`, the dual of `O/ϖ` contributes `Ext¹_O(O/ϖ,O)`; ordinary Hom would lose it. Over `R=O/ϖ^m`, the exact `R`-dual in the displayed finite-coefficient formula preserves nonzero finite modules.

**Crystalline twists and local–global compatibility**

A prescribed global crystalline character makes the unitary residual representation generic without changing the desired local conclusion. The finite shifted-partition argument recovers the labelled rank-n weights. The final theorem has two separate alternatives for obtaining its nonzero comparison.

<a id="genericity-making-character-twist"></a>

### 1.13 Genericity making character twist

Prove `genericity_making_character_twist`. Let `ρ̄_𝔪` be decomposed generic. After enlarging `k` there is a character `ψ̄: G_F →` kˣ, trivial on `G_{F_v}` for every `v ∈ S`, such that the rank-2n representation `(ρ̄_𝔪 ⊗ ψ̄) ⊕ (ρ̄_𝔪 ⊗ ψ̄)^{c,∨}ε^{1−2n}` is decomposed generic. Prove the character prescription using finite idele-class characters with the indicated local restrictions.

([ACC](#source-acc), §4.4, proof of Corollary 4.4.8, p. 984). *Needs:* `AG:AG2.7`; `CS:§§2.12–2.16`.

*Route.* At a completely split generic rational prime, choose finite character values avoiding all forbidden cross-summand ratios. Use class-field approximation with the character trivial at `S`, and take its Teichmüller lift. Enlarge `S` only as prescribed and descend through the prime-to-p abelian quotient. The finite-order character is CS §2.15, `cht_character_extension` applied to the character that is trivial on `∏_{v∈S} F_v^×` and unramified with the prescribed root-of-unity Frobenius values at the split witness places `w, w^c`; reduce modulo the maximal ideal after enlarging `k`. This is Chevalley’s approximation, not a Grunwald–Wang statement.

<a id="shifted-partition-recovery"></a>

### 1.14 Shifted partition recovery

Prove `shifted_partition_recovery`. Let `m ≥ 1` and let A, `B, C, D` be m-element sets of integers such that every element of `C` exceeds every element of `D`. Suppose that A `∪ B` and `C ∪ D` are equal and have `2m` elements, and that (A+1) `∪ B` and (C+1) `∪ D` are equal and have `2m` elements, where A+1 `=` {a+1 : a `∈` A}. Then A `= C` and `B = D`.

([ACC](#source-acc), §4.5, Lemma 4.5.2, p. 989). *Needs:* Mathlib integer arithmetic and finite collections.

*Route.* Compare multiplicities at the largest value where the two partitions differ. Use the strict separation `C>D` and the second partition after shifting A,C by one to eliminate that value; induct on the finite multisets.

<a id="all-degree-fontaine-laffaille"></a>

### 1.15 All degree Fontaine–Laffaille

Prove `all_degree_fontaine_laffaille`. Let `v̄ ∈ S̄_p, K ⊂ GL_n(A_F^∞)` good, `λ ∈ (Z^n_+)^{Hom(F,E)}, m ⊂ T^S(K,λ)` non-Eisenstein. Assume: (1) `K_v = GL_n(O_{F_v})` for `v | v̄`; (2) there is `v̄' ∈ S̄_p, v̄' ≠ v̄`, with `Σ_{v̄'' ∈ S̄_p, v̄'' ≠ v̄, v̄'} [F^+_{v̄''}:Q_p] > ½[F^+:Q]`; (3) `−λ_{τc,1} − λ_{τ,1} ≥ 0` and `−λ_{τc,n} − λ_{τ,n} ≤ p − 1 − 2n` for every `τ` inducing `v̄`; (4) `p > n²`; (5) for every finite place `w ∉ S` of `F` with residue characteristic `l`, either `S` contains no `l`-adic place of `F` and `l` is unramified in `F`, or `l` splits in some imaginary quadratic field `F_0 ⊂ F`; (6) `ρ̄_m` is decomposed generic. Then for all integers `q ∈ [0, d−1]` and `m ≥ 1` there are `N ≥ 1` depending only on [F:Q] and `n, J ⊂ A(K,λ,q,m)` with `J^N = 0`, and a continuous `ρ_m: G_{F,S} → GL_n(A(K,λ,q,m)/J)` satisfying (a), `(b), (c)` of `middle_range_fontaine_laffaille`.

([ACC](#source-acc), §4.4, Corollary 4.4.8, pp. 981–984). *Needs:* `Layer 1`; `LGD:§1.6`; `AC:§1.5a`; `fontaine_laffaille_normalization`.

*Route.* First prove the upper-degree range using `middle_range_fontaine_laffaille`. Reflect `q` to `d−1−q` using Poincaré duality and the cyclotomic twist. Choose a finite character so that the unitary residual direct sum is decomposed generic, and compare twisted coefficient systems.

<a id="fontaine-laffaille-local-global"></a>

### 1.16 Fontaine–Laffaille compatibility

Prove `fontaine_laffaille_local_global`. Let `K ⊂ GL_n(A_F^∞)` be a good subgroup, `λ ∈ (Z^n_+)^{Hom(F,E)}, S` a finite set of finite places of `F` containing the `p`-adic places with `S = S^c`, and `m ⊂ T^S(K,λ)` a non-Eisenstein maximal ideal with `T^S(K,λ)/m = k` of characteristic `p`. Let `v̄` be a `p`-adic place of `F^+` and assume: (1) `F` is unramified at `p`, and some imaginary quadratic subfield `F_0⊂F` has `p` split; (2) for every finite place `w ∉ S` of `F` with residue characteristic `l`, either `S` contains no `l`-adic place of `F` and `l` is unramified in `F`, or `l` splits in some imaginary quadratic field `F_0 ⊂ F`; (3) `K_v = GL_n(O_{F_v})` for every `v | v̄`; (4) `λ_{τ,1} + λ_{τc,1} − λ_{τ,n} − λ_{τc,n} ≤ p − 2n − 1` for every `τ: F ↪ E` inducing `v̄`; (5) `p > n²`; (6) there is a `p`-adic place `v̄' ≠ v̄` of `F^+` with `Σ_{v̄'' ∈ S̄_p, v̄'' ≠ v̄, v̄'} [F^+_{v̄''}:Q_p] > ½[F^+:Q]`; (7) `ρ̄_m` is decomposed generic; (8) either (a) `H^*(X_K, V_λ)_m[1/p] ≠ 0`, or `(b)` for every `τ` inducing `v̄, −λ_{τc,n} − λ_{τ,n} ≤ p − 2n − 2` and `−λ_{τc,1} − λ_{τ,1} ≥ 0`. Then there exist an integer `N ≥ 1`, depending only on `[F^+:Q]` and `n`, an ideal `J ⊂ T^S(K,λ)_m` with `J^N = 0`, and a continuous `ρ_m: G_{F,S} → GL_n(T^S(K,λ)_m/J)` such that: (a) for each finite `v ∉ S`, the characteristic polynomial of `ρ_m(Frob_v)` is the image of `P_v(X); (b)` for each `v | v̄, ρ_m|_{G_{F_v}}` lies in the essential image of `G^a` with a `= (λ_{τ,n})_{τ ∈ Hom(F_v,E)}; (c)` for each `v | v̄` there is `M̄ ∈ MF_k` with `ρ̄_m|_{G_{F_v}} ≅ G(M̄)` and `FL_τ(M̄) = {λ_{τ,1}+n−1, λ_{τ,2}+n−2, …, λ_{τ,n}}` for every `τ: F_v ↪ E`.

([ACC](#source-acc), §4.1, Theorem 4.5.1, p. 967 (restated §4.5, p. 985; proof pp. 985–988)). *Needs:* `Layer 1`; `LGD:§1.6`; `AC:§1.5a`; `fontaine_laffaille_normalization`; `PH:§§3.2–3.6,6.1`; `AG:AG2.0`; `CS:Layer 1`.

*Route.* Use Corollary 4.4.8 on the torsion cohomology images and the uniform nilpotence bound to pass to the complex Hecke algebra. In case `(8a)`, import the automorphic point and its pure central-character weight sum, and twist by a crystalline global character. In case `(8b)`, use two character twists differing by one and the shifted-partition recovery lemma to identify the bottom `n` weights. Remove the twists and read the rank-n residual Fontaine–Laffaille multiset with geometric Artin and `HT(ε)=−1` conventions.

### Examples

At rank one the two shuffles have lengths 0 and 1; exchanging two blocks of size `n` has length `n²`. The zero weight table fails CTG, whereas two conjugate pairs with sums 0 and 1 satisfy it. The cohomological duality has degree `d−1−q`, with its coefficient twist retained.

### Dependencies

Layer 0; §1.0; LGD §1.6 and AC §1.5a with `fontaine_laffaille_normalization` (§1.9a); PH §§3.2–3.6,6.1 with AG2.0’s numerical sign adapter; AG2.2/AG2.3/AG2.6; IHG Layers 0–1; and the integral dual Weyl modules of Layer 0.

## Layer 2: Soluble transport and rank-two compatible systems

**Soluble transport and split test primes**

Iterate cyclic base change and descent with irreducibility maintained. A finite collection of split-test primes controls both residual and cyclotomic images. These transport results are independent of the lifting conclusions in Layer 5.

<a id="genericity-normal-closure-restriction"></a>

### 2.1 Genericity normal closure restriction

Prove `genericity_normal_closure_restriction`. Let `F` be a number field and `r̄: G_F → GL_n(F̄_l)` continuous, absolutely irreducible and decomposed generic. Let `K/Q` be a finite Galois extension linearly disjoint over `Q` from the Galois closure over `Q` of `F̄^{ker r̄}(ζ_l)`. Then `r̄|G_{FK}` is absolutely irreducible and decomposed generic. In the proof of Qian's Theorem 1.4 this is applied with `K = L′LF^suff(ζ_N)`, which is Galois over `Q` with `K ∩ F^avoid = Q`, and FK `= F′`. Apply the disjointness over `Q` to `K`; the resulting field FK contains `F`.

([ACC](#source-acc), Lemma 7.1.7, p. 1091). *Needs:* `AG:AG2.7`; `Tau Ceti Chebotarev L10`.

*Route.* Let `H` be the normal closure over `ℚ` of the fixed field `F̄^{ker r̄}(ζ_l)`. Disjointness gives `Gal(HK/ℚ)=Gal(H/ℚ)×Gal(K/ℚ)`; choose the original generic conjugacy class together with the identity on `K`. Chebotarev supplies a rational prime completely split in FK with the original generic ratios; residual-image surjectivity under the same disjointness preserves absolute irreducibility.

<a id="residual-lifting-hypothesis-restriction"></a>

### 2.2 Residual lifting hypothesis restriction

Prove `residual_lifting_hypothesis_restriction`. Let `F` be a number field, `l` a prime, `r: G_F → GL_n(Q̄_l)` continuous with residual representation `r̄`, and `M = F^{ker r̄}(ζ_l)`. Let `F'/F` be a finite extension linearly disjoint from `M` over `F`. Then `G_{F'}` surjects onto `Gal(M/F)`, so `r̄(G_{F'}) = r̄(G_F)` and `r̄(G_{F'(ζ_l)}) = r̄(G_{F(ζ_l)})`. Consequently: `r̄|G_{F'}` is absolutely irreducible if `r̄` is; `r̄(G_{F'(ζ_l)})` is enormous if `r̄(G_{F(ζ_l)})` is; and if `σ ∈ G_F − G_{F(ζ_l)}` has `r̄(σ)` scalar, then some `σ' ∈ G_{F'} − G_{F'(ζ_l)}` has `r̄(σ') = r̄(σ)`. If `r` is unramified almost everywhere, so is `r|G_{F'}`. Suppose `r|G_{F_v}` is potentially semistable and ordinary of weight `λ_v` (Qian, Definition 1.2). Then for each place `w | v` of `F', r|G_{F'_w}` is potentially semistable and ordinary of weight `(λ_{v,τ'|F_v})_{τ'}`, by the compatibility `Art_{F_v} ∘ N_{F'_w/F_v} =` (restriction) `∘ Art_{F'_w}`. Decomposed genericity is not covered here; it needs `genericity_normal_closure_restriction`.

([Qian](#source-qian), Remark after Definition 1.3, p. 1241; proof of Theorem 1.4, p. 1274; NSF online-first PDF pp. 3 and 36). *Needs:* `AG:AG2.7`; `CS:§§1.3–1.4,1.7,1.9,1.12`.

*Route.* Disjointness from the residual-cyclotomic field makes the restricted finite quotient surjective. Identify the full and cyclotomic residual images, lift the scalar coset, and preserve finite ramification. Use Artin/norm compatibility to pull back each full ordinary flag and algebraic inertia exponent; decomposed genericity uses the separate normal-closure lemma.

### 2.2a Local base change and Weil–Deligne restriction

Prove `local_base_change_rec_compatibility`. For a cyclic prime-degree extension `L/K` of characteristic-zero nonarchimedean local fields, `n≥1` and every irreducible smooth complex representation `σ` of `GL_n(K)`, Arthur–Clozel local base change satisfies `rec_L(BC_{L/K}σ)≅rec_K(σ)|_{W_L}` as Frobenius-semisimple Weil–Deligne representations, including the monodromy operator. Use the geometric normalization of AG2.0 and ET §10.30. Iterate this identity along a soluble local tower, with the identity extension included.

([Harris–Taylor](#source-ht), Lemma VII.2.6; [Scholze LLC](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 12.1(v), pp. 30–31; Arthur–Clozel, Chapter I, §§6–7.) *Needs:* `ET:§§10.20,10.30`; `AS:§7.0b`; `SR:SR.3.1,SR.5.2`; `AG:AG2.0`.

*Route.* ET §10.20 gives restriction for supercuspidal semisimple Weil parameters, and §10.30 identifies these with the classical correspondence. Extend through the segment/special-block rule: an essentially square-integrable block with parameter `r⊗Sp_s` goes to `(r|_{W_L})⊗Sp_s`, decomposed into its irreducible Weil blocks. In particular the nilpotent special-block operator is retained. Use AS §7.0b's construction of Langlands base change from the essentially tempered inducing data and their unique Langlands quotient to extend to every irreducible `σ`. This step uses no Shintani character identity for a general Langlands quotient. The restriction of `N` has the same nilpotent blocks; Frobenius semisimplification does not erase them. ET §6.24 separately identifies these automorphic local lifts with the components of global cyclic base change.

**Checks.**

- In rank one, base change is `χ↦χ∘N_{L/K}` and restriction follows from geometric Artin reciprocity.
- For an unramified degree-`r` extension, unramified Frobenius eigenvalues `α_i` become `α_i^r`.
- A twisted `St₂` retains `N≠0` over a ramified extension. Its semisimple Weil parameter alone cannot distinguish it from the `N=0` parameter with the same Weil constituents.

<a id="soluble-base-change-and-descent"></a>

### 2.3 Soluble base change and descent

Prove `soluble_base_change_and_descent`. Fix `n ≥ 2`, a prime `p` and `ι: Q̄_p ≅ ℂ`. Let `F` be imaginary CM or totally real and `E/F` a finite Galois extension with `Gal(E/F)` soluble and `E` imaginary CM or totally real. (1) If `π` is a cuspidal regular algebraic automorphic representation of `GL_n(𝔸_F)` of weight `λ = (λ_τ)_{τ∈Hom(F,ℂ)}` with `r_ι(π)|G_E` irreducible, there is a cuspidal regular algebraic `π_E` of `GL_n(𝔸_E)` of weight `λ_{E,τ} = λ_{τ|F}` with `r_ι(π_E) ≅ r_ι(π)|G_E`, and `rec_{E_w}(π_{E,w}) = rec_{F_v}(π_v)|_{W_{E_w}}` for every finite place `w | v`. (2) If `ρ: G_F → GL_n(Q̄_p)` is continuous with `ρ|G_E` irreducible and `ρ|G_E ≅ r_ι(Π)` for a cuspidal regular algebraic `Π` of `GL_n(𝔸_E)` of weight `λ`, then `λ_{F,τ} = λ_{τ′}` (`τ′` any extension of `τ` to `E`) is well defined and there is a cuspidal regular algebraic `π_F` of `GL_n(𝔸_F)` of weight `λ_F` with `ρ ≅ r_ι(π_F)` and `rec_{E_w}(Π_w) = rec_{F_v}(π_{F,v})|_{W_{E_w}}` for every finite `w | v`. The identities at every finite place use `local_base_change_rec_compatibility` (§2.2a); ET §6.24 and AS §7.1 supply global cyclic base change and its automorphic local lifts.

([ACC](#source-acc), §6.5.12, Proposition 6.5.13 and its proof, pp. 1070–1072). *Needs:* `local_base_change_rec_compatibility`; `ET:§6.24; AS:§7.1`; `AL:AL.3`; `Tau Ceti Chebotarev L10`; `AG:AG2.6`; `AG:AG2.2`.

*Route.* Induct along a composition series to `E/F` cyclic of prime degree with generator `σ` and a nontrivial character `η` of `Gal(E/F)`. (1): `π ⊗ (η∘Art_F^{-1}) ≇ π`, since otherwise `r_ι(π) ⊗ ι^{-1}η ≅ r_ι(π)` and `r_ι(π)|G_E` would be reducible. ET §6.24 and AS §7.1’s Arthur–Clozel cyclic base change ([AC89, Ch. 3, Thms 4.2 and 5.1]) gives a cuspidal regular algebraic `Π` of weight `λ_E` whose components lift `π` at almost all places; Chebotarev and AG2.2’s attachment under soluble base change give `r_ι(Π) ≅ r_ι(π)|G_E`. (2): strong multiplicity one gives `Π^σ ≅ Π`, so `Π` descends by ET §6.24 and AS §7.1 to some cuspidal `π′` of weight `λ_F`; Chebotarev gives `r_ι(π′)|G_E ≅ ρ|G_E`, and irreducibility of `ρ|G_E` gives a twist `π_F = π′ ⊗ (η∘Art_F^{-1})^i` with `r_ι(π_F) ≅ ρ`. Local identities at every finite place: `Π_w` is the Arthur–Clozel local base change of `π_v` at every finite `w | v`, by ET §6.24 and AS §7.1. Apply `local_base_change_rec_compatibility` to get restriction of the full Weil–Deligne parameter to `W_{E_w}`, including monodromy. Frobenius agreement at almost all places alone determines `rec_{E_w}(Π_w)` only up to semisimplification.

**Checks.**

- For `E = F` both parts are the identity.
- The cuspidality of `π_E` needs irreducibility of `r_ι(π)|G_E`: for a CM quadratic `E/F` and `π` automorphically induced from `E`, the base change is not cuspidal.
- The weight of the descent is `λ_F`, independent of the extension `τ′` of `τ`.

<a id="split-test-prime-image-preservation"></a>

### 2.4 Split test prime image preservation

Prove `split_test_prime_image_preservation`. Let `F` be imaginary CM, `ρ̄` absolutely irreducible with `ρ̄(G_{F(ζ_p)})` enormous and some `σ ∈ G_F − G_{F(ζ_p)}` with `ρ̄(σ)` scalar, and `K/F(ζ_p)` the extension cut out by `ρ̄|_{G_{F(ζ_p)}}`. Choose finite sets of finite places: `V_0`, all split in `F(ζ_p)`, such that for each subfield `F(ζ_p) ⊊ K′ ⊆ K` some `v ∈ V_0` splits in `F(ζ_p)` but not in `K′; V_1` such that for each subfield `F ⊊ K′ ⊆ K` some `v ∈ V_1` does not split in `K′; V_2 =` the `p_0-adic` places for a rational prime `p_0 ≠ p` that is decomposed generic for `ρ̄`; and `v ∤ 2p` with `ρ, π` unramified at every `v ∈ V_0 ∪ V_1 ∪ V_2`. Then for every finite Galois `E/F` in which all places of `V_0 ∪ V_1 ∪ V_2` split: `ρ̄(G_E) = ρ̄(G_F)` and `ρ̄(G_{E(ζ_p)}) = ρ̄(G_{F(ζ_p)})`; hence `ρ̄|_{G_{E(ζ_p)}}` has enormous image, some `σ ∈ G_E − G_{E(ζ_p)}` has `ρ̄(σ)` scalar, and `ρ̄|_{G_E}` is decomposed generic (`p_0` splits in `E`).

([ACC](#source-acc), §6.5.12, proof of Theorem 6.1.1, p. 1072 (and §6.6.10, p. 1082)). *Needs:* `Layer 2`; `AG:AG2.7`.

*Route.* Use completely split test primes for every proper subextension of the residual/cyclotomic normal closures. Splitting `V₀,V₁` preserves the residual images and the scalar element outside cyclotomic; splitting `V₂` preserves the fixed generic witness. Keep the original fields and normal closures in these disjointness checks.

<a id="auxiliary-cm-extension-prescriptions"></a>

### 2.5 Auxiliary soluble and cyclic extensions

Prove the cyclic and CM refinement `auxiliary_cm_extension_prescriptions`. Let `F` be a number field, `A/F` a finite Galois avoidance field and `S` a finite set of places. For every `N≥1` there is a cyclic extension `E/F` of degree `N`, disjoint from `A`, with every place of `S` split completely. If `F` is imaginary CM, require `E` to be CM: make the cyclic extension over `F⁺`, keep all real places split, avoid the normal closure of `A` over `F⁺`, and compose with `F`. This is the degree-prescribed cyclic refinement of the soluble completion supplier recorded in Exact supplier contracts; arbitrary local extensions do not by themselves prescribe a CM field.

Realize the cyclic extension by a finite-order idele-class character trivial at the prescribed places and with local order divisible by `N` at an additional place, then take its degree-`N` subextension. Extra split test places force disjointness. For soluble prescribed completions use `PotentialModularityAndCompatibleSystems` §2.16, with its actual local Galois hypotheses and unrestricted enlargement of the global degree; its §2.15 supplies the finite local-character extension. In the CM application make the preliminary construction over `F⁺` with real splitting and compatible conjugate local data before composing with `F`. These exports and the cyclic refinement supply the `E₀` choices in §§2.6–2.7.

([BLGGT](#source-blggt-published), Appendix A.2, Lemmas A.2.1–A.2.2 and Corollary A.2.3, pp. 600–601). *Needs:* Tau Ceti ClassFieldTheory, Layers 11–12 (global reciprocity and existence); `CS:§§2.12–2.16` (split test places); solubility of finite Galois extensions of local fields (pinned Tau Ceti `TauCeti.LocalFieldsRamification.isSolvable_algEquiv`).

**Checks.**

- `N=1` gives `E=F`, including when `A=F`.
- A prescribed trivial completion forces splitting, while a quadratic unramified completion has local degree 2 and cannot split completely.
- Over CM `F`, keeping the real places of `F⁺` split makes the cyclic auxiliary field totally real before its compositum with `F`.

<a id="fontaine-laffaille-base-change-fields"></a>

### 2.6 Fontaine–Laffaille base change fields

Prove `fontaine_laffaille_base_change_fields`. Let `E_0/F` be a soluble CM extension such that: all places of `V_0 ∪ V_1 ∪ V_2` split and `p` is unramified in `E_0; π_{E_0,w}^{Iw_w} ≠ 0` for every finite `w`; at every finite prime-to-p `w`, either `π_{E_0,w}` and `ρ|_{G_{E_0,w}}` are both unramified, or `ρ|_{G_{E_0,w}}` is unipotently ramified, `q_w ≡ 1 mod p` and `ρ̄|_{G_{E_0,w}}` is trivial; every `w̄ | p` of `E_0⁺` splits in `E_0` and admits `w̄′ ≠ w̄, w̄′ | p`, with `Σ_{w̄″≠w̄,w̄′} [E⁺_{0,w̄″}:ℚ_p] > ½[E_0⁺:ℚ]`. Choose imaginary quadratic `E_a, E_b, E_c` with: every rational prime below `V_0 ∪ V_1 ∪ V_2` splits in `E_aE_bE_c` and `p` is unramified in `E_aE_bE_c; 2` and `p` split in `E_a`; every `l ∉ {2,p}` below a place of `E_0` where `π_{E_0}` or `ρ` ramifies, or ramified in `E_0E_aE_c`, splits in `E_b`; every `l ∉ {2,p}` ramified in `E_b` splits in `E_c` (write `B_old` for the rational primes `l∉{2,p}` below ramification of the original `π_{E₀}` or `ρ|G_{E₀}`, or ramified in `E₀E_a`; this set excludes the not-yet-chosen `E_c`. Choose `E_b=ℚ(√−p_b)` with `p_b≠p`, `p_b≡1 mod 4` and `p_b≡−1 mod l` only for `l∈B_old`, together with the separate congruences `p_b≡−1 mod l` at the rational split-test primes below `V_0∪V_1∪V_2`. Then choose `E_c=ℚ(√−p_c)`, with `p_c≠p`, `p_c≡1 mod 4p_b` and `p_c≡−1 mod l` at those split-test primes. Avoid the finite old and test sets when choosing the new primes. Quadratic reciprocity gives splitting of `p_b` in `E_c` and of the new prime `p_c` in `E_b`; it imposes no congruence `p_b≡−1 mod p_c`). Then `E = E_0E_aE_bE_c` is a soluble CM extension of `F`, split at `V_0 ∪ V_1 ∪ V_2`, with: `p` unramified in `E`; for `R =` {prime-to-p `w: π_{E,w}` or `ρ|_{G_{E_w}}` ramified}, `S_p` the `p`-adic places and `S′ = S_p ∪ R`, every prime below `S′` or ramified in `E` splits in an imaginary quadratic subfield of `E; ρ̄|_{G_{E_w}}` trivial and `q_w ≡ 1 mod p` for `w ∈ R; ρ̄|_{G_{E(ζ_p)}}` enormous, `ρ̄|_{G_E}` decomposed generic, some `σ ∈ G_E − G_{E(ζ_p)}` with `ρ̄(σ)` scalar; and the `E⁺-analogue` of the `p`-adic degree condition.

([ACC](#source-acc), §6.5.12, proof of Theorem 6.1.1, pp. 1072–1073). *Needs:* `Layer 2`; `auxiliary_cm_extension_prescriptions`.

*Route.* First make the soluble CM extension `E₀` by `auxiliary_cm_extension_prescriptions` (BLGGT Lemma A.2.1 and Corollary A.2.3) with prescribed unramified p-completions and local semistable/Iwahori conditions. Adjoin `E_a` where `p` and 2 split, then choose `E_b` and `E_c` by quadratic congruences so each bad rational prime splits in an imaginary quadratic subfield. Keep `V₀∪V₁∪V₂` split at every step and verify the displayed field, residual-image and `p`-adic degree conditions. The remaining good-level auxiliary places are supplied separately by `neatness_auxiliary_places`; the weight, automorphic and local representation hypotheses of the full seventeen-clause profile remain those of the lifting application.

**Checks.**

- If one also imposed `p_b≡−1 mod p_c`, then `p_c` would divide `p_b+1`, whereas `p_c≡1 mod 4p_b` gives `p_c≥4p_b+1>p_b+1`. Thus the new prime cannot belong to `B_old`.
- With no odd old or test primes, `p_b=5` and `p_c=41` satisfy the displayed congruences: `(−41/5)=1` and `(−5/41)=1`. Both new odd ramification primes split in the other quadratic field.
- For an odd `l∈B_old`, `−p_b≡1 mod l`, so `l` splits in `E_b`. At `2` and `p`, the required splitting is supplied separately by `E_a`.

<a id="ordinary-base-change-fields"></a>

### 2.7 Ordinary base change fields

Prove `ordinary_base_change_fields`. Let `E_0/F` be a soluble CM extension such that: all places of `V_0 ∪ V_1 ∪ V_2` split in `E_0; π_{E_0,w}^{Iw_w} ≠ 0` for every finite `w`; at each finite prime-to-p `w`, either `π_{E_0,w}` and `ρ|_{G_{E_0,w}}` are unramified, or `ρ|_{G_{E_0,w}}` is unipotently ramified, `q_w ≡ 1 mod p` and `ρ̄|_{G_{E_0,w}}` trivial; for `w | p, ρ̄|_{G_{E_0,w}}` is trivial and `[E_{0,w}:ℚ_p] > n(n+1)/2 + 1`; for `v | p, w | v` and each `i, ψ_{v,i}` agrees with `σ ↦ ∏_{τ∈Hom(F_v,Q̄_p)} τ(Art_{F_v}^{-1}(σ))^{−(λ_{τ,n−i+1}+i−1)}` on all of `I_{E_0,w}`; and, with `μ` the weight of `π_{E_0}, ψ_{v,i}(Art_{E_0,w}(x)) · ∏_{τ∈Hom(E_{0,w},Q̄_p)} τ(x)^{μ_{ιτ,n−i+1}+i−1} = 1` for every `w | p` and every `p`-power root of unity `x ∈ E_{0,w}`. Choose imaginary quadratic `E_a, E_b, E_c` using §2.6’s ordered construction with `B_old` defined from `E₀E_a` and the original ramification, and with the separate split-test congruences, but without requiring `p` unramified (`p_c ≡ 1 mod 4p_b` and `p_b ≡ p_c ≡ −1 mod` every rational prime below `V_0∪V_1∪V_2`). Then `E = E_0E_aE_bE_c` is soluble CM, V-split, and: every prime below `S′ = S_p ∪ R` or ramified in `E` splits in an imaginary quadratic subfield of `E; ρ̄|_{G_{E_w}}` trivial and `q_w ≡ 1 mod p` for `w ∈ R; ρ̄|_{G_{E(ζ_p)}}` enormous, `ρ̄|_{G_E}` decomposed generic, some `σ ∈ G_E − G_{E(ζ_p)}` with `ρ̄(σ)` scalar; `ρ̄|_{G_{E_w}}` trivial and `[E_w:ℚ_p] > n(n+1)/2 + 1` for `w | p`. These are the field and residual/local arithmetic conditions. Construction of `π_E` uses Layer 2/soluble-base-change-and-descent; transport of its `ι-ordinarity` is the separate Layer 3/iota-ordinary-soluble-base-change obligation used by Layer 5/ordinary-lifting-descent.

([ACC](#source-acc), §6.6.10, proof of Theorem 6.1.2, pp. 1082–1084). *Needs:* `Layer 2`; `auxiliary_cm_extension_prescriptions`.

*Route.* Make `E₀` by `auxiliary_cm_extension_prescriptions` (BLGGT Lemma A.2.1 and Corollary A.2.3): soluble CM, linearly disjoint from the kernel field, with prescribed completions giving trivial residual representations at `p`, degree `> n(n+1)/2+1`, whole-inertia algebraic characters and the `p`-power-root condition. Choose `E_a,E_b,E_c` with the ordinary congruence constraints, keeping `V` split. Verify the displayed field, residual-image and local-character clauses. The good-level auxiliary places are supplied separately by `neatness_auxiliary_places`. In the lifting application, `ordinary_lifting_descent` uses `soluble_base_change_and_descent` and `iota_ordinary_soluble_base_change` to supply `π_E` and its `ι-ordinarity`; neither assertion is a conclusion of this field construction.

**Checks.**

- The new `p_c` is handled by quadratic reciprocity, not by adding `p_c` to the congruences defining `p_b`; the incompatible pair of congruences in §2.6's first Check remains excluded.
- The conditions `p_b≡p_c≡−1 mod l` at a split-test prime make that prime split in both quadratic fields, preserving the test places used to keep the residual images.
- Ramified `p`-adic completions are permitted here. The auxiliary quadratic fields preserve the lower bound on their degrees and triviality of the residual restrictions; no unramified Fontaine–Laffaille conclusion is drawn.

**Rank-two systems and their monodromy**

Begin with extremely weak compatibility over an arbitrary number field. Rank-one classification gives the reducibility dichotomy and the irreducible trichotomy. Algebraic subdirect-product structure and the arithmetic classification of unramified forms then feed the density-one large-image result.

<a id="rank-two-reducibility-dichotomy"></a>

### 2.8 Rank two reducibility dichotomy

Prove `rank_two_reducibility_dichotomy`. A rank-two extremely weakly compatible system `R` has one of two forms: every member `r_λ` is irreducible, or there are rank-one weakly compatible systems `𝒳₁,𝒳₂` in the BLGGT sense with `r_λ≅χ₁,λ⊕χ₂,λ` at every coefficient place `λ`.

([ACC](#source-acc), §7.1, Lemma 7.1.1, p. 1086). *Needs:* `CS:Layer 1`; `CS:§§1.3–1.4,1.7,1.9,1.12`; `rational_abelian_is_locally_algebraic` below; `AGR:§5.3`, `GaloisRep.iso_of_frobenius_charpoly_eq` (with §2.16's normalization).

The comparison target `rational_abelian_is_locally_algebraic` has the following contract. Let `F` and `E` be number fields, `λ` a finite place of `E`, and `ρ` a continuous finite-dimensional semisimple abelian `E_λ-representation` of `G_F`, unramified outside finitely many places, whose good Frobenius characteristic polynomials lie in `E[X]`. Then `ρ` is locally algebraic: on a sufficiently small open subgroup of each `F_v×` for `v|ℓ, ρ∘Art_{F_v}` is the restriction of an algebraic representation of `Res_{F_v/Q_ℓ} G_m`. In particular its characters over `Q̄_ℓ` are de Rham. This is Henniart's classification, in the explicit formulation of [ERA 979](#source-era979), `§5(a)`, Theorem 5.5, p. 48. It assumes E-rationality of `ρ`, not separately of each constituent, and assumes no Hodge or de Rham condition. Apply it after finite coefficient-field enlargement if a representation is initially presented over `Q̄_ℓ`. The global class-field/Hecke-character theorem of CS §1.9 then realizes each finitely ramified de Rham constituent as an algebraic Hecke character, with a further finite global coefficient extension if necessary. This target supplies the missing pre-de-Rham comparison; it does not redefine the owner's character-system carrier.

*Route.* Suppose `r_{λ₀}=χ₁⊕χ₂`. It is an abelian semisimple representation rational over the system's coefficient field by the common good Frobenius polynomials. Apply the preceding classification to this entire representation, so that each `χ_i` is de Rham. Only now apply CS's de Rham character converse to construct the two rank-one weak systems. Their direct sum and `R` have the same Frobenius polynomials at `λ₀`, hence the same algebraic polynomials. At every other `λ` apply AGR's `GaloisRep.iso_of_frobenius_charpoly_eq` through §2.16. This works also when `χ₁=χ₂`. The isomorphisms concern the representations; an extremely weak system's arbitrary Hodge multisets are not identified with the two characters' full Hodge tables, since only their sums were prescribed.

**Checks.**

- `rational_abelian_is_locally_algebraic.repeated``: 1⊕1` is abelian, semisimple and Q-rational; it gives two identical weak character systems, both of Hodge–Tate weight 0. No distinct-character hypothesis is allowed.
- `rational_abelian_is_locally_algebraic.finite`: a finite-order abelian representation is locally constant at `ℓ`, hence locally algebraic of weight 0, even if it is ramified at `ℓ`. Crystalline at every place is not a conclusion.
- For `1⊕ε`, geometric good Frobenius polynomials are `(X−1)(X−q_v⁻¹)` and the true weights are `{0,−1}`. The extremely weak metadata `{2,−3}` has the same sum `−1` and is allowed, but is not the true Hodge multiset. The character systems recover the representations, not this arbitrary table.
- `rational_abelian_is_locally_algebraic.rationality`: continuity alone is insufficient. Choose `a∈Z₅` such that `11^a` is transcendental over `Q`; this is possible because exponentiation by 11 has uncountable image. The cyclotomic principal-unit character `⟨ε⟩^a` of `G_Q` is continuous and unramified away from 5, but its value at geometric Frobenius at 11 is the transcendental number `11^{−a}`. It fails the number-field rationality hypothesis; an arbitrary 5-adic exponent is not an algebraic Hecke weight.

<a id="rank-two-system-trichotomy"></a>

### 2.9 Rank-two trichotomy

Prove `rank_two_system_trichotomy`. An irreducible rank-two extremely weakly compatible system `R` falls into at least one of three classes: it is strongly irreducible; it is Artin up to twist; or it is induced, meaning that, for a quadratic extension `F′/F` and a weakly compatible system `𝒳` of characters of `G_{F′}`, every `r_λ` is the induced representation `Ind_{G_{F′}}^{G_F} χ_λ`. The comparison preserves all good Frobenius polynomials; as in §2.8, it does not identify arbitrary extremely weak Hodge metadata with the induced system’s full Hodge table.

([ACC](#source-acc), §7.1, Lemma 7.1.2, pp. 1086–1087). *Needs:* `rank_two_reducibility_dichotomy`; `AGR:§5.3`, `GaloisRep.iso_of_frobenius_charpoly_eq` (with §2.16's normalization); `CS:Layer 1`; `CS:§§1.3–1.4,1.7,1.9,1.12`.

*Route.* If an irreducible member becomes reducible, take a finite Galois extension `E/F` making it `χ₁⊕χ₂`. Apply §2.8's rational abelian classification to the restricted system before making a character system. If `χ₁≠χ₂`, their stabilizer has index two and the stable line gives a de Rham character on that quadratic field; induce its weak character system and compare Frobenius polynomials. If `χ₁=χ₂=χ`, choose an odd coefficient prime and write `φ=det r` and `⟨φ⟩` for its principal-unit part. The square map is invertible on the principal units, giving a character `ψ` of `G_F` with `ψ²=⟨φ⟩`. After a finite extension killing the finite Teichmüller factor and the quadratic ratio, `ψ|_{G_E}=χ`. The already established de Rhamness of `χ` implies that of `ψ` by finite-extension descent. Extend `ψ` to a weak character system; `r⊗ψ⁻¹` is finite-image and supplies the Artin factor. A square root of a de Rham character alone would not prove de Rhamness of the root. Propagate both cases using AGR's `GaloisRep.iso_of_frobenius_charpoly_eq` with §2.16's normalization. The three alternatives need not be disjoint.

<a id="pgl2-product-forms"></a>

### 2.10 Forms of products of PGL₂

Define `NonabelianGaloisH1` for a profinite group `Γ` acting continuously by automorphisms on a discrete group A. Its elements are continuous functions `z: Γ →` A satisfying `z(στ) = z(σ) · σ(z(τ))`, modulo the equivalence `z′(σ) = a⁻¹z(σ)σ(a)` for one a `∈` A and every `σ`. The class of the constant identity function is the distinguished point. For a characteristic-zero field `k` and an affine algebraic `k`-group `H`, write `H¹(k,H)` for this pointed set with `Γ = Gal(k̄/k)` and A `= H(k̄)`, given the discrete topology and its natural Galois action. The coefficients need not be commutative, so no group structure on this quotient is asserted.

Its API consists of `NonabelianGaloisH1.cocycle_one` `(z(1) = 1)`, `NonabelianGaloisH1.class_eq_iff` (the displayed single-a equivalence), `NonabelianGaloisH1.map` (an equivariant coefficient homomorphism induces a pointed map), and `NonabelianGaloisH1.abelian_agreement` (for abelian coefficients this quotient agrees with continuous first group cohomology). These supply the maps induced by `PGL₂^r → PGL₂^r ⋊ S_r → S_r` below. ([Platonov–Rapinchuk–Rapinchuk](#source-prr), §1.3.2, pp. 23–24.) *Needs:* Mathlib topological groups and group actions; Tau Ceti continuous first cohomology for the abelian comparison.

**Checks.**

- `NonabelianGaloisH1.trivial_group`: for `Γ = {1}` the cocycle identity forces `z(1) = 1`, and the pointed set is a singleton for every A.
- `NonabelianGaloisH1.trivial_cyclic_action`: for the trivial action of `C₂` on `C₂` there are two classes, represented by the trivial and identity homomorphisms. They are not equivalent, since all conjugations of `C₂` are trivial.
- `NonabelianGaloisH1.nonabelian_coefficients`: for the trivial action of `C₂` on `S₃` there are two classes, represented by the identity and a transposition. The three transpositions give the same class by conjugation. Sending the generator to a 3-cycle is not a cocycle, since its square is not the identity. This distinguishes cocycles from arbitrary functions and conjugacy classes from individual homomorphisms.

Prove `pgl2_product_forms`. Let `k` be a field of characteristic zero (in the application a finite extension of `ℚ_ℓ`) and `r ≥ 1`. (1) Over an algebraic closure every automorphism of `PGL₂^r` is a permutation of the factors followed by conjugation by an element of `PGL₂^r`, so `Aut(PGL₂^r) = PGL₂^r ⋊ S_r`. (2) The k-forms of `PGL₂^r` correspond bijectively to `H¹(k, PGL₂^r ⋊ S_r)`; the image in `H¹(k, S_r)` is the class of an étale `k`-algebra `N = ∏_i N_i` of degree `r`, and every form is isomorphic to `∏_i Res_{N_i/k} H_i` with `H_i` a form of `PGL₂` over `N_i`. (3) Such a form is quasi-split exactly when every `H_i` is split, so the quasi-split forms are the products `∏_i Res_{N_i/k} PGL₂`; when `k` is `ℓ-adic`, such a product splits over an unramified extension of `k` exactly when every `N_i/k` is unramified.

([Platonov–Rapinchuk–Rapinchuk](#source-prr), §2.2.1, Theorem 2.15, p. 78, and §2.2.4, pp. 87–89; [ACC](#source-acc), §7.1, proof of Lemma 7.1.3, facts (4), (7) and (8), pp. 1088–1089). *Needs:* `RG:RG2.0a`; Tau Ceti ReductiveGroups L7; `NonabelianGaloisH1`.

Part (2) is the general classification of forms of an affine algebraic group by `H¹` of its automorphism group, applied to the semidirect product of (1). A form of `PGL₂` is the projective unit group of a quaternion algebra and is quasi-split only when the algebra is split, which gives (3).

**Checks.**

- For `r = 1` the forms of `PGL₂` over `ℚ_ℓ` are `PGL₂` and the projective unit group of the quaternion division algebra; only the first is quasi-split.
- For `r = 2` and a ramified quadratic extension `N/ℚ_ℓ, Res_{N/ℚ_ℓ} PGL₂` is quasi-split but does not split over any unramified extension.

<a id="rank-two-adjoint-monodromy"></a>

### 2.11 Rank two adjoint monodromy

Prove `rank_two_adjoint_monodromy`. Over `Q̄_l`: (1) every morphism `PGL_2 → PGL_2` is trivial or conjugation by an element of `PGL_2(Q̄_l)`; (2) every morphism `PGL_2^r → PGL_2` is trivial or a projection followed by a conjugation; (3) up to `PGL_2(Q̄_l)^J-conjugacy`, morphisms `PGL_2^I → PGL_2^J` are induced by pairs `(J_0 ⊂ J, φ : J_0 → I)`; (4) `Aut(PGL_2^I) = PGL_2^I ⋊ S_I`; (5) a connected algebraic subgroup `G ⊂ PGL_2^J` surjecting onto `PGL_2` under every projection is `≅ PGL_2^I`, embedded (up to conjugacy) through a surjection `φ : J ↠ I` (induction on #J and Goursat); (6) for `M/Q_l` finite, `(Res^M_{Q_l} PGL_2)_{Q̄_l} ≅ PGL_2^{Hom_{Q_l}(M,Q̄_l)}` with `G_{Q_l}` acting through its left action on `Hom_{Q_l}(M, Q̄_l)`; (7) forms of `PGL_2^r` are classified by the middle term of `H^1(Q_l, PGL_2^r) → H^1(Q_l, Aut PGL_2^r) → H^1(Q_l, S_r)`, and the unramified ones (quasi-split and split over an unramified extension) are exactly `∏_i Res^{N_i}_{Q_l} PGL_2` with `N_i/Q_l` unramified; (8) hence, if `G ⊂ ∏_{j∈J} Res^{M_j}_{Q_l} PGL_2` is an unramified connected subgroup whose base change to `Q̄_l` surjects onto every factor of `PGL_2^{⊔_j Hom(M_j,Q̄_l)}`, then `G ≅ ∏_{i∈I} Res^{N_i}_{Q_l} PGL_2` with `N_i/Q_l` unramified, and each `(j, τ)-projection` of `G_{Q̄_l}` is `PGL_2(Q̄_l)-conjugate` to the projection onto one factor of `∏_i (Res^{N_i}_{Q_l} PGL_2)_{Q̄_l}`.

([ACC](#source-acc), §7.1, proof of Lemma 7.1.3, facts (1)–(8), pp. 1088–1089). *Needs:* `pgl2_product_forms`; Tau Ceti ReductiveGroups L7; `RG:RG2.0a`; `AGR:§7.6` (algebraic two-factor Goursat and connected monodromy/strong irreducibility).

*Route.* Use the adjoint simple type-A1 group structure to identify algebraic endomorphisms of `PGL₂` and maps out of products. Iterate the algebraic two-factor Goursat theorem of AGR §7.6 to obtain the arbitrary finite-product assertion (5), importing its two-factor theorem and monodromy predicates. The finite-product bookkeeping and form descent are targets here. Import RG2.0a Weil restriction and its splitting-field product isomorphism with the Galois permutation action, giving fact (6). Facts (7)–(8) are `pgl2_product_forms` combined with the connected subdirect-product description; density-one hyperspecial maximality belongs to the following residual-image application.

<a id="rank-two-large-residual-image"></a>

### 2.12 Rank-two large residual image

Prove `rank_two_large_residual_image`. Suppose `R` is a rank-two extremely weakly compatible system which is irreducible. A set `L` of rational primes of Dirichlet density one can be chosen so that bar `r_λ` is absolutely irreducible for every `l∈L` and every `λ|l`. If `R` is neither induced nor Artin up to twist, shrink `L` while keeping density one so that bar `r_λ(G_{F̃})` contains `SL₂(F_l)`, where `F̃` is the normal closure of `F/Q`. The contained subgroup is over the prime field; no equality with the coefficient residue-field `SL₂` is asserted.

([ACC](#source-acc), §7.1, Lemma 7.1.3, pp. 1087–1089). *Needs:* `Layer 2`; `CS:Layer 1`; `CS:§§1.3–1.4,1.7,1.9,1.12`; `extremely_weak_rational_maximality` below; `AGR:§7.6` (algebraic two-factor Goursat and connected monodromy/strong irreducibility).

The comparison target `extremely_weak_rational_maximality` is the following application of [Larsen](#source-larsen), Definitions 3.9–3.10 and §3.11, author pp. 22–23, and Theorem 3.17, author p. 25. Let `Γ` be a compact topological group, with a dense indexed family of Frobenius elements `F_α`, and let `s_ℓ:Γ→GL_N(Q_ℓ)` be continuous semisimple representations for a density-one set of rational primes. Suppose there are good pairs `(α,ℓ)` such that each `α` is good for all but finitely many `ℓ`, the Frobenius elements simultaneously good at any finite list of `ℓ` are dense, and their characteristic polynomials lie in `Q[X]` independently of `ℓ`. Let `G_ℓ` be the algebraic monodromy groups. There is a common open normal subgroup `H` of `Γ` with `Zar(s_ℓ(H))=G_ℓ⁰` for every `ℓ` ([Larsen–Pink](#source-larsen-pink), Proposition 6.14 and §6.15, author p. 15). For the restricted connected system, put `σ:G_ℓ⁰→(G_ℓ⁰)^ad` and `τ:(G_ℓ⁰)^sc→(G_ℓ⁰)^ad`. On a density-one subset, the full inverse image `τ⁻¹(σ(s_ℓ(H)))` in `(G_ℓ⁰)^sc(Q_ℓ)` is a hyperspecial maximal compact subgroup. The conclusion concerns this simply connected inverse image, not the original `GL_N` image or its centre. No Hodge–Tate, purity or geometric-origin hypothesis occurs. Unramified monodromy is the separate Larsen–Pink Proposition 8.9, author p. 18.

*Route.* Handle the Artin-up-to-twist branch first by excluding the finitely many primes of bad reduction of its fixed finite-image irreducible representation. For quadratic induction choose one good split prime where the two inducing characters have distinct Frobenius values; excluding its residue characteristic and the prime divisors of the nonzero algebraic difference preserves residual irreducibility. Thus only the strongly irreducible branch needs maximality.

In that branch choose two good Frobenius polynomials with distinct roots and different residue characteristics. Adjoin their roots to the coefficient number field `M`. The rational-eigenvalue descent for an irreducible rank-two representation realizes every `r_λ` over `M_λ`: use the first Frobenius away from its residue characteristic and the second at that characteristic (ACC p. 1087). Form the `Q_ℓ-representation`

```text
s_ℓ = ⊕_{λ|ℓ} Res_{M_λ/Q_ℓ} r_λ,       dim s_ℓ = 2[M:Q],
det(X−s_ℓ(Frob_v)) = Norm_{M/Q}(Q_v(X)).
```

The norm means the product of the coefficient conjugates of `Q_v`, hence lies in `Q[X]`; it is not the original degree-two polynomial at a single `λ`. For fixed `v` only its residue characteristic is excluded; for a finite list of `ℓ` discard `S` and the places over those primes. Chebotarev makes the remaining Frobenius elements dense in `G_F`. These are exactly Larsen's three compatibility conditions. His common `H` is `G_{F⁰}` for one finite Galois extension `F⁰/F`; restricting the Frobenius family to `H` gives a connected compatible system by Larsen–Pink §6.15. This one rationalized family handles every `λ|ℓ` simultaneously. The determinant-weight metadata of the original extremely weak system is unused in maximality.

Strong irreducibility forces each rank-two connected projection to contain `SL₂`. By §§2.10–2.11 and unramified monodromy, `(G_ℓ⁰)^ad` is a product of `Res_{N_i/Q_ℓ} PGL₂` with `N_i/Q_ℓ` unramified. The hyperspecial inverse image is conjugate to `∏_i SL₂(O_{N_i})`; its adjoint image contains the corresponding product modulo the centres. Projection to each `λ` and reduction therefore contain a conjugate of `PSL₂(F_ℓ)`. Choose `ℓ>3`. The scalar obstruction to lifting that subgroup to `GL₂` is a homomorphism from the perfect group `SL₂(F_ℓ)` to a scalar quotient and is trivial; hence the residual image contains a conjugate of `SL₂(F_ℓ)`. Finally exclude the finitely many `ℓ` for which `PSL₂(F_ℓ)` can be a subquotient of the fixed `Gal(F̃/F)`. Normality then preserves this subgroup on `G_{F̃}`. All restrictions made are density-zero or finite, and the same set works for every `λ|ℓ`. No claim about `SL₂` of the full coefficient residue field follows.

**Checks.**

- For `M=Q(√2)` and `Q_v=X²−√2` X+1, the rationalized polynomial is `(X²−√2 X+1)(X²+√2 X+1)=X⁴+1`. Its degree is 4 at both split and inert `ℓ`. Using `Q_v` as a rational polynomial fails.
- `extremely_weak_rational_maximality.centre`: for a finite-image character the connected monodromy and its simply connected derived cover are trivial. Maximality there is automatic; it does not assert that the character's original image is a maximal compact subgroup of `G_m`.
- `rank_two_large_residual_image.small_prime``: SL₂(F₂)≅S₃` and `SL₂(F₃)` have nontrivial abelianization. The perfection argument is used only after excluding `ℓ≤3`; no uniform assertion at every prime is made.
- `rank_two_large_residual_image.prime_field`: when the coefficient residue field is `F_{ℓ²}`, a conjugate of `SL₂(F_ℓ)` is a proper subgroup of `SL₂(F_{ℓ²})`. The conclusion retains exactly the first subgroup.

**Galois composita, genericity and avoidance**

Separate the finite group calculation from the field compositum construction. Decomposed genericity uses the normal closure over `Q`, whereas preservation of a residual image uses disjointness over `F`. Symmetric-power avoidance requires both disjointness conditions specified below.

<a id="simple-galois-composita"></a>

### 2.13 Simple Galois composita

Prove `simple_galois_composita`. Let `k` be a field, `Δ` a finite simple group, and `K_1, …, K_s` finite Galois extensions of `k` inside a common field, each equal to `k` or with Galois group isomorphic to `Δ`. Then there is a subset `J ⊂ {1, …, s}` such that the compositum `K = K_1⋯K_s` is the compositum of the `K_j` with `j ∈ J`, and restriction identifies `Gal(K/k)` with `∏_{j∈J} Gal(K_j/k) ≅ Δ^{|J|}`. In particular, for disjoint subsets `I, I′` of `J`, the composita of the `K_j` over `j ∈ I` and over `j ∈ I′` are linearly disjoint over `k`.

([Qian](#source-qian), Proof of Lemma 2.6(2), journal concordance pp. 1251–1252; NSF PDF pp. 13–14). *Needs:* `mathlib:Subgroup.goursat_surjective`; `AGR:§§4.3–4.7,7.7,7.10–7.12`.

*Route.* Induct on the number of fields and restrict the compositum Galois group to its factors. Apply Mathlib `Subgroup.goursat_surjective`; simplicity makes a new factor either independent or already redundant. Choose a maximal independent subfamily; restriction identifies the compositum Galois group with its product, giving disjointness of disjoint subfamilies.

<a id="symmetric-power-adjoint-genericity"></a>

### 2.14 Symmetric-power genericity

Prove `symmetric_power_adjoint_genericity`. Let `F/Q` be finite with normal closure `F̃, m` a positive integer, `l > 2m + 3` a prime, and `r̄: G_F → GL_2(F̄_l)` continuous with `r̄(G_{F̃}) ⊃ SL_2(F_l)`. Let `F′/F` be a finite extension linearly disjoint from `F̄^{ker r̄}` over `F`, with normal closure `F̃′` over `Q`. If `ad r̄(G_{F̃′}) ⊃ PSL_2(F_l)`, then `Sym^m r̄|_{G_{F′}}` is decomposed generic.

([ACC](#source-acc), Lemma 7.1.6(3), pp. 1090–1091). *Needs:* `Layer 2`; `AG:AG2.7`; `AGR:§§4.3–4.7,7.7,7.10–7.12`; `mathlib:Matrix.ProjectiveSpecialLinearGroup.rank_two_simple`; `Tau Ceti Chebotarev L10`.

*Route.* Keep the original pair `F,F′` in ACC Lemma 7.1.6(3). Pass to the normal closure of `F′` and a harmless extension only inside its proof. Use the simple-composita result to describe the projective normal closure as a product of `PSL₂` factors. Choose A with eigenvalue ratio `α` such that `α^{±i}≠1` for `1≤i≤m`. Chebotarev at (A,…,A) gives a completely split prime `q≡1 mod l`; all symmetric-power eigenvalue ratios avoid `q`.

<a id="qian-symmetric-power-avoidance"></a>

### 2.15 Symmetric-power avoidance

Prove `qian_symmetric_power_avoidance`. Let `F/Q` be a finite extension with normal closure `F̃, n` a positive integer, `l > 2n + 5` a prime, and `r̄: G_F → GL_2(F̄_l)` a continuous representation with `r̄(G_{F̃}) ⊃ SL_2(F_l)`. Put `H = F̃ · F̄^{ker ad r̄}`, and let `H′` be the normal closure of `H` over `Q`. Let `F_1/F` be a finite Galois extension that is linearly disjoint from `F̄^{ker r̄}` over `F` and linearly disjoint from `H′` over `F`. Then `Sym^{n−1} r̄|_{G_{F_1}}` is decomposed generic. For `n = 1` this is immediate, since `Sym^0 r̄` is the trivial character; for `n ≥ 2` the proof rests on `symmetric_power_adjoint_genericity` with `m = n − 1`.

([Qian](#source-qian), Lemma 2.6(2), p. 1251; proof pp. 1251–1252; NSF online-first PDF pp. 13–14 (journal pagination inferred from 1239–1275)). *Needs:* `Layer 2`; `AG:AG2.7`; `AGR:§§4.3–4.7,7.7,7.10–7.12`; `mathlib:Matrix.ProjectiveSpecialLinearGroup.rank_two_simple`.

*Route.* For `n=1` the symmetric power is the trivial character, and the pairwise-distinct ratio condition has no pairs. For `n≥2` use simple composita and Goursat in the normal-closure tower to prove the required adjoint image over `F̃₁`. Apply ACC Lemma 7.1.6(3) with `m=n−1` to the original `F,F₁`. The proof’s intermediate `E,E₁` must not replace the original pair in that application.

**Weak automorphy and symmetric powers**

Keep prescribed primes in the weak automorphy witness: almost-everywhere equality alone does not control them. Purity upgrades this witness over CM fields. The rank-two symmetric-power formulas transport the labelled weights and determinants to the desired rank.

<a id="frobenius-polynomials-determine-semisimple"></a>

### 2.16 Frobenius polynomials determine semisimple representations

Use `frobenius_polynomials_determine_semisimple` as the local application name for **ArithmeticGaloisRepresentations §5.3**, `GaloisRep.iso_of_frobenius_charpoly_eq`. Let `F` be a number field, `E` a Hausdorff topological field and `ρ₁, ρ₂: G_F → GLₙ(E)` continuous semisimple representations. If both are unramified at every place of a set `Pl` of Dirichlet density one and their geometric Frobenius characteristic polynomials agree there, then `ρ₁ ≅ ρ₂`. This includes `E = Q̄_ℓ` with its ℓ-adic topology and `E = F̄_ℓ` with the discrete topology. No finite ramification set is required. For different coefficient fields use AGR §5.3's continuous embeddings into a common Hausdorff topological field and compare the scalar extensions there, with its semisimplicity hypotheses.

([Chenevier](#source-chenevier), Theorem 2.12, PDF p. 28; [BCGNT](#source-bianchi), proof of Lemma 6.1.4, author PDF p. 59; for inversion, Mathlib `Matrix.charpoly_inv` and `Matrix.reverse_charpoly`). *Supplied by:* `AGR:§§5.1–5.3`, `GaloisRep.iso_of_frobenius_charpoly_eq`.

AGR uses arithmetic Frobenius. At an unramified place its image is the inverse of geometric Frobenius. For `A ∈ GLₙ(E)` put `P_A(X) = det(X − A)`; then `P_{A⁻¹}(X) = (−1)ⁿ det(A)⁻¹ Xⁿ P_A(X⁻¹)`, where `Xⁿ P_A(X⁻¹)` denotes the reversed polynomial. Since `P_A(0) = (−1)ⁿ det(A) ≠ 0`, equality of geometric Frobenius polynomials is equivalent to equality of arithmetic Frobenius polynomials, in every characteristic. Apply the supplied recognition theorem after this conversion. For coefficients recorded as `det(1 − A T)`, reverse once to recover `P_A`; retain all coefficients in characteristic ℓ.

**Checks.**

- Over `F̄_ℓ` traces do not suffice: for a nontrivial character `χ`, the sums of `ℓ` copies of the trivial character and of `ℓ` copies of `χ` have trace 0 everywhere but characteristic polynomials `(X−1)^ℓ` and `(X−χ(g))^ℓ`.
- Agreement on an arbitrary positive-density set is insufficient: the trivial character and the quadratic character of a quadratic extension `K/F` agree at the places split in `K`, a set of density one half.
- Inversion changes the polynomial: over `F₇`, `A = diag(2,3)` has `P_A(X) = X² + 2X + 6`, while `A⁻¹ = diag(4,5)` has `P_{A⁻¹}(X) = X² + 5X + 6`. The displayed formula converts them; simply identifying arithmetic and geometric Frobenius would fail this check.

<a id="weak-automorphy-prime-to-set"></a>

### 2.17 Weak automorphy prime to a set

Define `WeaklyAutomorphicPrimeTo`. For `T` a finite set of finite places disjoint from `S, R` is weakly automorphic of level prime to `T` if there are a regular algebraic cuspidal `π` of `GL_n(𝔸_F)` and `ι : M ↪ ℂ` such that for all but finitely many `v ∉ S` and for every `v ∈ T, π_v` is unramified and `rec^T_{F_v}(π_v)(Frob_v)` has characteristic polynomial `ι(Q_v(X))`; weakly automorphic means `T = ∅`.

([BCGNT](#source-bianchi), Definition 6.1.2(3), author PDF p. 58). *Needs:* `CS:Layer 1`; `AG:AG2.6`; `CS:§§1.3–1.4,1.7,1.9,1.12`.

Its interface includes:

- `WeaklyAutomorphicPrimeTo.empty`: At `T=∅` this is weak automorphy.
- `WeaklyAutomorphicPrimeTo.mono`: For `T′⊂T` disjoint from `S`, a witness at `T` is a witness at `T′`.
- `WeaklyAutomorphicPrimeTo.witness_at`: Every `v∈T` is unramified for the witnessing `π` and has precisely the specified polynomial.
- `WeaklyAutomorphicPrimeTo.automorphic_implies`: An automorphic system is weakly automorphic prime to any finite `T` disjoint from `S`.

**Checks.**

- `WeaklyAutomorphicPrimeTo.empty_set` (degenerate): An automorphic system is weakly automorphic prime to `∅`.
- `WeaklyAutomorphicPrimeTo.singleton` (characterisation): At `T={v₀}`, a witness must match at `v₀` even if `v₀` lies in its finite almost-everywhere exception list.
- `WeaklyAutomorphicPrimeTo.bad_set` (non-example): `T∩S≠∅` is inadmissible; no unspecified `Q_v` at a bad place can witness the predicate.

<a id="pure-unramified-principal-series-irreducible"></a>

### 2.18 Pure unramified principal series

Prove `pure_unramified_principal_series_irreducible`. Let `F_v` be a nonarchimedean local field with residue cardinality `q` and `χ₁, …, χₙ` unramified characters of `F_vˣ` with values in `ℂˣ`. The normalized parabolic induction `χ₁ × ⋯ × χₙ` of `GLₙ(F_v)` is irreducible if and only if `χ_iχ_j⁻¹ ≠ |·|^{±1}` for all `i ≠ j`. In particular it is irreducible when all `|χ_i(ϖ_v)|` are equal; this holds when, through `ι` and the normalisation `rec^T` of AG2.0, the `χ_i(ϖ_v)` correspond to the Frobenius eigenvalues of a representation pure of some weight `m`.

([Zelevinsky](#source-zelevinsky), §4, Theorem 4.2, p. 184, for segments of length one; [BCGNT](#source-bianchi), proof of Lemma 6.1.4, author PDF p. 59). *Needs:* `SR:SR.2.2` (normalized parabolic induction); `SR:SR.3.4`; `AG:AG2.0`.

**Checks.**

- For `n = 2` and `χ₂ = χ₁|·|`, the induction is reducible, with a Steinberg twist as its irreducible quotient and a character as its irreducible subrepresentation. Moreover `|χ₁(ϖ_v)/χ₂(ϖ_v)| = q`, so the purity hypothesis fails.

<a id="pure-weak-automorphy-upgrade"></a>

### 2.19 Pure weak automorphy upgrade

Prove `pure_weak_automorphy_upgrade`. Let `F` be CM and `R` a very weakly compatible system of rank `n` that is weakly automorphic, via `π`, and pure of weight `m`. Then `R` is automorphic.

([BCGNT](#source-bianchi), Lemma 6.1.4, author PDF p. 59). *Needs:* `WeaklyAutomorphicPrimeTo`; `AGR:§5.3`, `GaloisRep.iso_of_frobenius_charpoly_eq` (with §2.16's normalization); `pure_unramified_principal_series_irreducible`; `CS:Layer 1`; `AG:AG2.6`; `AG:AG2.5` (Varma's comparison up to semisimplification, BCGNT reference [Var24], Theorem 1).

*Route.* Compare the witnessing `π-system` with `R` at one `λ` using AGR's `GaloisRep.iso_of_frobenius_charpoly_eq` with §2.16's normalization. At a missing good `v` use Varma’s Weil–Deligne semisimplification compatibility. Purity makes the unramified principal series with the specified Satake parameters irreducible; `π_v` is then unramified and matches `Q_v`.

<a id="density-one-crystalline-large-image"></a>

### 2.20 Density one crystalline large image

Prove `density_one_crystalline_large_image`. Let `R` be a strongly irreducible very weakly compatible system of rank 2 over a number field `F`. The set `L(R)` of primes `l` not lying below any place of `S` such that `r_λ` is crystalline with Hodge–Tate weights `H_τ` and `r̄_λ(G_{F̃})` contains a conjugate of `SL_2(𝔽_l)` for every `λ | l` (`F̃` the Galois closure of `F/ℚ`) has Dirichlet density 1.

([BCGNT](#source-bianchi), Lemma 6.1.5, author PDF p. 59). *Needs:* `Layer 2`; `CS:Layer 1`.

*Route.* Intersect the density-one crystalline/HT set in the very weak compatibility definition with the density-one residual-image set of ACC Lemma 7.1.3. Discard the finitely many rational primes below `S`; the intersection still has Dirichlet density one.

<a id="rank-two-symmetric-power-transport"></a>

### 2.21 Rank two symmetric power transport

Prove `rank_two_symmetric_power_transport`. For a very weakly compatible system `R` of rank 2 with `H_τ = {0, m}, Sym^{n−1}R` has representations `Sym^{n−1}r_λ`, weights `{0, m, …, (n − 1)m}` and determinant `det^{n(n−1)/2}`. Here `n≥1`. Regularity follows when `m≠0`; for `m=0` and `n>1` the Hodge multiset has repetitions. No automorphy or purity is inferred from the operation alone.

([BCGNT](#source-bianchi), §6.2, proof discussion after Remark 6.2.2, author PDF p. 60 (parallel HT formula); the determinant formula is the imported symmetric-power calculation). *Needs:* `mathlib:Matrix.charpoly`; `CS:Layer 1`; `CS:§§1.3–1.4,1.7,1.9,1.12`.

*Route.* Import the general symmetric-power operation from CS §§1.3–1.4 and 1.7. On a diagonal matrix with eigenvalues `a,b` compute the `n` eigenvalues `a^{n−1−i}b^i` and their product `(ab)^{n(n−1)/2}`. Apply the corresponding HT multiset formula and the declared good-place compatibility; track semisimplification.

**Checks.**

- For `n=3` and `H={0,m}, H(Sym²)={0,m,2m}` and `det(Sym²)=(det r)^3`. Roots 2,3 give `Sym²` roots 4,6,9 and determinant `216=6³`.
- For `m=0` and `n=3`, the multiset {0,0,0} is not regular.

**Weight zero, oddness and irreducibility criteria**

Weight zero is the Hodge multiset {0,1}, and oddness is a determinant condition at every real place. The regularity hypothesis removes the Artin-up-to-twist branch of the rank-two trichotomy. The final large-image formulation retains the prime-field conclusion.

<a id="rank-two-weight-zero"></a>

### 2.22 Rank two weight zero

Define `RankTwoWeightZero`. For a rank-two compatible system with Hodge table `H_τ`, WeightZero means `H_τ` is the multiset {0,1} at every embedding `τ`. This is the BCGP automorphic-weight convention and differs from saying that the system is pure of weight 0. General system purity, regularity and strong irreducibility are imported from CS Layer 1.

([BCGP](#source-bcgp), §9.1, definitions before Lemma 9.1.10, p. 251). *Needs:* `CS:Layer 1`.

Its interface includes:

- `RankTwoWeightZero.iff`: Weight zero means `∀τ,H_τ={0,1}` as multisets.
- `RankTwoWeightZero.sum`: Every Hodge multiset has sum 1.
- `RankTwoWeightZero.regular`: Its two Hodge weights are distinct, so the rank-two system is regular.
- `RankTwoWeightZero.restriction`: Pulling the Hodge table back along restriction of embeddings preserves weight zero.

**Checks.**

- The constant table {0,1} has weight zero.
- The constant table {0,0} does not have weight zero.
- The table presented as {1,0} has weight zero because the weights are a multiset.

<a id="rank-two-odd"></a>

### 2.23 Rank two odd

Define `RankTwoOdd`. For a rank-two system over a number field `F` with characteristic-zero coefficient fields, Odd means `det r_λ(c_v)=−1` for every real place `v` and every coefficient place `λ`, where `c_v` is the complex-conjugation involution. At a field with no real places the condition is vacuous. With the actual involutions supplied, it is the determinant condition on the corresponding matrices; it is not trace zero without a coefficient-characteristic restriction.

([BCGP](#source-bcgp), §9.1 definitions before Lemma 9.1.10, p. 251). *Needs:* `mathlib:Matrix.charpoly`; `CS:Layer 1`; `AG:AG2.6`; `CS:§§1.3–1.4,1.7,1.9,1.12`.

Its interface includes:

- `RankTwoOdd.det_eq`: For every real-place involution and coefficient member the determinant is `−1`.
- `RankTwoOdd.conjugate`: Changing the representative complex conjugation by conjugacy preserves the determinant equation.
- `RankTwoOdd.no_real_places`: If `F` has no real places the condition is true.
- `RankTwoOdd.automorphic_weight_zero`: The weight-zero cuspidal `GL₂` system in BCGP’s setting is odd by the automorphic-system supplier.

**Checks.**

- `diag(1,−1)` is odd.
- The identity matrix over `Q` is not odd.
- An empty real-place family satisfies the determinant condition.

<a id="rank-two-member-irreducibility-equivalence"></a>

### 2.24 Rank two member irreducibility equivalence

Prove `rank_two_member_irreducibility_equivalence`. For a rank-two weakly compatible system `R`, the following are equivalent: `R` is irreducible on a density-one set of rational primes; every `r_λ` is irreducible; at least one `r_λ` is irreducible. The assertion follows from the stronger extremely weak rank-two reducibility dichotomy over the same `F`, not from the CS §1.14 result restricted to `Q`.

([BCGP](#source-bcgp), Lemma 9.1.10(1), pp. 251–252). *Needs:* `Layer 2`; `CS:Layer 1`.

*Route.* Apply the Layer 2 rank-two reducibility dichotomy if any member is reducible. The resulting two compatible characters make every member reducible, contradicting either irreducibility condition. The all-member implication gives the density-one implication directly.

<a id="strong-irreducibility-symmetric-square"></a>

### 2.25 Strong irreducibility symmetric square

Prove `strong_irreducibility_symmetric_square`. For an irreducible regular rank-two weakly compatible system `R`, strong irreducibility of `R`, irreducibility of `Sym²R` as a system, irreducibility of every `Sym²r_λ`, and irreducibility of some `Sym²r_λ` are equivalent. If they fail, `R` is induced from a compatible system of characters of a quadratic extension `F′/F`. Regularity excludes the Artin-up-to-twist case. The rank-three symmetric-square implication uses rank-two representation theory, not an assertion of general lambda-independence of rank-three systems.

([BCGP](#source-bcgp), Lemma 9.1.10(2), pp. 251–252). *Needs:* `Layer 2`; `CS:Layer 1`.

*Route.* Apply the rank-two trichotomy; distinct Hodge weights exclude Artin up to a character twist. Quadratic induction makes `Sym²` reducible for every member. In the strongly irreducible case, the Zariski closure contains `SL₂`, whose symmetric square is irreducible; a quadratic self-twist is the remaining obstruction.

<a id="corrected-rank-two-large-image"></a>

### 2.26 Prime-field large residual image

Prove `corrected_rank_two_large_image`. For a strongly irreducible rank-two weakly compatible system over `F`, there is a density-one set of rational primes `l` such that for every coefficient place `λ|l`, bar `r_λ(G_{F̃})` contains a conjugate of `SL₂(F_l)`. No regularity hypothesis is needed. This does not assert `SL₂(O_M/λ)`. In the real-multiplication use of BCGP Lemma 9.2.2, a separate large-image argument is required from AbelianSurfacesPotentialModularity.

([BCGP](#source-bcgp), Lemma 9.1.10(3), pp. 251–252, corrected by ACC Lemma 7.1.3). *Needs:* `Layer 2`; `CS:Layer 1`.

*Route.* Use the stronger extremely weak rank-two large-image theorem after excluding the induced and Artin cases by strong irreducibility. Retain the normal-closure restriction and the prime-field `SL₂` group exactly. A quartic-character twist can enlarge the coefficient residue field without enlarging the projective residual image; thus prime-field containment does not imply containment of `SL₂` over that larger residue field.

### Examples

The identity field extension fixes both base-change directions. Weight-zero means the multiset {0,1}, in either order, while repeated zero fails. Oddness is checked on `diag(1,−1)`; the identity matrix over `Q` fails. A cyclic induced representation shows why base change can lose cuspidality. Over `ℚ_ℓ` the only non-split form of `PGL₂` is the projective unit group of the quaternion division algebra; `χ × χ|·|` is the reducible unramified principal series of `GL₂`, excluded by purity.

### Dependencies

ET §6.24 and AS §7.1, AL.3, AG2.0/AG2.2/AG2.5/AG2.6/AG2.7, CS:Layer 1 and §§2.12–2.16, AGR:§§4.3–4.7,5.1–5.3,7.6–7.7,7.10–7.12 (including Frobenius recognition, algebraic two-factor Goursat and connected monodromy); Tau Ceti Chebotarev (Layer 10), ClassFieldTheory (Layers 11–12), ReductiveGroups (Layer 7), ReductiveGroupsPartII (RG2.0a), SmoothRepresentationsOfLocalGroups (SR.2.2, SR.3.4) and IHG Layer 1; Platonov–Rapinchuk–Rapinchuk for forms. The auxiliary CM construction supplies the prescribed extensions.

## Layer 3: Ordinary cohomology and compatibility

**Iwahori levels, contraction and ordinary summands**

Fix all local factors before passing up a tower. Positive torus elements act by transfer on unipotent invariants. The ordinary projector at finite Artinian level is imported; the stable image of a single endomorphism is the local algebraic core of its arithmetic use.

<a id="iwahori-level-tower"></a>

### 3.1 Iwahori level tower

Define `IwahoriLevelTower`, the two-depth adelic refinement of the Iwahori subgroup of RG2.3. Throughout Layer `3, F` is a CM field containing an imaginary quadratic field in which `p` splits (`p` may ramify in `F`), and `E/ℚ_p` contains the images of all embeddings of `F`. Let `K ⊂ GLₙ(𝔸^∞_F)` be good, `λ ∈ (ℤⁿ₊)^{Hom(F,E)}`, and `S` a finite set of finite places containing `S_p` and stable under `c`, such that every rational prime `l` below a finite place outside `S` either is unramified in `F` with no `l`-adic place in `S`, or splits in an imaginary quadratic subfield of `F`; and `K_v = Iw_v` for `v | p` and `K_v = GLₙ(O_{F_v})` for `v ∉ S`. For integers `c ≥ b ≥ 0` with `c ≥ 1`, the level `K(b,c)` agrees with `K` away from `p` and equals `Iw_v(b,c)` (`IwahoriLevelTower.level`) at `v | p`; then `K(0,1) = K` and `K(0,c)/K(b,c) ≅ ∏_{v|p} Tₙ(O_{F_v}/ϖ_v^b)`. The ordinary Hecke algebra `T^{S,ord}` adjoins to `T^S ⊗_O O⟦Tₙ(O_{F,p})⟧` formal variables `U_{v,1}, …, U_{v,n}` and `U_{v,n}⁻¹` for `v | p`; put `U_v = U_{v,1}⋯U_{v,n−1}` and `U_p = ∏_{v|p} U_v`. It acts on `RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ)` in `D(O[K(0,c)/K(b,c)])`: the Iwasawa algebra through its quotient `O[K(0,c)/K(b,c)]`, and `U_{v,i}` by the double coset of `diag(ϖ_v, …, ϖ_v, 1, …, 1)` (`i` entries `ϖ_v`) at level `Iw_v(b,c)`. From Layer 3 onwards the uniformizers satisfy `ϖ_{v^c} = c(ϖ_v)`; the operators `U_{v,i}` depend on `ϖ_v`, but the ordinary summand, the ordinary Hecke algebra and the truth of `ordinary_local_global` do not.

([ACC](#source-acc), §5.1, pp. 989–991). *Needs:* `Layer 0`; `SR:SR.1.4`; `RG:RG2.3`.

Its interface includes:

- `IwahoriLevelTower.level`: The (b,c)-level equals `K` away from `p` and matrices upper triangular modulo `varpi_v^c` with diagonal congruent to 1 modulo `varpi_v^b` at `p`.
- `IwahoriLevelTower.transition`: For `b′≥b,c′≥c`, inclusion of levels gives compatible pullback and trace on integral cohomology.
- `IwahoriLevelTower.diamondQuotient``: K(0,c)/K(b,c)` is the product of diagonal unit groups modulo `varpi_v^b`.
- `IwahoriLevelTower.ordinaryOperator``: U_p` is the product over `v|p` and `1≤i<n` of the normalized double-coset operators; `U_{v,n}` is already invertible.

**Checks.**

- `IwahoriLevelTower.base` (computation): `K(0,1)=K`.
- For `b=0` the diamond quotient is trivial.
- For `b=1` a diagonal unit not congruent to 1 modulo `varpi_v` is excluded even though it belongs to `K(0,c)`.
- Over a field, nonzero `ϖ` generates the unit ideal and the congruence levels are the whole matrix group; arithmetic uniformizers are nonunits.

<a id="smooth-monoid-modules"></a>

### 3.2 Smooth modules over open monoids

Define `SmoothMonoidModules`. Let `G` be a locally profinite group, `Δ ⊆ G` an open submonoid containing an open compact subgroup of `G`, and `m ≥ 1`. A smooth `O/ϖ^m[Δ]`-module is an `O/ϖ^m[Δ]`-module each of whose vectors is fixed by an open subgroup of `G` contained in `Δ`. `Mod_sm(O/ϖ^m[Δ])` is the full subcategory of smooth modules in all `O/ϖ^m[Δ]-modules, M ↦ M^sm` (the smooth vectors) is right adjoint to the inclusion, and `D_sm(O/ϖ^m[Δ])` is the derived category of `Mod_sm(O/ϖ^m[Δ])`. The category is abelian with enough injectives, and for a subgroup `Δ′ ⊆ Δ` that is either open or compact the restriction functor `Mod_sm(O/ϖ^m[Δ]) → Mod_sm(O/ϖ^m[Δ′])` preserves injectives. In this layer `Δ` is `Δₚ = ∏_{v|p} Iw_v Tₙ(F_v)⁺ Iw_v`, the positive torus monoid `Tₙ(Fₚ)⁺, B(Fₚ⁺)⁺` or `Δ̃ₚ`.

([ACC](#source-acc), §5.2.1, (5.2.2)–(5.2.3) and Lemma 5.2.4, p. 992, using Emerton's Proposition 2.1.11 of the second ordinary-parts paper for the compact case). *Needs:* `SR:SR.0`; `SR:SR.0d` (the smooth category of a group and its injectives); `SR:SR.2.1` (compact induction is left adjoint to restriction to an open subgroup).

Its interface includes:

- `SmoothMonoidModules.smoothVectors``: M ↦ M^sm` is right adjoint to the inclusion; since the inclusion is exact, `M ↦ M^sm` preserves injectives, and enough injectives of all modules give enough injectives of smooth ones.
- `SmoothMonoidModules.restrict_open`: for `Δ′ ⊆ Δ` an open subgroup, compact induction is an exact left adjoint of restriction, so restriction preserves injectives.
- `SmoothMonoidModules.restrict_compact`: for `Δ′ ⊆ Δ` a compact subgroup, choose a compact open subgroup of `Δ` containing `Δ′` and reduce to restriction from a group to a compact subgroup.
- `SmoothMonoidModules.group_case`: for `Δ = G` the category is the smooth category of SR.0.
- `SmoothMonoidModules.hecke_action`: for an open compact `U ⊆ Δ` with `UΔU = Δ, RΓ(U, M)` carries an action of the monoid Hecke algebra `H(Δ, U)` (ACC §2.1.9, p. 913; `positive_monoid_hecke_restriction`).

**Checks.**

- `SmoothMonoidModules.group` (compatibility): with `Δ = G` one recovers `SmoothRep(O/ϖ^m, G)` of SR.0.
- `SmoothMonoidModules.trivial` (degenerate): `O/ϖ^m` with the trivial action is smooth, and its smooth vectors are itself.
- `SmoothMonoidModules.all_functions` (non-example): for `G = Δ = ℤ_p` acting by translation on all functions `ℤ_p → 𝔽_p`, the module is not smooth; its smooth vectors are exactly the locally constant functions.

<a id="positive-torus-monoid"></a>

### 3.3 Positive torus monoid

Define `PositiveTorusMonoid`. `T_n(F_p)^+ ⊂ T_n(F_p)` is the open submonoid of `t` with `t N_n(O_{F,p}) t^{-1} ⊂ N_n(O_{F,p}); T_n(F_v)^+ = T_n(F_v) ∩ T_n(F_p)^+; Δ_p = ∏_{v|p} Iw_v T_n(F_v)^+ Iw_v` (§2.2.5). For `b ≥ 0: T_n(O_{F,p})(b) = ∏_{v∈S_p} ker(T_n(O_{F_v}) → T_n(O_{F_v}/ϖ_v^b)), T_n(O_{F,p})_b = T_n(O_{F,p})/T_n(O_{F,p})(b), T_n(F_p)^+_b = T_n(F_p)^+/T_n(O_{F,p})(b), T_n(F_p)_b = T_n(F_p)/T_n(O_{F,p})(b)`. `u_p = (p^{n−1}, p^{n−2}, …, 1) ∈ T_n(Q_p) ⊂ T_n(F_p)` lies in `T_n(F_p)^+`. `B_n(F_p)^+ = N_n(O_{F,p})·T_n(F_p)^+ ⊂ Δ_p; B_n(O_{F,p})(b)` is the preimage of `T_n(O_{F,p})(b)` in `B_n(O_{F,p})`. Every `C ∈ D_sm(O/ϖ^m[T_n(F_p)^+_b])` carries a functorial homomorphism `O⟦T_n(O_{F,p})⟧[{U_{v,1},…,U_{v,n},U_{v,n}^{-1}}_{v∈S_p}] → End(C)`, via `O⟦T_n(O_{F,p})⟧ → O/ϖ^m[T_n(O_{F,p})_b]` and `U_{v,i} ↦ diag(ϖ_v,…,ϖ_v,1,…,1) ∈ T_n(F_v)` (`i` entries `ϖ_v`); hence a `T^``S`-action on `C` extends to a `T^{S,ord}-action`.

([ACC](#source-acc), §5.2.1, pp. 992–993). *Needs:* `IwahoriLevelTower`; `SmoothMonoidModules`; `SR:SR.1.4`.

Its interface includes:

- `PositiveTorusMonoid.mem_iff`: For a diagonal torus element, contraction of upper unipotents is equivalent to `valuation(t_i)≥valuation(t_j)` for `i<j`.
- `PositiveTorusMonoid.contractingElement`: The local-uniformizer row `(n−1,n−2,…,0)` is positive; `u_p` has this row multiplied by `v(p)`.
- `PositiveTorusMonoid.unit_subgroup`: Every diagonal unit belongs to the cone, and zero valuations recover the compact torus.
- `PositiveTorusMonoid.mul`: Componentwise products preserve the cone, so it is an open submonoid of the diagonal torus.

**Checks.**

- For `n=1` all diagonal torus elements are positive.
- The exponent row (1,0) is positive.
- The exponent row (0,1) is not positive for the upper-triangular Borel.

<a id="arithmetic-ordinary-summand"></a>

### 3.4 Arithmetic ordinary summand

Define `ArithmeticOrdinarySummand` on the arithmetic tower with its diamond and Hecke actions. For the levels `K(b,c)` of `IwahoriLevelTower`, the complex `RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ)` in `D(O[K(0,c)/K(b,c)])` has a canonical direct summand `RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ)^ord`, the largest summand on which `U_p` is invertible: the image of the ordinary idempotent (Khare–Thorne, §2.4; the generic stable-image theory is SR.6.5 and IHG §2.3, the Artinian projector PF:Layer `0a`). The ordinary Hecke algebra `T^S(K(b,c),λ)^ord` is the image of `T^{S,ord}` in the endomorphisms of this summand in `D(O[K(0,c)/K(b,c)])`. The natural map from the image of `T^S` on the whole complex to `T^S(K(b,c),λ)^ord` need be neither injective nor surjective, but it gives every maximal ideal `𝔪` of the ordinary algebra a residual representation `ρ̄_𝔪: G_{F,S} → GLₙ(T^S(K(b,c),λ)^ord/𝔪)`. A maximal ideal of `T^{S,ord}` with residue field finite over `k` is called of Galois type, respectively non-Eisenstein, when its pullback to `T^S` is (IHG Layer `3b`; ACC Definition 2.3.6).

([ACC](#source-acc), §5.1, p. 990). *Needs:* `Layer 3`; `PF:Layer 0a`.

Its interface includes:

- `ArithmeticOrdinarySummand.complex`: The image of PadicFamilies:Layer 0a’s derived ordinary idempotent on the tower’s finite perfect complex.
- `ArithmeticOrdinarySummand.operator_bijective``: U_p` acts invertibly on that image.
- `ArithmeticOrdinarySummand.finite_quotient_comparison`: Modulo `varpi^m` the image is the stabilized factorial-power summand, and equals the localization of the finite module at `U_p`.
- `ArithmeticOrdinarySummand.base_change`: Coefficient quotient and equivariant tower maps commute with the projector after the finite-quotient/continuity hypotheses are verified.

**Checks.**

- `ArithmeticOrdinarySummand.zero_complex` (degenerate): The ordinary summand of the zero complex is zero.
- `ArithmeticOrdinarySummand.unit_operator` (computation): With `U_p` the identity, the summand is the whole complex.
- `ArithmeticOrdinarySummand.nilpotent_operator` (non-example): A finite complex with nilpotent `U_p` has zero ordinary summand.

<a id="lowest-weight-character"></a>

### 3.5 Lowest weight character

Define `LowestWeightCharacter`. For `λ ∈ X^*((Res_{F/Q}T_n)_E) = (Z^n)^{Hom(F,E)}, O(λ)` is the free rank-one `O`-module on which `u ∈ T_n(O_{F,p})` acts by `∏_{τ∈Hom(F,E)} ∏_{i=1}^n τ(u_i)^{λ_{τ,i}}` and every `diag(ϖ_v^{a_1},…,ϖ_v^{a_n}) (a_i ∈ Z)` acts trivially. For dominant `λ`, projection to the lowest weight space gives an `O`-linear map `V_λ → O(w_0^G λ)` which is `B_n(F_p)^+`-equivariant (`·_p`-action of §2.2.5 on the source, action through the projection to `T_n(F_p)` on the target); `K_λ := ker(V_λ → O(w_0^G λ))` is an `O[B_n(F_p)^+]`-module, finite free over `O`.

([ACC](#source-acc), §5.2.1, p. 993). *Needs:* `PositiveTorusMonoid`; `IntegralDualWeylModule`; Tau Ceti ReductiveGroups L9.

Its interface includes:

- `LowestWeightCharacter.unit_eval`: On units `u` its scalar is `∏τ,i τ(u_i)^{λ_{τ,i}}`.
- `LowestWeightCharacter.uniformizer_eval`: It is 1 on every chosen diagonal uniformizer power.
- `LowestWeightCharacter.add`: The character for `λ+μ` is the product of the two characters.
- `LowestWeightCharacter.projection`: For dominant `λ` the integral dual-Weyl lattice has a `B⁺-equivariant` lowest-weight quotient `O(w₀λ)` with finite free kernel killed by a power of `u_p` modulo `varpi^m`.

**Checks.**

- The zero weight gives the trivial character.
- For one embedding, rank one and weight 2, a unit `u` acts by `τ(u)²`.
- Even for nonzero `λ`, chosen uniformizers act by 1, not by their algebraic `λ-power`.

<a id="ordinary-galois-characters"></a>

### 3.6 Ordinary Galois characters

Define `OrdinaryGaloisCharacters`. The operators `U_{v,i}` are invertible in `T^S(K(b,c),λ)^ord` (because `U_p` is). For each `v | p` and `i = 1,…,n, χ_{λ,v,i}: G_{F_v} → (T^S(K(b,c),λ)^ord)^×` is the unique continuous character with `χ_{λ,v,i}(Art_{F_v}(u)) = ε^{1−i}(Art_{F_v}(u)) · ∏_{τ∈Hom_{Q_p}(F_v,E)} τ(u)^{−(w_0^G λ)_{τ,i}} ·` ⟨diag(1,…,u,…,1)⟩ for `u ∈ O_{F_v}^×` (`u` in the i-th diagonal entry), and `χ_{λ,v,i}(Art_{F_v}(ϖ_v)) = ε^{1−i}(Art_{F_v}(ϖ_v)) · U_{v,i}/U_{v,i−1}` (with `U_{v,0} = 1`).

([ACC](#source-acc), §5.1, p. 990). *Needs:* `Layer 3`; `mathlib:Matrix.charpoly`.

Its interface includes:

- `OrdinaryGaloisCharacters.on_units`: On `Art(u), χ_i=ε^{1−i}∏τ τ(u)^{−λ_{τ,n−i+1}}` times the i-th diamond character.
- `OrdinaryGaloisCharacters.on_uniformizer`: On `Art(varpi_v), χ_i=ε^{1−i} U_{v,i}/U_{v,i−1}`, with `U_{v,0}=1`.
- `OrdinaryGaloisCharacters.unique`: The unit formula and chosen uniformizer value determine the continuous character by local class field theory.
- `OrdinaryGaloisCharacters.change_uniformizer`: Changing the uniformizer changes the U-ratio by the corresponding unit/diamond factor and leaves the Galois character unchanged.

**Checks.**

- For `n=1, χ₁(Art(varpi_v))=U_{v,1}`.
- `OrdinaryGaloisCharacters.determinant` (characterisation): The product of the `n` uniformizer values is `ε^{n(1−n)/2}U_{v,n}`.
- For rank 2 with `λ=(2,0)`, the algebraic unit factors are 1 for `χ₁` and `u^{-2}` for `χ₂` before `ε` and diamonds; using `λ_i` instead of `λ_{n−i+1}` reverses them.

**Local ordinary functors and derived invariants**

The coefficient characteristic is `p`. Build ordinary parts in smooth positive-monoid categories with enough injectives, then derive the functors. The comparisons depend on unipotent acyclicity and injective preservation, with the indicated boundedness conditions.

The coordinate API also gives `OrdinaryGaloisCharacters.unique_from_units_and_uniformizer` and `OrdinaryGaloisCharacters.coordinate_uniformizer_change`. If `ϖ′=u₀ϖ`, its new coordinates `(u,k)` represent old coordinates `(u u₀^k,k)`, so `χ(u u₀^k,k)=χ(u,0)(χ(u₀,0)χ(1,1))^k`. This proves the algebraic coordinate change; local reciprocity supplies the arithmetic character. Every quotient `U_i/U_{i−1}` uses units of the ordinary Hecke algebra, and the integer powers therefore include negative `k`. (The unit/uniformizer prescription in ACC §5.1, p. 990.)

**Checks.**

- For rank one, unit character `u↦u` and `χ(ϖ)=2` over `Q`, replacing `ϖ` by `3ϖ` gives `χ(3ϖ)=6`. Keeping the old uniformizer value 2 fails this computation.

<a id="local-ordinary-parts"></a>

### 3.7 Ordinary parts

Define `LocalOrdinaryParts`. `Γ(N_n(O_{F,p}),−): Mod_sm(O/ϖ^m[Δ_p]) → Mod_sm(O/ϖ^m[T_n(F_p)^+])` is `N_n(O_{F,p})-invariants` with `t ∈ T_n(F_p)^+` acting by `t·v = Σ_{n∈N_n(O_{F,p})/tN_n(O_{F,p})t^{-1}} n t v` (ACC (5.2.5)), i.e. by the double coset operator `[N_n(O_{F,p}) t N_n(O_{F,p})]`. `Γ(B_n(O_{F,p})(b),−): Mod_sm(O/ϖ^m[Δ_p]) → Mod(O/ϖ^m[T_n(F_p)^+_b])` is `B_n(O_{F,p})(b)-invariants` with the same formula. For `c ≥ b ≥ 0, c ≥ 1, Iw_p(b,c) = ∏_{v∈S_p} Iw_v(b,c)` and `Γ(Iw_p(b,c),−): Mod_sm(O/ϖ^m[Δ_p]) → Mod(O/ϖ^m[T_n(F_p)^+_b]), t` acting by `[Iw_p(b,c) t Iw_p(b,c)]`. `Γ(T_n(O_{F,p})(b),−)` maps `Mod_sm(O/ϖ^m[T_n(F_p)^+]) → Mod(O/ϖ^m[T_n(F_p)^+_b])` and `Mod_sm(O/ϖ^m[T_n(F_p)]) → Mod(O/ϖ^m[T_n(F_p)_b])`. `ord = − ⊗_{O/ϖ^m[T_n(F_p)^+]} O/ϖ^m[T_n(F_p)]: Mod_sm(O/ϖ^m[T_n(F_p)^+]) → Mod_sm(O/ϖ^m[T_n(F_p)])` and `ord_b = − ⊗_{O/ϖ^m[T_n(F_p)^+_b]} O/ϖ^m[T_n(F_p)_b]: Mod(O/ϖ^m[T_n(F_p)^+_b]) → Mod(O/ϖ^m[T_n(F_p)_b])` (localizations; on modules finite over `O/ϖ^m` they agree with the maximal summand on which the torus acts invertibly, Emerton (ordinary parts II), Lemma 3.2.1).

([ACC](#source-acc), §5.2.1, (5.2.5), pp. 993–994). *Needs:* `Layer 3`; `PF:Layer 0a`; `SmoothMonoidModules`; `SR:SR.0d`.

Its interface includes:

- `LocalOrdinaryParts.transfer_action`: The action on `N(O)-invariants` is `t·v=Σ_{n∈N(O)/tN(O)t^{-1}}` ntv.
- `LocalOrdinaryParts.localization`: Ordinary parts are the localization from the positive-torus monoid algebra to the group algebra after `N`-invariants.
- `LocalOrdinaryParts.finite_comparison`: On finite `O/varpi^``m`-modules this localization is the PadicFamilies:Layer `0a` ordinary summand.
- `LocalOrdinaryParts.map`: Equivariant module maps induce ordinary maps and preserve identity/composition.
- `LocalOrdinaryParts.derived`: Derive `N`-invariants in the smooth monoid category, then apply exact localization.

**Checks.**

- `LocalOrdinaryParts.zero` (degenerate): The ordinary parts of the zero representation are zero.
- `LocalOrdinaryParts.trivial_unipotent` (compatibility): For `N={1}`, the functor is precisely torus localization.
- `LocalOrdinaryParts.transfer_not_naive` (non-example): For a trivial `F_p-representation` of `N=Z_p` and `tNt^{-1}=pN`, transfer acts by `p=0`; ordinary localization is zero although the naive `t` action would be the identity.

<a id="ordinary-torus-invariants"></a>

### 3.8 Ordinary torus invariants

Prove `ordinary_torus_invariants`. For `b ≥ 0` the square `Γ(T_n(O_{F,p})(b),−) ∘ ord ≅ ord_b ∘ Γ(T_n(O_{F,p})(b),−)` of functors `Mod_sm(O/ϖ^m[T_n(F_p)^+]) → Mod(O/ϖ^m[T_n(F_p)_b])` commutes up to natural isomorphism; i.e. the natural map `M^{T_n(O_{F,p})(b)} ⊗_{O/ϖ^m[T_n(F_p)^+_b]} O/ϖ^m[T_n(F_p)_b] → (M ⊗_{O/ϖ^m[T_n(F_p)^+]} O/ϖ^m[T_n(F_p)])^{T_n(O_{F,p})(b)}` is an isomorphism for every smooth `M`.

([ACC](#source-acc), §5.2.1, Lemma 5.2.6, p. 995). *Needs:* `Layer 3`.

*Route.* Every invariant element has a finite open torus stabilizer. Choose a common contracting denominator on that finite quotient; compare invariant vectors before and after localization.

<a id="unipotent-invariants-acyclicity"></a>

### 3.9 Unipotent invariants acyclicity

Prove `unipotent_invariants_acyclicity`. The functors `Γ(N_n(O_{F,p}),−), Γ(B_n(O_{F,p})(b),−)` and `Γ(Iw_p(b,c),−)` on `Mod_sm(O/ϖ^m[Δ_p])` are left exact, and for every `b ≥ 0` the functor `Γ(N_n(O_{F,p}),−)` sends injective objects of `Mod_sm(O/ϖ^m[Δ_p])` to `Γ(T_n(O_{F,p})(b),−)-acyclic` objects of `Mod_sm(O/ϖ^m[T_n(F_p)^+])`.

([ACC](#source-acc), §5.2.1, Lemma 5.2.7(1), p. 995). *Needs:* `Layer 3`; `SmoothMonoidModules`; `SR:SR.0d`.

*Route.* Compute invariants using the smooth monoid injective resolution. Use the right adjoints to restriction and the contracting Hecke action to show higher compact-torus derived invariants vanish.

<a id="ordinary-exact-injective"></a>

### 3.10 Ordinary exact injective

Prove `ordinary_exact_injective`. The localization functors `ord: Mod_sm(O/ϖ^m[T_n(F_p)^+]) → Mod_sm(O/ϖ^m[T_n(F_p)])` and `ord_b: Mod(O/ϖ^m[T_n(F_p)^+_b]) → Mod(O/ϖ^m[T_n(F_p)_b])` are exact and preserve injectives.

([ACC](#source-acc), §5.2.1, Lemma 5.2.7(2), pp. 995–996). *Needs:* `Layer 3`; `SmoothMonoidModules`; `SR:SR.0d`.

*Route.* Localization in the commuting positive torus operators is exact. At fixed `b` use the noetherian finite-quotient torus algebra and the injective-extension criterion; pass through smooth open stabilizers.

<a id="iwahori-borel-ordinary-comparison"></a>

### 3.11 Iwahori borel ordinary comparison

Prove `iwahori_borel_ordinary_comparison`. For `c ≥ b ≥ 0` with `c ≥ 1` there is a natural isomorphism `ord_b ∘ Γ(Iw_p(b,c),−) ≅ ord_b ∘ Γ(B_n(O_{F,p})(b),−)` of functors `Mod_sm(O/ϖ^m[Δ_p]) → Mod(O/ϖ^m[T_n(F_p)_b])`, induced by the inclusion `V^{Iw_p(b,c)} ⊂ V^{B_n(O_{F,p})(b)}` (which is `T_n(F_p)^+_b-equivariant` because `Iw_p(b,c)` has an Iwahori decomposition).

([ACC](#source-acc), §5.2.1, Lemma 5.2.8, pp. 996–997). *Needs:* `Layer 3`.

*Route.* Compare Iwahori and Borel invariants by their finite decompositions. The terms outside the Borel chart are killed by a power of the contracting operator; localize to obtain the comparison.

<a id="derived-ordinary-comparison"></a>

### 3.12 Derived ordinary comparison

Prove `derived_ordinary_comparison`. Let `π ∈ D_sm(O/ϖ^m[Δ_p])` be bounded below. For `c ≥ b ≥ 0` with `c ≥ 1` there is a natural isomorphism `RΓ(T_n(O_{F,p})(b), ord RΓ(N_n(O_{F,p}), π)) ≅ ord_b RΓ(Iw_p(b,c), π)` in `D(O/ϖ^m[T_n(F_p)_b])`.

([ACC](#source-acc), §5.2.1, Lemma 5.2.9, pp. 997–998). *Needs:* `Layer 3`; `SmoothMonoidModules`; `SR:SR.0d`.

*Route.* Resolve in the smooth coefficient-characteristic-p monoid category. Use acyclicity of `N`-invariants and exactness/injective preservation of ord; compare the two composite derived functors.

**Completed cohomology and weight control**

Keep the finite-level coefficient reduction, level transition maps and continuous torus actions throughout the inverse limits. Classical comparison and weight control use the lowest-weight projection after the contracting action has removed its kernel.

<a id="completed-arithmetic-cohomology"></a>

### 3.13 Completed arithmetic cohomology

Define `CompletedArithmeticCohomology`. For `K ⊂ GL_n(A_F^∞)` good there are functors `Γ_{K^p,sm}: Mod(O/ϖ^m[G^∞]) → Mod_sm(O/ϖ^m[G(F_p^+)])` and `Mod(O/ϖ^m[G^{p,∞}×Δ_p]) → Mod_sm(O/ϖ^m[Δ_p]), M ↦ Γ(K^p,M)^sm`. For `λ ∈ (Z^n_+)^{Hom(F,E)}, π(K^p,λ,m) := RΓ_{K^p,sm} RΓ(𝔛_G, V_λ/ϖ^m) ∈ D_sm(O/ϖ^m[Δ_p])`. If `K^S = ∏_{v∉S} GL_n(O_{F_v})` it carries `T^S → End_{D_sm(O/ϖ^m[Δ_p])}(π(K^p,λ,m))` (ACC (5.2.11)), and for `K_p ⊂ Δ_p` a canonical `T^``S`-equivariant isomorphism `RΓ(K_p, π(K^p,λ,m)) ≅ RΓ(X_K, V_λ/ϖ^m)` in `D(O/ϖ^m)` (ACC (5.2.12)). `π(K^p,m) := RΓ_{K^p,sm} RΓ(𝔛_G, O/ϖ^m) ∈ D_sm(O/ϖ^m[G(F_p^+)])` carries `T^S → End_{D_sm(O/ϖ^m[G(F_p^+)])}(π(K^p,m))` (ACC (5.2.13)), recovering (ACC (5.2.11)) for `λ = 0; T^S(K^p,m) :=` image of (ACC (5.2.13)).

([ACC](#source-acc), §5.2.10, (5.2.11)–(5.2.13), p. 998). *Needs:* `Layer 0`; `mathlib:DerivedCategory`; `SmoothMonoidModules`; `SR:SR.0d`.

Construct the fixed-exponent comparison `CompletedArithmeticCohomology.level_colimit`. At `λ=0`, for the cofinal system of good `p`-levels `U`, identify `π(K^p,m)` with `colim_U C^•(X_{K^pU},O/ϖ^m)` in the smooth derived category, using the compatible cochain models of §0.1; the exponent `m` is fixed. Its cohomology is `colim_U H^i(X_{K^pU},O/ϖ^m)`. The full local group acts by translating levels; tame Hecke maps are induced by the finite-level correspondences. For algebraic coefficients prove the analogous comparison over `Δ_p`, with the normalized lattice action specified in §3.6. At weight zero the underlying fixed-exponent level-colimit object is the carrier supplied by CompletedCohomologyPartII §§1.1 and 2.1. For the unitary similitude tower its compact-support version equals the fixed-exponent carrier in TorsionCohomologyInfrastructure §2.1 (`perfectoidComparison`), with support convention identified by CompletedCohomologyPartII §8.6. The extra comparisons here retain the positive-monoid lattice action and the derived residual summands; they do not reconstruct the compact-support comparison or classical Hecke continuity. No coefficient inverse limit is introduced.

Construct `CompletedArithmeticCohomology.residual_level_colimit`. Fix a maximal ideal `𝔪` of the abstract tame Hecke algebra with residual characteristic `p`. At each good finite `p`-level `U`, let `C_U` be the compatible perfect `O/ϖ^m` cochain complex of §0.1. Its derived Hecke image is a finite Artinian algebra. Let `C_{U,𝔪}` be the summand cut out by its `𝔪`-primary idempotent, and zero if `𝔪` is absent. Define `π(K^p,λ,m)_𝔪=colim_U C_{U,𝔪}` in the smooth derived category at this fixed exponent. The idempotent acts in the derived category; no termwise idempotent is assumed. The IHG derived splitting supplies its summand. Transition and translation maps intertwine the same abstract Hecke action and restrict to these summands, even when no homomorphism between the two raw image algebras has been specified.

Prove that this construction is the `𝔪`-summand of the level colimit, that `RΓ(K_p,π(K^p,λ,m)_𝔪)≅C_{K_p,𝔪}`, and that these comparisons commute with restriction, trace, translations and coefficient reduction. For a parabolic with compact quotient, exact smooth induction commutes with this filtered colimit and carries each selected summand to the induced selected summand. If the unitary Hecke algebra acts through `𝒮`, its `𝔪̃=𝒮*(𝔪)` localization retains the induced `𝔪`-summand; this does not identify it with every other summand above `𝔪̃`. These are the localization conventions in §§3.21 and 3.34. The finite derived image, its residual summand and an inverse-limit completed Hecke algebra are separate objects.

([ACC](#source-acc), §5.2.10 and proof of Theorem 5.4.1, pp. 998, 1011–1013.) *Needs:* `CompletedArithmeticCohomology.level_colimit`; `IHG:Layer 2`; `SR:SR.0d`; `SR:SR.2.1`.

*Route.* Apply the ALS equivariant-sheaf and derived-invariants comparison to the arithmetic tower. Smooth sections are the union of compact-open fixed sections; use exactness of filtered colimits of modules to compare a compatible injective resolution with the level cochains. Common refinements identify the Hecke maps. Apply derived invariants, rather than degree-zero invariants, to recover a finite level; the equivariant-sheaf resolution supplies the descent comparison. For algebraic coefficients keep the positive-monoid lattice action in every map. This proves the equivalence between the displayed groupoid presentation and the actual level colimit.

Its interface includes:

- `CompletedArithmeticCohomology.finite_level``: RΓ(K_p,π(K^p,λ,m))≅RΓ(X_K,V_λ/varpi^m)`, Hecke-equivariantly.
- `CompletedArithmeticCohomology.hecke_action`: Unramified double cosets away from `S` give `T^S → End` of the smooth derived complex.
- `CompletedArithmeticCohomology.coefficient_reduction`: Derived coefficient reduction `m′→m` commutes with completed cohomology on the imported finite-projective models.
- `CompletedArithmeticCohomology.weight_zero`: At `λ=0` this is the weight-zero completed complex with the full local group action.
- `CompletedArithmeticCohomology.level_colimit`: At fixed exponent, the derived-invariants presentation identifies Hecke-equivariantly with the level colimit, with the full local group at weight zero and the specified positive monoid for algebraic coefficients.
- `CompletedArithmeticCohomology.residual_level_colimit`: The level colimit of the finite derived residual summands has the stated compact-open derived-invariants, transition and induction comparisons.

**Checks.**

- `CompletedArithmeticCohomology.zero_coefficients` (degenerate): The zero coefficient local system gives the zero completed complex.
- `CompletedArithmeticCohomology.finite_level_identity` (compatibility): Taking the specified `K_p` derived invariants recovers the ALS finite-level complex, rather than its degree-zero invariants only.
- `CompletedArithmeticCohomology.higher_group_cohomology` (non-example): For the trivial `F_p`-module of a pro-p group `Z_p`, replacing derived invariants by fixed vectors loses the nonzero `H¹`.
- For a regular point torsor over `K₀`, the fixed-exponent level colimit is the locally constant functions `K₀→O/ϖ^m`, with translation action; it is not the module of all set functions.
- If the finite Hecke image is `R×R` and `𝔪` selects the first factor, the residual tower is the colimit of the first-factor complexes. If it selects neither factor the corresponding finite summand is zero.
- For a transition between levels, an abstract Hecke element invertible on one primary factor acts invertibly on its transported factor; functorial residual projection therefore commutes with the transition without identifying the whole image algebras.
- Compact-open recovery of the localized tower retains higher derived invariants, and parabolic induction retains the selected residual summand. Neither comparison replaces the raw Hecke image by a completed inverse limit.
- A fixed algebraic lattice need not admit the full local-group action: multiplication by a local uniformizer on the standard rank-one lattice is not a lattice automorphism. The normalized positive-monoid action, rather than an unqualified group action, is retained.

<a id="completed-ordinary-cohomology"></a>

### 3.14 Completed ordinary cohomology

Define `CompletedOrdinaryCohomology`. `π^ord(K^p,λ,m) := ord RΓ(N_n(O_{F,p}), π(K^p,λ,m)) ∈ D_sm(O/ϖ^m[T_n(F_p)])`; for `λ = 0` it is written `π^ord(K^p,m)`.

([ACC](#source-acc), §5.2.10, p. 999). *Needs:* `Layer 3`.

Its interface includes:

- `CompletedOrdinaryCohomology.formula``: π^ord=ord RΓ(N_n(O),π)`, in the smooth torus derived category.
- `CompletedOrdinaryCohomology.torus_action`: The torus group acts after localization; Hecke away from `S` acts commuting with it.
- `CompletedOrdinaryCohomology.weight_zero`: At `λ=0` the formula agrees with ordinary parts of weight-zero completed arithmetic cohomology.
- `CompletedOrdinaryCohomology.change_coefficients`: Derived reduction modulo a smaller coefficient power commutes under the tower’s finite-quotient hypotheses.

**Checks.**

- `CompletedOrdinaryCohomology.zero` (degenerate): Zero completed cohomology has zero ordinary part.
- `CompletedOrdinaryCohomology.invertible_contractor` (compatibility): If `N={1}` and all positive torus operators are invertible, ordinary localization recovers the original complex.
- `CompletedOrdinaryCohomology.nilpotent_contractor` (non-example): A nilpotent contracting action gives zero ordinary part, even with nonzero completed cohomology.

<a id="completed-classical-ordinary-control"></a>

### 3.15 Completed classical ordinary control

Prove `completed_classical_ordinary_control`. Let `K ⊂ G^∞` be a good subgroup with `K_v = Iw_v` for each `v | p` and `K^S = ∏_{v∉S} GL_n(O_{F_v})`, and let `c ≥ b ≥ 0` be integers with `c ≥ 1`. For every `λ ∈ (Z^n_+)^{Hom(F,E)}` there is a `T^{S,ord}-equivariant` isomorphism `RΓ(T_n(O_{F,p})(b), π^ord(K^p,λ,m)) ≅ RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ/ϖ^m)^ord` in `D(O/ϖ^m[K(0,c)/K(b,c)]) (K(0,c)/K(b,c) ≅ T_n(O_{F,p})_b)`.

([ACC](#source-acc), §5.2.10, Proposition 5.2.15, p. 999). *Needs:* `Layer 3`.

*Route.* Take the derived invariants at `T_n(O)(b)` of completed ordinary cohomology. Apply the finite-level comparison for completed cohomology and the Iwahori/Borel comparison to identify the finite ordinary complex.

<a id="ordinary-level-control"></a>

### 3.16 Ordinary level control

Prove `ordinary_level_control`. Let `K ⊂ GL_n(A_F^∞)` be good with `K_v = Iw_v` for `v | p` and `K^S = ∏_{v∉S} GL_n(O_{F_v})`; let `c ≥ b ≥ 0` with `c ≥ 1` and `λ ∈ (Z^n_+)^{Hom(F,E)}`. The natural morphism `RΓ_{K(0,max(1,b))/K(b,max(1,b))}(X_{K(b,max(1,b))}, V_λ/ϖ^m)^ord → RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ/ϖ^m)^ord` in `D(O/ϖ^m[T_n(O_{F,p})_b])` is an isomorphism.

([ACC](#source-acc), §5.2.10, Corollary 5.2.16, p. 999). *Needs:* `Layer 3`.

*Route.* Apply completed/classical ordinary control at level max(1,b). Use the localization isomorphism to discard the deeper `c` coordinate with all diamond actions retained.

<a id="completed-ordinary-weight-control"></a>

### 3.17 Completed ordinary weight control

Prove `completed_ordinary_weight_control`. Let `K ⊂ GL_n(A_F^∞)` be good with `K^S = ∏_{v∉S} GL_n(O_{F,v})` and `λ ∈ (Z^n_+)^{Hom(F,E)}`. There are `T^``S`-equivariant isomorphisms in `D(O/ϖ^m[T_n(F_p)]): π^ord(K^p,λ,m) ≅ ord RΓ(N_n(O_{F,p}), RΓ_{K^p,sm} RΓ(𝔛_G, O(w_0^G λ)/ϖ^m)) ≅ π^ord(K^p,m) ⊗_O O(w_0^G λ)`.

([ACC](#source-acc), §5.2.10, Proposition 5.2.17, p. 1000). *Needs:* `Layer 3`.

*Route.* Apply the lowest-weight projection `V_λ → O(w₀λ)`. A fixed power of `u_p` kills its kernel modulo `varpi^m`; the localized derived kernel is zero. Identify completed ordinary cohomology with the weight-zero complex twisted by the lowest-weight character.

<a id="finite-ordinary-weight-control"></a>

### 3.18 Finite ordinary weight control

Prove `finite_ordinary_weight_control`. Let `K` be good with `K_v = Iw_v` for `v | p` and `K^S = ∏_{v∉S} GL_n(O_{F_v}); c ≥ b ≥ 0` with `c ≥ 1`. For `λ, λ' ∈ (Z^n_+)^{Hom(F,E)}` with `O(w_0^G λ)/ϖ^m ≅ O(w_0^G λ')/ϖ^m` as `O/ϖ^m[T_n(O_{F,p})(b)]`-modules there is a `T^{S,ord}-equivariant` isomorphism `RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ/ϖ^m)^ord ≅ RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_{λ'}/ϖ^m)^ord ⊗_O O(w_0^G λ) ⊗_O O((w_0^G λ')^{-1})` in `D(O/ϖ^m[T_n(F_p)_b])`.

([ACC](#source-acc), §5.2.10, Corollary 5.2.18, p. 1000). *Needs:* `Layer 3`.

*Route.* Use completed weight independence for both weights. Restrict to the chosen torus congruence subgroup; the two characters agree modulo `varpi^m` there, so derived invariants give the finite-level comparison.

**The unitary tower and ordinary Satake operators**

The contracting element belongs to the full `GL_{2n}` factor. The unitary positive cone and the Levi cone therefore have distinct roles. The explicit formulas below determine the Satake map on every ordinary generator.

<a id="unitary-ordinary-tower"></a>

### 3.19 Unitary ordinary tower

Define `UnitaryOrdinaryTower`. Every `p`-adic place of `F^+` splits in `F`; the fixed lifts ṽ `∈ S̃_p` give `∏_{v̄∈S̄_p} ι_ṽ: G̃(F_p^+) ≅ ∏_{v̄∈S̄_p} GL_{2n}(F_ṽ)`, with `T ⊂ B ⊂ G̃` corresponding to `T_{2n} ⊂ B_{2n}`. `T̃^{S,ord} = T̃^S ⊗_O O⟦T(O_{F^+,p})⟧[{Ũ_{v,1},…,Ũ_{v,2n},Ũ_{v,2n}^{-1}}_{v∈S_p}] / (Ũ_{v^c,i} − Ũ_{v,2n−i} Ũ_{v,2n}^{-1})_{v∈S_p, i=1,…,2n}; Ũ_v =` [Iw `diag(ϖ^{2n−1},…,ϖ,1)` Iw] (equivalently the product of the `2n−1` simple ordinary operators with the source normalization) and `Ũ_p = ∏_{v∈S_p} Ũ_v`. For `K̃` good with `K̃_v̄ = Ĩw_v̄ (v̄ ∈ S̄_p)` and `c ≥ b ≥ 0, c ≥ 1: K̃(b,c)_v̄ = K̃_v̄ (v̄ ∉ S̄_p), Ĩw_v̄(b,c) (v̄ ∈ S̄_p)`. For `λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)}`, the ordinary summand `RΓ_{K̃(0,c)/K̃(b,c)}(X̃_{K̃(b,c)}, V_λ̃)^ord` is defined as for `GLₙ` (`ArithmeticOrdinarySummand`), with `Ũ_p` in place of `U_p`, and `T̃(K̃(b,c),λ̃)^ord` is the image of `T̃^{S,ord}` acting on it. Monoids: `T(F_p^+)^+ ⊂ T(F_p^+) =` elements contracting `N(O_{F^+,p})`; under `T(F_p^+) = T_n(F_p), T(F_p^+)^+ ⊂ T_n(F_p)^+` (strictly for `n ≥ 2); Ĩw_p(b,c) = ∏_{v̄} Ĩw_v̄(b,c); Δ̃_p = Ĩw_p(b,c) T(F_p^+)^+ Ĩw_p(b,c`) with its `·_p-action` on `V_λ̃; T(O_{F^+,p})(b) = T_n(O_{F,p})(b); B(O_{F^+,p})(b) =` preimage of `T(O_{F^+,p})(b)` in `B(O_{F^+,p}); B(F_p^+)^+ = N(O_{F^+,p})·T(F_p^+)^+`.

([ACC](#source-acc), §5.2.19, pp. 1000–1001). *Needs:* `Layer 0`; `Layer 3`; `PF:Layer 0a`; `SR:SR.1.4`.

Its interface includes:

- `UnitaryOrdinaryTower.split_local_factor`: The chosen lift of `v̄` identifies its factor with `GL_{2n}(F_v)`.
- `UnitaryOrdinaryTower.conjugate_operator``: Ũ_{vᶜ,i}=Ũ_{v,2n−i}Ũ_{v,2n}^{−1}`.
- `UnitaryOrdinaryTower.ordinary_operator`: The full contracting double coset is `diag(varpi^{2n−1},…,varpi,1)`.
- `UnitaryOrdinaryTower.coefficient_control`: Boundary and interior tower maps commute with the finite-quotient ordinary projector.

**Checks.**

- `UnitaryOrdinaryTower.zero_b` (degenerate): The diamond quotient at `b=0` is trivial.
- `UnitaryOrdinaryTower.rank_one_contraction` (computation): For `n=1` the unitary rank-2 contracting exponents are (1,0), so the ordinary operator is not an empty product.
- `UnitaryOrdinaryTower.proper_cone` (non-example): For `n≥2` the unitary positive monoid in the Levi torus is strictly smaller than the `GL_n` positive monoid; the Satake map cannot equate the cones.

<a id="ordinary-satake-homomorphism"></a>

### 3.20 Ordinary Satake homomorphism

Prove `ordinary_satake_homomorphism`. With the Siegel Levi `G ≅ Res_{O_F/O_{F^+}} GL_n` (so `T ≅ Res_{O_F/O_{F^+}} T_n`), the unnormalized Satake homomorphism `S: T̃^S → T^S` of (ACC (2.1.8)) extends to `S: T̃^{S,ord} → T^{S,ord}` using `O⟦T(O_{F^+,p})⟧ ≅ O⟦T_n(O_{F,p})⟧` and `Ũ_{v,i} ↦ U_{v^c,n−i} U_{v^c,n}^{-1}` (`1 ≤ i ≤ n`), `Ũ_{v,i} ↦ U_{v^c,n}^{-1} U_{v,i−n}` (`n+1 ≤ i ≤ 2n`); these are double coset operators of elements of `T(F_p^+)` and `T_n(F_p)` that match under `T(F_p^+) = T_n(F_p)`. (The assignment respects the relations `Ũ_{v^c,i} = Ũ_{v,2n−i}Ũ_{v,2n}^{-1}.`)

([ACC](#source-acc), §5.2.19, p. 1001). *Needs:* `Layer 3`; `Layer 0`; `SR:SR.1.4`.

*Route.* Compute the double-coset Satake images of all ordinary operators using the Siegel Levi. For `i≤n` the image is `U_{vᶜ,n−i}/U_{vᶜ,n}`; for `i>n` it is `U_{vᶜ,n}^{−1}U_{v,i−n}`. Check compatibility with the twisted lattice action; the unitary positive cone is a proper subcone for `n≥2`.

<a id="unitary-completed-boundary"></a>

### 3.21 Unitary completed boundary

Define `UnitaryCompletedBoundary`. Fix `m ≥ 1; K̃ ⊂ G̃(A^∞_{F^+})` good with `K̃_v̄ = Ĩw_v̄ (v̄ ∈ S̄_p), λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)}`. `π̃(K̃^p,λ̃,m) := RΓ_{K̃^p,sm} RΓ(𝔛_G̃, V_λ̃/ϖ^m) ∈ D_sm(O/ϖ^m[Δ̃_p])` (ACC (5.2.20)), with `T̃^S → End` (ACC (5.2.21)) if `K̃^S = G̃(Ô^S_{F^+}); π̃(K̃^p,m) := RΓ_{K̃^p,sm} RΓ(𝔛_G̃, O/ϖ^m) ∈ D_sm(O/ϖ^m[G̃(F_p^+)])` with (ACC (5.2.22)); boundary versions `π̃_∂(K̃^p,λ̃,m) := RΓ_{K̃^p,sm} RΓ(∂𝔛_G̃, V_λ̃/ϖ^m)` (ACC (5.2.23))–(ACC (5.2.24)) and `π̃_∂(K̃^p,m)` (ACC (5.2.25)). For `c ≥ b ≥ 0, c ≥ 1`, canonical `T̃^{S,ord}-equivariant` isomorphisms `RΓ(Ĩw_p(b,c), π̃(K̃^p,λ̃,m)) ≅ RΓ(X̃_{K̃(b,c)}, V_λ̃/ϖ^m)` (ACC (5.2.26)) and `RΓ(Ĩw_p(b,c), π̃_∂(K̃^p,λ̃,m)) ≅ RΓ(∂X̃_{K̃(b,c)}, V_λ̃/ϖ^m)` (ACC (5.2.27)) in `D(O/ϖ^m)`. Ordinary parts: `π̃^ord(K̃^p,λ̃,m) = ord RΓ(N(O_{F^+,p}), π̃(K̃^p,λ̃,m))` and `π̃^ord_∂(K̃^p,λ̃,m) = ord RΓ(N(O_{F^+,p}), π̃_∂(K̃^p,λ̃,m))` in `D_sm(O/ϖ^m[T(F_p^+)]); λ̃ = 0` is omitted from the notation.

([ACC](#source-acc), §5.2.19, (5.2.20)–(5.2.27), p. 1002). *Needs:* `Layer 3`; `Layer 0`; `mathlib:DerivedCategory`.

Construct `UnitaryCompletedBoundary.level_colimit` by the fixed-exponent comparison of §3.13 for the unitary group, with supports interior, compact and boundary. At weight zero, `π̃_∂(K̃^p,m) ≅ colim_U C^•(∂X̃_{K̃^pU},O/ϖ^m)` in the smooth local-group derived category; for algebraic coefficients use `Δ̃_p` and its normalized lattice action. Filtered colimits are exact and preserve the finite-level support triangle and tame Hecke maps. The equivariant-sheaf descent comparison identifies its Iwahori derived invariants with the finite-level boundary complex. This constructs the support and recovery comparison for these unitary towers at fixed `m`. Apply `CompletedArithmeticCohomology.residual_level_colimit` separately to interior, compact-support and boundary finite complexes, selecting the same abstract residual ideal `𝔪̃`; localize the finite support triangle before the colimit. This defines every residual localization of these unitary smooth complexes and preserves the triangle and its finite-level recovery.

Its interface includes:

- `UnitaryCompletedBoundary.interior`: The interior complex is `RΓ_{K̃^p,sm}RΓ` of the unitary arithmetic groupoid.
- `UnitaryCompletedBoundary.boundary`: Replace that groupoid by its Borel–Serre boundary to obtain `π̃_∂`.
- `UnitaryCompletedBoundary.finite_level`: Iwahori derived invariants recover the corresponding finite interior and boundary complexes.
- `UnitaryCompletedBoundary.triangle`: The imported compact-support/interior/boundary triangle carries the same commuting Hecke and ordinary actions.
- `UnitaryCompletedBoundary.level_colimit`: The fixed-exponent boundary colimit and the derived-invariants presentation agree, compatibly with the support triangle and finite-level recovery.

**Checks.**

- `UnitaryCompletedBoundary.zero_coefficients` (degenerate): All three complexes vanish for the zero coefficient local system.
- `UnitaryCompletedBoundary.boundary_recovery` (compatibility): Finite Iwahori derived invariants of `π̃_∂` give the ALS boundary complex.
- `UnitaryCompletedBoundary.nonempty_rank_one`: For `F=Q(i)` and `n=1`, every neat finite level has nonempty Borel–Serre boundary, since `U(1,1)` has a rational Siegel parabolic. With trivial `O/ϖ^m` coefficients its `H⁰` is nonzero, and finite-level derived invariants of the completed boundary complex recover that group. A zero boundary model fails this test.

<a id="unitary-ordinary-control"></a>

### 3.22 Unitary ordinary control

Prove `unitary_ordinary_control`. Let `K̃ ⊂ G̃(A^∞_{F^+})` be good with `K̃_v̄ = Ĩw_v̄` for `v̄ ∈ S̄_p` and `K̃^S = G̃(Ô^S_{F^+}); c ≥ b ≥ 0` with `c ≥ 1`. For every `λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)}` there are `T̃^{S,ord}-equivariant` isomorphisms `RΓ(T(O_{F^+,p})(b), π̃^ord(K̃^p,λ̃,m)) ≅ RΓ(T(O_{F^+,p})(b), O(w_0^G̃ λ̃) ⊗_O π̃^ord(K̃^p,m)) ≅ RΓ_{K̃(0,c)/K̃(b,c)}(X̃_{K̃(b,c)}, V_λ̃/ϖ^m)^ord`, and likewise `RΓ(T(O_{F^+,p})(b), π̃^ord_∂(K̃^p,λ̃,m)) ≅ RΓ(T(O_{F^+,p})(b), O(w_0^G̃ λ̃) ⊗_O π̃^ord_∂(K̃^p,m)) ≅ RΓ_{K̃(0,c)/K̃(b,c)}(∂X̃_{K̃(b,c)}, V_λ̃/ϖ^m)^ord`, in `D_sm(O/ϖ^m[K̃(0,c)/K̃(b,c)])`.

([ACC](#source-acc), §5.2.19, Proposition 5.2.28, p. 1003). *Needs:* `Layer 3`.

*Route.* Repeat the completed/classical, level and lowest-weight arguments for the split unitary `p`-adic factors. Apply the same comparisons to the boundary triangle and check that ordinary Satake commutes with all maps.

**Relative Bruhat cells and compact charts**

Filter parabolic induction by relative length, using compact charts for the local invariants. Absolute length records local field degrees and determines cohomological shifts; relative length determines the order of the filtration.

<a id="relative-bruhat-cells"></a>

### 3.23 Relative Bruhat cells

Define `RelativeBruhatCells`. For a `p`-adic place `v̄` of `F^+: ^rW_v̄ = W(G̃_{F^+_v̄}, T_{F^+_v̄}) (≅ S_{2n}), ^rW_{P,v̄} = W(G_{F^+_v̄}, T_{F^+_v̄}) (≅ S_n × S_n), ^rW^P_v̄ ⊂ ^rW_v̄` the representatives of `^rW_{P,v̄}∖^rW_v̄` attached to `B_{F^+_v̄}; ^rW, ^rW_P, ^rW^P` are the products over `v̄ ∈ S̄_p; ^rW ⊂ W` (absolute Weyl group), `l_r =` relative length, `l =` absolute length; `w_0^P = w_0^G w_0^G̃`, the longest element of `W^P` (equivalently of `^rW^P`), has `l(w_0^P) = [F^+:Q]n^2` and `l_r(w_0^P) = |S̄_p|n^2; ρ =` half-sum of `(Res_{F^+/Q}B)_E-positive` roots. `^rW` is identified with permutation matrices in `G̃(F_p^+) = ∏_{ṽ∈S̃_p} GL_{2n}(F_ṽ); G̃(F_p^+) = ⊔_{w∈^rW^P} P(F_p^+) w B(F_p^+)` Borel–Tits, Corollary 5.20. For `w ∈ ^rW^P: S_w = P(F_p^+) w N(F_p^+), S_w° = P(F_p^+) w N(O_{F^+,p}) ⊂ S_w`; the closure of `S_w` is `⊔_{w'≤w} S_{w'}` (Bruhat order on `^rW^P`), and `w' < w ⇒ l_r(w') < l_r(w)`. For `i ≥ 0, G̃_{≥i} = ⊔_{w∈^rW^P, l_r(w)≥i} S_w` is open in `G̃(F_p^+)`, left `P(F_p^+)-` and right `B(F_p^+)-invariant`.

([ACC](#source-acc), §5.3, pp. 1003–1004). *Needs:* `Layer 1`; `Layer 3`; `Tau Ceti ReductiveGroups L7`.

Its interface includes:

- `RelativeBruhatCells.cell``: S_w=P(F_p⁺)wN(F_p⁺)`, and `S_w°` uses `N(O_{F⁺,p})`.
- `RelativeBruhatCells.lengths`: Relative length sums one inversion count per `p`-adic place; absolute length multiplies each by its local degree.
- `RelativeBruhatCells.open_union`: The union of cells of relative length `≥i` is open.
- `RelativeBruhatCells.longest`: The longest shuffle has absolute length `n²[F⁺:Q]` and relative length `n²#S̄_p`.

**Checks.**

- A single split `GL₂` factor has relative cell lengths 0 and 1.
- The identity representative has both lengths zero.
- For one `p`-adic place of local degree 2 and `n=1`, longest relative length is 1 but absolute length is 2.

<a id="bruhat-cell-induction"></a>

### 3.24 Bruhat cell induction

Define `BruhatCellInduction`. `Ind_{P(F_p^+)}^{G̃(F_p^+)}: Mod_sm(O/ϖ^m[P(F_p^+)]) → Mod_sm(O/ϖ^m[G̃(F_p^+)])` is exact and preserves injectives (right adjoint of the exact restriction). For `i ≥ 0`, define `I_{≥i}: Mod_sm(O/ϖ^m[P(F_p^+)]) → Mod_sm(O/ϖ^m[B(F_p^+)])` by the locally constant functions `f: G̃_{≥i} → π` compactly supported modulo `P(F_p^+)` and satisfying `f(pg) = p f(g)` for `p ∈ P(F_p^+), g ∈ G̃_{≥i}` with `B(F_p^+)` acting by right translation; for `w ∈ ^rW^P, I_w(π)` is defined the same way with `S_w` in place of `G̃_{≥i}; I_w°: Mod_sm(O/ϖ^m[P(F_p^+)]) → Mod_sm(O/ϖ^m[B(F_p^+)^+])` sends `π` to the subspace of `I_w(π)` of functions supported in `S_w°`.

([ACC](#source-acc), §5.3, pp. 1003–1004). *Needs:* `Layer 3`; `SmoothMonoidModules`; `SR:SR.0d`; `SR:SR.2.1`.

Its interface includes:

- `BruhatCellInduction.section`: Sections are locally constant `P`-equivariant functions with compact support modulo `P` on the specified cell or open union.
- `BruhatCellInduction.right_action``: B` acts by right translation; on the compact chart use `B⁺`.
- `BruhatCellInduction.restriction`: Restriction to a length-i layer induces the maps in the exact Bruhat-filtration sequence.
- `BruhatCellInduction.compact_inclusion`: Extension by zero includes functions supported in `S_w°` into those on `S_w`.

**Checks.**

- `BruhatCellInduction.zero_module` (degenerate): Inducing the zero coefficient module gives zero in each chart.
- `BruhatCellInduction.outside_support` (computation): The extension-by-zero compact-chart section evaluates to zero outside `S_w°`.
- `BruhatCellInduction.equivariance` (non-example): A locally constant function violating `f(pg)=p f(g)` is not a section, even if its support is compact modulo `P`.

<a id="bruhat-filtration"></a>

### 3.25 Bruhat filtration

Prove `bruhat_filtration`. (1) `I_{≥0}` is the restriction from `G̃(F_p^+)` to `B(F_p^+)` of the parabolic induction `Ind^{G̃(F_p^+)}_{P(F_p^+)}`. (2) The functors `I_{≥i}, I_w` and `I_w°` are exact. (3) For `i ≥ 0` and `π` in `Mod_sm(O/ϖ^m[P(F_p^+)])`, restricting functions from the open set `G̃_{≥i}` to the cells of relative length exactly `i` gives a short exact sequence, natural in `π`, with kernel `I_{≥i+1}(π)`, middle term `I_{≥i}(π)` and quotient `⊕_{w∈^rW^P, l_r(w)=i} I_w(π)`. Consequently, for `π` in `D_sm(O/ϖ^m[P(F_p^+)])` these form a distinguished triangle `I_{≥i+1}(π) → I_{≥i}(π) → ⊕_{l_r(w)=i} I_w(π) → I_{≥i+1}(π)[1]` in `D_sm(O/ϖ^m[B(F_p^+)])`, natural in `π` (ACC (5.3.2)).

([ACC](#source-acc), §5.3, Proposition 5.3.1 and (5.3.2), pp. 1004–1005). *Needs:* `Layer 3`.

*Route.* Filter parabolic induction by the open union of Bruhat cells of relative length at least `i`. Restriction to the layer of length `i` gives the exact sequence with direct sum of `I_w`. Apply it degreewise to bounded-below complexes and use the induced distinguished triangles.

<a id="bruhat-invariant-filtration"></a>

### 3.26 Bruhat invariant filtration

Prove `bruhat_invariant_filtration`. Let `π ∈ D_sm(O/ϖ^m[P(F_p^+)])` be bounded below, `b ≥ 0` and `λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)}`. For every `i ≥ 0` and `j ∈ Z` the sequence `0 → R^jΓ(B(O_{F^+,p})(b), O(w_0^G̃ λ̃) ⊗_O I_{≥i+1}(π)) → R^jΓ(B(O_{F^+,p})(b), O(w_0^G̃ λ̃) ⊗_O I_{≥i}(π)) → R^jΓ(B(O_{F^+,p})(b), ⊕_{w∈^rW^P, l_r(w)=i} O(w_0^G̃ λ̃) ⊗_O I_w(π)) → 0` in `Mod(O/ϖ^m[T(F_p^+)^+_b])` associated with (ACC (5.3.2)) is (short) exact.

([ACC](#source-acc), §5.3, Lemma 5.3.3, pp. 1005–1006). *Needs:* `Layer 3`.

*Route.* Use compact-open chart sections to prove surjectivity after the required `B(O)(b)-invariants`. Take ordinary localization, retaining the filtration rather than asserting a canonical splitting.

<a id="bruhat-unipotent-acyclicity"></a>

### 3.27 Bruhat unipotent acyclicity

Prove `bruhat_unipotent_acyclicity`. For `w ∈ ^rW^P`, the functor `I_w°` takes injective objects of `Mod_sm(O/ϖ^m[P(F_p^+)])` to `Γ(N(O_{F^+,p}),−)-acyclic` objects.

([ACC](#source-acc), §5.3, Lemma 5.3.4(1), p. 1006). *Needs:* `Layer 3`; `SmoothMonoidModules`; `SR:SR.0d`.

*Route.* Write the compact Bruhat chart as a compact induction compatible with `N(O)`. Use the right adjoint to evaluation and smooth injective acyclicity to kill higher `N(O)-cohomology`.

<a id="ordinary-compact-cell-comparison"></a>

### 3.28 Ordinary compact cell comparison

Prove `ordinary_compact_cell_comparison`. For `w ∈ ^rW^P` and `π ∈ D_sm(O/ϖ^m[P(F_p^+)])` bounded below there is a natural isomorphism `ord RΓ(N(O_{F^+,p}), I_w°(π)) ≅ ord RΓ(N(O_{F^+,p}), I_w(π))`; equivalently `ord RΓ(N(O_{F^+,p}), J_w(π)) = 0` for `J_w = I_w/I_w°`.

([ACC](#source-acc), §5.3, Lemma 5.3.4(2), pp. 1006–1007). *Needs:* `Layer 3`.

*Route.* Under iteration of the contracting torus element, the complement of the compact Bruhat chart leaves every compact support. Its cohomology is locally nilpotent; ordinary localization removes it.

**Cell evaluation and orientation**

Evaluation at a Bruhat representative identifies the derived compact-unipotent invariants. The orientation character uses the `p`-adic absolute value as a rational scalar, and the conjugation twist is recorded separately. Together these give each ordinary graded piece.

<a id="bruhat-unipotent-invariants"></a>

### 3.29 Bruhat unipotent invariants

Define `BruhatUnipotentInvariants`. For `w ∈ ^rW^P, N_w := P(F_p^+) ∩ w N(O_{F^+,p}) w^{-1}`, a compact subgroup of `P(F_p^+)` containing `N_n(O_{F,p})`. `Γ(N_w,−): Mod_sm(O/ϖ^m[P(F_p^+)]) → Mod_sm(O/ϖ^m[T(F_p^+)^+])`, with `t ∈ T(F_p^+)^+` acting by `t·v = tr_{t^w N_w (t^w)^{-1} / N_w}(t^w v)`, where `t^w = w t w^{-1}` (this makes sense since `t^w N_w (t^w)^{-1} = P(F_p^+) ∩ w t N(O_{F^+,p}) t^{-1} w^{-1} ⊂ N_w`); moreover `w T(F_p^+)^+ w^{-1} ⊂ T_n(F_p)^+`.

For `H = t^w N_w (t^w)^{-1} ⊆ N_w`, the trace in this formula is the map `Γ(H,−) → Γ(N_w,−), v ↦ ∑_{g∈N_w/H}` gv. The coset sum uses the larger group modulo the smaller one, fixing the direction of the source's subscript convention.

([ACC](#source-acc), §5.3, p. 1007). *Needs:* `Layer 3`.

Its interface includes:

- `BruhatUnipotentInvariants.subgroup``: N_w=P∩wN(O)w^{-1}`.
- `BruhatUnipotentInvariants.transfer`: For `t` the transfer uses `t^w=wtw^{-1}` and the finite-index subgroup `t^wN_w(t^w)^{-1}`.
- `BruhatUnipotentInvariants.evaluation`: Evaluation at `w` identifies the derived compact-cell `N`-invariants with `RΓ(N_w,π)`.
- `BruhatUnipotentInvariants.map`: A smooth P-map induces the corresponding invariant and derived invariant maps.

**Checks.**

- `BruhatUnipotentInvariants.zero` (degenerate): The invariant functor sends the zero module to zero.
- `BruhatUnipotentInvariants.identity_w` (computation): For `w=1` the subgroup is `P∩N(O)`.
- `BruhatUnipotentInvariants.index_p_transfer` (non-example): On a trivial `F_p`-module a transfer over index `p` is zero, not the naive identity torus action.

<a id="bruhat-evaluation-comparison"></a>

### 3.30 Bruhat evaluation comparison

Prove `bruhat_evaluation_comparison`. For `w ∈ ^rW^P` and `π ∈ D_sm(O/ϖ^m[P(F_p^+)])` bounded below there is a natural isomorphism `RΓ(N(O_{F^+,p}), I_w°(π)) ≅ RΓ(N_w, π)` (compatible with the `T(F_p^+)^+-actions`), induced by `f ↦ f(w)`.

([ACC](#source-acc), §5.3, Lemma 5.3.5 and (5.3.6), pp. 1007–1008). *Needs:* `Layer 3`.

*Route.* Evaluate a Bruhat-cell function at `w` and identify the stabilizer `N_w`. Compare injective resolutions and compute the conjugated transfer torus action; it is not the naive torus action.

<a id="bruhat-orientation-character"></a>

### 3.31 Bruhat orientation character

Define `BruhatOrientationCharacter`. For `w ∈ ^rW^P, χ_w: T(F_p^+) → O^×` is `χ_w(t) = N_{F_p^+/Q_p} det_{F_p^+}(Ad(t^w)|_{Lie U(F_p^+) ∩ w N(F_p^+) w^{-1}})^{-1} / |N_{F_p^+/Q_p} det_{F_p^+}(Ad(t^w)|_{Lie U(F_p^+) ∩ w N(F_p^+) w^{-1}})|_p`. There is an isomorphism `O(χ_w) ≅ O(−ρ + w^{-1} w_0^P(ρ)) ⊗_O O(α_w)` of `O[T(F_p^+)]`-modules, where `w_0^P = w_0^G w_0^G̃` is the longest element of `^rW^P` and `α_w: T(F_p^+) → O^×` is trivial on `T(O_{F^+,p})` and agrees with `χ_w` on every `ι_v^{-1}(diag(ϖ_v^{a_1},…,ϖ_v^{a_{2n}})) (a_i ∈ Z)`. `τ_w: Mod_sm(O/ϖ^m[T_n(F_p)]) → Mod_sm(O/ϖ^m[T_n(F_p)])` sends `π` to `π` with `t` acting as `π(t^{w^{-1}})`.

([ACC](#source-acc), §5.3, p. 1008). *Needs:* `Layer 3`.

Its interface includes:

- `BruhatOrientationCharacter.formula`: For `a(t)=N det Ad(t^w)` on the indicated unipotent Lie space, `χ_w(t)=a(t)^{-1}/|a(t)|_p`.
- `BruhatOrientationCharacter.unit_part`: Its algebraic character is `−ρ+w^{-1}w₀^Pρ; α_w` is the residual unramified character.
- `BruhatOrientationCharacter.uniformizer_part``: α_w` is trivial on units and agrees with `χ_w` on chosen diagonal uniformizer powers.
- `BruhatOrientationCharacter.twist``: τ_w` precomposes the torus action with `t↦t^{w^{-1}}`.

**Checks.**

- For a zero-dimensional unipotent Lie space, `χ_w=1`.
- For a one-dimensional rational root with Ad scalar `u∈Z_p×, χ_w(u)=u^{-1}`.
- For the same rational root with scalar `p, χ_w(p)=1` because the `p`-adic norm factor cancels `p^{-1}`.
- At `p=2`, the rational unit `−1` gives `χ_w(−1)=−1`; reduction modulo 2 would lose this sign.

<a id="ordinary-unipotent-degree-shift"></a>

### 3.32 Ordinary unipotent degree shift

Prove `ordinary_unipotent_degree_shift`. Let `w ∈ ^rW^P` and `π ∈ D_sm(O/ϖ^m[G(F_p^+)])` bounded below. There is a natural isomorphism in `D_sm(O/ϖ^m[T_n(F_p)]) ord RΓ(N_w, Inf_{G(F_p^+)}^{P(F_p^+)} π) ≅ O/ϖ^m(χ_w) ⊗_{O/ϖ^m} τ_w^{-1} ord RΓ(N_n(O_{F,p}), π)[−[F^+:Q]n^2 + l(w)]`.

([ACC](#source-acc), §5.3, Lemma 5.3.7, pp. 1008–1010). *Needs:* `Layer 3`; `Layer 0`.

*Route.* Split `N_w` into the Levi part and its unipotent radical. Compute top continuous cohomology of that radical with its determinant orientation character. Apply ordinary localization and identify the cohomological shift `−n²[F⁺:Q]+l(w)` and the `τ_w^{-1}` twist.

<a id="ordinary-bruhat-piece"></a>

### 3.33 Ordinary Bruhat piece

Prove `ordinary_bruhat_piece`. Let `w ∈ ^rW^P` and `π ∈ D_sm(O/ϖ^m[G(F_p^+)])` bounded below. There is a natural isomorphism in `D_sm(O/ϖ^m[T_n(F_p)]) ord RΓ(N(O_{F^+,p}), I_w(Inf_{G(F_p^+)}^{P(F_p^+)} π)) ≅ O/ϖ^m(χ_w) ⊗_{O/ϖ^m} τ_{w^{-1}} ord RΓ(N_n(O_{F,p}), π)[−[F^+:Q]n^2 + l(w)] (τ_{w^{-1}} = τ_w^{-1})`.

([ACC](#source-acc), §5.3, Proposition 5.3.8, pp. 1010–1011). *Needs:* `Layer 3`.

*Route.* Combine compact-cell comparison, evaluation at `w` and the unipotent degree shift. Identify `χ_w` as the algebraic character `−ρ+w^{-1}w₀^Pρ` times `α_w`, trivial on torus units.

**Boundary degree shifting with ordinary coefficients**

The completed boundary retract gives a map onto the image of the unitary Satake action. Weight choice in rank at least two then moves the needed `GL_n` degrees to unitary middle degree. All further determinant transfer must respect the inclusion of that image.

<a id="completed-boundary-induction-retract"></a>

### 3.34 Completed boundary induction retract

Prove `completed_boundary_induction_retract`. Let `K̃ ⊂ G̃(A^∞_{F^+})` be a good subgroup decomposed with respect to `P (K = K̃ ∩ G(A^∞_{F^+}))`; let `𝔪 ⊂ T^S` be a non-Eisenstein maximal ideal and `𝔪̃ = S^*(𝔪) ⊂ T̃^S`. Then `Ind_{P(F_p^+)}^{G̃(F_p^+)} (Inf_{G(F_p^+)}^{P(F_p^+)} π(K^p,m)_𝔪)` is a `T̃^``S`-equivariant direct summand (`T̃^S` acting through `S`) of `π̃_∂(K̃^p,m)_{𝔪̃}` in `D_sm(O/ϖ^m[G̃(F_p^+)])`.

([ACC](#source-acc), §5.4, Theorem 5.4.1, pp. 1011–1013). *Needs:* `Layer 3`; `Layer 0`; `residual_unitary_galois_inputs`; `finite_coefficient_gln_galois_inputs`; `SR:SR.2.1`.

*Route.* Form the localized smooth towers by `CompletedArithmeticCohomology.residual_level_colimit` and its unitary support versions in §3.21. The levelwise residual projections commute with the boundary and Siegel maps; exact parabolic induction with compact quotient commutes with the colimit. Use the ALS non-Eisenstein boundary localization to isolate the Siegel stratum. Strong approximation makes the higher unipotent cohomology vanish in the level limit. Construct the actual inclusion and retraction of parabolic induction inside completed boundary cohomology.

<a id="ordinary-boundary-degree-shifting"></a>

### 3.35 Ordinary degree shifting

Prove `ordinary_boundary_degree_shifting`. Let `K̃` be good, decomposed with respect to `P`, with `K̃_v̄ = Ĩw_v̄` for `v̄ ∈ S̄_p`. Let `λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)}, w ∈ ^rW^P, λ_w = w(λ̃+ρ) − ρ ∈ (Z^n_+)^{Hom(F,E)}; 𝔪 ⊂ T^S` non-Eisenstein, `𝔪̃ = S^*(𝔪); c ≥ b ≥ 0` with `c ≥ 1`. Then for every `j ∈ Z, S` descends to a homomorphism, surjective onto the image of `T̃^{S,ord}` acting through `S, T̃^{S,ord}(H^j(∂X̃_{K̃(b,c)}, V_λ̃)^ord_{𝔪̃}) → T^{S,ord}(O(α_{w_0^G w w_0^G̃}) ⊗_O τ^{-1}_{w_0^G w w_0^G̃} H^{j−l(w)}(X_{K(b,c)}, V_{λ_w})^ord_𝔪)`.

([ACC](#source-acc), §5.4, Theorem 5.4.3, pp. 1013–1015). *Needs:* `Layer 3`.

*Route.* Apply the Bruhat filtration to that induced summand and compare ordinary pieces. Use `x=w₀^Gww₀^{G̃}`, with `l(x)=d−l(w)`, and the `χ_x` and `τ_x` twists. The chosen weight isolates the surviving constituent, giving the Hecke quotient in degree `j−l(w)`.

<a id="ordinary-ctg-weight-choice"></a>

### 3.36 Ordinary ctg weight choice

Prove `ordinary_ctg_weight_choice`. For a dominant `λ ∈ (Z^n_+)^{Hom(F,E)}` and an integer `a`, put `λ(a)_{τ,i} = λ_{τ,i} + a`. Assume `n ≥ 2` and fix `m ≥ 1`. There is a dominant `λ` such that (1) `O(λ)/ϖ^m ≅ O/ϖ^m` as `T_n(F_p)`-modules; (2) `Σ_{i=1}^n (λ_{τ,i} + λ_{τc,i})` is independent of `τ ∈ Hom(F,E)`; and (3) for each `i = 0,…,n²` there are `w_i = (w_{i,v̄})_{v̄∈S̄_p} ∈ ^rW^P`, `a_i ∈ (p−1)Z` and dominant `λ̃_i ∈ (Z^{2n}_+)^{Hom(F⁺,E)}` with (a) `CTGWeight(λ̃_i)`; (b) `l_r(w_{i,v̄}) = n² − i` at every `v̄`, hence `l(w_i) = [F⁺:Q](n² − i)`; and (c) `w_i(λ̃_i + ρ) − ρ = λ(a_i)`. Choose `M > 16n` divisible by `8(p−1)·#(O/ϖ^m)^×`. Set `λ_τ = (−nM, −2nM, …, −n²M)` for `τ ∈ Ĩ_p` and `λ_τ = (0, −M, …, (1−n)M)` for `τc ∈ Ĩ_p`; then `λ̃(a) = ((n−1)M − a, …, −a, −nM + a, …, −n²M + a)`. For `i > 0`, take `w_{i,v̄} = σ_{X_i}` with `X_i = {x+1,…,x+r, x+r+2,…,x+n+1}`, where `nx + n − r = n² − i` and `1 ≤ r ≤ n`. Let `a_i` be the unique integer in `[(nx+2n−r−1)M/2, (nx+2n−r)M/2]` congruent to `M/8 mod M/2`, and set `λ̃_i = w_i⁻¹(λ̃(a_i) + ρ) − ρ`. For `i = 0`, take the block-exchange shuffle `(n+1, …, 2n, 1, …, n)` with `x = r = n`. Prove dominance across the boundary between its two nonempty blocks.

([ACC](#source-acc), §5.4, Lemma 5.4.8 and (5.4.9)–(5.4.12), pp. 1015–1017). *Needs:* `Layer 1`; `Layer 3`.

*Route.* Choose `M>16n` divisible by `8(p−1)#(O/ϖ^m)×`. The displayed weight rows give the constant paired weight sum and trivial torus character modulo `ϖ^m`. For `1≤i≤n²` use the source’s n-subset shuffle and choose the unique `a_i` in its length-M/2 interval with `a_i≡M/8 (mod M/2)`. The shifted dominance inequalities differ by at most `2n−1`, so `M>16n` gives the required margins. For `i=0` use the block-exchange permutation; only the true boundary inequality is checked. All chosen `a_i` are divisible by `p−1`. CTG is a translate-split obstruction, hence a question about equal differences, not equal complementary sums. Before the final permutation, write the first row as `A_j=(n−1−j)M−a` and the second as `B_j=−n(j+1)M+a`, with `ρ_j=(2n−2j−1)/2`. Positive intrablock differences are `k(M+1)` and k(nM+1), `1≤k≤n−1`, and the two families are disjoint. The oriented mixed differences have residues `±M/4` modulo `M`, with perturbation at most `2n−1`; they meet neither intrablock family nor each other. Within each orientation their leading coefficient `nk−j (0≤j,k<n)` is injective, and `M>16n` prevents collisions. A translate splitting would pair all `2n` entries into `n` disjoint pairs with the same nonzero positive difference. A mixed difference occurs in only one pair. An intrablock difference cannot occur in the other block, so its pairs cannot cover all `2n` entries. This proves CTG for `n≥2` and remains true after permutation. The rank-one case must be handled separately.

<a id="ordinary-middle-degree-quotient"></a>

### 3.37 Ordinary middle degree quotient

Prove `ordinary_middle_degree_quotient`. Suppose `[F^+:Q] > 1` and `n ≥ 2`, and fix `m ≥ 1`. There exist a dominant `λ ∈ (Z^n_+)^{Hom(F,E)}` on whose `V_λ` a finite-index subgroup of `O_F^×` acts trivially and, for each `i = 0,…,n^2−1`, a CTG dominant weight `λ̃_i ∈ (Z^{2n}_+)^{Hom(F^+,E)}`, an integer `a_i` divisible by `p−1` and `w_i ∈ ^rW^P`, such that for every good `K̃ ⊂ G̃(A^∞_{F^+})` decomposed with respect to `P` with `K̃_v̄ = Ĩw_v̄ (v̄ ∈ S̄_p)`, all integers `c ≥ b ≥ 0` with `c ≥ 1`, and every non-Eisenstein `𝔪 ⊂ T^S` with `ρ̄_{𝔪̃}` decomposed generic `(𝔪̃ = S^*(𝔪))`: (1) `O(λ)/ϖ^m ≅ O/ϖ^m` as `O[T(F_p^+)]`-modules; (2) for each `i = 0,…,n^2−1, S` descends to an algebra homomorphism `T̃^{S,ord}(H^d(X̃_{K̃(b,c)}, V_{λ̃_i})^ord_{𝔪̃}) → T^{S,ord}(O(α_{w_i}) ⊗_O τ_{w_i}^{-1} H^{i[F^+:Q]}(X_{K(b,c)}, V_{λ(a_i)})^ord_𝔪)`, where `d = [F^+:Q]n^2`.

([ACC](#source-acc), §5.4, Proposition 5.4.13, pp. 1017–1018). *Needs:* `Layer 3`; `unitary_generic_vanishing` (§1.0).

*Route.* Apply the ordinary boundary degree-shifting result for the weights from Lemma 5.4.8. Its shuffle `u_i` has length `(n²−i)[F⁺:Q]`, while the character-index shuffle `w_i=w₀^G u_i w₀^{G̃}` has length `i[F⁺:Q]`; distinguish them and retain `α_{w_i}` and `τ_{w_i}^{−1}`. Import §1.0 concentration independently of Layer 1 and specialize `j` to the unitary middle degree `d`.

**The determinant torus and all degrees**

The determinant quotient has an archimedean component of dimension `f−1`. After a suitable neat-level shrinking, its cohomology separates from the determinant-one factor. The exterior grading supplies the remaining shifts with a Hecke-trivial torus action.

<a id="determinant-torus"></a>

### 3.38 Determinant torus

Define `DeterminantTorus`. For a good `K ⊂ GL_n(A_F^∞)`, define `A_K = F^×∖A_F^×/det(K) det(K_∞) R_{>0}`, with identity component `A_K°`. Mapping to `F^×∖A_F^×/det(K) F_∞^×` expresses this quotient as a real torus extension of the ray class group. The torus has dimension `[F⁺:Q]−1`, and its cocharacters are the lattice `F^×∩det(K)`, a torsion-free congruence subgroup of `O_F^×`. Set `Γ_{g,K}=GL_n(F)∩gKg^{−1}` for `g∈GL_n(A_F^∞)`. The dimensions are `dim X_K=d−1=[F⁺:Q]n²−1` and `dim A_K=[F⁺:Q]−1`.

([ACC](#source-acc), §5.4, pp. 1018, 1020). *Needs:* `Layer 0`.

Its interface includes:

- `DeterminantTorus.quotient`: The quotient is `F×∖A_F×/(det K·det K∞·R_{>0})`.
- `DeterminantTorus.component`: The identity component `A_K°` is the real torus of dimension `[F⁺:Q]−1`.
- `DeterminantTorus.determinant_map`: Determinant `X_K→A_K` induces the ray-class identification of connected components.
- `DeterminantTorus.level_change`: Inclusion `K′⊂K` induces the quotient map `A_{K′}→A_K` and commutes with determinant.

**Checks.**

- `DeterminantTorus.imaginary_quadratic` (computation): For `[F⁺:Q]=1` the identity component has dimension zero.
- `DeterminantTorus.degree_two` (computation): For `[F⁺:Q]=2` the identity component has dimension one.
- `DeterminantTorus.not_whole_class_group` (non-example): For `[F⁺:Q]>1` the quotient has a positive-dimensional torus; replacing it by the finite ray-class group loses that component.

<a id="determinant-component-product"></a>

### 3.39 Determinant component product

Prove `determinant_component_product`. (2) `det: X_K → A_K` is continuous and induces a bijection on sets of connected components (equivalently `det: G(F^+)∖G(A^∞_{F^+})/K → F^×∖(A_F^∞)^×/det(K)` is bijective, by strong approximation for `Res_{F/F^+} SL_n`). (3) If `g ∈ GL_n(A_F^∞)` satisfies `det(Γ_g) = det(F^× ∩ K)` and `Γ_g^1 = SL_n(F) ∩ Γ_g`, then the product map `Γ_g^1 × (F^× ∩ K) → Γ_g` is a group isomorphism; writing `X = X^1 × (∏_{v|∞} R_{>0})/R_{>0}` with `X^1 = SL_n(F_∞)/∏_{v|∞} SU(n)`, one gets `Γ_g∖X = (Γ_g^1∖X^1) × (F^× ∩ K)∖(∏_{v|∞} R_{>0})/R_{>0}`. (4) Under the same hypothesis `det: F^× ∩ K → F^× ∩ det(K)` is an isomorphism, the composite `Γ_g∖X ↪ X_K → A_K` is `(x,z) ↦ det(g) z^n`, and `z ↦ det(g) z^n` is an isomorphism from `(F^× ∩ K)∖(∏_{v|∞} R_{>0})/R_{>0}` onto the connected component `A_K^{[det(g)]}` of `A_K` containing `[det(g)]`. (`K` is neat.)

([ACC](#source-acc), §5.4, Lemma 5.4.14(2)–(4), pp. 1018–1019). *Needs:* `Layer 3`; `ALS:ALS.4`.

*Route.* The determinant identifies connected components with the ray-class quotient. Under neatness and `det Γ=det(F×∩K)`, split `Γ` into its determinant-one subgroup and central units. Identify the component product and compute determinant `(x,z)=det(g)z^n`.

<a id="determinant-neat-level-shrinking"></a>

### 3.40 Determinant neat level shrinking

Prove `determinant_neat_level_shrinking`. Let `K` be a good subgroup of `G(A^∞_{F^+}) = GL_n(A_F^∞)` and `T` a finite set of finite places of `F`. There is a good normal subgroup `K' ⊂ K` with `K'_T = K_T` such that `det(Γ_{g,K'}) = det(F^× ∩ K')` for all `g ∈ GL_n(A_F^∞)`. Construction: an ideal `𝔞` of `O_F` prime to `T` with `ker(O_F^× → (O_F/𝔞)^×)` torsion-free and contained in `F^× ∩ K` (Chevalley, Theorem 1); an ideal `𝔟` prime to `𝔞` and `T` with `ker(O_F^× → (O_F/𝔞𝔟)^×) ⊂ (ker(O_F^× → (O_F/𝔞)^×))^n; K' = ker(O_F^× → (O_F/𝔞)^×)·K(𝔞𝔟), K(𝔞𝔟) = K ∩` (principal congruence subgroup of level `𝔞𝔟`).

([ACC](#source-acc), §5.4, Lemma 5.4.15, pp. 1019–1020). *Needs:* `Layer 3`.

*Route.* Apply Chevalley congruence separation of units and shrink away from the prescribed finite set `T`. Make the determinant subgroup equal to the central-unit determinant subgroup, without changing any prescribed local factor.

<a id="central-torus-cohomology-shifting"></a>

### 3.41 Central torus cohomology shifting

Prove `central_torus_cohomology_shifting`. Let `K = K(b, c) ⊂ GL_n(A_F^∞)` be good with `K_v = Iw_v(b, c)` for `v | p` and `λ ∈ (Z^n_+)^{Hom(F,E)}`, and suppose (1) `det(Γ_g) = det(F^× ∩ K)` for all `g ∈ GL_n(A_F^∞)` and (2) `F^× ∩ K` acts trivially on `V_λ`. Then `R det_*(V_λ)` is constant on each connected component of `A_K` and `R det_*(V_λ) = ⊕_{i=0}^{dim X^1} R^i det_*(V_λ)[−i]`; there is a `T^{S,ord}-equivariant` isomorphism of graded `O`-modules `⊕_{i=0}^{dim X_K} H^i(X_K, V_λ) ≅ (⊕_{j=0}^{dim A_K°} H^j(A_K°, O)) ⊗_O (⊕_{k=0}^{dim X^1} H^0(A_K, R^k det_*(V_λ)))` (ACC (5.4.17)), with trivial Hecke action on the first factor. Consequently the image of `T^{S,ord}` in `End_O(⊕_{i=0}^{dim X_K} H^i(X_K, V_λ))` equals its image in `End_O(⊕_{i=0}^{n^2−1} H^{i[F^+:Q]}(X_K, V_λ))`.

([ACC](#source-acc), §5.4, Lemma 5.4.16 and (5.4.17), pp. 1020–1021). *Needs:* `Layer 3`; `ALS:ALS.4`.

*Route.* Use the component product to identify the determinant pushforward local system. Over the DVR split its bounded derived cohomology and use Künneth with the torus `A_K°` of dimension `[F⁺:Q]−1`. The Hecke action is trivial on the torus-cohomology factor; its image in all degrees equals the image in degrees `i[F⁺:Q]`. Retain the Iwahori-level condition needed to define ordinary cohomology.

### 3.41a Rational unitary ordinary Hecke semisimplicity

Prove `unitary_rational_ordinary_hecke_semisimple`. Under the hypotheses of `unitary_generic_vanishing`, take a CTG dominant unitary weight `λ̃`, a good level `K̃(b,c)` with `c≥b≥0`, `c≥1`, and the split `GL₂ₙ` factors at all places above `p` of the Layer 3 standing assumptions. Let

```text
H̃ = H^d(X̃_{K̃(b,c)},V_λ̃)^ord_{𝔪̃},
Ã_ord = image(T̃^{S,ord} → End_O H̃).
```

Then `H̃` is finite free over `O`, `Ã_ord` is finite `O`-flat and `Ã_ord[1/p]` is a finite product of finite extensions of `E` (zero if `H̃=0`). Its factors are the simultaneous ordinary Hecke eigencharacters in the cuspidal unitary Matsushima decomposition, with the ordered normalized operators and diamonds retained. This assertion concerns the image on middle cohomology, rather than the possibly nonreduced image on a derived complex.

([ACC](#source-acc), proof of Proposition 5.4.18, pp. 1023–1024, applying Geraghty 2019, Lemma 5.4; [Geraghty, 2010 manuscript](#source-geraghty), Lemma 5.1.1, p. 59.) *Needs:* `unitary_generic_vanishing`; `arithmetic_franke_inputs`; `ALS:ALS.5b`; `AG:AG2.2`; `SR:SR.1.4`.

*Route.* Middle-degree torsion-freeness gives flatness of the integral image. CTG and the rational automorphic comparison isolate the cuspidal terms. Apply rational ordinary Hecke semisimplicity on each split local `GL₂ₙ` factor and the commuting tame Hecke action, then take the finite image algebra. This input uses neither §3.43 nor §3.48.

**Checks.**

- A nonzero eigenspace of multiplicity greater than one still gives a field factor in the image; multiplicity does not create a matrix factor in the commutative Hecke algebra.
- The algebra `E[t]/(t²)` acting by a nonzero Jordan block is not semisimple. Mere commutativity of the operators does not establish this target.
- A torsion middle group would not embed into its rationalization; §1.0 rules it out before the `O`-flat image is used.

### 3.41b Unitary ordinary refinements and assembly

Prove `unitary_ordinary_refinement`. For each cuspidal ordinary eigensystem in §3.41a, apply the characteristic-zero unitary attachment of AG2.2–AG2.3. After finite coefficient enlargement, the rank-`2n` representation has an ordered full flag at every `v|p`. For a chosen lift `v` above a place of `F⁺`, its graded characters `ψ_{v,j}`, `1≤j≤2n`, satisfy

```text
ψ_{v,j}(Art_{F_v}(u)) = ε^{1−j}(Art_{F_v}(u))
  · ∏_{τ:F_v↪E} τ(u)^{−(w₀^{G̃}λ̃)_{τ|F⁺,j}} · ⟨diag(1,…,u,…,1)⟩,
ψ_{v,j}(Art_{F_v}(ϖ_v)) = ε^{1−j}(Art_{F_v}(ϖ_v)) · Ũ_{v,j}/Ũ_{v,j−1},
ψ_{vᶜ,j} = ψ_{v,2n+1−j}^{c,∨} ε^{1−2n},       Ũ_{v,0}=1.
```

In the diamond in row `j`, the unit `u` occupies position `j`; every eigenvalue is evaluated in the chosen factor of `Ã_ord[1/p]`. Units and the chosen uniformizer determine the character, and `ϖ_{vᶜ}=c(ϖ_v)` fixes the conjugate-place formula. These local characters and flags refine the actual AG2 attachment, independently of the rank-`n` ordinary theorem. The field-valued representations are ordinary and potentially semistable, with the labelled weights of `λ̃` under AG2.0's convention. Exact algebraic inertia gives semistability. Under the hyperspecial, unramified-`p` spherical hypotheses used in Layer 1, AG2.3 also gives crystallinity. At arbitrary Iwahori or deep level the conclusion retains potentially semistable ordinary flags and permits nonzero monodromy.

Assemble these representations over the finite product `Ã_ord[1/p]`, after the same coefficient enlargement, to obtain `ρ̃_ord`. Its good-place polynomial is `P̃_v(X)`, its local flags have the displayed characters, and its determinant is valued in the integral image `Ã_ord`. The ordered `2n`-fold product vanishes for arbitrary independent local arguments. Retain the character formulas and determinant under the coefficient comparison back to the original Hecke image. This supplies the characteristic-zero representation and integral determinant used by §3.42.

([ACC](#source-acc), Theorem 2.3.3 and proof of Proposition 5.4.18, pp. 1023–1025, especially (5.4.19), invoking Thorne 2015, Theorem 2.4.) *Needs:* `unitary_rational_ordinary_hecke_semisimple`; `AG:AG2.0`; `AG:AG2.2`; `AG:AG2.3`; `AG:AG2.6`; `LGD:§§1.7,0.3`; `IHG:Layer 0`.

*Route.* Apply the polarized/unitary characteristic-zero ordinary comparison to each cuspidal eigencharacter, using its split-place ordinary refinement. Multiply the field-valued attachments across the semisimple image. The flag implies the ordered product identity; determinant integrality follows from the integral Hecke image and dense good Frobenius polynomials as in ACC's use of Chenevier Example 2.32. The local flag comparison is a target here in addition to the supplied Hodge and WD comparisons.

**Checks.**

- A Tate-curve/Steinberg ordinary factor has nonzero monodromy. Its ordinary flag and character formulas are permitted at Iwahori level, but it is not crystalline.
- For `n=1` there are two characters; the uniformizer values are `Ũ_{v,1}` and `ε⁻¹(Art ϖ_v)Ũ_{v,2}/Ũ_{v,1}`. Their product is `ε⁻¹(Art ϖ_v)Ũ_{v,2}`.
- The conjugate-place identity reverses the flag indices and applies duality and `ε^{1−2n}`; using the same index on both sides changes the unit characters.
- With `2n` graded characters, the ordered product uses `2n` independent arguments. Knowledge of its characteristic polynomial at one argument does not imply that identity.

<a id="all-degree-ordinary-characteristic-data"></a>

### 3.42 All degree ordinary characteristic data

Prove `all_degree_ordinary_characteristic_data`. Suppose `[F^+:Q] > 1`. Let `K ⊂ GL_n(A_F^∞)` be good with `K_v = Iw_v` for `v ∈ S_p; c ≥ b ≥ 0` with `c ≥ 1; m ≥ 1; 𝔪 ⊂ T^S` non-Eisenstein, `𝔪̃ = S^*(𝔪)`. Suppose (1) `ρ̄_𝔪` is decomposed generic; (2) for every finite `v ∉ S` with residue characteristic `l`, either `S` contains no `l`-adic place of `F` and `l` is unramified in `F`, or `l` splits in some imaginary quadratic `F_0 ⊂ F`. Then there are `λ ∈ (Z^n_+)^{Hom(F,E)}` and `N ≥ 1` depending only on `[F^+:Q]` and `n` such that (1) `O(λ)/ϖ^m ≅ O/ϖ^m` as `O[T(F_p^+)]`-modules; (2) for each `i = 0,…,d−1` there are a nilpotent ideal `J_i ⊂ T^{S,ord}(H^i(X_{K(b,c)}, V_λ)^ord_𝔪)` with `J_i^N = 0` and a continuous `ρ_𝔪: G_{F,S} → GL_n(T^{S,ord}(H^i(X_{K(b,c)}, V_λ)^ord_𝔪)/J_i)` with (a) `det(X − ρ_𝔪(Frob_v)) =` image of `P_v(X)` for `v ∉ S; (b)` for `v | p` and `g ∈ G_{F_v}, det(X − ρ_𝔪(g)) = ∏_{j=1}^n (X − χ_{λ,v,j}(g)); (c)` for `v | p` and `g_1,…,g_n ∈ G_{F_v}, ρ_𝔪` maps `(g_1 − χ_{λ,v,1}(g_1))⋯(g_n − χ_{λ,v,n}(g_n))` to 0 in `M_n(…/J_i)`.

([ACC](#source-acc), §5.4, Proposition 5.4.18 and (5.4.19)–(5.4.23), pp. 1022–1026). *Needs:* `Layer 3`; `unitary_rational_ordinary_hecke_semisimple`; `unitary_ordinary_refinement`; `mathlib:Matrix.charpoly`; `CS:Layer 1`.

*Route.* For `n=1` use the Hecke-character/class-field correspondence directly, as the CTG construction in Lemma 5.4.8 requires `n≥2`. The remaining steps apply only when `n≥2`. Shrink the level by Lemma 5.4.15 and apply central-torus shifting to reach arbitrary degree. For each relevant degree use the middle-degree quotient and `unitary_rational_ordinary_hecke_semisimple` followed by `unitary_ordinary_refinement`. Their assembled representation and integral determinant supply the ordinary characters and ordered flags at the actual Iwahori level. Hyperspecial crystallinity from Layer 1 is not used here. Transfer the characteristic and ordered-product identities as polynomial-law identities through the Satake image inclusion and O-flat unitary coefficient algebra, then through the uniform nilpotent quotient. This transfer must use the inclusion of the Satake image; a quotient onto that image does not identify it with the entire `GL_n` ordinary Hecke algebra.

<a id="ordinary-local-global"></a>

### 3.43 Ordinary local–global compatibility

Prove `ordinary_local_global`. Assume the standing hypotheses of Layer 3 (`F` contains an imaginary quadratic field in which `p` splits; `ϖ_{v^c} = c(ϖ_v)`) and `[F^+:Q] > 1`. Let `K ⊂ GL_n(A_F^∞)` be a good subgroup with `K_v = Iw_v` for each `v ∈ S_p` (and `K_v = GL_n(O_{F_v})` for `v ∉ S`), let `c ≥ b ≥ 0` be integers with `c ≥ 1`, let `λ ∈ (Z^n_+)^{Hom(F,E)}` be a dominant weight, and let `𝔪 ⊂ T^S(K(b,c),λ)^ord` be a non-Eisenstein maximal ideal. Suppose (1) for every finite place `v ∉ S` with residue characteristic `l`, either `S` contains no `l`-adic place of `F` and `l` is unramified in `F`, or there is an imaginary quadratic `F_0 ⊂ F` in which `l` splits; (2) `ρ̄_𝔪` is decomposed generic. There is a bound `N=N(n,[F⁺:Q])≥1` and an ideal `J ⊂ T^S(K(b,c),λ)^ord_𝔪` with `J^N = 0`, and a continuous `ρ_𝔪: G_{F,S} → GL_n(T^S(K(b,c),λ)^ord_𝔪/J)` such that: (a) for every finite `v ∉ S, det(X − ρ_𝔪(Frob_v))` is the image of `P_v(X); (b)` for every `v ∈ S_p` and `g ∈ G_{F_v}, det(X − ρ_𝔪(g)) = ∏_{i=1}^n (X − χ_{λ,v,i}(g)); (c)` for every `v ∈ S_p` and `g_1,…,g_n ∈ G_{F_v}, (ρ_𝔪(g_1) − χ_{λ,v,1}(g_1))(ρ_𝔪(g_2) − χ_{λ,v,2}(g_2))⋯(ρ_𝔪(g_n) − χ_{λ,v,n}(g_n)) = 0`.

([ACC](#source-acc), §5.1, Theorem 5.5.1, p. 991; restated and proved in §5.5, pp. 1026–1027). *Needs:* `Layer 3`; `mathlib:Matrix.charpoly`; `CS:Layer 1`.

*Route.* Treat `n=1` by the Hecke-character/class-field correspondence; do not use the CTG weight construction at rank one. Reduce to the finite torsion Hecke images and `c=b≥m` by Hochschild–Serre and ordinary level control. Use ordinary weight control to replace `λ` by the specially chosen CTG weight of Proposition 5.4.18. Apply the all-degree integral characteristic data in degrees `q` and q+1 to the universal-coefficient short exact sequence; multiply nilpotent annihilators and recover both the characteristic polynomial and the ordered n-fold matrix identity.

**Checks.**

- For `n=2` the ordered identity is `(ρ(g₁)−χ₁(g₁))(ρ(g₂)−χ₂(g₂))=0` for arbitrary distinct arguments `g₁,g₂`; a factorization only at one `g` is insufficient.

**Automorphic ordinarity and Galois flags**

Ordinarily automorphic means that an automorphic witness has a nonzero ordinary Hecke eigenspace. The ordered Galois flag is a subsequent consequence under its residual hypotheses. Construct the automorphic-witness predicate first; its `local_flag` API is supplied by the later flag theorem. The soluble-transport input in Layer 2 is an independent prerequisite for the final field reduction.

<a id="iota-ordinary-automorphic-representation"></a>

### 3.44 ι-ordinary automorphic representation

Define `IotaOrdinary`. Let `F` be a number field (in the applications imaginary CM or totally real), `l` a prime, `ι: Q̄_l ≅ ℂ`, and `π` a regular algebraic automorphic representation of `GL_n(𝔸_F)` of weight a `∈ (ℤⁿ₊)^{Hom(F,ℂ)}: π_∞` has the infinitesimal character of `Ξ_a^∨` (AG2.0); for `λ = ι^{-1}a ∈ (ℤⁿ₊)^{Hom(F,Q̄_l)}` this is ACC’s weight `ιλ`, and `HT_τ(r_{l,ι}(π)) = {λ_{τ,i}+n−i}` when `r_{l,ι}(π)` exists. Fix a place `v | l`, a uniformizer `ϖ_v` and `b ≥ 1`, and let `Iw(v^{b,b}) = Iw_v(b,b) ⊂ GL_n(O_{F_v})` be the subgroup of matrices that are upper triangular unipotent modulo `ϖ_v^b` (Layer 3/iwahori-level-tower). On `(ι^{-1}π_v)^{Iw(v^{b,b})}` the double-coset operators `U^{(j)}_{ϖ_v} = [Iw(v^{b,b}) diag(ϖ_v·1_j, 1_{n−j}) Iw(v^{b,b})], j = 1,…,n`, commute, and the weight-normalized operators are `U^{(j)}_{λ,ϖ_v} = (∏_{τ:F_v↪Q̄_l} ∏_{i=1}^{j} τ(ϖ_v)^{−λ_{τ,n−i+1}}) U^{(j)}_{ϖ_v}`. The ordinary part `(ι^{-1}π_v)^{Iw(v^{b,b}),ord}` is the maximal subspace stable under every `U^{(j)}_{λ,ϖ_v}` on which all their eigenvalues are `l`-adic units; it does not depend on `ϖ_v`. `π` is `ι-ordinary` at `v` if this ordinary part is nonzero for some `b ≥ 1`, and `π` is `ι-ordinary` if it is `ι-ordinary` at every `v | l`. The diagonal torus `T_n(O_{F_v})` normalizes `Iw(v^{b,b})` and its diamond operators ⟨u⟩ commute with the `U^{(j)}_{λ,ϖ_v}`; their common eigenvalues on a nonzero ordinary part are the data `u^{(i)}_{λ,ϖ_v}` and `⟨u⟩_{ι,i}` of Geraghty’s 2010 Definition 5.1.4 (p. 60; later Definition 5.5) used in `ordinary_automorphic_galois_flag`. No polarization is assumed; BLGGT uses this notion for polarized `π`.

([Geraghty, 2010 manuscript](#source-geraghty), §5.1, Definition 5.1.2 and preceding formula, p. 60; [BLGGT](#source-blggt-published), §2.1, definition of `ι-ordinary, p`. 537 (PDF p. 37); [Qian](#source-qian), Definition 1.3, p. 1241 (NSF PDF p. 3), citing the later Geraghty Definition 5.3). *Needs:* `IwahoriLevelTower`; `SR:SR.1.4`; `AG:AG2.0`.

Its interface includes:

- `IotaOrdinary.normalizedOperator``: U^{(j)}_{λ,ϖ_v} = (∏_{τ:F_v↪Q̄_l} ∏_{i=1}^{j} τ(ϖ_v)^{−λ_{τ,n−i+1}}) U^{(j)}_{ϖ_v}` on `(ι^{-1}π_v)^{Iw(v^{b,b})}`; these operators commute.
- `IotaOrdinary.ordinaryPart`: The maximal subspace of `(ι^{-1}π_v)^{Iw(v^{b,b})}` stable under all `U^{(j)}_{λ,ϖ_v}` with only `l`-adic unit eigenvalues; it is the sum of the common generalized unit eigenspaces.
- `IotaOrdinary.uniformizer_independent`: For `ϖ_v′=uϖ_v` the normalized j-th operator changes by the weight unit `∏_τ∏_{i=1}^j τ(u)^{−λ_{τ,n−i+1}}` times the commuting diamond operator `⟨diag(u·1_j,1_{n−j})⟩`. The diamond order divides the exponent of `(O_{F_v}/ϖ_v^b)^×`; both factors have unit eigenvalues, so the ordinary part and `ι-ordinarity` are unchanged.
- `IotaOrdinary.level_independent``: π` is `ι-ordinary` at `v` if and only if for some `c ≥ b ≥ 0` with `c ≥ 1` the `Iw_v(b,c)-invariants` contain a common eigenvector of all `U^{(j)}_{λ,ϖ_v}` with unit eigenvalues (the formulation cited from Geraghty’s Definition 5.3).
- `IotaOrdinary.iff_local``: ι-ordinarity` at `v` depends only on `ι, π_v` and the weights `λ_τ` for the embeddings `τ` inducing `v`.
- `IotaOrdinary.twist`: For an algebraic Hecke character `ψ` of `F, π` is `ι-ordinary` if and only if `π ⊗ (ψ∘det)` is `ι-ordinary` (with its shifted weight).

**Checks.**

- `IotaOrdinary.gl_one` (computation): For `n = 1` every algebraic Hecke character `χ` of weight `λ` is `ι-ordinary` at every `v | l`: on the one-dimensional space the normalized operator acts by `ι^{-1}χ_v(ϖ_v)·∏_{τ:F_v↪Q̄_l} τ(ϖ_v)^{−λ_τ}`, which is the value of the `l`-adic character `r_{l,ι}(χ)` at `Art_{F_v}(ϖ_v)`, an `l`-adic unit.
- `IotaOrdinary.supersingular` (non-example): Let `π` be the cuspidal representation of `GL_2(𝔸_Q)` of weight (0,0) attached to an elliptic curve `E/Q` with good reduction at `l ≥ 5` and `a_l(E) = 0`. The eigenvalues of `U^{(1)}_{λ,l}` on `π_l^{Iw(l^{1,1})}` are the two roots of `X² − a_l(E)X + l = X² + l`, of `l`-adic valuation 1/2, so `π` is not `ι-ordinary` at `l`.
- `IotaOrdinary.unnormalized_fails` (non-example): Omitting the weight normalization is wrong: for `n = 1, F_v = Q_l` and an algebraic Hecke character of weight `λ_τ = 3` at the embedding inducing `v`, the unnormalized eigenvalue `ι^{-1}χ_v(l)` has `l`-adic valuation 3, although `χ` is `ι-ordinary`.
- `IotaOrdinary.finite_twist` (compatibility): For a finite-order Hecke character `ψ, π ⊗ (ψ∘det)` has the same weight and the normalized `U^{(j)}` eigenvalues of `π` multiplied by the roots of unity `ψ_v(ϖ_v)^j` on the same `Iw(v^{b,b})-invariants` once `b` exceeds the conductor of `ψ_v`; hence it is `ι-ordinary` exactly when `π` is.
- `IotaOrdinary.tame_uniformizer_change` (non-example): Take `n=1, F=ℚ, l=5, b=1`, weight zero and a quartic finite-order Hecke character of conductor 5. On its `Iw(5^{1,1})-invariants`, changing the uniformizer 5 to 10 multiplies the operator by the character value at 2, a primitive fourth root of unity. The diamond operator therefore has order 4, not dividing `b=1`; ordinarity is unchanged.

<a id="ordinarily-automorphic-representation"></a>

### 3.45 Ordinarily automorphic representation

Define `OrdinarilyAutomorphic`. Let `E` be an imaginary CM or totally real field, `l` a prime and `ι: Q̄_l ≅ ℂ`. For an attached representation `r_{l,ι}(π)` supplied with its attachment contract, a continuous representation `r: G_E → GL_n(Q̄_l)` is `ι-ordinarily` automorphic (of weight `ιλ`) if `r ≅ r_{l,ι}(π)` for a regular algebraic cuspidal automorphic representation `π` of `GL_n(𝔸_E)` (of weight `ιλ`) that is `ι-ordinary` at every place `v | l` (Layer 3/iota-ordinary-automorphic-representation). A residual representation `r̄: G_E → GL_n(F̄_l)` is `ι-ordinarily` automorphic if it has a lift `r ≅ r_{l,ι}(π)` with `π` regular algebraic cuspidal and `ι-ordinary` at every `v | l`. This is a condition on Hecke eigenvalues of `π_v`, not on `r|G_{E_v}`: ordinarity of `r|G_{E_v}` for `v | l` does not replace it (Qian Remark 4.4, whose deduction of automorphic ordinarity uses polarizability). The conclusion of ACC `ordinary_automorphy_lifting` is that `ρ` is `ι-ordinarily` automorphic of weight `ιλ`.

([Qian](#source-qian), Definition 1.3, p. 1241 (NSF PDF p. 3)). *Needs:* `Layer 3`; `AG:AG2.6`; `AG:AG2.7`; `AG:AG2.0`.

Its interface includes:

- `OrdinarilyAutomorphic.lift`: A witness consists of a regular algebraic cuspidal `π, ι-ordinary` at every `v | l`, and an isomorphism `r ≅ r_{l,ι}(π)`.
- `OrdinarilyAutomorphic.residual`: If `r` is `ι-ordinarily` automorphic then so is its semisimplified reduction `r̄`, with the same witness `π`.
- `OrdinarilyAutomorphic.twist`: For `χ=r_{l,ι}(ψ)` supplied as the `l`-adic realization of an algebraic Hecke character `ψ` of `E`, with the attachment/tensor compatibility, `r` is `ι-ordinarily` automorphic if and only if `r ⊗ χ` is, with the shifted weight.
- `OrdinarilyAutomorphic.local_flag`: For `E` imaginary CM, if `r` is `ι-ordinarily` automorphic of weight `ιλ` and `r̄` is irreducible and decomposed generic, then `r|G_{E_v}` is ordinary of weight `λ` for every `v | l` by Layer 3/ordinary-automorphic-galois-flag (`ordinary_automorphic_galois_flag`). This API item does not assert a totally real local–global theorem.

**Checks.**

- `OrdinarilyAutomorphic.gl_one` (computation): For `n = 1`, the `l`-adic realization `r_{l,ι}(χ)` of an algebraic Hecke character `χ` is `ι-ordinarily` automorphic, by `IotaOrdinary.gl_one`.
- `OrdinarilyAutomorphic.supersingular` (non-example): `H¹_ét(E_{Q̄}, Q̄_l)` for `E/Q` with good reduction at `l ≥ 5` and `a_l(E) = 0` is automorphic but not `ι-ordinarily` automorphic: by strong multiplicity one the only `π` with `r_{l,ι}(π) ≅ H¹(E)` is the one attached to `E`, which is not `ι-ordinary` at `l`.
- `OrdinarilyAutomorphic.ordinary_curve` (computation): For `E/Q` with good ordinary reduction at `l ≥ 3` (`a_l(E)` an `l`-adic unit), `H¹_ét(E_{Q̄}, Q̄_l)` is `ι-ordinarily` automorphic: the Iwahori `U_l-eigenvalues` of the attached `π_l` are the two roots of `X² − a_l(E)X + l`, exactly one of which is a unit.

<a id="twisted-steinberg-ordinarity-criterion"></a>

### 3.46 Twisted steinberg ordinarity criterion

Prove `twisted_steinberg_ordinarity_criterion`. Use geometric Artin reciprocity and `HT(ε_l) = {−1}`. Let `F` be a CM field, `n≥1, l` a prime, `ι: Q̄_l ≅ ℂ, v | l` a place of `F` with uniformizer `ϖ_v`, and `π` a regular algebraic cuspidal automorphic representation of `GL_n(𝔸_F)` of weight `ιλ` in the ACC convention with `λ_{τ,i} = c_τ` for all `i = 1,…,n` and all `τ: F_v ↪ Q̄_l` (so `HT_τ(r_{l,ι}(π)) = {c_τ, c_τ+1, …, c_τ+n−1}` when an attached representation is available). Suppose `π_v ≅ Sp_n(ψ_v|·|_v^{(1−n)/2})` for an unramified character `ψ_v` of `F_v^×`, and `val_l(ι^{-1}ψ_v(det α^{(j)}_{ϖ_v})) = val_l(∏_{τ:F_v↪Q̄_l} τ(ϖ_v)^{+jc_τ})` for every `0 ≤ j ≤ n`, where `α^{(j)}_{ϖ_v} = diag(ϖ_v·1_j, 1_{n−j})`. Then `π` is `ι-ordinary` at `v`. Since `det α^{(j)}_{ϖ_v} = ϖ_v^j` and `n>0`, the condition for `j = n` implies it for every `j`. Geraghty's 2010 Lemma 5.1.5 is the weight-zero case; Qian cites it in the later numbering as Lemma 5.6.

([Geraghty, 2010 manuscript](#source-geraghty), §5.1, Lemma 5.1.1, p. 59, and Lemma 5.1.5 and proof, p. 60; [Qian](#source-qian), proof of Lemma 4.3, p. 1273 (NSF PDF p. 35)). *Needs:* `IotaOrdinary`; `SR:SR.1.4`; `SR:SR.3.4`.

*Route.* Use the following exact local comparison from Geraghty Lemma 5.1.1. For a smooth admissible representation `σ` of `GL_n(K)` over an algebraically closed characteristic-zero field, `c≥b≥0` with `c>0`, upper unipotent `N` and diagonal `T`, the map `σ^{Iw(b,c)}→(σ_N)^{T(ϖ^b)}` is surjective. Here `σ_N` denotes unnormalized `N(K)-coinvariants`. Its kernel is the sum of simultaneous generalized eigenspaces on which some `U^{(j)}` is noninvertible. The double coset `U^{(j)}=[Iw(b,c)α^{(j)}Iw(b,c)]` corresponds to `δ_B(α^{(j)})⁻¹σ_N(α^{(j)})`, where `δ_B(t)=|det(Ad(t)|Lie N)|` and `δ_B(α^{(j)})=q_v^{−j(n−j)}`. The finite Iwahori decomposition identifies this double coset with Geraghty's `N(O_K)` double coset; no normalized-Jacquet half-modulus is inserted.

For `σ=ι⁻¹Sp_n(ψ_v|·|_v^{(1−n)/2})`, the unnormalized Jacquet module is `(ι⁻¹ψ_v∘det)δ_B` (the calculation in Geraghty's proof of Lemma 5.1.5). The `δ_B` factors cancel, so the invertible Iwahori eigenvalue is exactly `ι⁻¹ψ_v(ϖ_v)^j`, not just a scalar of unspecified slope. At `b=c=1` the usual Iwahori-fixed Steinberg line embeds in the chosen invariants and gives this nonzero eigenspace. For the constant weight `c_τ` the additional normalization is `∏_τ τ(ϖ_v)^{−jc_τ}`. Thus the hypothesis makes every normalized eigenvalue a unit. In Qian's application the `j=n` identity comes from the central-character slope identity; division by the positive integer `n` gives the other `j`. No polarization or global Galois attachment is needed for this local calculation.

**Checks.**

- For `n = 1` the criterion is `IotaOrdinary.gl_one`: an unramified character `ψ_v` with the displayed valuation is `ι-ordinary`.
- With `c_τ = 0` the hypothesis is `val_l(ι^{-1}ψ_v(ϖ_v)^n) = 0`, which the central-character identity gives automatically (`r_{l,ι}(φ_π)` then has Hodge–Tate weight 0); this recovers the weight-zero Steinberg remark of BLGGT §2.1 (Geraghty Lemma 5.1.5). Complex unitarity of `ψ_v` alone does not give the `l`-adic condition.
- For `GL₂(Q₅), j=1` and `ψ_v(5)=1, δ_B(diag(5,1))=1/5`. The Jacquet scalar 1/5 is multiplied by 5 to give `U^{(1)}=1`. Omitting `δ_B⁻¹` gives valuation `−1` and incorrectly excludes the weight-zero Steinberg representation.
- For `GL₂(Q₅), c=2` and `ψ_v(5)=25`, the eigenvalues are `U^{(1)}=25` and `U^{(2)}=625`. The normalized values are `5⁻²·25=1` and `5⁻⁴·625=1`. Reversing the sign of the weight factor gives 625 and 390625, both nonunits.

<a id="iota-ordinary-soluble-base-change"></a>

### 3.47 Iota ordinary soluble base change

Prove `iota_ordinary_soluble_base_change`. Let `F` be imaginary CM or totally real, `E/F` a finite soluble Galois extension with `E` imaginary CM or totally real, `ι: Q̄_p ≅ ℂ`, and `π, π_E` regular algebraic cuspidal automorphic representations of `GL_n(𝔸_F), GL_n(𝔸_E)` of weights `ιλ` and `ιλ_E (λ_{E,τ} = λ_{τ|F})` with `rec_{E_w}(π_{E,w}) ≅ rec_{F_v}(π_v)|_{W_{E_w}}` for every finite place `w | v` (as produced by Layer 2/soluble-base-change-and-descent). Then `π_E` is `ι-ordinary` at `w | p` if `π` is `ι-ordinary` at `v = w|_F`, and `π` is `ι-ordinary` at `v` if `π_E` is `ι-ordinary` at the places `w | v`. If every `p`-adic place of `F` splits completely in `E` then `π_{E,w} ≅ π_v` and `λ_E` at `w` is `λ` at `v`, so the equivalence at `w` is immediate from `IotaOrdinary.iff_local`; this is the case of the proof of `ordinary_automorphic_galois_flag`.

([Geraghty, 2010 manuscript](#source-geraghty), §5.1, Lemma 5.1.6 and proof, pp. 60–61; [ACC](#source-acc), §6.6.10, proof of Theorem 6.1.2, p. 1084; proof of Corollary 5.5.2, p. 1028, citing the later Lemma 5.7). *Needs:* `IotaOrdinary`; `Layer 2`; the Jacquet comparison of §3.46.

The primary lemma allows any finite soluble extension of number fields and `n≥1`. It assumes `π` regular algebraic cuspidal; ascent additionally assumes its base change is cuspidal. It states ascent at each `w|v` and descent already from one such `w`. Our CM/totally real, Galois and two-cuspidal hypotheses are a sufficient restriction of that statement, and give equivalence at each `w`. No unramifiedness, splitting at `p`, polarization or residual hypothesis is required for the ordinary comparison itself. Cuspidality of the desired base change is supplied separately by Layer 2.

*Route.* Cuspidal local components are generic. An ordinary generic `π_v` is an irreducible normalized parabolic induction of Steinberg segments built from characters, by Geraghty Lemma 5.1.3 and the generic multisegment classification. Local base change sends each character to its composition with `N_{E_w/F_v}`, and transports the Jacquet characters accordingly. Use the `δ_B⁻¹` comparison of §3.46 and pull back every labelled weight. With `val_p(p)=1` and residue degree `f_{w/v}>0, val_p(χ(N(ϖ_w)))=f_{w/v}val_p(χ(ϖ_v))`: the remaining unit has finite-order character value. The weight-normalizing valuation also scales by `f_{w/v}`, since there are `e_{w/v}f_{w/v}` extensions of each embedding and `val_p(ϖ_w)=val_p(ϖ_v)/e_{w/v}`. Thus each normalized slope scales by `f_{w/v}`, preserving the zero-slope condition in both directions.

For descent, this slope calculation alone is insufficient: one must first produce the downstairs Jacquet character. Geraghty's proof uses the distinct valuations of the ordinary upstairs Weil–Deligne Frobenius eigenvalues. Choose a power of Frobenius centralizing the finite inertial image. Its eigenvalues still have distinct valuations, so its one-dimensional eigenspaces are stable under both inertia and Frobenius. Thus the downstairs supercuspidal constituents are characters. The upstairs Jacquet module is then a subquotient of the norm-pullback of the downstairs module, and its ordinary character descends. This is the nonsplit argument. When `E_w=F_v`, the local representation and weight are unchanged and `IotaOrdinary.iff_local` gives the result directly.

**Checks.**

- If `E/F` is split at every `p`-adic place, `ι-ordinarity` of `π` at `v` and of `π_E` at each `w | v` coincide.
- No `ι-ordinarity` is asserted for a base change that is not cuspidal; irreducibility of `r_ι(π)|G_E` is a hypothesis of the supplier theorem.
- In an unramified quadratic extension of `Q₅` the residue degree is 2. A character slope a and weight slope `b` become `2a` and `2b; 2(a−b)=0` exactly when `a−b=0`. For `a=b=2` the normalized value `5⁻²·25=1` becomes `5⁻⁴·625=1`.
- In a totally ramified quadratic extension of `Q₅, f=1`. Each extended embedding contributes half the original uniformizer valuation and there are two of them; the total weight slope and the character norm slope are unchanged. Replacing the scaling factor by `[E_w:F_v]=2` would give the wrong individual slopes.

<a id="ordinary-automorphic-galois-flag"></a>

### 3.48 Ordinary Galois filtration

Prove `ordinary_automorphic_galois_flag`. Let `F` be an imaginary CM field (the standing hypotheses of Layer 3 are not assumed), `ι: Q̄_p ≅ C`, and `π` a cuspidal automorphic representation of `GL_n(A_F)`, regular algebraic of weight `ιλ` with `λ ∈ (Z^n_+)^{Hom(F,Q̄_p)}`. Suppose (1) `π` is `ι-ordinary` at every `v ∈ S_p` (Layer 3/iota-ordinary-automorphic-representation; Geraghty, Definition 5.3); (2) `r̄_ι(π)` is decomposed generic and irreducible. Then for every `v ∈ S_p, r_ι(π)|_{G_{F_v}}` is ordinary of weight `λ` (Geraghty, §5.2): `r_ι(π)|_{G_{F_v}}` is conjugate to an upper-triangular representation with diagonal characters `ψ_{v,1},…,ψ_{v,n}`, where `ψ_{v,i}(Art_{F_v}(u)) = ε^{1−i}(Art_{F_v}(u)) ∏_{τ∈Hom_{Q_p}(F_v,Q̄_p)} τ(u)^{−(w_0^G λ)_{τ,i}} ⟨u⟩_{ι,i} (u ∈ O_{F_v}^×)` and `ψ_{v,i}(Art_{F_v}(ϖ_v)) = ε^{1−i}(Art_{F_v}(ϖ_v)) u^{(i)}_{λ,ϖ_v}/u^{(i−1)}_{λ,ϖ_v}`, with `⟨u⟩_{ι,i}, u^{(i)}_{λ,ϖ_v}` the Hecke eigenvalues on the ordinary part `(ι^{-1}π_v)^ord` of IotaOrdinary.ordinaryPart (Geraghty, Definition 5.5).

([ACC](#source-acc), §5.5, Corollary 5.5.2, p. 1028). *Needs:* `Layer 3`; `Layer 2`; `mathlib:Matrix.charpoly`; `LGD:§§1.12–1.13,3.7,6.24,7.4–7.6`.

*Route.* Choose `F′ =` FE with `E/Q` soluble Galois and disjoint over `Q` from the Galois closure of `F^{ker r̄_ι(π)}(ζ_p)`, retaining the source’s prescribed split local completions and imaginary quadratic subfield. Apply genericity-normal-closure-restriction to preserve decomposed genericity and residual-lifting-hypothesis-restriction to preserve irreducibility; disjointness only over `F` from the residual kernel field does not by itself preserve genericity. Base change `π` to `F′` by `soluble_base_change_and_descent`(1). Every place of `S_p` splits completely in `F′`, so `π_{F′,w} ≅ π_v` and `π_{F′}` is `ι-ordinary` at every `w | p` (`iota_ordinary_soluble_base_change`, split case; ACC cites Geraghty Lemma 5.7). Apply `ordinary_local_global` over `F′`. Use the distinct-character flag criterion of LGD §7.4 to obtain the full ordinary filtration, then descend along the split local completions.

### Examples

The positive rank-two row (1,0) contracts upper unipotents; (0,1) fails. A degree-two local factor has longest relative length 1 and absolute length 2 at `n=1`. Transfer over index `p` on trivial `F_p` coefficients is zero. The orientation scalar `p` has character value 1.

### Dependencies

Layers 0–2; SR.0, SR.0d, SR.1.4, SR.2 and SR.3.4; IHG §2.3; RG2.3 and RG2.4; PF:Layer `0a`, ALS.4/ALS.5a/ALS.5b and AG2.0/AG2.2/AG2.3/AG2.5/AG2.6/AG2.7. Sections 3.41a–3.41b supply rational unitary ordinary semisimplicity and the ordinary-refinement/assembly extension of the characteristic-zero attachment, using LGD §§0.3 and 1.7 for its period consequences. The fixed-exponent smooth level-colimit and support comparisons are constructed in §§3.13 and 3.21 from ALS finite-level cohomology and SR.0d. Exact arithmetic comparisons and polynomial-law transfer have the supplier contracts above.

## Layer 4: Arithmetic deformation and support inputs

**Deformation actions on arithmetic Hecke algebras**

Attach the universal representations only after verifying their local deformation conditions. Both maps land in Hecke algebras modulo a uniformly nilpotent ideal. The ordinary complex retains the full torus algebra and its weight normalization.

### 4.0 Coefficient components and global deformation problems

Under the appropriate good-level profile, let `𝔪` be the maximal Hecke ideal given by the residual eigensystem of `π`, after enlarging `E` so that its residue field is `k`, and fix `ρ̄_𝔪≅r̄_ι(π)`. For each character tuple `χ=(χ_{v,i})` at `R`, put `𝒱_λ(χ⁻¹)=V_λ⊗_O O(χ⁻¹)`, with the two actions through the `p` and `R` factors of the level.

In the Fontaine–Laffaille branch define `𝒮_χ=(ρ̄_𝔪,S,(O)_{v∈S},(D_v))`: use the Fontaine–Laffaille lifting condition of weight `λ` at `p`, the inertial condition `D_v^χ` at `R`, and the unrestricted framed lifting condition `D_v^□` at `S−(R∪S_p)`. In particular the global determinant varies.

In the ordinary branch let `O_{F_v}^×(p)` denote the maximal pro-`p` quotient and put `Λ_{1,v}=O⟦(O_{F_v}^×(p))^n⟧`, `Λ₁=⊗̂_{v|p,O}Λ_{1,v}`. The ordered characters

```text
x ↦ ∏_{τ:F_v↪E} τ(x)^{−(μ_{ιτ,n−i+1}+i−1)},    1≤i≤n,
```

on the pro-`p` unit factors define `p_{μ,v}:Λ_{1,v}→O`. Evaluate these characters using the canonical identification of `O_{F_v}^×(p)` with the principal units, obtained by removing the prime-to-`p` Teichmüller factor. Let `℘_{0,v}` be the unique minimal prime contained in `ker p_{μ,v}`, set `Λ_v=Λ_{1,v}/℘_{0,v}` and `Λ=⊗̂_{v|p,O}Λ_v`, and use the natural quotient `Λ₁→Λ`. Choose `E` to split the finite `p`-power torsion unit characters. The torsion character fixes the minimal prime, while the torsion-free unit directions give a power-series algebra. Define `𝒮_χ=(ρ̄_𝔪,S,(Λ_v)_{v|p}∪(O)_{v∤p},(D_v))` with the determinant-ordinary condition over `Λ_v` at `p`, `D_v^χ` at `R`, and `D_v^□` elsewhere in `S`. The determinant-ordinary local condition retains its universal ordered characters; no global determinant is fixed. The root-of-unity condition on the lifting weight `λ` in §5.19 places `p_λ` on the same component as `p_μ`. In §4.3 the quotient `Λ₁→Λ_{1,c}` is induced by unit reduction to the diagonal congruence kernel modulo `ϖ_v^c`.

([ACC](#source-acc), §§6.5.1,6.6.1, pp. 1062,1076.) *Needs:* `LGD:§§1.12–1.13,3.7` (Fontaine–Laffaille quotients); `LGD:§2.15` (`D_v^χ`); `LGD:§§6.24,7.1–7.6` (torus component and determinant-ordinary quotients); `LGD:F.2–F.3` (unrestricted lifting and local conditions); `GGD:G8` (the variable-determinant global tuple).

**Checks.**

- For `R=∅` there is one character tuple, so `𝒮_χ=𝒮₁` within either branch; the local condition at `p` is still branch-specific.
- At `c=1` the diagonal congruence kernel is trivial, so `Λ_{1,1}=O`. This finite-level quotient differs from selecting a minimal prime of `Λ₁`.
- A cyclic `p`-power torsion unit factor has different characteristic-zero character components after splitting its roots of unity. Equality of the weight characters on these roots puts `λ` and `μ` on the same minimal prime; agreement modulo `ϖ` alone does not do so.

<a id="local-condition-mod-varpi-comparison"></a>

### 4.1 Local-condition comparison

Prove `local_condition_mod_varpi_comparison`. Under either full good-level hypothesis profile, choose pairwise distinct characters `χ_{v,i}:k(v)×→O×` at every `v∈R`, all congruent to 1 modulo `varpi`. The untwisted and `χ-twisted` coefficient complexes have a Hecke-equivariant derived isomorphism modulo `varpi`, and their finite local/global deformation rings reduce to the same deformation problem. At `p` the FL condition or the ordinary flag/determinant condition is identical on the two sides; away from `p` the LGD §2.15 unipotent/inertial-type reductions supply the comparison. Framing conventions and coefficient maps are the same on both sides. The global determinant varies, as in the source deformation problems; the ordinary local determinant condition is retained. A separate globally fixed-determinant variant requires its own presentation and dimension counts.

([ACC](#source-acc), §6.5.1, pp. 1062, 1068–1069 (variable-determinant `Sχ` and reduced coefficient comparison); §6.6.1, equation (6.6.4), p. 1077). *Needs:* `Layer 0`; `LGD:§2.15`; `LGD:§§7.1–7.6`; `LGD:§§1.12–1.13,3.7,6.24,7.4–7.6`; `GGD:G8`.

*Route.* Use the integral character-twist comparison for coefficient local systems. Use LGD §2.15 mod-varpi comparison at `R`, unchanged `p` conditions from LGD §§6.24 and 7.1–7.6 and unchanged unrestricted conditions elsewhere. Use G8 representability to identify the global mod-varpi problems; check universal representations and all local maps commute.

<a id="fontaine-laffaille-deformation-hecke-map"></a>

### 4.2 Fontaine–Laffaille deformation action

Prove `fontaine_laffaille_deformation_hecke_map`. Under the Fontaine–Laffaille good-level hypotheses, for each `χ` as above there are an integer `δ ≥ 1` depending only on `n` and `[F:ℚ]`, an ideal `J ⊂ T^S(RΓ(X_K, 𝒱_λ(χ^{-1})))_𝔪` with `J^δ = 0`, and a continuous surjection `f_{𝒮_χ}: R_{𝒮_χ} → T^S(RΓ(X_K, 𝒱_λ(χ^{-1})))_𝔪/J` such that for every finite place `v ∉ S` the characteristic polynomial of `f_{𝒮_χ} ∘ ρ_{𝒮_χ}(Frob_v)` is the image of `P_v(X)`.

([ACC](#source-acc), §6.5.1, Proposition 6.5.3, p. 1063). *Needs:* `fontaine_laffaille_local_global`; `local_condition_mod_varpi_comparison`; `AG:AG2.5`; `GGD:G8`.

Take the Galois representation valued in the Hecke algebra modulo a nilpotent ideal given by `fontaine_laffaille_local_global` (ACC Theorem 2.3.7 provides it in general), conjugated so that it reduces to `ρ̄_𝔪`; that theorem also gives the Fontaine–Laffaille condition at the places above `p`, and the inertial comparison of AG2.5, applied with the set of ramification `S ∪ S^c` and with `R = S − S_p`, gives the inertial characteristic polynomials at `R` and unramifiedness with the correct Frobenius polynomial at `S^c − S`. The universal property of `R_{𝒮_χ}` then gives `f_{𝒮_χ}`, with one nilpotence exponent `δ` for all the comparisons.

<a id="ordinary-hida-complex"></a>

### 4.3 Ordinary Hida complex

Define `OrdinaryHidaComplex`. For `c ≥ 1, Λ_{1,c} = 𝒪[∏_{v∈S_p} ker(T_n(𝒪_{F_v}/ϖ_v^c) → T_n(𝒪_{F_v}/ϖ_v))]`, a quotient of `Λ_1`, and `A_1(μ,χ,c) = RHom_{Λ_{1,c}}(RΓ(X_{K(c,c)}, 𝒱_μ(χ^{-1}))^{ord}, Λ_{1,c})[−d]`, a perfect complex in `D(Λ_{1,c})` on which `T^{S,ord}` acts by transpose. (ACC (6.6.3)): for `c′ ≥ c` there are `T^{S,ord}-equivariant` isomorphisms `A_1(μ,χ,c′) ⊗^L_{Λ_{1,c′}} Λ_{1,c} ≅ A_1(μ,χ,c)` in `D(Λ_{1,c})` (`ordinary_level_control`). (ACC (6.6.4)): canonical `T^{S,ord}-equivariant` isomorphisms `A_1(μ,χ,c) ⊗^L_{Λ_{1,c}} Λ_{1,c}/ϖ ≅ A_1(μ,1,c) ⊗^L_{Λ_{1,c}} Λ_{1,c}/ϖ`. By Khare–Thorne, Lemma 2.13 there is a perfect `A_1(μ,χ) ∈ D(Λ_1)` with `T^{S,ord}-action` and equivariant isomorphisms `A_1(μ,χ) ⊗^L_{Λ_1} Λ_{1,c} ≅ A_1(μ,χ,c)` (all `c ≥ 1`) and `A_1(μ,χ) ⊗^L_{Λ_1} Λ_1/ϖ ≅ A_1(μ,1) ⊗^L_{Λ_1} Λ_1/ϖ`, compatible with (ACC (6.6.3)) and with (ACC (6.6.4)) for varying `χ; A(μ,χ) = A_1(μ,χ) ⊗^L_{Λ_1} Λ ∈ D(Λ)`.

([ACC](#source-acc), §6.6.1, (6.6.3), (6.6.4), pp. 1076–1077). *Needs:* `Layer 3`; `mathlib:DerivedCategory`; `PF:Layer 0a`; `DP:Layer 7`; `DP:Layer 8`.

Its interface includes:

- `OrdinaryHidaComplex.finite``: A₁(μ,χ,c)=RHom_{Λ₁,c}(RΓ(X_{K(c,c)},V_μ(χ^{-1}))^ord,Λ₁,c)[−d]`.
- `OrdinaryHidaComplex.transition`: Derived tensor from `Λ₁,c′` to `Λ₁,c` gives the finite `c` complex for `c′≥c`.
- `OrdinaryHidaComplex.mod_varpi`: For `χ` congruent to 1 modulo `varpi`, the `χ` and 1 complexes agree after derived reduction.
- `OrdinaryHidaComplex.perfect_limit`: The DP Layer 7 reconstruction supplies a perfect `Λ₁-complex` with all these compatible finite specializations.

**Checks.**

- `OrdinaryHidaComplex.zero` (degenerate): The dual of the zero ordinary complex is zero.
- `OrdinaryHidaComplex.single_free_term` (computation): For the free module `Λ₁,c` in degree 0 the dual shifted by `−d` has its sole cohomology in degree `d`.
- `OrdinaryHidaComplex.derived_reduction` (compatibility): For a perfect finite complex, specializing the dual equals the dual of the specialized complex; underived reduction of cohomology is not substituted.

<a id="weight-independent-hida-twist"></a>

### 4.4 Weight independent Hida twist

Define `WeightIndependentHidaTwist`. `ν ∈ X^*((Res_{F/ℚ} T)_E) = (ℤ^n)^{Hom(F,E)}` is `ν_τ =` (0, `1, …, n−1`) for all `τ`. `B_1(μ,χ) = A_1(μ,χ) ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1}`, where `𝒪(ν + w_0^G μ)^{-1}` is the `𝒪[T_n(F_p)]`-module of §5.2.1 (the action of `T_n(𝒪_{F,p})` extending uniquely to `𝒪⟦T_n(𝒪_{F,p})⟧`); it is a perfect complex in `D(Λ_1)` with `T^{S,ord}-action`. `B(μ,χ) = B_1(μ,χ) ⊗^L_{Λ_1} Λ`. Write `κ=(ν+w₀^Gμ)⁻¹` for the twisting character. The torus action on `B₁` is diagonal: for `t`, it is `κ(t)` times the action on `A₁`. Equivalently it is restriction of scalars through the continuous automorphism `τ_κ([t])=κ(t)[t]` of `Λ₁`. The component and weight maps of §4.0 are applied to this twisted action. In particular `B` uses twist followed by the natural quotient `Λ₁→Λ`; twisting `A=A₁⊗^L_{Λ₁}Λ` afterwards does not give this `Λ`-object unless the component ideal and scalar map are transported through `τ_κ`.

([ACC](#source-acc), §6.6.1, p. 1077). *Needs:* `Layer 4`; `Layer 3`.

Its interface includes:

- `WeightIndependentHidaTwist.nu``: ν_{τ,i}=i−1` for one-based `i`.
- `WeightIndependentHidaTwist.formula``: B₁=A₁⊗O(ν+w₀μ)^{-1}`, and `B=B₁⊗^L_{Λ₁}Λ`.
- `WeightIndependentHidaTwist.hecke`: Transpose Hecke away from `S` is preserved under the tensor twist.
- `WeightIndependentHidaTwist.component_specialization`: Form the diagonal twist over `Λ₁` before quotienting by the component ideal, retaining the quotient scalar action. Finite quotients used in a comparison are transported through `τ_κ`.
- `WeightIndependentHidaTwist.weight_compare`: For all dominant `μ,μ′` the complexes `B₁(μ,χ),B₁(μ′,χ)` are equivariantly isomorphic by `hida_weight_independence`.

**Checks.**

- For `n=1, μ=0, ν=0` so the twist is trivial.
- For `n=2, μ=0, ν=(0,1)` and the twist is `O(0,1)^{-1}`, not the trivial character.
- For `μ=(2,0), ν+w₀μ=(0,3)`, fixing both the reversal and `ν` shift.
- `WeightIndependentHidaTwist.torsion_component`: take `Λ₁=O[C_p]`, generator `t`, a primitive `ζ_p∈O`, `κ(t)=ζ_p`, `Λ=Λ₁/(t−ζ_p)` and `A₁=Λ₁`. In `B=(A₁⊗O(κ))⊗^L_{Λ₁}Λ`, `t` acts by `ζ_p`. In `(A₁⊗^L_{Λ₁}Λ)⊗O(κ)` with diagonal action it acts by `ζ_p²≠ζ_p`, so that action does not factor through the same quotient. Power-series variables do not change the test.
- For `κ=1` the automorphism is the identity, and the two orders of specialization coincide.

<a id="hida-weight-independence"></a>

### 4.5 Hida weight independence

Prove `hida_weight_independence`. For every `μ′ ∈ (ℤ^n_+)^{Hom(F,E)}` there is a `T^{S,ord}-equivariant` isomorphism `B_1(μ,χ) ≅ B_1(μ′,χ)` in `D(Λ_1)`.

([ACC](#source-acc), §6.6.1, Lemma 6.6.5, p. 1077). *Needs:* `WeightIndependentHidaTwist`; `OrdinaryHidaComplex`; `completed_ordinary_weight_control`; `DP:Layer 7`.

Completed ordinary cohomology does not depend on the weight after the twist by `O(w₀μ)` (`completed_ordinary_weight_control`); the twist by `O(ν + w₀μ)⁻¹` removes the weight from the torus action at every finite level `c`, and the perfect inverse-limit reconstruction of DP:Layer 7 (as in Khare–Thorne, Lemma 2.13) assembles the finite-level isomorphisms.

<a id="hida-weight-specialization"></a>

### 4.6 Hida weight specialization

Prove `hida_weight_specialization`. For `μ′ ∈ (ℤ^n_+)^{Hom(F,E)}` there is a `T^{S,ord}-equivariant` isomorphism in `D(𝒪): B_1(μ,χ) ⊗^L_{Λ_1} 𝒪(ν + w_0^G μ′)^{-1} ≅ A_1(μ′,χ,1) ⊗_𝒪 𝒪(ν + w_0^G μ′)^{-1}`.

([ACC](#source-acc), §6.6.1, Corollary 6.6.6, pp. 1077–1078). *Needs:* `hida_weight_independence`; `OrdinaryHidaComplex`.

By `hida_weight_independence` it suffices to treat `μ′ = μ`, where the left side is `A₁(μ,χ) ⊗^L_{Λ₁} O ⊗_O O(ν + w₀μ)⁻¹` and the derived specialization of the perfect complex is the finite complex at level `c = 1`.

**Ordinary diamonds and patching**

The ordinary auxiliary complex carries both its finite torus algebra and its diamond action. Pass to the c-limit with derived reductions intact, and verify diamond linearity before applying the abstract patching construction.

<a id="ordinary-deformation-hecke-map"></a>

### 4.7 Ordinary deformation action

Prove `ordinary_deformation_hecke_map`. Let `T^{S,Λ_1} = T^S ⊗_𝒪 Λ_1 ⊂ T^{S,ord}`. There are `δ ≥ 1` depending only on `n` and `[F:ℚ]`, an ideal `J ⊂ T^{S,Λ_1}(B(μ,χ)_𝔪)` with `J^δ = 0`, and a continuous surjective `Λ`-algebra homomorphism `f_{𝒮_χ}: R_{𝒮_χ} → T^{S,Λ_1}(B(μ,χ)_𝔪)/J` such that for every finite `v ∉ S` the characteristic polynomial of `f_{𝒮_χ} ∘ ρ_{𝒮_χ}(Frob_v)` is the image of `P_v(X)`.

([ACC](#source-acc), §6.6.1, Proposition 6.6.7, p. 1078). *Needs:* `Layer 3`; `Layer 4`; `AG:AG2.5`; `LGD:§§7.1–7.6`; `GGD:G8`.

At finite levels construct the ordinary Galois actions as in `fontaine_laffaille_deformation_hecke_map`, using `ordinary_local_global` and LGD §§7.1–7.6. Carayol’s lemma (Clozel–Harris–Taylor, Lemma 2.1.10) puts the image in a nilpotent quotient of the smaller algebra. Transpose on the reconstructed `A₁`, then take its diagonal `κ`-twist `B₁` over `Λ₁`, and only then specialize to `Λ`. The local unit characters agree with the universal determinant-ordinary characters for this action; all finite coefficient maps involved in the twist are transported through `τ_κ`. Reconstruction and quotient comparison give the action on `B`, with one exponent `δ`.

**Checks.**

- The `C_p` example of §4.4 makes the two orders of operations different; the target here uses `B` with its quotient action.
- The weight specialization at `p_μ` factors through the selected component of the twisted complex, since its torsion character is `κ`.
- For trivial `κ` the target image agrees with the untwisted component image, with the same tame Hecke operators.

**Components and the derived support interface**

Compare the untwisted and character-twisted local conditions modulo the coefficient uniformizer, then globalize using the same framings and variable determinant. The dimension and component calculation is the arithmetic input to the abstract support theorem. Its conclusion is conditional on the actual perfect pair supplied in Layer 5.

<a id="arithmetic-component-dimension-input"></a>

### 4.8 Arithmetic component comparison

Prove `arithmetic_component_dimension_input`. For the FL or ordinary framed global problem and its `χ-twist`, tensor the local rings with the common framing/patching power-series variables. With `q` Taylor–Wiles places and `g=qn−n²[F⁺:Q]≥0`, the FL rings satisfy `dim R∞=dim S∞−ℓ₀` and `dim(R∞/varpi)=dim R∞−1, ℓ₀=n[F⁺:Q]−1`. The maximal-dimensional mod-varpi generic points lift uniquely to maximal-dimensional characteristic-zero components as required by DP Layer 9; the `χ-twisted` generic lifts are unique, and lower components satisfy the strict dimension bound in ACC Assumption 6.3.6 (DP:Layer 9). In the ordinary case the same DP Layer 9 comparisons apply after choosing the specified minimal prime of the torus Iwasawa algebra and using the §6.24 trivial-residual degree bound; this is not a classification of every ordinary component.

([ACC](#source-acc), Proof of Theorem 6.5.4 pp. 1069–1070; proof of Theorem 6.6.2 pp. 1080–1081). *Needs:* `Layer 4`; `LGD:§2.15`; `GGD:G7`; `LGD:§§1.12–1.13,3.7,6.24,7.4–7.6`; `LGD:§§7.1–7.6`; `GGD:G8`; `DP:Layer 9`.

*Route.* Compute local dimensions using LGD §§6.24 and 7.1–7.6, the ACC FL local ring and LGD §2.15 away-from-p rings. Use the enormous G7 presentation to add exactly `g` formal variables and the fixed framing variables. Compare generic points using the distinct `χ-types` and LGD §2.15 component uniqueness; reduce to the imported DP Layer 9 hypothesis list.

<a id="arithmetic-derived-support-contract"></a>

### 4.9 Derived Ihara avoidance

Prove `arithmetic_derived_support_contract`. Given the imported DP Layer 8 patched perfect complexes `C∞,C∞′` for these two arithmetic towers, their common mod-varpi Hecke image and quotient deformation actions, and rational amplitude `[q_patch,q_patch+ℓ₀]` at every characteristic-zero augmentation point, the component input implies DP Layer 9 ACC Assumption 6.3.6 (DP:Layer 9). Consequently support of `H*(C∞)` contains each maximal-dimensional component, and an augmentation characteristic-zero point `x` is in the support of `H*(C∞⊗^L_{S∞}S∞/(x∩S∞))[1/p]` whenever its generic component is one of those components. This statement is conditional on the patching input; Layer 5 constructs and verifies that input. The conclusion is reduced support, not an integral `R=T` isomorphism.

([ACC](#source-acc), §6.3.5, Proposition 6.3.8 and Corollary 6.3.9, pp. 1052–1053). *Needs:* `Layer 4`; `mathlib:Module.support`; `DP:§§9.1,9.4`; `DP:Layer 9`.

*Route.* Compare the arithmetic data with each clause of DP Layer 9 ACC Assumption 6.3.6 (DP:Layer 9). Apply DP Layer 9 ACC Proposition 6.3.8 (DP:Layer 9) and ACC Corollary 6.3.9 (DP:Layer 9) to the fixed arithmetic quotient action. Use nilpotence invariance of the underlying prime support; preserve the characteristic-zero restriction.

### Examples

The zero ordinary complex and the unramified trace-twist identity test the coefficient and Hecke actions. A zero localization cannot certify support: the lifting point must lie on the specified maximal-dimensional component and rational cohomology must be nonzero.

### Dependencies

Layers 1 and 3; LGD §§1.12–1.13,3.7,6.24,7.1–7.6/LGD §2.15, GGD:G7/G8 and DP:Layers 7 and 9. Support is conditional on the supplied pair; Layer 5 verifies its arithmetic hypotheses.

## Layer 5: Arithmetic patching and automorphy lifting

**Taylor–Wiles levels and selected roots**

Auxiliary sets and deformation presentations come from their global owner. This layer constructs the arithmetic levels, the ordered-root localization and the trace comparison. At every old place the original level is retained.

<a id="taylor-wiles-arithmetic-levels"></a>

### 5.1 Taylor–Wiles arithmetic levels

Define `TaylorWilesArithmeticLevels`. Let `(Q, (α_{v,1},…,α_{v,n})_{v∈Q})` be a Taylor–Wiles datum for `𝒮_1` (GGD:G7 (ACC §6.2.28)) such that for each `v ∈ Q` the residue characteristic `l_v` splits in an imaginary quadratic subfield of `F`. It is a Taylor–Wiles datum for every `𝒮_χ`, and `R_{𝒮_{χ,Q}}` is an `𝒪[Δ_Q]-algebra, Δ_Q = ∏_{v∈Q} Δ_v = ∏_{v∈Q} k(v)^×(p)^n`. Good subgroups `K_1(Q) ⊂ K_0(Q) ⊂ K: K_1(Q)_v = K_0(Q)_v = K_v` for `v ∉ Q`; for `v ∈ Q, K_0(Q)_v = Iw_v` and `K_1(Q)_v` is the largest subgroup of `Iw_v` that is a pro-prime-to-p group, equivalently the kernel of `Iw_v → Tₙ(k(v)) → Tₙ(k(v))(p)`. Then `K_0(Q)/K_1(Q) ≅ Δ_Q`, and (ACC (6.5.6)) there are surjective `T^{S∪Q}`-algebra maps `_{K_0(Q)/K_1(Q)}T^{S∪Q}(K_0(Q)/K_1(Q), 𝒱) → T^{S∪Q}(K_0(Q), 𝒱) → T^{S∪Q}(K, 𝒱) (𝒱 = 𝒱_λ(χ^{-1}))`: the first from `K_0(Q)`-invariants (`𝒪[Δ_Q]` acting trivially on invariants), the second `t ↦ [K:K_0(Q)]^{-1} π_{Q,*} ∘ t ∘ π_Q^*` for the projection `π_Q: X_{K_0(Q)} → X_K`, where `[K:K_0(Q)] ≡ (n!)^{|Q|} mod p` is a unit since `p > n`. `T^{S∪Q}_Q(K_0(Q), 𝒱) ⊂ End_{D(𝒪)}(RΓ(X_{K_0(Q)}, 𝒱))` is the commutative `T^{S∪Q}(K_0(Q),𝒱)-subalgebra` generated by the `U_{v,i} (v ∈ Q, 1 ≤ i ≤ n)`, equivalently the image of the Iwahori Hecke operators at `Q` (AG2.5; ACC §3.1); `T^{S∪Q}_Q(K_0(Q)/K_1(Q), 𝒱) ⊂ End_{D(𝒪[Δ_Q])}(RΓ_{K_0(Q)/K_1(Q)}(X_{K_1(Q)}, 𝒱))` likewise (an `𝒪[Δ_Q]`-algebra). (ACC (6.5.7)): the first map of (ACC (6.5.6)) extends to a surjection `T^{S∪Q}_Q(K_0(Q)/K_1(Q), 𝒱) → T^{S∪Q}_Q(K_0(Q), 𝒱)` sending `U_{v,i}` to `U_{v,i}`.

([ACC](#source-acc), §6.5.1, paragraphs after Corollary 6.5.5, (6.5.6), (6.5.7), pp. 1064–1065). *Needs:* `Layer 0`; `GGD:G7`.

Its interface includes:

- `TaylorWilesArithmeticLevels.away`: Both auxiliary levels equal `K_v` at every `v∉Q`, including `v∈S`.
- `TaylorWilesArithmeticLevels.at_auxiliary`: At `v∈Q` use `Iw_v` and its maximal pro-prime-to-p subgroup.
- `TaylorWilesArithmeticLevels.diamond_quotient`: The quotient `K₀(Q)/K₁(Q)` is the imported `Δ_Q`.
- `TaylorWilesArithmeticLevels.trace_scalar`: Pullback followed by trace has scalar `[K:K₀(Q)]≡(n!)^{#Q} mod p`.

**Checks.**

- For `Q=∅` both levels equal `K` and the diamond group is trivial.
- For `Q={v}, n=2` and `p>2` the trace scalar is 2 modulo `p`, hence a unit.
- At `v∈S` outside `Q` the original local factor must be retained; leaving it unspecified does not define a level.

<a id="taylor-wiles-selected-ideals"></a>

### 5.2 Taylor–Wiles selected ideals

Define `TaylorWilesSelectedIdeals`. With `𝒱 = 𝒱_λ(χ^{-1}): 𝔪^Q ⊂ T^{S∪Q}(K, 𝒱)` is the pullback of `𝔪` under `T^{S∪Q}(K,𝒱) ⊂ T^S(K,𝒱); 𝔪_0^Q ⊂ T^{S∪Q}(K_0(Q),𝒱)` is the pullback of `𝔪^Q` and `𝔪_1^Q ⊂ _{K_0(Q)/K_1(Q)}T^{S∪Q}(K_0(Q)/K_1(Q),𝒱)` the pullback of `𝔪_0^Q` under the maps (ACC (6.5.6)); `𝔫_0^Q ⊂ T^{S∪Q}_Q(K_0(Q),𝒱)` is the ideal generated by `𝔪_0^Q` and the elements `U_{v,i} − q_v^{i(1−i)/2} α_{v,1}⋯α_{v,i} (v ∈ Q, 1 ≤ i ≤ n); 𝔫_1^Q ⊂ T^{S∪Q}_Q(K_0(Q)/K_1(Q),𝒱)` is the preimage of `𝔫_0^Q` under (ACC (6.5.7)).

([ACC](#source-acc), §6.5.1, paragraph before Lemma 6.5.8, p. 1065). *Needs:* `Layer 5`.

Its interface includes:

- `TaylorWilesSelectedIdeals.unramified_contraction``: m^Q` is the contraction of `m` to the `away-from-S∪Q` Hecke image.
- `TaylorWilesSelectedIdeals.selected_generator``: n₀^Q` adds `U_{v,i}−q_v^{i(1−i)/2}∏_{j≤i}α_{v,j}`.
- `TaylorWilesSelectedIdeals.diamond_pullback``: n₁^Q` is the preimage of `n₀^Q` under the auxiliary diamond-forgetting Hecke map.
- `TaylorWilesSelectedIdeals.ordering`: The chosen ordering of residual eigenvalues fixes the selected Iwahori constituent.

**Checks.**

- `TaylorWilesSelectedIdeals.empty` (degenerate): For `Q=∅` the selected ideal is just the original localized maximal ideal.
- `TaylorWilesSelectedIdeals.rank_two_second` (computation): For `n=2` the `i=2` generator is `U_{v,2}−q_v^{-1}α_{v,1}α_{v,2}; q_v=3` and roots 2,5 give eigenvalue 10/3.
- `TaylorWilesSelectedIdeals.order_sensitive` (non-example): For distinct `α₁,α₂`, interchanging them changes the `i=1` generator `U_{v,1}−α₁`.

<a id="taylor-wiles-residual-iwahori-hecke"></a>

### 5.3 Residual Iwahori Hecke algebra at Taylor–Wiles places

Prove `taylor_wiles_residual_iwahori_hecke`. Let `F_v` be a finite extension of `ℚ_l` with residue cardinality `q`, and `p ≠ l` an odd prime with `q ≡ 1 mod p` and `p > n`; choose `q^{1/2} ∈ O` with `(q^{1/2})² = q` and `q^{1/2} ≡ 1` modulo the coefficient maximal ideal. Hensel's lemma gives this choice since `p` is odd. Let `K = GLₙ(O_{F_v}), B ⊆ K` the standard Iwahori subgroup, `H_B` and `H_K` the O-valued Hecke algebras, `t₁, …, tₙ` the elements of `O[X_*(T)]` given by the standard basis, and `T_i = [K diag(ϖ_v,…,ϖ_v,1,…,1) K]` (`i` entries `ϖ_v`). (1) `H_B ⊗_O k ≅ k[X_*(T) ⋊ W]`, with `θ_λ·T_w ↦ e^λ w`, where `θ_λ` is the Bernstein element. (2) For a smooth `O[GLₙ(F_v)]-module M` the inclusion `M^K ⊆ M^B` is split by `[K:B]⁻¹[K]`, and [K:B] `≡ n! mod p` is a unit. (3) The centre of `H_B` is `O[X_*(T)]^W ≅ H_K`, with `e_i(t₁,…,tₙ) ↦ q^{−i(n−i)/2}T_i`; equivalently the normalized Satake map sends `T_i` to `q^{i(n−i)/2}e_i(t)`. (4) Let `M` be an `H_B`-module finite-dimensional over `k` with `[K]M ≠ 0` on which each `T_i` acts on `[K]M` as the scalar `e_i(γ₁,…,γₙ)` for pairwise distinct `γ_j ∈` kˣ; then every maximal ideal `(t₁−γ_{w(1)}, …, tₙ−γ_{w(n)})` of `k[X_*(T)], w ∈ W`, lies in the support of `M`. (5) Let `M` be a nonzero `H_B`-module finite-dimensional over `k` such that, for each maximal ideal `𝔫` of `k[X_*(T)]^W` in its support, the polynomial `Σ_i (−1)^i q^{i(n−i)/2} e_i(t)X^{n−i}` has distinct roots modulo `𝔫`. Then `[K]M ≠ 0`; if moreover the central support is a single maximal ideal `𝔫` and its polynomial splits into distinct roots in `k`, then for each maximal ideal `𝔪` of `k[X_*(T)]` in the support the maps `k[W] ⊗ M_𝔪 → M` and `M_𝔪 → [K]M, x ↦ [K]x`, are isomorphisms.

([KT](#source-kt), §5, Lemmas 5.1–5.4 and the paragraph between Lemmas 5.2 and 5.3, manuscript pp. 25–27). *Needs:* `SR:SR.1.5` (Bernstein presentation; its integral basis statement is an obligation of that layer); `SR:SR.4.3` (the spherical Hecke algebra of `GLₙ`).

Part (1) holds because at `q = 1` the quadratic relation of the finite Hecke algebra becomes `T_s² = 1` and the Bernstein relation becomes the semidirect-product relation; (2) is the trace map; (4) and (5) decompose a module over `k[X_*(T)]` into W-translates of one localization.

**Checks.**

- For `n = 1` the algebra `H_B ⊗ k` is the group algebra `k[ℤ]` and (2) is the identity.
- For `n = 2` the index [K:B] `= q + 1 ≡ 2 mod p`, a unit for odd `p`; for `q ≢ 1 mod p`, (1) fails because `T_s² = q + (q−1)T_s` does not reduce to `T_s² = 1`.
- The square-root choice fixes the residual eigenvalue labels. For `n = 2` and `k = 𝔽₅`, using the other lift `q^{1/2} ≡ −1` gives `e₁(t) = −T₁`. If the spherical eigenvalues are `e₁(1,2) = 3` and `e₂(1,2) = 2`, the torus roots are then `−1` and `−2`, rather than 1 and 2. The condition `q^{1/2} ≡ 1` makes the labels in (4) agree with the Bernstein normalization.
- For `n=2,q=11,p=5` choose `a=q^{1/2}≡1 mod 5`. On the normalized principal series with Satake parameters `1,1`, `T₁` acts by `2a`, so `a⁻¹T₁` acts by 2 while `aT₁` acts by 22. These integral scalars differ although their reductions agree.
- The zero module has empty support and satisfies every condition quantified over that support, but `[K]0 = 0`. Part (5) therefore requires `M ≠ 0`.
- Splitting over `k` is essential for the last two comparisons. Take `n = 2, q = 11, k = 𝔽₅` and `M = 𝔽₂₅ = 𝔽₅[γ]` with `γ² = 2`. Let `t₁` and `t₂` act by `γ` and `−γ`, and let the transposition act by Frobenius `x ↦ x⁵`. This is a module over `k[ℤ² ⋊ S₂]`, with the single central polynomial `X² − 2`, separable but irreducible over `k`. The torus maximal ideal is fixed by `S₂, M_𝔪 = M` has dimension 2, and `k[S₂] ⊗_k M_𝔪` has dimension 4. The map `[K] = 1 +` Frobenius has image `𝔽₅` of dimension 1, so neither comparison is an isomorphism. After extending to `𝔽₂₅` the two ordered-root localizations are exchanged and the split-root comparison applies.


<a id="selected-ideal-properness"></a>

### 5.4 Selected ideal properness

Prove `selected_ideal_properness`. Each of `𝔪^Q, 𝔪_0^Q, 𝔪_1^Q, 𝔫_0^Q, 𝔫_1^Q` is a (proper) maximal ideal. The content is that `𝔫_0^Q` is proper, i.e. `H^*(X_{K_0(Q)}, 𝒱_λ(χ^{-1})/ϖ)[𝔪_0^Q]` contains a nonzero vector on which every `U_{v,i} (v ∈ Q)` acts by `α_{v,1}⋯α_{v,i}`; this follows from (the proof of) Khare–Thorne, Lemma 5.3 once the nonzero residual module `H^*(X_K,𝒱_λ(χ^{-1})/ϖ)_{𝔪^Q}` is supported only at `𝔪`, equivalently is annihilated by a power of `𝔪`. This residual support assertion is part of the target.

([ACC](#source-acc), §6.5.1, Lemma 6.5.8, p. 1065; [KT](#source-kt), §5, Lemma 5.3 and proof, manuscript p. 26). *Needs:* `TaylorWilesSelectedIdeals`; `taylor_wiles_residual_iwahori_hecke`; `finite_coefficient_gln_galois_inputs`; `AGR:§5.3`, `GaloisRep.iso_of_frobenius_charpoly_eq` (with §2.16's normalization); `ALS:ALS.3`; `AG:AG2.0` (spherical polynomial at `Q`).

*Route.* Work with the finite-dimensional residual Iwahori Hecke module obtained from torsion cohomology. Since `q_v ≡ 1 mod p` and `p > n`, the spherical inclusion is split by `[GL_n(O_v):Iw_v]^{-1}` times trace (KT Lemma 5.2). For every residual supported ideal above `𝔪^Q`, §0.7b gives a semisimple Galois representation. Its characteristic polynomials away from `S∪Q` agree with those of `ρ̄_𝔪`; AGR's `GaloisRep.iso_of_frobenius_charpoly_eq`, with §2.16's inversion comparison and residual coefficient field, identifies it with `ρ̄_𝔪`. Compatibility at `Q` then recovers the omitted spherical eigenvalues and identifies the ideal with `𝔪`. The finite residual module is therefore supported only there and annihilated by a power of `𝔪`. Nonzero integral localization at `𝔪` gives nonzero residual cohomology by derived Nakayama. At each `v ∈ Q`, KT Lemma 5.3, applied to a nonzero spherical central eigenspace, shows that every ordered distinct-root torus maximal ideal lies in the Iwahori module support. Iterate over `Q` to obtain a nonzero simultaneous selected eigenspace; this proves `𝔫_0^Q` proper. The other maximal ideals follow from the defining quotient maps, including `𝔫_1^Q` as the preimage of `𝔫_0^Q`.

**Checks.**

- For `T=O×O`, diagonal `T₀=O`, and `M=O×O`, integral `M[(ϖ)]=0` gives no uniqueness: both maximal ideals of `T` lie above `(ϖ)`. The residual module `k×k` sees both.
- A nonzero finite residual module supported only at `𝔪` is killed by some `𝔪^r`; this is the module to which the ordered-root argument applies.
- Zero residual localization gives no selected eigenspace. The nonzero spherical residual module and distinct split roots are both required by KT Lemma 5.3.

<a id="diamond-derived-augmentation"></a>

### 5.5 Diamond augmentation

Prove `diamond_derived_augmentation`. The natural morphisms `RΓ(X_K, 𝒱)_{𝔪^Q} → RΓ(X_K, 𝒱)_𝔪, RΓ(X_{K_0(Q)}, 𝒱)_{𝔫_0^Q} → RΓ(X_K, 𝒱)_{𝔪^Q}` (trace), and `RΓ(Δ_Q, RΓ_{K_0(Q)/K_1(Q)}(X_{K_1(Q)}, 𝒱)_{𝔫_1^Q}) → RΓ(X_{K_0(Q)}, 𝒱)_{𝔫_0^Q}` are isomorphisms in `D(𝒪) (𝒱 = 𝒱_λ(χ^{-1}))`.

([ACC](#source-acc), §6.5.1, Lemma 6.5.9, p. 1066; [KT](#source-kt), §5, Lemma 5.4 and proof, manuscript p. 27). *Needs:* `selected_ideal_properness`; `taylor_wiles_residual_iwahori_hecke`; `Layer 0`.

The first map is an isomorphism because `𝔪` is the only maximal ideal of `T^S(K,V)` above `𝔪^Q`, by the residual support assertion in `selected_ideal_properness`. For the finite derived Hecke image, the kernel of its action on cohomology is nilpotent (IHG §2.2), and derived reduction of a finite perfect complex detects a nonzero localization. Thus residual support detects every maximal ideal above `𝔪^Q`. For the second, reduce modulo `ϖ`: by `taylor_wiles_residual_iwahori_hecke` the trace from level `K₀(Q)` to `K` identifies the summand cut out by the selected ordered roots with the spherical cohomology (Khare–Thorne, Lemma 5.4), and derived Nakayama lifts the comparison to `O`; the unit index `[K:K₀(Q)]` alone does not give this. The third is descent along the free action of `Δ_Q`.

<a id="taylor-wiles-hecke-locality"></a>

### 5.6 Taylor–Wiles Hecke locality

Prove `taylor_wiles_hecke_locality`. There is a surjection `_{K_0(Q)/K_1(Q)}T^{S∪Q}(RΓ_{K_0(Q)/K_1(Q)}(X_{K_1(Q)}, 𝒱)_{𝔫_1^Q}) → T^{S∪Q}(RΓ(X_K, 𝒱)_{𝔪^Q}) = T^{S∪Q}(K, 𝒱)_{𝔪^Q}`; its source is a local `𝒪[Δ_Q]`-algebra whose maximal ideal is the preimage of `𝔪^Q`, because it acts nearly faithfully on `H^*(X_{K_1(Q)}, 𝒱)_{𝔫_1^Q}`. Definition (Taylor (2008), Definition 2.1): a finitely generated module over a Noetherian local ring is nearly faithful if its annihilator is a nilpotent ideal.

([ACC](#source-acc), §6.5.1, (6.5.10) and following paragraph, p. 1066). *Needs:* `Layer 5`.

*Route.* Localize the enlarged auxiliary Hecke algebra at the proper selected maximal ideal. Its image on the localized perfect complex is a finite local `O[Δ_Q]`-algebra; nearly faithful support uses the DP §9.4 annihilator criterion.

<a id="diamond-linear-deformation-hecke-map"></a>

### 5.7 Diamond linear deformation Hecke map

Prove `diamond_linear_deformation_hecke_map`. Let `𝕋 = _{K_0(Q)/K_1(Q)}T^{S∪Q}(RΓ_{K_0(Q)/K_1(Q)}(X_{K_1(Q)}, 𝒱_λ(χ^{-1}))_{𝔫_1^Q})`. There are `δ ≥ 1` depending only on `n` and `[F:ℚ]`, an ideal `J ⊂ 𝕋` with `J^δ = 0`, and a continuous surjective `𝒪[Δ_Q]`-algebra homomorphism `f_{𝒮_{χ,Q}}: R_{𝒮_{χ,Q}} → 𝕋/J` such that for every finite `v ∉ S ∪ Q` the characteristic polynomial of `f_{𝒮_{χ,Q}} ∘ ρ_{𝒮_{χ,Q}}(Frob_v)` is the image of `P_v(X)`.

([ACC](#source-acc), §6.5.1, Proposition 6.5.11, pp. 1066–1067). *Needs:* `Layer 5`; `Layer 4`; `AG:AG2.5`; `GGD:G8`.

Let `T′` be the Hecke algebra at level `K₁(Q)` generated also by the operators `U_{v,i}`; it contains `𝕋` as a local subalgebra, finite over `O[Δ_Q]`. The Hecke-valued Galois representation over `T′/J′` (ACC Theorem 2.3.7; at these levels it comes from `all_degree_fontaine_laffaille`) lifts `ρ̄_𝔪` and satisfies the conditions of `fontaine_laffaille_deformation_hecke_map` at `S`, with no condition at `Q`. For `v ∈ Q` the characters `ψ_{v,i}` of `W_{F_v}` defined through the operators `t_{v,i}` satisfy `det(X − ρ(σ)) = ∏_i (X − ψ_{v,i}(σ))` by AG2.5; since their residual values at Frobenius are the distinct `α_{v,i}`, the restriction to `W_{F_v}` is the direct sum of the `ψ_{v,i}` (Bellaïche–Chenevier, Proposition 1.5.1), which is the `O[Δ_v]-linearity`. Take `J = ker(𝕋 → T′/J′)`.

**The Fontaine–Laffaille patched pair**

Verify the two arithmetic towers against the abstract ultrapatching input at a fixed nonprincipal ultrafilter. The free diamond-cell models, uniform ranks and nilpotent bounds are part of that verification. Reduction compares Hecke images in the reduced coefficient category.

<a id="fontaine-laffaille-patching-verification"></a>

### 5.8 Fontaine–Laffaille patching verification

Prove `fontaine_laffaille_patching_verification`. Fix one nonprincipal ultrafilter on the positive integers for the imported ultrapatching construction. Set `q = h¹(F_S/F, ad ρ̄_𝔪(1)), g = qn − n²[F⁺:ℚ], Δ_∞ = ℤ_p^{nq}, 𝒯 =` a power series ring over `𝒪` in `n²|S| − 1` variables, `S_∞ = 𝒯⟦Δ_∞⟧` with augmentation ideal `𝔞_∞ (Λ = 𝒪)`. Enlarge `E` to contain `ζ_p` and choose, for each `v ∈ R`, pairwise distinct `χ_{v,1},…,χ_{v,n}: 𝒪_{F_v}^× → 𝒪^×` trivial `mod ϖ` (possible as `p > n, q_v ≡ 1 mod p`); `χ = ∏_{v∈R} χ_v` on `∏_{v∈R} I_v`. For `N ≥ 1` choose Taylor–Wiles data `(Q_N, (α_{v,i})_{v∈Q_N})` as in GGD:G7 (ACC Proposition 6.2.33) (possible as `r̄_ι(π)(G_{F(ζ_p)})` is enormous; any imaginary quadratic subfield of `F`), `Q_0 = ∅, Δ_N = Δ_{Q_N}` with a surjection `Δ_∞ ↠ Δ_N` whose kernel lies in `(p^N ℤ_p)^{nq}` (as `q_v ≡ 1 mod p^N` for `v ∈ Q_N`). `R_N = R_{𝒮_{1,Q_N}}, R′_N = R_{𝒮_{χ,Q_N}} (R_0 = R_{𝒮_1}, R′_0 = R_{𝒮_χ}); R^loc = R^{S,loc}_{𝒮_1}, R′^loc = R^{S,loc}_{𝒮_χ}` (GGD:G8 (ACC §6.2.22)), also the local rings of `𝒮_{·,Q_N}`; canonical isomorphisms `R^loc/ϖ ≅ R′^loc/ϖ, R_N/ϖ ≅ R′_N/ϖ, R_N ⊗_{𝒪[Δ_N]} 𝒪 ≅ R_0, R′_N ⊗ 𝒪 ≅ R′_0`, compatible `mod ϖ; R^loc`-algebra structures on `R_N ⊗̂_𝒪 𝒯` (GGD:G8 (ACC Lemma 6.2.4)); `R_∞, R′_∞ =` power series rings in `g` variables over `R^loc, R′^loc` with surjections onto the framed rings `R_N ⊗̂ 𝒯, R′_N ⊗̂ 𝒯` (GGD:G8 (ACC Proposition 6.2.25) for `N = 0`, using `H⁰(F_S/F, ad ρ̄_𝔪(1)) = 0` because `r̄_ι(π)|_{G_{F(ζ_p)}}` is irreducible and `ζ_p ∉ F`; GGD:G7 (ACC Proposition 6.2.33)(3) for `N ≥ 1` ), compatible `mod ϖ` and with `R_N ⊗ 𝒪 ≅ R_0`. Complexes: `𝒞_0 = RHom_𝒪(RΓ(X_K, 𝒱_λ(1))_𝔪, 𝒪)[−d], T_0 = T^S(K, 𝒱_λ(1))_𝔪`, with `H^i(𝒞_0)[1/p] ≅ Hom_E(H^{d−i}(X_K, 𝒱_λ(1))_𝔪[1/p], E)` as `T_0-modules; 𝒞′_0, T′_0` likewise with `𝒱_λ(χ^{-1})`; for `N ≥ 1, 𝒞_N = RHom_{𝒪[Δ_N]}(RΓ_{K_0(Q_N)/K_1(Q_N)}(X_{K_1(Q_N)}, 𝒱_λ(1))_{𝔫_1^{Q_N}}, 𝒪[Δ_N])[−d], T_N = _{K_0/K_1}T^{S∪Q_N}(RΓ_{K_0(Q_N)/K_1(Q_N)}(X_{K_1(Q_N)}, 𝒱_λ(1))_{𝔫_1^{Q_N}})`, and `𝒞′_N, T′_N` with `𝒱_λ(χ^{-1})`. Claim: with `I_N, I′_N` from `fontaine_laffaille_deformation_hecke_map` and `diamond_linear_deformation_hecke_map` these data satisfy the set-up of DP:Layer 8 (ACC §6.4.1): canonical `𝒞_N ⊗^L k[Δ_N] ≅ 𝒞′_N ⊗^L k[Δ_N]` with `T_N, T′_N` having the same image `T̄_N; 𝒞_N ⊗^L_{𝒪[Δ_N]} 𝒪 ≅ 𝒞_0` (`diamond_derived_augmentation`), compatible `mod ϖ`; local `𝒪[Δ_N]`-algebra surjections `R_N → T_N/I_N, R′_N → T′_N/I′_N` compatible `mod ϖ` and agreeing into `T̄_N/(Ī_N + Ī′_N); T_N ⊗_{𝒪[Δ_N]} 𝒪 → T_0` surjective onto `T_0/I_0` (Chebotarev and the Galois representation over `T_0/I_0`), and likewise primed.

([ACC](#source-acc), §6.5.1, proof of Theorem 6.5.4, pp. 1067–1069). *Needs:* `Layer 5`; `mathlib:DerivedCategory`; `DP:Layer 7`; `GGD:G7`; `ALS:ALS.1`; `DP:Layer 8`.

*Route.* Take dual minimal finite free models of `RΓ` at `K₁(Q_N)`, shifted by `−d`, with the diamond action. Use finite-cell freeness and residual minimal ranks to bound the range and each rank uniformly in `N`. Use derived diamond augmentation, common mod-varpi models, global presentation and uniform nilpotent Hecke maps to fill every DP Layer 8 patching datum condition. Fix one nonprincipal ultrafilter; only transition-map-choice independence from DP Layer 8 is used.

<a id="patched-arithmetic-mod-varpi-comparison"></a>

### 5.9 Patched-complex comparison

Prove `patched_arithmetic_mod_varpi_comparison`. (1) The quasi-isomorphisms `𝒞_N/ϖ ≅ 𝒞′_N/ϖ` induce a quasi-isomorphism `𝒞_∞/ϖ ≅ 𝒞′_∞/ϖ`. (2) Via this identification `T_∞` and `T′_∞` have the same image `T̄_∞` in the endomorphism algebras of `𝒞_∞/ϖ` and `𝒞′_∞/ϖ` in `D(S_∞/ϖ)`, and also after restriction of scalars to `D(S_∞)`. (3) With `Ī_∞, Ī′_∞` the images of `I_∞, I′_∞` in `T̄_∞`, the actions of `R_∞/ϖ ≅ R′_∞/ϖ` (through `T_∞` and `T′_∞`) on `H^*(𝒞_∞/ϖ)/(Ī_∞ + Ī′_∞)` and `H^*(𝒞′_∞/ϖ)/(Ī_∞ + Ī′_∞)` are identified via `𝒞_∞/ϖ ≅ 𝒞′_∞/ϖ`.

([ACC](#source-acc), §6.4.2, Proposition 6.4.17, pp. 1060–1061). *Needs:* `Layer 4`; `mathlib:DerivedCategory`; `DP:Layer 8`.

*Route.* Apply the imported DP Layer 8 comparison to the two arithmetic towers after verifying the termwise mod-varpi coefficient comparison. Identify the common Hecke image in `End_{D(S∞/varpi)}` of the reduced complex. Compare the induced `R∞/varpi` actions after quotienting by the sum of the two reduced nilpotent ideals.

<a id="fontaine-laffaille-dimension-amplitude"></a>

### 5.10 Fontaine–Laffaille dimension amplitude

Prove `fontaine_laffaille_dimension_amplitude`. Applying DP:Layer 8 (ACC §6.4.2) to the Fontaine–Laffaille arithmetic tower data gives: bounded complexes `𝒞_∞, 𝒞′_∞` of free `S_∞-modules, T_∞ ⊂ End_{D(S_∞)}(𝒞_∞), T′_∞ ⊂ End_{D(S_∞)}(𝒞′_∞)`, ideals with `I_∞^δ = I′_∞^δ = 0, S_∞`-algebra structures on `R_∞, R′_∞` and `S_∞`-algebra surjections `R_∞ → T_∞/I_∞, R′_∞ → T′_∞/I′_∞`; surjections `R_∞/𝔞_∞ ↠ R_0, R′_∞/𝔞_∞ ↠ R′_0; 𝒞_∞ ⊗^L S_∞/𝔞_∞ ≅ 𝒞_0` and `𝒞′_∞ ⊗^L S_∞/𝔞_∞ ≅ 𝒞′_0` with `T_∞ → T_0` surjective onto `T_0/I_0` and `R_∞/𝔞_∞ → (T_0/I_0)/I_{∞,0}` factoring through `R_0; 𝒞_∞ ⊗^L S_∞/ϖ ≅ 𝒞′_∞ ⊗^L S_∞/ϖ` with a common image `T̄_∞` of `T_∞` and `T′_∞` and identified actions of `R_∞/ϖ ≅ R′_∞/ϖ` on `H^*(𝒞_∞ ⊗^L S_∞/ϖ)/(Ī_∞ + Ī′_∞)`. By LGD:§§1.12–1.13,3.7,6.24,7.4–7.6 and LGD:§2.15 (ACC Lemma 6.2.26): every generic point of `Spec R_∞/ϖ` specializes from a unique generic point of `Spec R_∞`, all generic points of `Spec R_∞` have characteristic `0, Spec R′_∞` is irreducible with characteristic-0 generic point, `R_∞` is equidimensional, and `dim R_∞ = dim R′_∞ = 1 + g + n²|S| + ½n(n−1)[F:ℚ]`. For `X_K` with `F` CM, `ℓ_0 = n[F⁺:ℚ] − 1`; since `dim S_∞ = n²|S| + qn` and `g = qn − n²[F⁺:ℚ], dim R_∞ = dim R′_∞ = dim S_∞ − ℓ_0`. `H^*(𝒞_∞ ⊗^L S_∞/𝔞_∞)[1/p] ≅ Hom_E(H^{d−*}(X_K, 𝒱_λ(1))_𝔪[1/p], E)` is nonzero and concentrated in `[q_patch, q_patch + ℓ_0]` by ALS.5b.8 (ACC Theorem 2.4.10). Hence ACC Assumption 6.3.6 (DP:Layer 9) holds, ACC Proposition 6.3.8 (DP:Layer 9) gives full support of `H^*(𝒞_∞)` over `R_∞`, hence of `H^*(𝒞_∞ ⊗^L S_∞/𝔞_∞) = H^*(𝒞_0)` over `R_∞/𝔞_∞` and so over `R_{𝒮_1}`.

([ACC](#source-acc), §6.5.1, proof of Theorem 6.5.4, pp. 1069–1070). *Needs:* `Layer 4`; `LGD:§§1.12–1.13,3.7,6.24,7.4–7.6`; `LGD:§2.15`; `ALS:ALS.5b`; `Layer 5`; `DP:Layer 9`.

*Route.* Put `q=dim` dual Selmer, `g=qn−n²[F⁺:Q]`, and add `n²|S|−1` framing variables. Compute `dim S∞=n²|S|+qn` and `dim R∞=dim S∞−ℓ₀, ℓ₀=n[F⁺:Q]−1`. Use LGD §2.15 component comparison. Apply ALS.5b.8 with `arithmetic_franke_inputs` and AG2.4's `GLₘ` attachments for every Levi rank. The given cuspidal `π` has `K`-invariants at the good level and contributes a nonzero characteristic-zero eigenspace; finite-cell perfectness alone would allow the zero complex. Residual absolute irreducibility removes the proper supports, giving rational cohomology in `[q_GL,q_GL+ℓ₀]`. After `RHom(−,O)[−d]`, compute the interval `[q_GL+1,q_GL+1+ℓ₀]` and use that as DP Layer 9's `q₀` interval to verify ACC Assumption 6.3.6 (DP:Layer 9).

<a id="fontaine-laffaille-full-support"></a>

### 5.11 Fontaine–Laffaille full support

Prove `fontaine_laffaille_full_support`. Under the Fontaine–Laffaille good-level hypotheses, `H^*(X_K, 𝒱_λ(1))_𝔪` has full support over `R_{𝒮_1}`, i.e. its support in `Spec R_{𝒮_1}`, defined through `f_{𝒮_1}: R_{𝒮_1} → T^S(RΓ(X_K, 𝒱_λ(1)))_𝔪/J` (`fontaine_laffaille_deformation_hecke_map`) as in §6.3.5, is all of `Spec R_{𝒮_1}` (although `H^*` is not literally an `R_{𝒮_1}`-module).

([ACC](#source-acc), §6.5.1, Theorem 6.5.4, p. 1063; proof pp. 1067–1070). *Needs:* `Layer 5`; `Layer 4`; `DP:Layer 9`.

*Route.* Combine the arithmetic DP Layer 8 verification, patched mod-varpi comparison and DP Layer 9 dimension/component hypotheses. Apply DP Layer 9 maximal-component support and specialization at characteristic-zero points. Use the diamond augmentation and the deformation–Hecke map to identify the finite-level full reduced support; a nilpotent quotient is invisible to support.

**Checks.**

- Nilpotent ideals disappear from Spec and support, but the original integral deformation and Hecke rings need not be isomorphic.

<a id="fontaine-laffaille-lifting-at-good-level"></a>

### 5.12 Fontaine–Laffaille lifting at good level

Prove `fontaine_laffaille_lifting_at_good_level`. Under the Fontaine–Laffaille good-level hypotheses, let `ρ: G_F → GL_n(Q̄_p)` be continuous with: (1) `ρ̄ ≅ r̄_ι(π)`; (2) `ρ|_{G_{F_v}}` crystalline for every `v | p`, with `HT_τ(ρ) = {λ_{ιτ,1} + n − 1, …, λ_{ιτ,n}}` (the j-th entry `λ_{ιτ,j} + n − j`) for every `τ: F ↪ Q̄_p`; (3) `ρ` unramified at every finite `v ∉ S`; (4) `ρ|_{G_{F_v}}` unipotently ramified for `v ∈ R`. Then `ρ` is automorphic: there is a cuspidal regular algebraic automorphic representation `Π` of `GL_n(𝔸_F)` of weight `λ` with `ρ ≅ r_ι(Π)`, and `Π_v` is unramified at every finite `v` with `v | p` or `v ∉ S`.

([ACC](#source-acc), §6.5.1, Corollary 6.5.5, pp. 1063–1064). *Needs:* `Layer 5`; `ALS:ALS.5b`.

Conjugate `ρ` into `GLₙ(O)` with reduction `ρ̄_𝔪`; it is a lift of type `𝒮₁` and gives a point `f: R_{𝒮₁} → E`. By `fontaine_laffaille_full_support` the kernel of `f` lies in the support of `H*(X_K, V_λ(1))_𝔪[1/p]`, and the automorphic realization of ALS.5b.8 (ACC Theorem 2.4.10) gives `Π` with `(Π^∞)^K ≠ 0`.

**Auxiliary neatness and Hida weight independence**

Two suitable auxiliary places justify neatness. For the ordinary tower remove the weight by the `ν+w₀μ` character before taking the perfect limit. Specialization then recovers the required finite-level ordinary complex at the new weight.

<a id="neatness-auxiliary-places"></a>

### 5.13 Neatness auxiliary places

Prove `neatness_auxiliary_places`. Let `E` be an imaginary CM field, `n ≥ 2, p` an odd prime, and `ρ̄: G_E → GL_n(k)` continuous and unramified outside a finite set `S′` containing the `p`-adic places. Assume some `σ ∈ G_E − G_{E(ζ_p)}` has scalar `ρ̄(σ)`, and fix a finite forbidden set `R^c` of places. Then infinitely many degree-one places `v` of `E` have odd residue characteristic different from `p`, avoid `S′ ∪ R^c` and the primes ramified in `E/ℚ`, have scalar `ρ̄(Frob_v)`, and satisfy `q_v ≢ 1 mod p`. At such `v`, local Tate duality gives `H²(E_v, ad ρ̄) = H⁰(E_v, ad ρ̄(1))^∨ = 0`. Choose two of distinct residue characteristics and put `S = S′ ∪ {v_0,v′_0}`; pro-v Iwahori factors at these two places make the resulting level neat (ACC Lemma 6.5.2). Their underlying rational primes split in every imaginary quadratic subfield of `E`. If `π_E` is unramified outside `S′` and all other Fontaine–Laffaille seventeen-clause (respectively ordinary fifteen-clause) profile hypotheses have already been arranged, this completes the auxiliary unramified, `H²-vanishing`, two-prime and neat-level requirements; it does not establish the other profile hypotheses.

([ACC](#source-acc), §6.5.12, proof of Theorem 6.1.1, pp. 1073–1074 (and §6.6.10, p. 1084); Lemma 6.5.2, p. 1062, for neatness). *Needs:* `Tau Ceti Chebotarev L10`; `Tau Ceti ClassFieldTheory L5`; `ALS:ALS.1`.

*Route.* Apply Chebotarev to the finite joint residual/cyclotomic extension, using the scalar element outside the cyclotomic subgroup; its conjugacy class gives degree-one places of `E` with scalar residual Frobenius and `q_v ≠ 1 mod p`. Exclude the finitely many forbidden and ramified primes and choose two distinct odd residue characteristics. The adjoint action of scalar unramified Frobenius is trivial; twisting by the nontrivial mod-p cyclotomic value makes `H⁰(E_v,ad ρ̄(1))` zero. Import the finite-module evaluation pairing of local Tate duality to obtain `H²=0`. Apply ArithmeticLocallySymmetricSpaces ALS.0.11, `LocallySymmetric.isNeat_of_two_proUnipotent`, to these two pro-v Iwahori factors. The auxiliary-place target supplies the places to which that existing neatness criterion applies; it supplies only the stated auxiliary clauses of an otherwise arranged profile.

<a id="ordinary-taylor-wiles-levels"></a>

### 5.14 Ordinary Taylor–Wiles levels

Define `OrdinaryTaylorWilesLevels`. For a Taylor–Wiles datum `(Q, (α_{v,i}))` for `𝒮_1` whose places have residue characteristic split in an imaginary quadratic subfield of `F` (a TW datum for all `𝒮_χ; R_{𝒮_{χ,Q}}` an `𝒪[Δ_Q]-algebra, Δ_Q = ∏_{v∈Q} k(v)^×(p)^n`) and `c ≥ 1`: good subgroups `K(c,c)_1(Q) ⊂ K(c,c)_0(Q) ⊂ K(c,c)`, equal to `K(c,c)_v` away from `Q`, with `K(c,c)_0(Q)_v = Iw_v` and `K(c,c)_1(Q)_v` the largest pro-prime-to-p subgroup of `Iw_v` for `v ∈ Q`, so `K(c,c)_0(Q)/K(c,c)_1(Q) ≅ Δ_Q`. `A_1(μ,χ,Q,c) = RHom_{Λ_{1,c}[Δ_Q]}(RΓ_{K(c,c)_0(Q)/K(c,c)_1(Q)}(X_{K(c,c)_1(Q)}, 𝒱_μ(χ^{-1}))^{ord}, Λ_{1,c}[Δ_Q])[−d] ∈ D(Λ_{1,c}[Δ_Q])`, with transpose action of `T^{S∪Q,ord}_Q = T^{S∪Q,ord} ⊗_{T^{S∪Q}} T^{S∪Q}_Q`. Passing to the limit in `c` gives `A_1(μ,χ,Q) ∈ D(Λ_1[Δ_Q])` with `T^{S∪Q,ord}_Q-action` and equivariant isomorphisms `A_1(μ,χ,Q) ⊗^L_{Λ_1} Λ_{1,c} ≅ A_1(μ,χ,Q,c)` and `A_1(μ,χ,Q) ⊗^L_{Λ_1} Λ_1/ϖ ≅ A_1(μ,1,Q) ⊗^L_{Λ_1} Λ_1/ϖ`, compatible with the level-c data. Define `B₁(μ,χ,Q)=A₁(μ,χ,Q)⊗_O O(κ)` with the same diagonal torus action as §4.4 and unchanged commuting `Δ_Q` action, and `B(μ,χ,Q)=B₁(μ,χ,Q)⊗^L_{Λ₁}Λ`. `𝔪^Q =` the contraction of `𝔪` to `T^{S∪Q,ord}; 𝔫^Q =` the ideal of `T^{S∪Q,ord}_Q` generated by `𝔪^Q` and `U_{v,i} − α_{v,1}⋯α_{v,i} (v ∈ Q, 1 ≤ i ≤ n)`.

([ACC](#source-acc), §6.6.1, pp. 1078–1079). *Needs:* `Layer 5`; `Layer 4`; `PF:Layer 0a`; `GGD:G7`; `DP:Layer 8`; `DP:Layer 7`.

Its interface includes:

- `OrdinaryTaylorWilesLevels.levels`: For every `c` the two auxiliary levels agree with `K(c,c)` away from `Q` and use the same imported diamonds at `Q`.
- `OrdinaryTaylorWilesLevels.dual`: The finite ordinary dual complex is formed over `Λ₁,c[Δ_Q]`, with transpose Hecke.
- `OrdinaryTaylorWilesLevels.selected_generator`: The ordinary auxiliary ideal has generators `U_{v,i}−∏_{j≤i}α_{v,j}`, using the ordinary normalization.
- `OrdinaryTaylorWilesLevels.limit`: Perfect reconstruction in `c` commutes with mod-varpi comparison and carries the diamond action.

**Checks.**

- `OrdinaryTaylorWilesLevels.empty` (degenerate): For `Q=∅` the complex is `A₁(μ,χ,c)`.
- `OrdinaryTaylorWilesLevels.single_rank_two` (computation): For `n=2` and `Q={v}`, the ordinary `i=2` generator is `U_{v,2}−α₁α₂`; the FL factor `q_v^{-1}` is absent. For `q_v=3` and roots 2,5 its eigenvalue is 10.
- `OrdinaryTaylorWilesLevels.old_level` (compatibility): All places in `S` outside `Q` retain `K(c,c)_v`; the auxiliary modification does not change their levels.

<a id="ordinary-diamond-augmentation"></a>

### 5.15 Ordinary diamond augmentation

Prove `ordinary_diamond_augmentation`. `𝔫^Q` lies in the support of `H^*(A_1(μ,χ,Q))`, and there are `T^{S∪Q,ord}-equivariant` isomorphisms `A_1(μ,χ,Q)_{𝔫^Q} ⊗^L_{Λ_1[Δ_Q]} Λ_1 ≅ A_1(μ,χ)_{𝔪^Q} ≅ A_1(μ,χ)_𝔪`. Twisting over `Λ₁` first and then selecting the component gives `B(μ,χ,Q)_{𝔫^Q}⊗^L_{Λ[Δ_Q]}Λ≅B(μ,χ)_𝔪`, with the diamond augmentation unchanged.

([ACC](#source-acc), §6.6.1, Lemma 6.6.8, p. 1079). *Needs:* `Layer 5`.

At each finite level `c` the argument of `diamond_derived_augmentation` applies, with the ordinary projector commuting with every map; the compatible perfect complexes of DP:Layer 7 pass the comparison to `Λ₁` and show that `𝔫^Q` lies in the support.

<a id="ordinary-diamond-linear-hecke-map"></a>

### 5.16 Ordinary diamond linear Hecke map

Prove `ordinary_diamond_linear_hecke_map`. Use `B(μ,χ,Q)` of §5.14, and let `_{Δ_Q}T^{S∪Q,Λ_1}=T^{S∪Q,Λ_1}⊗_O O[Δ_Q]`. It acts on `B(μ,χ,Q)_{𝔫^Q}` by the twisted torus and tame Hecke actions and the commuting diamonds. Its image `𝕋=_{Δ_Q}T^{S∪Q,Λ_1}(B(μ,χ,Q)_{𝔫^Q})` is a local `Λ[Δ_Q]`-algebra. Then there are `δ≥1` depending only on `n` and `[F:ℚ]`, an ideal `J⊂𝕋` with `J^δ=0`, and a continuous surjective `Λ[Δ_Q]`-algebra homomorphism `f_{𝒮_{χ,Q}}:R_{𝒮_{χ,Q}}→𝕋/J` such that for every finite `v∉S∪Q` the characteristic polynomial of `f_{𝒮_{χ,Q}}∘ρ_{𝒮_{χ,Q}}(Frob_v)` is the image of `P_v(X)`.

([ACC](#source-acc), §6.6.1, Proposition 6.6.9 and the preceding paragraph, pp. 1079–1080). *Needs:* `Layer 4`; `Layer 5`; `AG:AG2.5`; `LGD:§§7.1–7.6`; `GGD:G8`.

Construct the `Λ`-algebra map at the auxiliary levels as in `ordinary_deformation_hecke_map`, twisting over `Λ₁` before selecting the component. Obtain `Λ[Δ_Q]`-linearity as in `diamond_linear_deformation_hecke_map`, through the algebra generated by the `U_{v,i}` on `B(μ,χ,Q)_{𝔫^Q}`.

**Checks.**

- For `Q=∅` this is the map on `B(μ,χ)_𝔪` of §4.7.
- The torus twist acts trivially on the `Δ_Q` factor, so diamond augmentation commutes with twisting before component specialization.
- With a `C_p` torsion-unit factor, the quotient still acts by `ζ_p`, as in §4.4; adjoining Taylor–Wiles diamonds does not change it to `ζ_p²`.

<a id="ordinary-patching-verification"></a>

### 5.17 Ordinary patching verification

Prove `ordinary_patching_verification`. Fix one nonprincipal ultrafilter on the positive integers for the imported ultrapatching construction. Let `f: R_{𝒮_1} → 𝒪` classify `ρ`. Set `q = h¹(F_S/F, ad ρ̄_𝔪(1)), g = qn − n²[F⁺:ℚ], Δ_∞ = ℤ_p^{nq}, 𝒯 =` a power series ring over `Λ` (the weight algebra) in `n²|S| − 1` variables, `S_∞ = 𝒯⟦Δ_∞⟧`, augmented over `Λ` with ideal `𝔞_∞`. Choose `χ = ∏_{v∈R} χ_v: ∏_{v∈R} Iw_v → 𝒪^×` with `χ_{v,1},…,χ_{v,n}: k(v)^× → 𝒪^×` trivial `mod ϖ` and pairwise distinct. `R^loc = R^{S,loc}_{𝒮_1}, R′^loc = R^{S,loc}_{𝒮_χ}` (GGD:G8 (ACC §6.2.22)); `R_∞, R′_∞ =` power series rings in `g` variables over them. Applying DP:Layer 8 (ACC §6.4.2) to the complexes `B(μ,χ,Q_N)_{𝔫^{Q_N}}` (and `χ = 1`), for Taylor–Wiles data from GGD:G7 (ACC Proposition 6.2.33), gives: bounded complexes `𝒞_∞, 𝒞′_∞` of free `S_∞-modules, T_∞, T′_∞` with nilpotent `I_∞, I′_∞ (I^δ = 0), S_∞`-algebra structures on `R_∞, R′_∞` and surjections `R_∞ → T_∞/I_∞, R′_∞ → T′_∞/I′_∞`; surjections of local `Λ-algebras R_∞/𝔞_∞ ↠ R_{𝒮_1}, R′_∞/𝔞_∞ ↠ R_{𝒮_χ}`; and isomorphisms `𝒞_∞ ⊗^L_{S_∞} S_∞/𝔞_∞ ≅ B(μ,1)_𝔪` and `𝒞′_∞ ⊗^L S_∞/𝔞_∞ ≅ B(μ,χ)_𝔪` in `D(Λ)`.

([ACC](#source-acc), §6.6.1, proof of Theorem 6.6.2, pp. 1080–1081). *Needs:* `Layer 5`; `mathlib:DerivedCategory`; `DP:Layer 7`; `GGD:G7`; `ALS:ALS.1`; `DP:Layer 8`.

*Route.* Use the reconstructed auxiliary `Λ₁` dual complexes, their diagonal `κ`-twists, and then their derived component specializations `B(μ,χ,Q_N)`, with the imported enormous Taylor–Wiles presentations. The twisted diamond augmentation of §5.15 identifies their base complexes with `B(μ,χ)` over the same natural quotient `Λ₁→Λ`. The finite cell models are `arithmetic_finite_cell_models` at neat base level; they prove perfectness at each auxiliary level. First localize at the selected ordered-root ideals, apply the ordinary projector and use `ordinary_diamond_augmentation`. Derived reduction modulo the maximal ideal of `Λ₁[Δ_Q]` identifies the resulting residual complex with the fixed base ordinary complex. By DP:Layer 7, minimal free representatives have ranks equal to its residual cohomology dimensions. These give uniform ranks and amplitude for duality, reconstruction and patching, after localization and projection. Verify compatible mod-varpi reductions, common Hecke images and the fixed-ultrafilter DP Layer 8 hypotheses. Identify the augmentation of `C∞` with `B(μ,1)_m` and of `C∞′` with `B(μ,χ)_m`.

**Checks.**

- For `n=2` and one auxiliary place, each cell at level `K` lifts to `q_v+1` orbits of `Δ_Q` at level `K₁(Q)`, since `[K:K₀(Q)]=q_v+1`. As `q_v` grows these ranks are unbounded before selected-root localization.
- After selected-root localization and ordinary diamond augmentation, reduction to the residue field of `Λ₁[Δ_Q]` gives the fixed base residual ordinary complex; its cohomology dimensions determine the minimal ranks.
- If that residual complex is zero, its minimal representative is zero. This rank bound alone supplies no nonzero automorphic specialization.

<a id="ordinary-support-at-lifting-point"></a>

### 5.18 Ordinary support at the lifting point

Prove `ordinary_support_at_lifting_point`. For the ordinary patched pair just constructed: LGD §§6.24 and 7.1–7.6 (ACC Lemma 6.2.27)(1),(2) give ACC Assumption 6.3.6 (DP:Layer 9)(1),(2) for `R_∞, R′_∞` (the dimension equality `dim R_∞ = dim S_∞ − ℓ_0` needs `g = qn − n²[F⁺:ℚ]`). For `𝔭 =` the preimage in `S_∞` of `Ann_Λ(𝒪(ν + w_0^G μ)^{-1})`, `hida_weight_specialization` gives `(𝒞_∞ ⊗^L S_∞/𝔭)[1/p] ≅ (B(μ,1)_𝔪 ⊗^L_Λ 𝒪(ν + w_0^G μ)^{-1})[1/p]`, whose cohomology is a quotient of `Hom_E(H^{d−*}(X_{K(1,1)}, 𝒱_μ)_𝔪[1/p], E); π` contributes, so by ALS.5b.8 (ACC Theorem 2.4.10) it is nonzero and concentrated in `[q_patch, q_patch + ℓ_0]` (ACC Assumption 6.3.6 (DP:Layer 9)(3)). Let `x ∈ Spec R_∞` be the preimage of `ker f` and `y` its contraction to `S_∞` (the preimage of `Ann_Λ(𝒪(ν + w_0^G λ)^{-1})`). The inertial characters on the diagonal of `ρ|_{G_{F_v}}` are pairwise distinct for `v ∈ S_p`, so `x` lies on a maximal-dimensional component of `Spec R_∞` (LGD §§6.24 and 7.1–7.6 (ACC Lemma 6.2.27)(3)), and ACC Corollary 6.3.9 (DP:Layer 9) gives `ker f ∈ Supp H^*(B(μ,1)_𝔪 ⊗^L_Λ 𝒪(ν + w_0^G λ)^{-1})[1/p]`; by `hida_weight_specialization`, `ker f ∈ Supp H^*(A_1(λ,1,1)_𝔪 ⊗_𝒪 𝒪(ν + w_0^G λ)^{-1})[1/p]`, a quotient of `Hom_E(H^{d−*}(X_{K(1,1)}, 𝒱_λ)_𝔪, 𝒪(ν + w_0^G λ)^{-1}[1/p])`.

([ACC](#source-acc), §6.6.1, proof of Theorem 6.6.2, pp. 1080–1081). *Needs:* `Layer 5`; `Layer 4`; `LGD:§§1.12–1.13,3.7,6.24,7.4–7.6`; `LGD:§§7.1–7.6`; `LGD:§2.15`; `DP:Layer 9`.

*Route.* Verify the ordinary local-ring dimension and generic component hypotheses using LGD §§6.24 and 7.1–7.6 and LGD §2.15. The given `ι-ordinary π` supplies a nonzero ordinary eigensummand after rational weight specialization, rather than merely a class in the larger classical cohomology group. Apply ALS.5b.8 with §0.1’s `arithmetic_franke_inputs` and the named Galois attachments to bound this summand in the reflected range. Apply DP Layer 9 support after specialization at the `O`-point `ker f`, and then apply Hida weight specialization at `λ`. Conclude support at that point only; the source does not claim full support on every ordinary component.

<a id="ordinary-lifting-at-good-level"></a>

### 5.19 Ordinary lifting at good level

Prove `ordinary_lifting_at_good_level`. Under the ordinary good-level hypotheses, let `ρ: G_F → GL_n(Q̄_p)` be continuous and `λ ∈ (ℤ^n_+)^{Hom(F,Q̄_p)}` such that: (1) `ρ̄ ≅ r̄_ι(π)`; (2) for each `v | p, ρ|_{G_{F_v}}` is conjugate to an upper-triangular representation with diagonal characters `ψ_{v,1}, …, ψ_{v,n}`, where `ψ_{v,i}` agrees on the whole inertia group `I_{F_v}` with `σ ↦ ∏_{τ∈Hom(F_v,Q̄_p)} τ(Art_{F_v}^{-1}(σ))^{−(λ_{τ,n−i+1} + i − 1)}`; (3) for each `v | p`, each `i` and each `p`-power root of unity `x ∈ 𝒪_{F_v}: ∏_{τ∈Hom(F_v,Q̄_p)} τ(x)^{λ_{τ,n+1−i} − μ_{ιτ,n+1−i}} = 1`; (4) `ρ` unramified at finite `v ∉ S`; (5) `ρ|_{G_{F_v}}` unipotently ramified for `v ∈ R`. Then `ρ` is ordinarily automorphic of weight `ιλ`: there is an `ι-ordinary` cuspidal automorphic `Π` of `GL_n(𝔸_F)` of weight `ιλ` with `ρ ≅ r_ι(Π)`, and `Π_v` is unramified for every finite `v ∉ S`.

([ACC](#source-acc), §6.6.1, Theorem 6.6.2, p. 1075; proof pp. 1080–1081). *Needs:* `Layer 5`; `ALS:ALS.5b`.

The full flag and the characters on the whole inertia group identify `ρ` with a point `f` of the ordinary global deformation ring; `ordinary_support_at_lifting_point` puts `f` in the support after specializing the Hida weight to `λ`, and automorphic realization (ALS.5b.8) produces `Π`. The ordinary conclusion is support at the specified lifting point; it requires no classification of every determinant-ordinary component.

**Lifting over the original field**

Use the independent soluble field constructions of Layer 2 to reach the good-level hypotheses, apply the appropriate lifting result, and descend. Recover unramified local components using the local Weil–Deligne comparison. The rank-one character case is treated before the higher-rank reduction.

<a id="fontaine-laffaille-lifting-descent"></a>

### 5.20 Fontaine–Laffaille lifting descent

Prove `fontaine_laffaille_lifting_descent`. Let `F, ρ, π, λ, ι` satisfy the hypotheses of `fontaine_laffaille_automorphy_lifting` ((1) `ρ` unramified almost everywhere; (2) `ρ|_{G_{F_v}}` crystalline for `v | p, p` unramified in `F`; (3) `ρ̄` absolutely irreducible and decomposed generic, `ρ̄(G_{F(ζ_p)})` enormous; (4) some `σ ∈ G_F − G_{F(ζ_p)}` with `ρ̄(σ)` scalar, `p > n²`; (5) `π` cuspidal regular algebraic of weight `λ` with `λ_{τ,1} + λ_{τc,1} − λ_{τ,n} − λ_{τc,n} < p − 2n, ρ̄ ≅ r̄_ι(π), HT_τ(ρ) = {λ_{ιτ,1} + n − 1, …, λ_{ιτ,n}}, π_v` unramified for `v | p`). The totally real case reduces to the imaginary CM case by base change. For imaginary `F`: choose `V_0, V_1, V_2` and a soluble CM `E/F` as in the split-test and Fontaine–Laffaille field constructions in Layer 2 and auxiliary places `v_0, v′_0` so that the Fontaine–Laffaille good-level hypotheses hold for `E, π_E` and `S = S′ ∪ {v_0, v′_0}`; `fontaine_laffaille_lifting_at_good_level` for `ρ|_{G_E}` and part (2) of `soluble_base_change_and_descent` give a cuspidal regular algebraic `Π` of `GL_n(𝔸_F)` of weight `λ` with `ρ ≅ r_ι(Π)`, with `Π_{E,w}` unramified for `w ∉ S`; unramifiedness of `Π_v` at finite `v ∤ p` where `ρ` and `π` are unramified follows from the Varma argument. For `v | p`, unramifiedness follows from the unramified component `Π_{E,w}` and `p` being unramified in `E`.

([ACC](#source-acc), §6.5.12, proof of Theorem 6.1.1, pp. 1071–1074). *Needs:* `Layer 2`; `Layer 5`; `AG:AG2.5`.

*Route.* Apply the `E₀E_aE_bE_c` checklist and choose `v₀,v₀′` to satisfy all seventeen good-level hypotheses. Apply `fontaine_laffaille_lifting_at_good_level` over `E`. Descend by `soluble_base_change_and_descent`(2): `ρ|G_E` is irreducible and `ρ|G_E ≅ r_ι(Π_E)`, so `ρ ≅ r_ι(Π)` for a cuspidal regular algebraic `Π` of weight `λ` with the local identity `rec_{E_w}(Π_{E,w}) = rec_{F_v}(Π_v)|_{W_{E_w}}` at every finite place. For `v|p`, the good-level lifting theorem gives `Π_{E,w}` unramified and the Fontaine–Laffaille field construction makes `E_w/F_v` unramified. Thus `I_{E_w}=I_{F_v}`; the all-place local base-change comparison descends unramifiedness. For `v∤p` use the specified split test primes, finite-inertia comparison and Varma, rather than that inertia equality for ramified extensions.

<a id="ordinary-lifting-descent"></a>

### 5.21 Ordinary lifting descent

Prove `ordinary_lifting_descent`. Let `F, ρ, λ, π, ι` satisfy `ordinary_automorphy_lifting` ((1) `ρ` unramified almost everywhere; (2) for `v | p, ρ|_{G_{F_v}}` potentially semistable and ordinary of regular weight `λ ∈ (ℤ^n_+)^{Hom(F,Q̄_p)}`: upper triangular with diagonal `ψ_{v,i}` agreeing with `σ ↦ ∏_τ τ(Art_{F_v}^{-1}(σ))^{−(λ_{τ,n−i+1}+i−1)}` on an open subgroup of `I_{F_v}`; (3) `ρ̄` absolutely irreducible and decomposed generic, `ρ̄(G_{F(ζ_p)})` enormous, some `σ ∈ G_F − G_{F(ζ_p)}` with `ρ̄(σ)` scalar, `p > n`; (4) `π` regular algebraic cuspidal and `ι-ordinary` with `r̄_ι(π) ≅ ρ̄`). The totally real case reduces to the imaginary CM case by base change. For imaginary `F` choose `V_0, V_1, V_2`, the ordinary field extension `E` of Layer 2 and auxiliary places `v_0, v′_0` so that the ordinary good-level hypotheses hold for `E, π_E, S`; `ordinary_lifting_at_good_level` applied to `ρ|_{G_E}` gives an `ι-ordinary` cuspidal `Π_E` of weight `λ_E` with `r_ι(Π_E) ≅ ρ|_{G_E}`; part (2) of `soluble_base_change_and_descent` and `iota_ordinary_soluble_base_change` descend it to an `ι-ordinary` cuspidal regular algebraic `Π` of `GL_n(𝔸_F)` of weight `λ` with `r_ι(Π) ≅ ρ; Π_{E,w}` is unramified for `w ∉ S`, and `Π_v` is unramified at finite `v ∤ p` where `ρ` and `π` are unramified (the Varma local–global comparison).

([ACC](#source-acc), §6.6.10, proof of Theorem 6.1.2, pp. 1081–1084). *Needs:* `Layer 2`; `Layer 5`; `Layer 3`; `AG:AG2.5`.

*Route.* Use the ordinary `E₀E_aE_bE_c` checklist, including residual triviality at `p`, the large local degree and the `p`-power-root character condition. Apply `ordinary_lifting_at_good_level` over `E`. Descend `Π_E` to an `ι-ordinary Π` of weight `λ` with `r_ι(Π) ≅ ρ` by `soluble_base_change_and_descent`(2) and `iota_ordinary_soluble_base_change`; `π_E` is `ι-ordinary` by the same theorem, as clause (8) of the ordinary good-level hypotheses requires. Unramified places `v ∤ p: Π_{E,w}` is unramified for `w | v` by varying `v₀, v₀′`; the local identity of `soluble_base_change_and_descent`(2) makes `rec_{F_v}(Π_v)` finitely ramified, and the semisimplified Varma comparison of AG2.5 with `ρ` unramified at `v` gives `Π_v` unramified.

<a id="fontaine-laffaille-automorphy-lifting"></a>

### 5.22 Fontaine–Laffaille automorphy lifting

Prove `fontaine_laffaille_automorphy_lifting`. Let `F` be an imaginary CM or totally real field, `c ∈ Aut(F)` complex conjugation, `p` a prime, and `ρ : G_F → GL_n(ℚ̄_p)` continuous with: (1) `ρ` unramified almost everywhere; (2) `ρ|_{G_{F_v}}` crystalline for every `v | p`, and `p` unramified in `F`; (3) `ρ̄` absolutely irreducible and decomposed generic (AG2.7; ACC Definition 4.3.1), and `ρ̄(G_{F(ζ_p)})` enormous (AGR:§§7.10–7.12; ACC Definition 6.2.29); (4) there is `σ ∈ G_F − G_{F(ζ_p)}` with `ρ̄(σ)` scalar, and `p > n²`; (5) there is a cuspidal automorphic `π` of `GL_n(𝔸_F)` with (a) `π` regular algebraic of weight `λ` satisfying `λ_{τ,1} + λ_{τc,1} − λ_{τ,n} − λ_{τc,n} < p − 2n` for all `τ; (b)` an isomorphism `ι : ℚ̄_p → ℂ` with `ρ̄ ≅ r̄_ι(π)` and `HT_τ(ρ) = {λ_{ιτ,1} + n − 1, λ_{ιτ,2} + n − 2, …, λ_{ιτ,n}}` for every `τ : F ↪ ℚ̄_p; (c) π_v` unramified for every `v | p`. Then `ρ` is automorphic: `ρ ≅ r_ι(Π)` for a cuspidal automorphic `Π` of `GL_n(𝔸_F)` of weight `λ`; moreover `Π_v` is unramified at every finite `v` with `v | p` or with `ρ` and `π` both unramified at `v`. The first half of (4) only concerns `ρ̄` through its projective image, which has the same image as `ad ρ̄`, so it says that `ζ_p` does not lie in the field cut out by `ad ρ̄`; when `p` is unramified in `F` this holds as soon as the image of `ad ρ̄` has no quotient isomorphic to `(ℤ/pℤ)ˣ` (ACC Remark 6.1.4).

([ACC](#source-acc), §6.1, Theorem 6.1.1 and Remark 6.1.4, pp. 1029–1030). *Needs:* `Layer 5`; `AG:AG2.7`; `AG:AG2.5`; `GGD:G7`; `ALS:ALS.5b`; `Layer 2`; `CS:Layer 1`.

*Route.* For `n=1` use the class-field/Hecke-character correspondence of CS §1.9: a crystalline character unramified almost everywhere is `r_ι` of an algebraic Hecke character. For totally real `F` make the controlled imaginary CM base change with the required splitting and disjointness, and descend using `soluble_base_change_and_descent`(2). For `n≥2` over CM use the corresponding good-level reduction and lifting theorem: `fontaine_laffaille_lifting_at_good_level` through the Fontaine–Laffaille field construction. Read the stated unramified places using rational local-global compatibility, rather than inferring unramified descent from a ramified field extension.

**Checks.**

- No polarization or conjugate self-duality of `ρ` is assumed, and the conclusion is automorphy of `ρ`, not an integral identification of deformation and Hecke rings.
- For `n = 1` the statement concerns a character: it follows from the classification of crystalline (respectively locally algebraic) characters as realizations of algebraic Hecke characters (`CS:Layer 1`), not from patching, and the higher-rank argument keeps its own bound on `p`.

<a id="ordinary-automorphy-lifting"></a>

### 5.23 Ordinary automorphy lifting

Prove `ordinary_automorphy_lifting`. Let `F` be an imaginary CM or totally real field, `c` complex conjugation, `p` a prime, and `ρ : G_F → GL_n(ℚ̄_p)` continuous with: (1) `ρ` unramified almost everywhere; (2) for every `v | p, ρ|_{G_{F_v}}` is potentially semistable and ordinary with regular Hodge–Tate weights: there is `λ ∈ (ℤ^n_+)^{Hom(F,ℚ̄_p)}` such that for each `v | p, ρ|_{G_{F_v}} ∼` an upper-triangular representation with diagonal characters `ψ_{v,1}, …, ψ_{v,n} : G_{F_v} → ℚ̄_p^×`, where `ψ_{v,i}` agrees on an open subgroup of `I_{F_v}` with `σ ↦ ∏_{τ ∈ Hom(F_v, ℚ̄_p)} τ(Art_{F_v}^{-1}(σ))^{−(λ_{τ,n−i+1} + i − 1)}`; (3) `ρ̄` absolutely irreducible and decomposed generic, and `ρ̄(G_{F(ζ_p)})` enormous; (4) there is `σ ∈ G_F − G_{F(ζ_p)}` with `ρ̄(σ)` scalar, and `p > n`; (5) there are a regular algebraic cuspidal automorphic `π` of `GL_n(𝔸_F)` and `ι : ℚ̄_p → ℂ` with `π ι-ordinary` and `r̄_ι(π) ≅ ρ̄`. Then `ρ` is ordinarily automorphic of weight `ιλ: ρ ≅ r_ι(Π)` for an `ι-ordinary` cuspidal automorphic `Π` of `GL_n(𝔸_F)` of weight `ιλ`; for finite `v ∤ p` with `ρ` and `π` unramified at `v, Π_v` is unramified. The weight `λ` is not assumed conjugate self-dual up to twist; the existence of `Π` forces `λ_{τ,i} + λ_{τc,n+1−i}` to be independent of `τ` and `i` by Clozel's purity lemma (ACC Remark 6.1.3, citing Clozel 1990, Lemma 4.9). The argument shows that `ρ` contributes to the ordinary part of completed cohomology and obtains `Π` by Hida weight independence (`hida_weight_specialization`).

([ACC](#source-acc), §6.1, Theorem 6.1.2 and Remark 6.1.3, pp. 1029–1030). *Needs:* `Layer 5`; `AG:AG2.7`; `AG:AG2.5`; `GGD:G7`; `ALS:ALS.5b`; `Layer 2`; `CS:Layer 1`; `Layer 3`.

*Route.* For `n=1` use the class-field/Hecke-character correspondence of CS §1.9: a de Rham character unramified almost everywhere is `r_ι` of an algebraic Hecke character, which is `ι-ordinary` by `IotaOrdinary.gl_one`. For totally real `F` make the controlled imaginary CM base change with the required splitting and disjointness, and descend using `soluble_base_change_and_descent`(2). For `n≥2` over CM use the corresponding good-level reduction and lifting theorem: `ordinary_lifting_at_good_level` through the ordinary field construction. Read the stated unramified places using rational local-global compatibility, rather than inferring unramified descent from a ramified field extension.

**Checks.**

- No polarization or conjugate self-duality of `ρ` is assumed, and the conclusion is automorphy of `ρ`, not an integral identification of deformation and Hecke rings.
- For `n = 1` the statement concerns a character: it follows from the classification of crystalline (respectively locally algebraic) characters as realizations of algebraic Hecke characters (`CS:Layer 1`), not from patching, and the higher-rank argument keeps its own bound on `p`.

### Examples

At rank two a single auxiliary flag index is `q_v+1`, congruent to 2 modulo `p`. The ordinary selected generator is `U_{v,2}−α₁α₂`; the Fontaine–Laffaille normalization retains `q_v⁻¹`. For `μ=(2,0), ν+w₀μ=(0,3)`, and the coefficient character is inverted in the Hida twist. At `q_v ≡ 1 mod p` the finite Hecke relation `T_s² = q + (q−1)T_s` reduces to `T_s² = 1`, which is why the residual Iwahori Hecke algebra is a twisted group algebra.

### Dependencies

Layers 0–4; ALS.1/ALS.5a/ALS.5b, GGD:G7/G8, LGD §§1.12–1.13,3.7,6.24,7.1–7.6/LGD §2.15, DP:Layers 7–9, SR.1.5 and SR.4.3, including uniform free diamond-cell models and compatible reconstruction.

## Downstream consumers

Downstream consumers include WeightZeroCrystallineAutomorphyLifting, CrystallineLocalGlobalCompatibilityCM and ModularityAndLanglandsExtensions: they use the lifting, local–global and transport interfaces in Layers 1–5.

## References

All mathematical statements above are in the conventions stated here. Page locators for ACC and BLGGT refer to the published editions. Qian locators give the journal pagination concordance and the physical page in the NSF online-first PDF. BCGNT, BCGP, Geraghty and Larsen locators refer to the specified author manuscripts. Geraghty's 2010 §5.1 numbering is kept distinct from the later numbering quoted by ACC and Qian.

<a id="source-acc"></a>

- **ACC**: Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor, Jack Thorne, [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf). Published Annals of Mathematics 197 (2023), 897–1113; author-hosted published PDF.

<a id="source-cs-noncompact"></a>

- **Caraiani–Scholze**: Ana Caraiani and Peter Scholze, [On the generic part of the cohomology of non-compact unitary Shimura varieties](https://people.mpim-bonn.mpg.de/scholze/Noncompact.pdf), arXiv:1909.01898, author manuscript with 88 numbered pages; Theorem 1.1, p. 5, §2.8, pp. 33–36, Theorem 4.6.1 and §6.4. Its auxiliary geometric prime is denoted `l` here and its coefficient prime `p`.

<a id="source-scholze-torsion"></a>

- **Scholze**: Peter Scholze, [On torsion in the cohomology of locally symmetric varieties](https://arxiv.org/pdf/1306.2070v2), June 2015 author text. Theorems IV.3.1 and V.4.1 and Corollary V.4.3 give the torsion Hecke interpolation and residual attachments; the published numbering is Theorems 4.3.1 and 5.4.1 and Corollary 5.4.3.

<a id="source-ht"></a>

- **Harris–Taylor**: Michael Harris and Richard Taylor, *The geometry and cohomology of some simple Shimura varieties*, Annals of Mathematics Studies 151, Princeton University Press, 2001, Lemma VII.2.6 (local cyclic base change and restriction).

<a id="source-qian"></a>

- **Qian**: Lie Qian, [Potential automorphy for GL_n](https://par.nsf.gov/servlets/purl/10388233). Inventiones Mathematicae 231 (2023), 1239–1275; NSF-hosted Springer online-first publisher PDF with 37 unpaginated physical pages. Journal page numbers in locators are a concordance; physical PDF pages are recorded separately.

<a id="source-bianchi"></a>

- **BCGNT**: George Boxer, Frank Calegari, Toby Gee, James Newton, Jack Thorne, [The Ramanujan and Sato–Tate Conjectures for Bianchi modular forms](https://www.ma.imperial.ac.uk/~tsg/Index_files/SatoTate.pdf). Author-hosted 2025 PDF; Definition 6.1.2 is on author page 58 and Lemmas 6.1.4–6.1.5 on page 59.

<a id="source-bcgp"></a>

- **BCGP**: George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, [Abelian surfaces over totally real fields are potentially modular](https://www.ma.imperial.ac.uk/~gboxer/abeliansurfacesmodular.pdf). Author-hosted published manuscript (2021); §9.1 pp. 251–252.

<a id="source-chenevier"></a>

- **Chenevier**: Gaëtan Chenevier, [The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings](https://arxiv.org/pdf/0809.0415). Public arXiv author text 0809.0415; determinant-kernel and multiplicity-free reconstruction passages.

<a id="source-blggt"></a>

- **BLGGT (preprint)**: Thomas Barnet-Lamb, Toby Gee, David Geraghty, Richard Taylor, [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561). arXiv 1010.2561 (author preprint of Ann. of Math. 179 (2014), 501–609).

<a id="source-blggt-published"></a>

- **BLGGT**: Thomas Barnet-Lamb, Toby Gee, David Geraghty, Richard Taylor, [Potential automorphy and change of weight](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p03-p.pdf). Published Annals of Mathematics 179 (2014), 501–609; publisher PDF.

<a id="source-kt"></a>

- **KT**: Chandrashekhar Khare, Jack Thorne, [Potential automorphy and the Leopoldt conjecture](https://www.repository.cam.ac.uk/bitstream/1810/254249/1/Khare%20et%20al%202016%20American%20Journal%20of%20Mathematics.pdf). Cambridge repository author manuscript of American Journal of Mathematics 139 (2017), 1205–1273.

<a id="source-nt16"></a>

- **Newton–Thorne**: James Newton, Jack A. Thorne, [Torsion Galois representations over CM fields and Hecke algebras in the derived category](https://arxiv.org/pdf/1511.04913). Forum of Mathematics, Sigma 4 (2016), e21; arXiv 1511.04913. §2.2.7, Proposition 2.10 and Corollary 2.11 are on arXiv pp. 13–14.

<a id="source-jantzen"></a>

- **Jantzen**: Jens Carsten Jantzen, *Representations of Algebraic Groups*, second edition, Mathematical Surveys and Monographs 107, American Mathematical Society, 2003. Part II, 5.5–5.6, pp. 220–221.

<a id="source-zelevinsky"></a>

- **Zelevinsky**: A. V. Zelevinsky, [Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/10.24033/asens.1379.pdf). Annales scientifiques de l'École Normale Supérieure (4) 13 (1980), 165–210; Theorem 4.2 is on p. 184.

<a id="source-prr"></a>

- **Platonov–Rapinchuk–Rapinchuk**: Vladimir Platonov, Andrei Rapinchuk, Igor Rapinchuk, *Algebraic Groups and Number Theory*, Volume I, second edition, Cambridge Studies in Advanced Mathematics 205, Cambridge University Press, 2023. §1.3.2 (non-abelian cohomology) and §2.2 (classification of forms; Theorem 2.15, p. 78).

<a id="source-geraghty"></a>

- **Geraghty (2010 manuscript)**: David Geraghty, [Modularity lifting theorems for ordinary Galois representations](https://web.archive.org/web/20150927002339id_/https://www2.bc.edu/david-geraghty/files/oml.pdf), author manuscript dated 12 March 2010, archived from the author's Boston College page. §5.1, Lemma 5.1.1, p. 59; Definition 5.1.2, Lemmas 5.1.3 and 5.1.5, p. 60; Lemma 5.1.6 and proof, pp. 60–61. The later publication is Math. Ann. 373 (2019), 1341–1427; its numbering is not used as the locator for the older manuscript.

<a id="source-larsen-pink"></a>

- **Larsen–Pink**: Michael Larsen, Richard Pink, [On l-independence of algebraic monodromy groups in compatible systems of representations](https://people.math.ethz.ch/~pinkri/ftp/LP2.pdf), Inventiones Mathematicae 107 (1992), 603–636. Definition 6.5, author p. 14; Proposition 6.14 and §6.15, author p. 15; Proposition 8.9 and Theorem 9.1, author p. 18.

<a id="source-era979"></a>

- **ERA 979**: Groupe d'étude de théorie des nombres de l'Université de Paris VI, [Les nombres transcendants](https://www.numdam.org/issue/MSMF_1984_2_13__1_0.pdf), Mémoires de la Société Mathématique de France (N.S.) 13 (1984), §5(a), Theorem 5.5, p. 48. This is the explicit published formulation of Henniart's rational abelian classification used in §2.8; it credits Henniart's deduction from Waldschmidt's p-adic transcendence theorem. The original reference is Guy Henniart, *Représentations l-adiques abéliennes*, in *Seminar on Number Theory, Paris 1980–81*, Progress in Mathematics 22 (1982), 107–126; the formulation used here is ERA 979’s Theorem 5.5.

<a id="source-larsen"></a>

- **Larsen**: Michael Larsen, [Maximality of Galois actions for compatible systems](https://web.archive.org/web/20100712085741id_/http://mlarsen.math.indiana.edu/~larsen/papers/max.pdf), archived author manuscript of Duke Mathematical Journal 80 (1995), 601–630 ([DOI](https://doi.org/10.1215/S0012-7094-95-08021-1)). Definitions 3.9–3.10 and §3.11, author pp. 22–23; Theorem 3.17, author p. 25. The theorem is density-one hyperspecial maximality for the simply connected inverse image of the connected adjoint image.

The statements above also cite the following works by author, as the sources cite them: Bellaïche–Chenevier, *Families of Galois representations and Selmer groups*, Astérisque 324 (2009); Borel–Tits, *Groupes réductifs*, Publ. Math. IHÉS 27 (1965), 55–150; Chevalley, *Deux théorèmes d'arithmétique*, J. Math. Soc. Japan 3 (1951), 36–44; Clozel, *Motifs et formes automorphes: applications du principe de fonctorialité*, in *Automorphic forms, Shimura varieties, and L-functions* I (1990), 77–159; Clozel–Harris–Taylor, *Automorphy for some l-adic lifts of automorphic mod l Galois representations*, Publ. Math. IHÉS 108 (2008), 1–181; Emerton, *Ordinary parts of admissible representations of p-adic reductive groups* I and II, Astérisque 331 (2010), 355–402 and 403–459; Geraghty, *Modularity lifting theorems for ordinary Galois representations*, Math. Ann. 373 (2019), 1341–1427; Taylor, *Automorphy for some l-adic lifts of automorphic mod l Galois representations. II*, Publ. Math. IHÉS 108 (2008), 183–239; Varma, local–global compatibility for regular algebraic cuspidal representations when l ≠ p (BCGNT reference [Var24], Theorem 1).
