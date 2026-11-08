# Roadmap: galois representations attached to modular and Hilbert modular forms

**Summary.** Build the arithmetic realization of a cuspidal eigenform from
parabolic cohomology, coefficient projectors and local comparison, then identify
its rank-two Galois representations, fixed integral lattices and whole-ring
Hecke determinant. Higher-weight classical and geometric Hilbert constructions
lead to the unrestricted Hilbert constructor and full local compatibility;
in weight one the supplied finite-image Artin representation is placed in the
same normalization. The end results include strict fixed-eigenform compatible systems,
ordinary/crystalline realizations, large-image theorems and deformation maps
over integral Hecke algebras, with ramified monodromy and nilpotents retained.

## Scope and ownership

This roadmap owns the DFG rational/integral premotive comparisons, the Hilbert
normalization dictionary and its nonparallel and unrestricted extensions, and
comparison with integral Hecke and period realizations. Classical attachment,
primitive multiplicity and coefficient descent belong to
AlgebraicModularFormsAndSerreWeights R15.5A; its §7.3 owns residual
attachment, lattice independence and coefficient transport. Its §§6.3–6.4
(R15.5A.2a–R15.5A.3) own the classical weight-one theory: conjugate prime
moments, sparse eigenvalues, the Deligne–Serre image bound, prime-to-order
lifting and the Artin attachment, which §2.10 compares with the normalization
of §1.5. Section 6.2
compares that attachment with the DFG lattice and proves its conductor,
oddness and weight-two torsion consequences; the concrete Kuga–Sato model and
Scholl projector belong to WeightsInEtaleCohomology R34.5. Analytic form spaces,
Hecke operators, primitive/newform decomposition, modular-symbol rational
structures, coefficient fields and period lines belong to
TauCetiRoadmap.ModularForms. Tau Ceti's
`HeckeRing.GL2.EigenformAwayFromLevel` and `HeckeRing.GL2.Newform` already bundle
the analytic cusp form, character and good Hecke eigensystem; the newform bundle
also records the new-space condition and `a₁=1`. These are the analytic inputs,
not a second form-space definition. The Tau Ceti theorem
`TauCeti.det_tateModuleGaloisRepresentation`, for `ℓ` invertible in the separably
closed extension, and its Weil pairing supply the elliptic baseline.

Generic continuous representations, stable lattices, Weil–Deligne functors,
finite/Lie-group classification and Tate modules belong to
ArithmeticGaloisRepresentations and the existing Tau Ceti library. Generic
finite-group averaging is Mathlib's representation invariant projector.
LocalGaloisDeformationRings §1.6 owns the shared coefficient Fontaine–Laffaille
category and its free-lattice and finite-torsion realizations, labelled factors,
Frobenius permutation and coefficient/kernel comparisons. Section 1.5a consumes
those specialisations for labelled tame inertia, integral interval twists and
automorphic applications.
The cyclotomic reciprocity formulas of TauCetiRoadmap.LocalGaloisGroups Layer 5
are already in the pinned Tau Ceti library as
`TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_unit` and
`TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_uniformizer`; their
geometric normalization is an input to the attached-character comparison below.
Generic determinant laws, Cayley–Hamilton reconstruction and coefficient descent
belong to TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants; the new targets here
extract the geometric Hecke module and apply those laws to that module.
Its Layer 3a.1 also supplies characteristic-polynomial duality, character
scaling and the classical `k≥2` coefficient normalization. The coefficient
formulas below fix the additional weight-one and inverse-Hecke-operator
conventions; they do not introduce another determinant or scaling theory.

SmallRamificationAndAbelianVarietyBaseCases §5.0d supplies the arbitrary-rank
compatible-system carrier and its raw operations and convention adapters.
AutomorphicGaloisRepresentationsPartII AG2.P supplies the weak and strict
predicates and their preservation by those operations. Here define rank-two
almost-strict compatibility on that carrier, record chosen `E_λ`-models as
additional realization data, and prove the character converse. The owner's
finite-exception arithmetic specialization does not replace this pairwise
almost-strict predicate. The shared early parallel-weight
eigenpacket attachment belongs to HilbertModularVarietiesAndShimuraCurves
R18.3.29 in type `(k,k−2)`; §3.10's adapter applies the integral Tate twist
for general parallel `(k,w)` before identifying the arithmetic object with our dual.
The classical Hilbert attachment and ordinary filtration are shared with
IntegralIwasawaTheory §9.5, `finiteWeightHilbert_galoisOldform`, for arbitrary
totally real fields and every prime. Sections 3.10–3.11 identify its
field-valued member with the arithmetic dual, and §§4.11 and 5.1 identify
the ordinary filtration on their common eigenpackets. Nonreduced oldform
assembly and integral congruence comparisons belong to IntegralIwasawaTheory;
the nonparallel construction, unrestricted local comparisons and fixed-lattice
theory specified here retain their full scope.
GL2AutomorphicRepresentationsAndTransfer §§R17.3.8a–R17.3.8d owns the algebraic
coefficient modules with their determinant normalization and the monoids `Σ₀`,
`Σ₁`, the quaternionic level forms, the classical quaternionic forms with their
definite averaging projectors, and their Hecke operators with the right cosets at
the levels `K₀`, `K₁`. HilbertModularVarietiesAndShimuraCurves §§R18.5.16a–R18.5.16b
owns those local levels with their indices and the class-set refinement fibres.
The analytic and overconvergent quaternionic forms built on them are the targets
of §§0.2a–0.2f: analytic weights and stages, the level/radius comparison and
property (Pr), certified Hecke matrices and the compact controlling operator,
Fredholm series, slope summands and families, and Bol's identity, partial theta
maps and small-slope classicality over totally real fields. Section 0.3 owns the
eigenvariety gluing on these objects, the comparison with Skinner's operator
normalization and the density of classical points.
The finite-weight
nearly ordinary data and ordinary attached-character formulas are also here.
SerreWeightAndLevelOptimisation §§2.10, 2.13, 4.7–4.8 owns the shared rational
weight-two lowering, coefficient-prime bridge and finite-flat optimization
inputs. Section 6.5 assembles the optimized weight-two wrapper, its extra
characteristic-three character comparison and type-Σ packaging; §7.6 retains
the squarefree lowering wrapper and fixed-form ramification deduction. Their
more general modularity-lifting and potential-automorphy applications consume
these interfaces. No such later theorem is a prerequisite of the attached
representation. The algebraic-character and generic period interfaces of
AutomorphicGaloisRepresentationsPartII, AG2.0 and AG2.P, are independent
suppliers. The unitary and `GL₃` geometric instances used here are targets of
§0.6; comparison of the resulting rank-two members uses the local theorems below.

The Wach construction, including dyadic primes, finite coefficients, lattice
recovery and filtered reduction, belongs to PhiGammaModulesAndIwasawaCohomology
§§6.0–6.1. Section 0.5 compares its embedded lattice with the R07 realization
on their common domain; §5.2 compares it with the specified eigenform lattice.

## Conventions

Let `F` be totally real, `d=[F:ℚ]`, and `π` a cuspidal representation of `GL₂(A_F)`.
Its infinity type `(k,w)` means that at each real embedding `τ` its component is
the discrete series `D_{k_τ,w}`, with `k_τ≥2, k_τ≡w` modulo 2, and central character
`t ↦ sgn(t)^{k_τ}|t|^{-w}`. Parallel weight is asserted only when stated.
For a coefficient number field `E` and `λ|ℓ`, representations are continuous over
`E_λ`; enlarge `E` when needed. No minimal field of definition is built into the
Hilbert constructor.

At an unramified finite `v`, write `q_v` for the residue cardinality and `ϖ_v` for a
uniformiser. The eigenvalues `t_v` and `s_v` are those of the double cosets
`diag(ϖ_v,1)` and `ϖ_v I₂`, respectively. Local class field theory sends `ϖ_v` to
**geometric** Frobenius. For `v∤ℓ` the cyclotomic character `ε_ℓ` has value `q_v⁻¹`
there, and corresponds to `|·|_v`. At `v|ℓ` its reciprocity values include
the algebraic norm factor specified in §4.11; `q_v⁻¹` is not its value
at a coefficient-prime uniformizer.

The single Hilbert object used throughout is `ρ_{π,λ}`, characterized at good
geometric Frobenius by

`P_v(X)=X²−t_vX+q_vs_v`.

Its determinant is `χ_{π,λ}ε_ℓ⁻¹`. Here `χ_{π,λ}` is the Galois character of `π`'s
central character. A twist by an algebraic Hecke character `η` multiplies the
representation by `η_λ`. In particular, `π⊗|det|⁻¹` has type `(k,w+2)` and its
representation is `ρ_{π,λ}⊗ε_ℓ⁻¹`. Its good polynomial is
`X²−q_vt_vX+q_v³s_v`.

| Source object | Expression in this convention |
| --- | --- |
| Carayol `σ_λ(π)` | `ρ_{π,λ}⊗χ_{π,λ}⁻¹ = ρ_{π^∨,λ} = ρ_{π,λ}^∨⊗ε_ℓ⁻¹` |
| Saito `ρ_{f,λ}` | Carayol `σ_λ(π_f)`, with Saito weight `w_S` translated by `w=2−w_S` |
| Kisin `ρ_{π,λ}` and Skinner `ρ_π` | `ρ_{π,λ}` itself |
| Classical cohomological `M_{f,λ}`, type `(k,k−2)` | `ρ_{π_f,λ}` |
| Deligne's classical arithmetic representation | `M_{f,λ}^∨` |
| Skinner–Wiles arithmetic representation | `σ_λ(π)^∨ = ρ_{π,λ}⊗ε_ℓ` |
| Khare–Wintenberger arithmetic representation | `ρ_{π,λ}^∨` in their type `(k,k−2)` setup |
| CDN `ρ_Π`, whose cohomology multiplicity is `ρ_Π(−1)` | `ρ_{π,λ}^∨` for the corresponding `GL₂` transfer |

Saito and Carayol use inverse-uniformiser operators. Their eigenvalues are
`τ_v=t_v/s_v` and `r_v=s_v⁻¹`; `X²−τ_vX+q_vr_v` describes `σ_λ(π)`, not `ρ_{π,λ}`.
The Skinner–Wiles polynomial at arithmetic Frobenius has these same coefficients.
A dual alone does not convert Carayol to the global object: the cyclotomic twist
is part of the identity.

Use the grading `D_HT(V)=⊕_n(V⊗ℂ_p(n))^{G}`. In that grading `ε_ℓ` has degree `−1`,
and `H¹_ét` of an elliptic curve has degrees 0 and 1. At `τ` the degrees of
`ρ_{π,λ}` are

`((w−k_τ+2)/2, (w+k_τ)/2)`.

Both are integral by parity, and their difference is `k_τ−1`. The good-place
Frobenius weight is `w+1`. If cyclotomic Hodge–Tate weight is instead declared `+1`,
the corresponding weights are the negatives of these degrees. Skinner's printed
pair `((w−k_τ)/2,(w+k_τ−2)/2)` requires the shift `w↦w+2` to express our type;
it must not be combined unshifted with his central-character parameter. For `Δ`,
type `(12,10)` gives degrees 0,11 and weight 11; for weight two, type `(2,0)`
gives degrees 0,1.

For Weil–Deligne data at geometric Frobenius `F`, use `FNF⁻¹=q_v⁻¹N`.
Frobenius-semisimplification keeps `N`. Thus a Steinberg parameter cannot be
replaced by the semisimple sum of its two characters. The cohomological local
parameter is `Rec_v(π_v⊗|·|_v⁻¹/²)`; its `L`-factor is `L(s−1/2,π_v)` and its
conductor is that of `π_v`. In Carayol's convention use `π_v^∨` in this `L`-factor.

For a nonzero classical form `f` of level `N` that is an eigenvector of `T_p` for
every prime `p∤N`, write `λ_p(f)` for its `T_p`-eigenvalue. Since
`a₁(T_pf)=a_p(f)`, comparing first coefficients gives `a_p(f)=λ_p(f)a₁(f)`: the
eigenvalue is the `q`-expansion coefficient when `a₁(f)=1`, as for a normalized
newform, and not in general. A multiple `cf` has `a_p(cf)=ca_p(f)` and the same
`λ_p`, and an oldform `f(dτ)` with `d>1` has `a₁=0` and `a_p=0` for every prime
`p∤d`. Statements about eigenforms that need not be normalized are written with
`λ_p`.
For a classical normalized newform of weight `k`, level `N` and nebentypus `ψ`,
`t_p=a_p` and `s_p=ψ(p)p^{k−2}`. The cohomological polynomial at geometric
Frobenius, and the arithmetic-dual polynomial at arithmetic Frobenius, are both
`X²−a_pX+ψ(p)p^{k−1}`. The cohomological polynomial at arithmetic Frobenius
instead has inverse roots. Diamond–Flach–Guo's initial factor realizes the
conjugate eigensystem; the `ψ⁻¹` twist below identifies our `M_f`. Test this with a
character of order greater than two, where `ψ` and `ψ⁻¹` differ.

Reduction always means choose a stable lattice, reduce, then semisimplify.
Only this last object is lattice independent. Residual recognition uses full
characteristic polynomials, including in characteristic two. Distinguish
characteristic-zero global absolute irreducibility, residual absolute
irreducibility, strong irreducibility after restriction to open subgroups, and
local reducibility in an ordinary filtration.

## Exact supplier contracts

Imports below specify mathematical obligations, including necessary extensions
in the supplier's direction. Naming a contract does not assert that its proof is
already in a library. Geometric comparison, local transfer and eigenvariety
interpolation are used only in the stated scope. In particular, an all-place
comparison cannot be deduced from almost-all Satake equality, and field-valued
eigenpoints cannot determine a nilpotent Hecke determinant.

### From Mathlib and the pinned Tau Ceti library

The baseline is Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti
`2fd255d997f47c0b5d834ee416c7015d55444ce5`. Use `ModularForm` and `CuspForm`
with their subgroup and integer-weight parameters, and `Representation` as the
monoid homomorphism into linear endomorphisms. `Submodule.restrictScalars`
retains the underlying set under a scalar tower. `Representation.averageMap`
and `Representation.isProj_averageMap` require a finite group with a chosen Fintype
and an invertible group order.
`Matrix.det_fin_two` and `DualNumber.eps` are the carriers for the division-free
and nilpotent README Checks of §§6.2 and 6.8. `PowerSeries.derivative` and
`Nat.descFactorial` carry Bol's identity of §0.2f and `ContinuousLinearMap` its
small-slope criterion; `Matrix.charpolyRev` with `Matrix.reverse_charpoly` gives the
classical factors of §0.2e, and Tau Ceti's `Matrix.charpolyRev_eq_reflect` and
`Matrix.natDegree_charpolyRev_le` in `TauCeti.LinearAlgebra.Matrix.Charpoly.Reverse`
give their reflection and degree bound. `NumberField.RingOfIntegers.instFintypeClassGroup`
gives the finite class group used by the central-character projector of §0.2c.
Over a complete ultrametric normed commutative ring, as every coefficient algebra `R` of
§0.2a is, Tau Ceti's `TauCeti.MvPowerSeries.restrictedWeightedSubstCLM` in
`TauCeti.RingTheory.MvPowerSeries.TateAlgebra.WeightedSubst` is the continuous linear map
`f↦g·f(h)` between series restricted at positive polyradii, for substituted series `h_i`
of Gauss norm at most the radius of `X_i`; by
`TauCeti.MvPowerSeries.restrictedWeightedSubstCLM_comp`, the map of `(g′,h′)` followed by
the map of `(g,h)` is the map of `(g·g′(h),h′(h))`, and
`TauCeti.MvPowerSeries.norm_restrictedWeightedSubstCLM_apply_le` bounds `‖g·f(h)‖` by
`‖g‖‖f‖`. Each slash operator on the unit-radius module `R⟨z_σ⟩` of §0.2a is such a map,
with `g=j_κ(γ)` and `h=w_γ`, so its action law reduces to the cocycle of the automorphy
factors and the composition of the `w_γ`, and its norm is at most `‖j_κ(γ)‖`. On a stage
of §0.2b, a finite product of Tate algebras, a slash operator is a finite matrix of such
maps, indexed by the discs and by a basis of the algebraic factors: the component of `f|γ`
on a disc `B` is the rescaled substitution applied to the component of `f` on the disc
containing `w_γ(B)`, tensored with the matrix of `γ` on the algebraic factors.
`ContinuousLinearMap.charPowerSeries` in
`TauCeti.Analysis.Normed.Operator.Nonarchimedean.PrModule.Basic` is the Fredholm series
`det(1−Tu)` of an endomorphism `u` of a module with property (Pr) (`TauCeti.HasPr`). If
moreover the scalars have `‖1‖=1` and a multiplicative pseudo-uniformizer
(`TauCeti.NormedRing.IsTate`), as the Banach–Tate algebras of §0.2a do, and `u` is row
compact (`ContinuousLinearMap.IsPrCompact`), it is the principal-minor series of `i∘u∘r`
for every retract presentation `r∘i=id` through a model space
(`ContinuousLinearMap.IsPrCompact.charPowerSeries_eq`). It is the series `H_κ` of §0.2e.
Over the same scalars, `ContinuousLinearMap.IsPrCompact.charPowerSeries_comp_comm` gives
`det(1−T(u∘v))=det(1−T(v∘u))` for a row-compact map `u` between two modules with property
(Pr) and any continuous linear map `v` back, and
`ContinuousLinearMap.IsPrCompact.charPowerSeries_conj` gives invariance of the series of a
row-compact endomorphism under conjugation by a continuous linear equivalence; these are
the cyclicity and conjugation invariance of CompactOperators §1.4, and they carry the
radius and splitting independence of §0.2e.

The analytic eigenform and newform carriers are
`HeckeRing.GL2.EigenformAwayFromLevel` and `HeckeRing.GL2.Newform` in
`TauCeti.NumberTheory.ModularForms.Newforms.Newform`; `N` is nonzero, `k` is an
integer and the nebentypus is a character of `(ZMod N)ˣ`.
`TauCeti.det_tateModuleGaloisRepresentation` in
`TauCeti.AlgebraicGeometry.EllipticCurve.TateModule.Determinant` requires
`(ℓ : K) ≠ 0` for the chosen separably closed extension `K`.
`TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_unit` and
`TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_uniformizer` in
`TauCeti.NumberTheory.ClassFieldTheory.Local.ExplicitCyclotomicSymbol.ArtinMap`
(LocalGaloisGroups Layer 5) use the arithmetic Artin normalization: for a
finite `F/ℚ_p`, a unit `u` of `F` has `χ_cyc(Art_F u)=N_{F/ℚ_p}(u)⁻¹`, and a
uniformizer `ϖ` has `χ_cyc(Art_F ϖ)·N_{F/ℚ_p}(ϖ)=p^f` with `f` the residue
degree. Invert that map for the geometric formulas used here.

### From ModularCurvesPartII

**Sections 14.1–14.4, 14.8, 14.11–14.12.** The universal elliptic
coefficient system `Sym^{k−2}`, finite and adic parabolic cohomology, boundary
and interior comparison, change of level, cohomological Hecke pull–push,
Poincaré pairing and the geometric modular-symbol lattice. Sections 7.1–7.6
supply the Hodge line, `q`-expansion pairing and weight-two differential
comparison. The Betti/de Rham/étale premotivic package, Scholl/DFG projector
comparison, coefficient-field action and `S`-integral newform kernel are the
applications of §§1.1–1.6, using the generic period comparisons specified below.
Here `S` contains the primes dividing `Nk!`, and integral Fontaine–Laffaille
comparison retains its safe interval. No crystalline integral comparison is
asserted at an excluded prime. (Diamond–Flach–Guo §§1.2, 2–3, Lemma 4.12.)

**Sections 13.3–13.6, 14.13–14.15.** The weight-two Hecke algebra `𝕋_ℤ` of `Γ_H(N)` generated by the `T_n` and `⟨d⟩`, acting on `J_Γ` and `T_ℓ(J_Γ)` compatibly with `G_ℚ`; faithfulness on `S₂(Γ, R)` and finite freeness of `𝕋_R`; the Weil-pairing adjointness of `T` and `w_N T w_N`; and `H₁(X_Γ, ℤ) ⊗ ℚ` free of rank two over `𝕋_ℚ` (Darmon–Diamond–Taylor Lemmas 1.34–1.39).

**Sections 17.1–17.2.** Weight-two special-fibre Eichler–Shimura correspondence with Frobenius/Verschiebung components and the corrected ordinary versus supersingular subgroup-scheme fibres. The conventions (the model of `X₁(N)`, the Picard or Albanese action of `T_p` and `⟨p⟩`) under which an arithmetic Frobenius on `V_ℓ(A_f)` has characteristic polynomial `X² − a_pX + ψ(p)p` (Darmon–Diamond–Taylor Theorems 1.41 and 3.1(a)); a character of order at least three distinguishes `ψ` from its inverse.

### From ArithmeticGaloisRepresentations

**Layer 6.** Tate modules of abelian varieties as continuous `G_ℚ`-modules, with their `K_f`-action for `A_f`, and smooth proper base change for good reduction.

**Sections 1.1–1.10.** Existence of `G`-stable lattices in continuous `ℓ`-adic representations of compact groups and Brauer–Nesbitt independence of the semisimplified reduction; Čebotarev uniqueness in characteristic zero, and full-polynomial recognition in arbitrary residue characteristic. Dirichlet characters as finite-order `G_ℚ` characters through `Gal(ℚ(ζ_N)/ℚ)`, arithmetic good Frobenius value `χ(q)`, and the `ℓ`-adic cyclotomic character of good Frobenius value `q`; used for the Eisenstein direct sum. For a complete DVR with finite residue field of characteristic `ℓ`, reduction `GL_n(O/π^(m+1))→GL_n(O/π^m)` is surjective; its successive congruence kernels are additive matrix `ℓ`-groups, and `GL_n(O)` is the topological inverse limit of these groups. Residual recognition in characteristic `ℓ` uses full characteristic polynomials, not traces alone. Stable lattices and lattice-independent residual semisimplification of the Hilbert eigenform representations, followed by full-polynomial recognition over the residue field; the classical-newform residual construction is not this Hilbert input.

**Sections 2.1–2.6.** Weil–Deligne representations of local Weil groups with Deligne's normalisation `F N F⁻¹ = q⁻¹N` for geometric Frobenius, Frobenius-semisimplification and Grothendieck's `ℓ`-adic monodromy theorem. Purity of Weil–Deligne representations in the monodromy sense (Deligne): `q`-Weil numbers, the classification of Frobenius-semisimple indecomposables `Λ ⊗ V_t`, and stability of purity under sums, duals, Tate twists and tensor products (Blasius §§1.8–1.10, Proposition 1).

**Layer 4 and §§5.12, 7.6–7.7.** Dickson's classification for subgroups `G` of `GL₂(𝔽_ℓ)` whose identity representation is semisimple, in the form of Serre, Propriétés galoisiennes des points d'ordre fini des courbes elliptiques (Invent. Math. 15, 1972), §2, Propositions 15–16, as Deligne–Serre 7.2 use it: `G` contains `SL₂(𝔽_ℓ)`, or lies in a Cartan subgroup, or lies in the normaliser of a Cartan subgroup but not in it, or has projective image `A₄, S₄` or `A₅`. The reducible (diagonalisable) case is included. Continuous finite-dimensional Clifford theory and Ribet 1975 Theorem 2.3 for compact semisimple `λ`-adic groups with an open abelian subgroup and infinite projective image. Dickson classification with subfield form, exceptional-group bounds and tame-inertia order argument; generic finite/Lie-group input only, the non-CM Hilbert application is owned here. Generic compact `λ`-adic Lie-group Zariski closure, quaternionic norm-one groups, finite-group classification and integral commutator lifting. The modular inner-twist/Momose application remains owned by Layer 7.

**Layer 5.** Čebotarev recognition in characteristic zero for representations of `G_ℚ` with finite image (Deligne–Serre Lemme 3.2), after realising both over a common field; coefficient descent over a finite field (Lemme 6.13); and the fact that every element of a finite image of `G_ℚ` is a Frobenius at a prime outside any given finite set. Čebotarev/Brauer–Nesbitt recognition and continuous rank-two pseudorepresentation recognition; generic character recognition only; Hilbert irreducibility is proved by §3.14. Serre §7.2 Corollary 2 trace-zero density theorem for a non-CM modular `λ`-adic representation, or the general `p`-adic analytic Chebotarev/Haar-zero hypersurface theorem that implies it. Continuous semisimple recognition by good Frobenius traces.

### From GL2AutomorphicRepresentationsAndTransfer

**R16.3.** Local Langlands for `GL₂(ℚ_p)` and `GL₂(F_v)` with the Hecke normalisation `σ_h` (Carayol 0.5) and its relation to Langlands' (twist by `ω^{1/2}`, contragredient); preservation of conductors, `L`- and `ε`-factors; arbitrary smooth character twists of Steinberg `↔ N ≠ 0`. The twist is unramified exactly when the Weil part has trivial inertia; finite inertia and the monodromy operator remain separate data. Twisting and duality for the Langlands parameter: `Rec_v(π_v ⊗ (χ∘det)) = Rec_v(π_v) ⊗ Rec_v(χ), Rec_v(π_v^∨) = Rec_v(π_v)^∨, π_v^∨ ≅ π_v ⊗ χ_{π_v}⁻¹` for `GL₂`, and preservation of `L-, ε`-factors and conductors under these operations.

**R17.3.** The Jacquet–Langlands correspondence between automorphic representations of `(D ⊗ A_F)^×` and cuspidal representations of `GL₂(A_F)` that are discrete series at the ramification places of `D`, with local functoriality at every place (one-dimensional representations `χ∘Nrd` of `D_v^× ↔ St⊗(χ∘det)` for arbitrary smooth characters `χ:F_v×→ℂ×`; the unramified case requires triviality on `O_D×`), as used by KW II §7 and Taylor. In Skinner §2.4.2, `[F:ℚ]` is even and the totally definite quaternion algebra is split at every finite place. A general definite instance may have finite ramification, must be split above `p` for §0.3, and receives only representations discrete series at its ramification places.

**Checks.**

- Over `ℚ₅`, let `χ` be quadratic on `ℤ₅×` by reduction modulo 5 and
  `χ(5)=1`. Then `χ∘Nrd` is one-dimensional, its transfer is the ramified
  `St⊗(χ∘det)`, and its WD parameter has `N≠0` with nontrivial scalar inertia.
- For `χ=1` the division-algebra character is trivial on `O_D×`; its transfer
  is Steinberg with trivial Weil inertia and nonzero monodromy.
- A ramified principal series has `N=0` despite nontrivial finite Weil inertia;
  inertia alone does not distinguish it from a ramified Steinberg twist.

(Sources: GL2AutomorphicRepresentationsAndTransfer §§R16.3.2 and R17.1.2;
[Bushnell–Henniart](https://link.springer.com/book/10.1007/3-540-31511-X),
§56.1–§56.2, pp. 334–335.)

**R17.4, especially §§R17.4.3, R17.4.13 and R17.4.17.** Local and global base change for `GL₂` along extensions of degree at most 3: Langlands for cyclic extensions and Jacquet–Piatetski-Shapiro–Shalika for non-Galois cubic ones, with the compatibility of the lift with restriction of the Weil–Deligne representation for principal series, special and ordinary cuspidal `π`, which Carayol (12.2.2) asserts without a reference. Cyclic totally real base change, descent and compatibility of attached good-prime polynomials with restriction; do not infer non-normal cubic base change from cyclic base change. Cyclic and non-normal cubic base change with local parameters and compatibility with Galois restriction, including Carayol §12.2.2; cyclic base change alone does not supply the cubic step. Section R17.4.17 supplies the nonnormal cubic comparison. Carayol §12.2.1–12.2.2 uses its local parameter/restriction assertion for principal series, special and ordinary cuspidal components at the chosen place, in addition to almost-all Satake transfer. Abelian (cyclic, solvable) base change of a cuspidal `π` of infinity type `(k,w)` to a totally real `F′`, cuspidal unless `π` is induced from `F′`, compatible with Satake parameters at unramified places and with Rec at every place; totally real quadratic base change; and the Gelbart–Jacquet adjoint lift `Ad(π)=Sym²π⊗ω_π⁻¹` to `GL₃`, cuspidal for non-CM `π`. Section 0.6 transports it by `ω_π|·|⁻¹` to the required `Π=Sym²π⊗|·|⁻¹`, including local parameters, central character and infinity exponents. For an essentially unitary `π` first take its unitary norm twist; the adjoint is unchanged by that twist.

**R17.5.** Automorphic induction `𝒲(L, ξ)` from a CM quadratic extension `L/F` with prescribed local component, archimedean types and behaviour at `v` (Carayol 11.2); Tunnell's globalisation of primitive local representations (`[Tu. 1]`, Theorem 1.3); and the Artin conjecture for tetrahedral (Langlands) and octahedral (Tunnell) representations, with Jacquet–Langlands chapter 12. Algebraic Hecke-character automorphic induction for quadratic extensions, theta-series correspondence, nontrivial quadratic self-twist criterion and index-two induced representation dictionary. The Grunwald–Wang existence theorem in the form Blasius §2.2 uses: for a totally real `F`, a finite place `v` and a finite-order character `ψ` of `F_v^×`, a finite-order idele class character `η` of `F` with `η_v = ψ`. Use §R16.1.8 for the extension with prescribed full local components; §§R17.5.15–R17.5.16 supply the stated globalization and induction.

**Section R16.4.4.** Strong multiplicity one: the away-`p` finite component of a cohomological cuspidal `GL₂` transfer determines its `p`-component; used in CDN Proposition 5.2.

**R16.2.** Classification of the irreducible unitary generic representations of `GL₂(F_v)`: tempered (supercuspidal, twist of Steinberg, unitary principal series) or complementary series `π(μψ, μ⁻¹ψ)` with `μ = |·|^t, 0 < t < 1/2` (Blasius §2.2).

**R17.3.8a–R17.3.8d.** The polynomial coefficient modules `L_{n,s}` over every
commutative ring with their right `∏GL₂` slash, basis and base change, the twisted
symmetric-power description of the left action `g↦(·)|g⁻¹`, the scalar and global-unit
characters, the normalized determinant with the scalar `ν_alg(ϖ_v)^e` that separates
it from the algebraic one on a double coset of determinant valuation `e`, the monoids
`Σ₁(ϖ_v^t)⊂Σ₀(ϖ_v^t)` with the nebentypus twist, and the inclusion into restricted
series. The level forms `M_D(U,A)` for every quaternion algebra over every number
field, with a monoid acting on the right on an arbitrary coefficient module: finite
class sets at every open level, evaluation at class representatives, representative
changes, restriction, trace, colimits, central characters and norms. The classical
forms with their dimension, coefficient extension, change of splitting with or without
nebentypus and integral coefficients, and in the definite case the finite stabiliser
images and their averaging projectors of norm at most `‖|H_i|⁻¹‖`. The operators
`T_v`, `T_{v²}`, `S_v`, `U_{ϖ_v}` and the diamonds, with their right cosets (for
`U_{ϖ_v}` the `q_v` cosets `x_α∈Σ₁(ϖ_v^t)`), the good-place relation in both
determinant conventions, inversion, commutation at distinct places, the commutative
Hecke algebra, compatibility with level and coefficient changes, and the coset norm
bound. Sections 0.2a–0.2f build the analytic theory on these objects, and §0.3 uses
their determinant and operator normalizations.

### From HilbertModularVarietiesAndShimuraCurves

**R18.4.** Shimura curves attached to quaternion algebras over totally real fields split at one real place, with the `ℓ`-adic sheaves `F_λ` and the Hecke decomposition of their cohomology used by Carayol (§§1–10). The CDN §5.2.1 quaternionic Shimura-curve tower and automorphic decomposition of `H¹` with `π_f⊗ρ_π(−1)`, all group actions and direct limits; HK/de Rham multiplicity extraction is owned here. Faithful generic rank-two Hecke multiplicity module from geometric cohomology, including the completed local algebra’s generalised eigenspaces, coefficient change and topology; needed before law descent. R18.3.29, *Early rank-two eigensystem realisation and local compatibility*, supplies the shared early parallel-weight eigenpacket attachment, including its extracted multiplicity, Taylor branch and stable lattice, with its stated local ranges. R18.4.25 supplies the cohomological eigenspace comparison. Section 3.10's parallel-weight adapter normalizes to type `(k,k−2)`, transports the supplied arithmetic object by its integral Tate twist, and identifies it with our dual; §§4.5–4.6 use its local conclusions on their overlap. R18.3.32, *Fixed ramified signs throughout a localized eigensystem*, supplies the common ramified sign with its residual-sign and division-level hypotheses. Nonparallel constructions and unrestricted local extensions remain here. The quaternionic surfaces and their `H²` constituent comparison are constructed in §0.7.

**R18.2.** Carayol's integral models of Shimura curves and their bad reduction (Compositio 59, 1986), on which Theorem `(B)` depends.

**Sections R18.5.16a–R18.5.16b.** The local levels `K₀(I)` and `K₁(I)` of `GL₂` over a
commutative local ring, with bottom-row reduction, the quotient `K₀(I)/K₁(I)≅(A/I)^×`
and their indices (§R18.5.16a, item 4); and, for a group `G` with a subgroup `Γ` and
subgroups `U′⊂U`, the identification of the fibre of `Γ\G/U′→Γ\G/U` over `ΓxU` with
the orbit set `Γ_x\U/U′`, with the resulting class counts and their normal-core case
(§R18.5.16b). Section 0.2c uses them for the class count in its level/radius
comparison.

**Sections R18.2.3, R18.2.6, R18.5.19–R18.5.21.** The quaternionic
`p`-divisible sheaf, split-place height-two Drinfeld level models, the selected
component fields and compatible local tower geometry. Section 3.5 constructs
the supersingular local vanishing-cycle representation `𝒰` and its three
commuting actions from this geometry; the representation itself is part of
that target. The comparison with completed strict-henselization generic-fibre
cohomology uses Brylinski's appendix to Carayol.

### From IntegralIwasawaTheory

**Section 9.5, `finiteWeightHilbert_galoisOldform`.** Use its field-valued
classical Hilbert representation `r_f`, with its Hecke polynomial and ordinary
local filtration, on the common characteristic-zero cuspidal eigenpackets.
The totally real degree and coefficient prime are arbitrary; retain the
finite-weight, level, character and ordinary-refinement hypotheses of that
section. This input requires no absolute irreducibility of the residual
representation. For parallel type `(k,k−2)`, after common coefficient extension,
the comparison is `r_f≅ρ_{π_f,λ}^∨`, with
`det r_f=ψ ε_ℓ^{k−1}=χ_{π_f,λ}⁻¹ε_ℓ`. For type `(k,w)` use §3.10's integral
twist before dualizing. At an ordinary `v|ℓ`, write `β_v` for its unramified
arithmetic quotient character, with arithmetic Frobenius value the normalized
unit root `α_v`. Its subcharacter is `ψ ε_ℓ^{k−1}β_v⁻¹`. Duality makes
`β_v⁻¹` the subcharacter of `ρ_{π_f,λ}`, with geometric Frobenius value `α_v`.
Sections 4.11 and 5.1 transport this filtration and its characters; the
nonparallel nearly ordinary comparison retains its labelled algebraic factors.
The product representation over nonreduced oldform algebras and its integral
Hecke/congruence-lattice comparisons are targets of IntegralIwasawaTheory
§§9.5–9.6.

(Sources: IntegralIwasawaTheory §9.5, `finiteWeightHilbert_galoisOldform`;
[Dasgupta–Kakde](https://arxiv.org/pdf/2010.00657v3), §9.1, pp. 65–66,
properties (1)–(3) and equation (110);
[Dasgupta–Kakde–Silliman–Wang](https://arxiv.org/pdf/2310.16399v1), §3.3,
pp. 27–30, equations (42)–(47).)

**Checks.**

- For a common parallel weight-two ordinary eigenpacket over `ℚ(√5)` at
  `ℓ=2`, neither even degree nor the dyadic coefficient prime excludes the
  shared representation or filtration. A local polynomial `X²+3X+4` has
  exactly one 2-adic unit root; the arithmetic quotient and geometric
  subrepresentation have that same Frobenius value.
- With a nebentypus value of order three, replacing `r_f` by `ρ_{π_f,λ}`
  without dualizing inverts the determinant. For a type `(k,w)` norm twist,
  `r_π=r_f⊗ε_ℓ^{(w−k+2)/2}` is required before taking the dual.
- If an oldform algebra is `E[U]/((U−a)²)`, its element `U−a` is nonzero
  although every field-valued specialization kills it. Agreement of the
  field-valued attachments supplies no nonreduced Hecke or congruence comparison.

### From WeightsInEtaleCohomology and DeligneWeightsAndPurity

WeightsInEtaleCohomology R34.3, “Saito's semistable model and period comparison”,
and R34.6, “Hilbert eigensummands and local monodromy weights”, supply the
geometric Saito comparison: `g>1, w_S≥k_τ≥2`, parity, and a finite discrete-series
place in even degree. Retain the coefficient projectors, nonconstant-coefficient
vanishing and the `p`-normalized monodromy. R34.6, “Transport through actual
arithmetic comparisons”, transports the geometric result through an actual
comparison; it supplies no unrestricted Hilbert theorem. R34.5–R34.6 supply
classical parabolic/Kuga–Sato purity with the projector hypotheses. In Saito's
source grading the étale and log-crystalline monodromy filtrations have weight
`w_S−1` (Saito §8, Proposition 1, §10). The generic geometric input is independent
of the coefficient-prime application of Layer 4.

DeligneWeightsAndPurity §§4.3 and 7.15 supplies proper smooth purity. The surface
weight–monodromy theorem and the quaternionic surface realization required in
the even-degree weight-two case are the precise targets of §0.7.

### From AlgebraicModularFormsAndSerreWeights

**Section 7.3.** Semisimple residual attachment of a nonzero reduction
eigensystem in the integral cusp lattice image, with full good-prime
polynomials, determinant, lattice independence, coefficient extension and
simultaneous transport of the coefficient place and residue embedding.
It agrees with reduction of every attached lift, including our DFG realization
through the comparison of §1.5. Section 6.2 adds that realization comparison,
its conductor bound, oddness consequences and weight-two torsion comparison.

**R15.5.** Mod-`ℓ` modular forms: the Eisenstein weight shift and the lifting of mod-`λ` eigenvalues (Deligne–Serre 6.9–6.11). Deligne–Serre 6.7 includes noncuspidal forms and coefficient characteristic dividing the level. Its reduction-to-weight-at-least-two application assumes a cuspidal integral reduction and `ℓ` prime to level; retain it for that subset and supply the general Eisenstein weight-shift/reduction-image argument and its integrality hypotheses for 6.7. The lifting lemma in R15.5, “The lifting lemma and its sharp limits”, supplies the finite-free commuting-Hecke input.

**R15.5A.1–R15.5A.2.** Primitive classical parabolic multiplicity, its pairing, coefficient descent and higher-weight attachment. Sections 1.1–1.5 compare these with DFG premotives and §3.11 with the Hilbert convention; they do not reconstruct the classical attachment.

**R15.5A.2a–R15.5A.3 (§§6.3–6.4).** The classical weight-one theory, owned there: the conjugate prime-moment bound with coefficient one and the finite eigenvalue set off a prime set of small upper Dirichlet density (Deligne–Serre Proposition 5.1 and its proof 5.2, pp. 518–519; Proposition 5.5 and Remark 5.6, pp. 519–520); residual eigensystems by Eisenstein weight shifting and eigenvalue lifting (Theorem 6.7, §§6.9–6.11 and Lemma 6.13, pp. 521–523); the uniform image bound for semisimple subgroups of `GL₂(𝔽_ℓ)` under the polynomial-support condition `C(η,M)` (§7.1 and Proposition 7.2, pp. 523–524); and the uniform residual bound over split coefficient primes, prime-to-order lifting, the characteristic-zero lift, cuspidal irreducibility and the Artin attachment (§§8.2–8.7, pp. 525–527). Section 2.10 compares that attachment, whose arithmetic Frobenius polynomial is `X²−λ_pX+ψ(p)` with `λ_p` the `T_p`-eigenvalue (Deligne–Serre Theorem 4.1, pp. 513–514), with §1.5.

**R15.2.** Generation of the weight-two Hecke algebra `𝕋_R` of `Γ_H(N)` (Darmon–Diamond–Taylor Lemma 4.1): by the `T_n`, or by the `T_p` and `⟨d⟩`; and, for `D` prime to `N` with `D` odd or 2 invertible in `R`, by the `T_n` with `(n, D) = 1` (Diamond–Im Proposition 3.5.1; Wiles 1995, p. 491).

### From IntegralHeckeAndGaloisDeterminants

**IHG.1.** Chenevier Theorem 2.22(i): faithful Cayley–Hamilton quotient over a henselian local coefficient ring with residually split absolutely irreducible determinant is `M₂(A)`; reconstruction, conjugacy/strict equivalence and continuity. No algebraically-closed-residue hypothesis and no Deligne–Serre lifting step. Characteristic-zero continuous semisimple reconstruction of the compatible Taylor trace/determinant, without assuming that the residual representation at every `λ` is absolutely irreducible. Pseudo-character reconstruction of a continuous semisimple representation from compatible traces and determinants modulo `λ^s` (Taylor's congruence branch).

**IHG.4.** Integral descent/interpolation of a degree-two determinant from an actual rank-two generic Hecke module over a finite flat complete coefficient algebra: closed integral traces, cross coefficients without 1/2, universal polynomial-law identities, finite quotients and continuity. Field-valued reduced points alone are insufficient. For the reduced `O`-flat KW algebra, descend the full determinant law from its actual product representation using integral traces/determinants and mixed coefficients; record continuity. This is an instance of generic interpolation, not Theorem B over an algebraic closure.

### From GlobalGaloisDeformations

**R04.3, especially §§3.3–3.4.** Global representability for supplied local deformation problems and a fixed determinant, with a chosen universal representative when matrices are used. Section 6.6 defines the concrete DDT type-`Σ` problems and proves their closure properties and cofinal-quotient argument. These are inputs to the abstract global theorem. For the Hilbert non-Eisenstein residual representation, the universal fixed determinant `ψχ_p` deformation functor unramified outside `S` (and with every local condition explicitly named when one is imposed). Check the Schur and finite-generation hypotheses of LocalGaloisDeformationRings §§F.2.2, F.2.5 before invoking the universal ring.

### From TauCetiRoadmap.ModularForms

**layer 4 eigenforms newforms primitive forms the conductor.** For `N≥1`
and a characteristic-zero field `K` containing the newform coefficients, the
newform decomposition is `S₂(Γ_H(N), K) = ⊕_f S_{K,f}`, over normalized newforms
`f` of primitive level `N_f | N` with compatible character. The summand is
spanned by `f(aτ)` for `a | N/N_f` (Darmon–Diamond–Taylor Theorem 1.22).
For a prime `p`, put `v=v_p(N/N_f)` and fix `a | N/(N_f p^v)`. If `v≥1`, the
`T_p`-stable chain is `f(ap^iτ)` for `0≤i≤v`, and its characteristic polynomial
is `u^(v−1)(u²−a_p(f)u+ψ_f(p)p)`. Here `ψ_f` is the character extended by zero
modulo the full primitive level `N_f`, so `ψ_f(p)=0` whenever `p | N_f`.
For `v=0` the chain is the line `K f(aτ)` and its polynomial is `u−a_p(f)`.
These are the oldspace formulas of DDT §4.1, pp. 110–111, Lemma 4.4.
In every weight `k≥1`, a nonzero cuspidal eigenform away from the ambient
level `N` has the good eigenvalues of a normalized
newform of primitive level `N_f | N` (Atkin–Lehner–Li). That newform's
coefficients are multiplicative, and at `p | N_f` satisfy
`a_{p^m}(f)=a_p(f)^m` for `m≥0` and `|a_p(f)|<p^(k/2)`.

**Checks.**

- The weight-two form `f=η(τ)²η(11τ)²=q−2q²−q³+2q⁴+⋯`, of primitive level
  11, is a good-Hecke eigenform at ambient level 22. At `p=2`, its coefficients
  satisfy `a₄=2≠4=a₂²` and `|a₂|=2=2^(k/2)`; the primitive bad-prime claims
  do not apply. The two-term oldchain has polynomial `u²+2u+2`.
- At `N=N_f=11` and `p=3`, `v=0` and the line `K f` has polynomial `u+1`,
  rather than a quadratic expression with a truncated exponent.
- At `N=121`, `N_f=11`, `p=11`, `v=1`, the full-level zero extension gives
  `ψ_f(11)=0`, `a₁₁(f)=1` and oldchain polynomial `u(u−1)`.

**layer 0 diamond operators and modular forms with character nebentypus.** Weight-one Eisenstein series with character and their Hecke eigenvalues: an Eisenstein eigenform of type `(1, ε)` on `Γ₀(N)` has `T_p`-eigenvalue `λ_p = χ₁(p) + χ₂(p)` for `p ∤ N`, with Dirichlet characters satisfying `χ₁χ₂ = ε` (Hecke, Mathematische Werke p. 690, as cited in Deligne–Serre 8.1); and the Hecke-stable decomposition `M₁(N, ε) = S₁(N, ε) ⊕ E₁(N, ε)`. For weights `k≥2`, the Hecke-stable cusp/Eisenstein decomposition and Eisenstein good-prime eigenvalue `χ₁(q)+χ₂(q)q^{k−1}`, with `χ₁χ₂=ε`, conductor and parity hypotheses; these give the two arithmetic character summands in Deligne–Serre Theorem 6.1.

**layer 8 modular symbols the integral hecke algebra and coefficient fields.** Use the existing modular-symbol rational structure, coefficient field, integral new Hecke algebra and `±` period lines. Do not reconstruct or renormalise these upstream objects.

### From LefschetzPencilsAndVanishingCycles

**LPV.0.** The vanishing-cycle exact sequence for a proper curve over a strictly henselian discrete valuation ring with a lisse coefficient sheaf, and its compatibility with finite étale covers and group actions, as Carayol uses it in 4.2–4.5.

**Sections 7a.1–7a.3.** The constant-`ℚ_ℓ` graph-monodromy theorem for a stable curve over a strictly henselian discrete valuation ring: `N` surjects onto the kernel of pullback to the normalization. Section 3.4 proves the coefficient version for Carayol's geometric sheaf `ℱ_λ`, using its component cohomology, duality and nondegenerate graph pairing (Carayol §§11.4–11.10). Lissity alone does not imply this surjectivity.

### From AutomorphicLFunctionsAndLocalFactors

**AL.3.** Holomorphy of the standard `L`-function of a cuspidal `GL₂` representation under the stated twist, and nonvanishing of the finite-order Hecke-character `L`-value at the noncancellation point in Skinner p. 256. For cuspidal `π` on `GL₂(A_F)` and an algebraic Hecke character `ψ, L(π ⊗ ψ, s)` is entire. Here `L` denotes the finite Euler-product `L`-function, meromorphically continued, without archimedean factors. For finite-order `θ, L(θ,s)` is finite and nonzero at real `s>1` and at `s=1` when `θ` is nontrivial; `θ=1` has a simple pole at 1. Separately, for an integral norm twist `ψ=θ|·|^a`, prove the meromorphic identity `L(ψ,s)=L(θ,s+a)`. Nonvanishing applies only when the translated argument lies in the stated range. In Skinner p. 256 order `a₁≥a₂` before evaluating at `1+a₁−a₂`; the trivial ratio at equal exponents contributes a pole.

### From FiniteFlatGroupsAndIntegralPadicHodgeTheory

**R07.3.** The underlying `ℤ_ℓ` Fontaine–Laffaille functor, its exactness, lattice comparison and simple-object tame-inertia formula in the safe interval `[0,ℓ−2]`, especially R07.3.9 and R07.3.17. LocalGaloisDeformationRings §1.6 supplies the `O_E`-linear, embedding-labelled free-lattice and finite-torsion specialisations, including coefficient and kernel transport. Section 1.5a uses them with R07.3.9 to prove the residual inertia profiles used in §§1.6, 7.4–7.5. The classical specialization permits fundamental characters of niveau one or two. Endpoint weights require a separate comparison.

**R07.4.** Weight-two good-reduction crystalline representation from the `p`-divisible group of the modular abelian quotient; Barsotti–Tate equivalence in the stated coefficient conventions. The precise inertial/Hodge-type characterisation of weight-two potentially Barsotti–Tate lifts, including `p=2` caveats; no extension of small-range Fontaine–Laffaille to weight `p+1`. The weight-two potentially Barsotti–Tate identification used in KW II Corollary 7.8(ii), with its norm-factor and local type hypotheses.

### From PhiGammaModulesAndIwasawaCohomology

**Sections 6.0–6.1.** Use the embedded integral Wach lattice and its rational
module for crystalline representations over finite unramified `K/ℚ_p`, with
finite coefficient field `E/ℚ_p` and stable `O_E`-lattice. These sections cover
all primes, including 2, and ramified coefficient fields. They supply existence,
uniqueness inside the period realization, lattice recovery, interval twists,
duals, filtered crystalline reduction after inverting `p`, unramified base
change and finite flat coefficient extension. Section 0.5 identifies this
object with R07's realization on their common domain; §5.2 identifies it for
the specified eigenform lattice. No second Wach construction is required.

### From LocalGaloisDeformationRings

**Section 1.6.** The common coefficient Fontaine–Laffaille category over unramified `K/ℚ_ℓ` in `[0,ℓ−2]`, with labelled `O_E⊗_{ℤ_ℓ}O_K` factors and their Frobenius permutation when `E` contains every embedding of `K`. Its free-lattice and finite-torsion specialisations supply the covariant realization by the `ℤ_ℓ`-linear lattice dual and Pontryagin torsion dual of `U_S`, with transported coefficient actions, exactness, coefficient extension, reduction, strict kernels of coefficient-linear filtration-preserving maps commuting with divided Frobenius, and lattice-quotient comparisons. Section 1.5a uses these with its coefficient Fontaine–Laffaille specialization; labelled tame-inertia formulas, integral interval twists and automorphic comparisons belong here.

**Sections 1.7–1.9 and 4.1.** Ordinary flags have finite-projective graded
lines and prescribed ordered characters; the flag scheme and its image ring
are distinct. The image criterion alone does not give an integral flag.
The finite-flat deformation condition is defined on every Artinian truncation,
with the model-closure criterion of §8.6. Section 6.12 applies these conditions
to the specified ordinary or finite-flat Hecke families.

**Sections 3.1–3.7.** Kisin 2.7.6/2.7.7 fixed potentially semistable/crystalline inertial and Hodge-type quotient for any complete Noetherian local `A°` with a free continuous family, with finite-projective period module and coefficient specialisation. The universal pst-deformation-ring node alone is insufficient.

### Period and geometric comparison suppliers

PadicPeriodRings §§4.1–4.3 supplies the actual period rings, topologies,
actions, invariant functors and dimension predicates. FiniteFlatGroupsAndIntegralPadicHodgeTheory
§§R07.P7.1–R07.P7.3 supplies finite coefficient actions, labelled Hodge–Tate
and Sen operators, and rank-one local algebraicity. Its labelled convention
assigns `+1` to the cyclotomic character; negate those labels for this roadmap's
`D_HT` grading. Sections R07.3.0–R07.3.3 and R07.4.13 supply filtered `(φ,N)`-modules,
weak admissibility, the induced-subobject inequality, exactness, full
faithfulness and weakly admissible implies admissible. Sections R07.4.27–R07.4.28
supply descent data at their stated odd-prime hypotheses.
AutomorphicGaloisRepresentationsPartII AG2.P, “Finite-coefficient periods,
descent and geometric comparison”, supplies the finite-field-coefficient
period API and potentially semistable WD descent at every prime, with tensor,
dual, Tate, idempotent and coefficient-change laws. Its geometric comparison
covers proper smooth good-reduction and proper strictly semistable realizations,
with Hyodo–Kato cohomology, filtration, cup products and algebraic
correspondences. These generic comparisons do not assert the eigenform
filtration of §4.11. CrystallineCohomology CR.6 supplies the Hyodo–Kato complexes.

The all-unit rank-one Frobenius formula, central-isogeny lifting, quaternionic
finite-slope family, analytic continuation of a crystalline period and
the comparison of Wach realizations are the targets of §§0.1–0.5.
PhiGammaModulesAndIwasawaCohomology §§6.0–6.1 supplies the all-prime,
finite-coefficient construction. FiniteFlatGroupsAndIntegralPadicHodgeTheory
§R07.4.26(ii) supplies its odd-prime, `ℤ_p`-coefficient realization and
Kisin–Ren comparison. Section 0.5 identifies the two embedded lattices on
that common domain, retaining the Kisin–Ren comparison.

### From AutomorphicGaloisRepresentationsPartII

**AG2.0, “The `l`-adic character `r_{l,ι}(χ)` of an algebraic Hecke character, its
Hodge–Tate numbers and its weight”.** Algebraic-character avatars, compatible
coefficient change, geometric reciprocity and labelled local degrees. Use this
rank-one construction without the higher-rank existence theorem. AG2.P,
“Arbitrary-rank compatible data and operations”, supplies `Weak`, `Strict`
and their preservation under the raw operations on the shared raw
compatible-system carrier of SmallRamificationAndAbelianVarietyBaseCases §5.0d;
AG2.6 populates that carrier. AG2.P, “Independent
classical and Hilbert members”, supplies `hilbertCoefficientPrimeComparison`
with de Rhamness, spherical crystallinity and Iwahori semistability; §4.7
proves the full Hilbert WD comparison. The generic AG2.P period contract is specified above; the independent unitary geometry
and packet calculation needed by Skinner are the targets of §0.6.

### From SmallRamificationAndAbelianVarietyBaseCases

Section 5.0d supplies the shared raw compatible-system carrier for arbitrary number fields and
positive ranks, with finite local realization fields, coefficient embeddings,
monic good polynomials of the specified rank with nonzero constant terms, and
labelled Hodge multisets, without compatibility assertions.
It supplies coefficient extension and conjugation, finite base restriction,
sum, tensor, dual and Tate twist with identity/composition laws, and the
Frobenius/WD and Hodge-sign convention adapters. For marked abelian
realizations, §5.1 supplies the isogeny and base-change transports of marked
`GL₂`-type data, retaining the coefficient action and its selected
`λ`-factor. Section 7.1 uses this raw API and adds its Hilbert models and
pairwise predicate. The arithmetic compatible family of §5.0d is the
carrier's rank-two specialization over `ℚ` with chosen `E_λ`-models; its
finite exceptional coefficient set alone implies no almost-strict comparison
at a pair it excludes.
(Sources: Allen et al. (ACC+),
[*Potential automorphy over CM fields*](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf),
§7.1, pp. 1084–1086; Dieulefait–Pacetti, Definition 1.10, pp. 6–7;
[Snowden](https://arxiv.org/pdf/0905.4266v1), §9.4, pp. 29–30, for abelian realizations.)

### Analytic and unitary geometry suppliers

LocallyAnalyticDistributions §§4.2, 4.15–4.16 supplies Fredholm determinants,
Banach families and finite-slope decompositions; the carriers and Riesz
projectors come from CompactOperators §§1.7, 3.1–3.5 and 4.3 and the affinoid
gluing from RigidAnalyticGeometry Layers 1 and 6. RestrictedPowerSeries §§0.1,
1.1–1.3 and 2.2–2.4, PadicFunctionalAnalysis §§0.3–0.4, 1.1, 2.2, 4.1–4.3, 4.6 and
5.2–5.5, CompactOperators §§0.1–0.3, 1.2 and 1.4–1.7, NewtonPolygons Layer 2 and
AdicSpacesPartII R0.5 supply the restricted series, substitution, derivatives,
identity theorem, Banach modules with property (Pr), analytic characters, determinant
bounds, coefficient polygons and completed tensors used by §§0.2a–0.2f. Section 0.3
glues the quaternionic eigenvariety from the modules of §§0.2c–0.2e and applies the
classicality of §0.2f to prove the density of classical points.
ShimuraVarieties
Layers 1–4 and §§8.18–8.23 supplies algebraic towers, canonical models and
minimal compactification functoriality used by §0.7.
PELModuli M0–M4 supplies the specified unitary PEL moduli problem, universal
abelian schemes, levels, good-prime integral models and canonical-model
comparison. EndoscopicTransferAndUnitaryTraceComparison §§13.1–13.4 supplies
unitary base change and cohomological transfer with its packet hypotheses.
Section 0.6 constructs the particular Blasius–Rogawski packet and cohomological
realizations, including its multiplicity and character corrections.

### Geometry and character contracts used by the concrete constructions

For the Kuga–Sato comparison use WeightsInEtaleCohomology R34.5,
“Classical Kuga–Sato and Hilbert projector comparisons”, “The classical
compactification” and “The higher-weight model comparison”, for the model,
equivariant resolution, full `Γ_r` projector and parabolic comparison.
EtaleCohomologyFoundations §§0.7, F.4.5–F.4.6, F.5–F.7 supplies equivariant
pull–push and duality for the DFG comparison here. For the geometric-character
converse use ClassFieldTheory's geometric reciprocity, GlobalNumberFields'
idele/ray-class and unit theorems, and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.3’s rank-one local
classification. These generic suppliers do not assert the modular irreducibility
theorem which the character converse will prove here.

### From SerreWeightAndLevelOptimisation

SerreWeightAndLevelOptimisation §2.10 owns weight-two trivial-character
lowering for odd `ℓ`, `q∤Mℓ` and an irreducible residual representation
arising at level `Mq` and unramified at `q`, returning a level-`M` eigenform
with coefficient embeddings and a residual isomorphism after common
residue-field extension. Its residual-support argument is part of that supplier.
Section 2.13 supplies descent
to the full prime-to-`ℓ` Artin conductor of a continuous odd irreducible already
modular representation in odd characteristic. Section 4.7 supplies the weight-two
coefficient-prime bridge for odd `ℓ` and an irreducible tame-level eigensystem with
`2≤k≤ℓ+1`, `ℓ∤N` and `ℓ>3` or `N>3`; its conclusion is occurrence at
level `Nℓ`, with only the residual tame character prescribed at `ℓ=3`.
Section 4.8 supplies the `ℓ≥5` finite-flat weight-two case for a continuous odd
irreducible already modular representation, using the actual local extension,
cyclotomic inertial determinant and extension-sensitive
weight-two recipe, with the canonical prime-to-`ℓ` character lift.
Section 6.5 assembles these inputs with the additional characteristic-three
character comparison and the local inertia comparison for the exact
coefficient-prime exponent, then proves type-Σ nonemptiness. Section 7.6
specializes the supplied lowering theorem and deduces fixed-form ramification
from finite newform sets and strong multiplicity one.

## How to read the build

Layer 0 gives the specific period, analytic-family and geometric interfaces used
by the constructions; its §§0.2a–0.2f build the analytic quaternionic forms, their
compact Hecke operators, Fredholm theory and theta classicality on the classical
quaternionic forms of GL2AutomorphicRepresentationsAndTransfer §§R17.3.8a–R17.3.8d.
Layer 1 compares the supplied classical factors and
projectors with DFG premotives. Layer 2 places the supplied weight-one Artin
representation in the normalization of §1.5. Layer 3 builds the geometric Hilbert
local pieces, then the unrestricted representation, its Hodge property and
irreducibility. Layer 4 proves geometric weights and local compatibility on both
sides of the coefficient characteristic; its geometric weight input is
independent of its coefficient-prime theorem. Layer 5 identifies ordinary
lattices, crystalline/Wach factors and CM lines. Layer 6 constructs integral
Hecke families and their deformation maps from the whole geometric determinant.
Layer 7 assembles strict fixed-form systems and their large-image and
ordinary-density consequences. The internal prerequisites of each subsection
point backward in this build. Suggested.lean states the ordinary-prime density
theorem of §7.7 on the pinned newform, coefficient-field and prime-density carriers.
The analytic-form targets of §§0.2e–0.3 require the weight modules of §§0.2a–0.2b as
modules over `Δ_P` and the Banach form spaces of §0.2c with their controlling operator,
built on the pinned weighted substitutions and Fredholm series; the geometric, local and
integral-family targets require the arithmetic carriers specified in their layers.

## Layer 0: Period, family and geometric interfaces

### 0.1 Rank-one local periods with all-unit values

Let `K/ℚ_p` and `E/ℚ_p` be finite, with `E` containing every embedding of `K`.
For a continuous character `η:G_K→E×` that is locally algebraic under geometric
reciprocity, write `η(rec_geom(x))=ν(x)∏_ττ(x)^{−a_τ}` on `K×`, where `ν` is
smooth with finite inertia image and `a_τ` are integers. Prove
the rank-one period formula: `η` is potentially crystalline, its `D_HT` degrees are
`(a_τ)`, and its geometric WD character is `ν`. If `η` is crystalline, for any
uniformizer `ϖ` its `φ^{f_K}` eigenvalue is
`η(rec_geom(ϖ))∏_ττ(ϖ)^{a_τ}=ν(ϖ)`.
For finite inertia obtain the same formula after a finite Galois extension
killing inertia and descend, using norm functoriality. This refines the
supplied local algebraicity criterion by identifying the Frobenius and the
finite unit factor. Prove compatibility with finite coefficient extension,
duals, products and change of uniformizer. The character must be continuous
and unit valued; an arbitrary smooth `ν` with a nonunit value at `ϖ` need not
extend from `K×` to `G_K`.

(Source: [Conrad](https://math.stanford.edu/~conrad/papers/locchar.pdf),
Appendix B, Definition B.1 p. 32, Propositions B.3–B.4 pp. 33–36.)

**Checks.**

- `η=1` gives degree `0, ν=1` and Frobenius 1.
- `η=ε_p` has degree `−1`. Its values are `N(u)` on geometric units and
  `N(ϖ)/q_K` on a uniformizer, so the WD value is `q_K⁻¹`; at `K=ℚ_p`,
  `ϖ=p` its Galois value is 1.
- A finite ramified `η` has degree 0 and nontrivial WD inertia; replacing `ν` by
  its unramified restriction loses that finite character.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P7.1–R07.P7.3;
AutomorphicGaloisRepresentationsPartII AG2.P, “Finite-coefficient periods,
descent and geometric comparison”; LocalGaloisGroups Layer 5.

### 0.2 Crystalline lifting through the central isogeny

For finite `K/ℚ_p` and a crystalline representation into
`(GL₂/{±1})(ℚ̄_p)` whose Hodge cocharacter lifts to `GL₂`, prove
the crystalline central-isogeny lifting theorem: after a finite coefficient extension it is
the image of a crystalline `GL₂`-representation. Keep the lifted cocharacter
and the quotient identification. In the symmetric-square application, two
rank-two lifts with the specified common quotient differ by a continuous
quadratic character; this character need not be unramified. Prove transport
under finite restriction and coefficient extension. No residue-characteristic
restriction is imposed on this characteristic-zero theorem.

(Sources: Wintenberger, Invent. Math. 120 (1995), Theorem 1.1.3,
Proposition 1.2, Remarks 1.1.4;
[Wintenberger 1997](https://www.numdam.org/article/AIF_1997__47_5_1289_0.pdf),
Theorem 2.2.2, pp. 1310–1311;
[Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf),
§2.4.1 p. 252.)

**Checks.**

- The trivial quotient admits the trivial crystalline lift.
- The lift of the Hodge cocharacter is a hypothesis: a quotient cocharacter
  outside its integral image does not define the prescribed lifted type.
- A ramified quadratic twist of a crystalline lift has the same symmetric
  square and need not itself be crystalline. Equality of symmetric squares
  gives potential crystallinity, with the quadratic ambiguity retained.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.0–R07.3.3,
R07.4.13; ArithmeticGaloisRepresentations §7.6; ReductiveGroups Layer 9.

### 0.2a Analytic weights and their slash action

Let `F` be a number field, `D` a quaternion algebra over `F` and `v` a finite place at
which `D` splits, with the identification `j_v:D⊗_FF_v≃M₂(F_v)` fixed as in
GL2AutomorphicRepresentationsAndTransfer §R17.3.8d. Let `K/ℚ_p` be a complete field
containing `σ(F_v)` for every `σ` in the set `Σ_v` of embeddings `F_v→K`, normalized by
`|p|=p⁻¹`, and let `R` be a complete commutative Banach–Tate `K`-algebra, nilpotents
allowed. Matrices act through `j_v` and the embeddings. For `t≥1` use the monoids
`Σ₁(ϖ_v^t)⊂Σ₀(ϖ_v^t)` of §R17.3.8a, whose elements of unit determinant form
`K₁(𝔭_v^t)⊂K₀(𝔭_v^t)`; over `ℚ`, `Σ₀(p^α)` is Jacobs's monoid `Σ_α`. Every element
of `Σ₀(ϖ_v^t)` maps `𝒪_v` into itself by `z↦(az+b)/(cz+d)`, since `cz+d` is a unit,
and for integral matrices with unit `d` the condition `c∈ϖ_v^t𝒪_v` is the norm
condition `|c|≤|ϖ_v|^t<1` used in the estimates below.

An **analytic weight** at `v` is a tuple `κ=(n,ν₀,t,ρ)`: continuous characters
`n,ν₀:𝒪_v^×→R^×`, a level `t≥1` and a radius `ρ>0` such that `x↦n(1+ϖ_v^tx)` on `𝒪_v` is
the restriction of a restricted power series of radius `ρ` in the coordinates
`x_σ=σ(x)`. The determinant character is `ν(ϖ_v^eu)=ν₀(u)`, the normalized convention
of §R17.3.8a: `ν(ϖ_v)=1`, while `ν₀` is arbitrary; the untwisted weights are those with
`ν₀=1`, which the normalization `ν(ϖ_v)=1` alone does not force. An arbitrary
continuous character of `F_v^×` in place of `ν` defines an action in the same way;
replacing it by its normalized version multiplies the operator of a double coset of
determinant valuation `e` by the inverse of its value at `ϖ_v^e`. For `γ∈Σ₀(ϖ_v^t)` let
`w_γ` have coordinates `w_{γ,σ}=(σ(a)z_σ+σ(b))/(σ(c)z_σ+σ(d))` and let
`j_κ(γ)=n(d)·n(1+cz/d)·ν(det γ)`, the middle factor read through the expansion at
`x_σ=σ(c/(dϖ_v^t))z_σ`. When `ρ≥1`, prove *the analytic slash action*:
`f|γ=j_κ(γ)·f(w_γ)` is a bounded operator on `R⟨z_σ:σ∈Σ_v⟩`, independent of the
expansion chosen, with `f|1=f` and `(f|γ)|δ=f|(γδ)`. The restricted algebra is thereby a
right `Σ₀(ϖ_v^t)`-module in the convention of §R17.3.8b. If `‖j_κ(γ)‖≤1` and `‖w_γ‖≤1`
the operator has norm at most one, as on an integral norm model, by Tau Ceti's
`TauCeti.MvPowerSeries.norm_restrictedWeightedSubstCLM_apply_le`. Smaller radii are the
stages of §0.2b.

- The pair `(n,ν₀)` is the same datum as the continuous character `χ(x,y)=n(x)ν₀(y)` of
  `𝒪_v^×× 𝒪_v^×`, recovered by `n=χ(·,1)` and `ν₀=χ(1,·)`; both directions preserve
  continuity and analyticity. A scalar `uI` acts by `n(u)ν₀(u)²`.
- The action can be built from bounded restricted automorphy factors satisfying
  `j(γδ)=(j(γ)∘w_δ)·j(δ)` and `w_{γδ}=w_γ∘w_δ`, which needs no evaluation at points and
  so applies to nonreduced and integral coefficients, or from characters with analytic
  expansions, where the cocycle follows from multiplicativity of `n`. The two
  constructions agree when both apply.
- Geometric decay `‖coeff_m j_κ(γ)‖≤η^{|m|}`, `0≤η<1`, makes `j_κ(γ)` a restricted
  series of radius `r` whenever `rη<1`, and not in general at `r=η⁻¹`.
- Every continuous character with values in a field becomes analytic on some group
  `1+ϖ_v^t𝒪_v`, with `t` depending on the character. Reduce to characters of `ℤ_p`
  through a `ℤ_p`-basis of `𝒪_v` (PadicFunctionalAnalysis §§4.6, 5.4–5.5) and pass to
  the coordinates `x_σ`. That linear change of coordinates is invertible without being
  isometric in general, so the radius shrinks by a constant depending on the basis.
  Expansions are unique by the identity theorem of RestrictedPowerSeries §2.4, under its
  hypotheses on `R`.
- Over `ℚ`, Jacobs's character `κ_J:ℤ_p^×→R^×` corresponds to `n(u)=κ_J(u)u⁻²` and
  `ν=1`, with action `f↦κ_J(cz+d)(cz+d)⁻²f((az+b)/(cz+d))`; the two descriptions give
  the same coefficient modules, hence the same forms and Hecke operators.
- If `n(u)=ε(u)∏_σσ(u)^{n_σ}` with `n_σ≥0` and `ε` of finite order trivial on
  `1+ϖ_v^t𝒪_v`, and `ν₀(u)=∏_σσ(u)^{s_σ}`, then `n(cz+d)=ε(d)∏_σσ(cz+d)^{n_σ}`, and the
  inclusion of §R17.3.8a's `L_{n,s}` in `K⟨z_σ⟩` intertwines its normalized slash,
  twisted by the nebentypus `ε(d mod ϖ_v^t)`, with the analytic slash. In the algebraic
  determinant convention the operators of a double coset of determinant valuation `e`
  differ by `ν_alg(ϖ_v)^e`, as in §R17.3.8a.
- The image of `z^r` is `j_κ(γ)∏_σw_{γ,σ}^{r_σ}`, so
  `∑_r(z^r|γ)X^r=j_κ(γ)∏_σ(1−X_σw_{γ,σ})⁻¹` as a formal series in the `X_σ` with
  restricted coefficients.
- Write `a_{m,r}(γ)` for the coefficient of `z^m` in `z^r|γ`. If for some `s<1` every
  `|σ(c)|` and `|σ(det γ)|` is at most `s` and `‖coeff_m j_κ(γ)‖≤s^{|m|}`, then
  `‖a_{m,r}(γ)‖≤s^{|m|}` for every `r`. With a separate factor `s_σ<1` in each variable
  the bound is `∏_σs_σ^{m_σ}`. Separate bounds `|σ(c)|≤ρ′`, `|σ(det γ)|≤s` and decay
  rate `η` with `ρ′,η≤s` are a special case.
- Without a geometric bound on `j_κ(γ)`, a slash by an element with `|det γ|<1` is a
  bounded multiplication after a strictly contracting substitution, since
  `w_γ(z)−w_γ(z′)=det γ(z−z′)/((cz+d)(cz′+d))`. It is therefore compact
  (CompactOperators §0.3), with no explicit row estimate.
- Continuity of `n` on the compact group `𝒪_v^×` does not by itself give `‖j_κ(γ)‖≤1`
  for an arbitrary Banach-algebra norm; the norm-one statement keeps that bound as a
  hypothesis.

(Sources: [Buzzard,
Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf),
§§9–10, p. 70, for weights as characters of `𝒪_v^×× 𝒪_v^×` and the dictionary
`k=n+2`, `w=v+n+1`; Jacobs, *Slopes of compact Hecke operators*, §1.5, Definition 1.27
and equation (1.5.13), p. 19, for the single character over `ℚ`. The row estimate
follows from the expansion `w_γ=b/d+(det γ/d²)z∑_k(−cz/d)^k`.)

**Checks.**

- Over `ℚ`, `κ_J(u)=u²` corresponds to `n=1`, whose degree-zero classical coefficients
  are the constants; `κ_J(u)=u^{m+2}ε(u)` corresponds to polynomial degree `m`.
- On `diag(u,1)` with `u` a unit, the constant function is multiplied by `ν₀(u)`
  although `cz+d=1`. A model that forgets `ν₀` multiplies it by 1.
- At odd `p`, `2I` acts by `2^k` for `n(u)=u^k` and `ν₀=1`, and by `2^{k+2}` when
  `ν₀(u)=u`.
- The matrix `((1,0),(1,1))` has `c=1`, so it lies in no `Σ₀(ϖ_v^t)`; its Möbius map
  sends `−1` to `∞`, and the condition on `c` is what keeps `𝒪_v` stable.
- Over `K[ε]/(ε²)` the character `u↦1+ε log u` is a nonreduced weight whose `ε`-part no
  field-valued point sees. At `p=2` the family `u↦exp(w log u)` is formed on `1+4ℤ₂` and
  extended through `{±1}`. For `|w|≤1` the same formula converges on all of
  `ℤ₂^×=1+2ℤ₂`, since `log(1+2ℤ₂)=4ℤ₂` (`v₂(log 3)=2`), but `log(−1)=0` makes it
  trivial on `−1`: at `w=1` it sends `−1` to 1 and `3` to `−3`, so it is not `u↦u`, and
  the sign is a separate character of `{±1}`.
- The series `∑_m(ηz)^m` with `|η|<1` has coefficients of norm `|η|^m` and fails to be
  restricted at radius `|η|⁻¹`.
- For trivial weight and `γ=diag(p,1)`, `z^r↦p^rz^r`: the matrix is diagonal and meets
  the row bound with `s=|p|`. For `γ=((1,0),(p,1))`, `w_γ=z/(pz+1)` has `z`-column
  `(−p)^{m−1}` in row `m`. That column decays, but `det γ=1` puts `γ` outside the
  hypotheses of the row estimate.
- For trivial weight, `γ=diag(p,1)` and `δ=((1,0),(p,1))`, both `(f|γ)|δ` and `f|(γδ)`
  take the value `f(p/(p+1))` at `z=1`, while `f|(δγ)` takes `f(p/(p²+1))`. A
  left-action formula fails the right-action law.

*Needs:* GL2AutomorphicRepresentationsAndTransfer §§R17.3.8a, R17.3.8b, R17.3.8d;
RestrictedPowerSeries §§0.1, 1.1–1.3, 2.2, 2.4; PadicFunctionalAnalysis §§0.4, 1.1, 4.6,
5.2–5.5; CompactOperators §0.3; Tau Ceti `TauCeti.MvPowerSeries.restrictedWeightedSubstCLM`,
`TauCeti.MvPowerSeries.restrictedWeightedSubstCLM_comp`,
`TauCeti.MvPowerSeries.norm_restrictedWeightedSubstCLM_apply_le`.

### 0.2b Several places and analytic stages

Let `P` be a finite set of finite places of `F` at which `D` splits, each carrying the
data of §0.2a, and let `Σ_P=⊔_{v∈P}Σ_v`. Form the completed tensor product of the local
coefficient modules over `P`, using AdicSpacesPartII R0.5 for completed tensors and
their `c₀` models, and tensor with the algebraic modules `L_{n,s}` of §R17.3.8a at the
further places where the weight is algebraic. For `0<r≤1` let `B_{v,r}⊂K^{Σ_v}` be the
union of the closed polydiscs of radius `r` centred at the images of the points of
`𝒪_v`, and let `A_{κ,r}` be the completed tensor over `v∈P` of the analytic functions on
`B_{v,r}`, with the slash action of §0.2a; at `r=1` this is §0.2a's module. Since
`|σ(x)|=|x|_v` for every `σ`, at `r=|ϖ_v|^s` the polydiscs at `v` are indexed by
`𝒪_v/ϖ_v^s`; when `F_v=ℚ_p` the disc of `a` has the coordinate `w` with `z=a+p^sw`.
Write `A_{κ,r}` as a finite product of Tate algebras, with the map of discs and the
rescaled substitutions by which each element of `Σ₀(ϖ_v^t)` acts, and prove *the stage
compatibility*: the actions commute with change of radius, refinement of the disc cover
and restriction. An element `γ` of `Σ₀(ϖ_v^t)` maps each disc of radius `r` into a disc
of radius `r`, by the difference formula for `w_γ` in §0.2a. When `det γ` is a unit,
`w_γ` is an isometry of `𝒪_v` with inverse `w_{γ⁻¹}` and permutes the discs; when
`|det γ|<1`, several discs can map into one.

- For `r′≤r` restriction `A_{κ,r}→A_{κ,r′}` is injective, bounded and equivariant;
  injectivity follows by recentring and rescaling each disc (RestrictedPowerSeries
  §§1.2, 2.2, 2.4).
- Reordering the tensor factors intertwines the actions.
- At a place with `F_v=ℚ_p`, restricting `A_{κ,|p|^s}` to the disc of `a` and
  substituting `z=a+p^sw` gives the Tate algebra `R⟨w⟩`.

(Source: [Buzzard,
Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf),
§10, pp. 70–73, for the analytic coefficient modules attached to a weight.)

**Checks.**

- At `p=3` and `s=1` there are three discs, centred at 0, 1 and 2; a one-disc model
  omits two of them.
- The function equal to 1 on `3ℤ₃` and to 0 on the other two discs lies in `A_{κ,1/3}`
  but not in `A_{κ,1}`: it is analytic on each small disc, not on the unit disc.
- Changing radius twice is changing it once: `z=a+p^sw` followed by `w=b+pw′` is
  `z=(a+p^sb)+p^{s+1}w′`.
- At `p=3` and `s=1`, with trivial weight and the coordinate `z=a+3w` on the disc of `a`,
  `((1,1),(0,1))` permutes the discs cyclically and sends `(f₀,f₁,f₂)` to
  `(f₁,f₂,f₀(1+w))`, while `diag(3,1)` maps all three discs into the disc of 0 and sends
  `(f₀,f₁,f₂)` to `(f₀(3w),f₀(1+3w),f₀(2+3w))`. A model in which every element permutes
  the discs gets the second operator wrong. Over a field the stage is not a single Tate
  algebra, which has no idempotent other than 0 and 1, since the function of the second
  Check is one; so neither operator is a single substitution.

*Needs:* §0.2a; AdicSpacesPartII R0.5; PadicFunctionalAnalysis §§4.1–4.3;
RestrictedPowerSeries §§1.2, 2.2, 2.4; GL2AutomorphicRepresentationsAndTransfer §R17.3.8a.

### 0.2c Analytic and overconvergent quaternionic forms

From here `F` is totally real and `D` totally definite, split at every place of `P`. The
level forms `M_D(U,A)`, with evaluation at class representatives, representative
changes, restriction, trace, colimits, central characters and norms, are those of
GL2AutomorphicRepresentationsAndTransfer §R17.3.8b, and the classical forms
`M_{n,s}(U,ε;K)` those of §R17.3.8c. Let `Δ_P⊂D_f^×` consist of the elements whose
component at each `v∈P` lies in the preimage of `Σ₀(ϖ_v^{t_v})`, and let `U⊂Δ_P` be
open. Define the *analytic quaternionic forms* `M_D(U,A_{κ,r})` at every radius at which
the weight acts, and the *overconvergent forms* as the colimit of these spaces under
restriction as every radius tends to zero. Prove the restriction maps injective, from
the injectivity of §0.2b, so that the colimit is the union of the stages inside the
functions on `D_f^×` with locally analytic values. Every norm and every Fredholm
determinant refers to one stage. With coefficients formed at the places of `P` through
`σ∘j_v`, the inclusion of `L_{n,s}` of §0.2a injects classical forms into analytic
forms, compatibly with Hecke operators up to the scalar `ν_alg(ϖ_v)^e` of §R17.3.8a.

**Level/radius comparison.** Let `U` have component `j_v⁻¹(GL₂(𝒪_v))` at each `v∈P`, and
fix `t_v≥1` and `s_v≥0`. Suppose that `n` extends analytically to the polydiscs of
radius `r|ϖ_v|^{s_v+t_v}` about the points of `𝒪_v^×`; this is the region met by `cz+d`
on both sides below. Prove the Hecke-equivariant *level/radius isomorphism*

`M_D(U∩∏_vK₀(𝔭_v^{t_v}),A_{κ,(r|ϖ_v|^{s_v})_v}) ≃ M_D(U∩∏_vK₀(𝔭_v^{t_v+s_v}),A_{κ,r})`,

compatible with nebentypus and with the indexing of discs. Here `K₀(𝔭_v^{t_v})` is
transported by `j_v` and extended by the full component elsewhere. The index
`[K₀(𝔭_v^t):K₀(𝔭_v^{t+s})]` is `q_v^s`, by the indices of
HilbertModularVarietiesAndShimuraCurves §R18.5.16a, item 4, and §R18.5.16b computes the
class set at the deeper level from that at the shallower one.

- The isomorphism varies naturally with the weight and is compatible with shrinking the
  radius on both sides.
- Restricted to polynomial coefficients, it matches the forms whose values are
  polynomial on each disc of radius `|ϖ_v|^{s_v}` with the classical forms of level
  `U∩∏_vK₀(𝔭_v^{t_v+s_v})`.

**Stabilisers and property (Pr).** The class set `Cl(U)` is finite (§R17.3.8b). If every
stabiliser `Γ_i` acts trivially on the coefficients, evaluation identifies
`M_D(U,A_{κ,r})` with `C₀(Cl(U)×ℕ^{Σ_P},R)`, tensored with a finite algebraic index when
algebraic factors are present, and the classical forms have dimension
`#Cl(U)·∏_σ(n_σ+1)` (§R17.3.8c). For compact open `U`, the definite case of §R17.3.8c
makes each `Γ_i` act on `A_{κ,r}` through a finite group `H_i` whenever `F^×∩U` acts
through a finite group; for an affinoid family require one finite quotient through which
every weight of the family acts. The average `E_i=|H_i|⁻¹∑_{h∈H_i}slash(h)` of
§R17.3.8c is defined because `R` is a `K`-algebra; it is bounded, being a finite sum of
bounded slash operators, and is an idempotent with image `A_{κ,r}^{Γ_i}`, of norm at
most `‖|H_i|⁻¹‖` for an isometric action. Prove *property (Pr) for analytic forms*: the
product `E` of the `E_i` projects the block model `⊕_iA_{κ,r}` boundedly onto
`M_D(U,A_{κ,r})`, so this space is a bounded direct summand of a model space, since
`A_{κ,r}` is a finite product of Tate algebras, and it has property (Pr) by
PadicFunctionalAnalysis §2.2.

**Central characters.** Let `U` be compact open and `ψ` a character of `𝔸_{F,f}^×` as
in §R17.3.8b: trivial on `F^×`, with `a|z=ψ(z)a` for `z∈U∩𝔸_{F,f}^×`. Right translation
by a central element preserves `M_D(U,A)` and commutes with the Hecke operators of
§R17.3.8d and with restriction between stages. Prove that the operators
`φ↦ψ(z)⁻¹φ(·z)`, `z∈𝔸_{F,f}^×`, act through the finite group
`C_U=𝔸_{F,f}^×/F^×(U∩𝔸_{F,f}^×)`, an extension of the class group of `F` (finite by
Mathlib's `NumberField.RingOfIntegers.instFintypeClassGroup`) by a quotient of the
finite group `Ô_F^×/(U∩𝔸_{F,f}^×)`, and that their invariants are the central-character
forms of §R17.3.8b. Averaging over `C_U` is then a bounded Hecke-equivariant projector
onto those forms, which therefore have property (Pr) on every analytic stage.

(Sources: [Buzzard,
Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf),
§10, pp. 70–73, for overconvergent forms, Proposition 11.1, p. 75, and Lemma 12.1, p. 78,
for the level/radius comparison.)

**Checks.**

- At `s_v=0` the level/radius isomorphism is the identity.
- Take `F=ℚ`, a single class whose stabiliser is central and acts trivially on the
  coefficients, and polynomial degree `k`. Forms whose values are polynomial on each of
  the `p^s` discs then form a space of dimension `p^s(k+1)`. On the other side
  `[K₀(p^t):K₀(p^{t+s})]=p^s`, central elements lie in every `K₀(p^{t+s})`, and the
  normal-core case of §R18.5.16b gives `p^s` classes, each with `k+1` dimensions.
- Without the analytic extension of `n`, the left side is not defined; a condition on
  the radius `r|ϖ_v|^{s_v}` alone does not supply it.
- A single class whose stabiliser acts trivially, with constant coefficients, gives a
  one-dimensional space.
- For `F` real quadratic and `U` containing `Ô_F^×`, each stabiliser contains `𝒪_F^×`,
  which has a unit `u` of infinite order. When `n_σ+2s_σ=w` is parallel, `u` acts by
  `N_{F/ℚ}(u)^w=±1` (§R17.3.8a), so the stabiliser still acts through a finite group.
  Over `ℚ(√2)` the unit `ε=1+√2` has norm `−1` and acts by `−1` when `w` is odd, while
  `ε²` acts by 1; a model in which parallel-weight units act as the identity misses this
  sign. For weights `(w₁,w₂)` with `w₁≠w₂`, `u` acts by `N(u)^{w₂}σ₁(u)^{w₁−w₂}`, of
  infinite order, and the finite-group hypothesis fails.
- Over `ℚ`, `𝔸_{ℚ,f}^×=ℚ_{>0}^×·Ẑ^×`. If `U∩𝔸_{ℚ,f}^×` is the group of units of `Ẑ`
  congruent to 1 modulo `N≥3`, then `C_U≅(ℤ/N)^×/{±1}`, of order `φ(N)/2`: the global
  unit `−1` lies in `F^×`, so `ψ(−1)=1` is forced, and averaging over `(ℤ/N)^×` instead
  of this quotient divides by the wrong order.

*Needs:* §§0.2a–0.2b; GL2AutomorphicRepresentationsAndTransfer §§R17.3.8a–R17.3.8d;
HilbertModularVarietiesAndShimuraCurves §§R18.5.16a–R18.5.16b; PadicFunctionalAnalysis
§§0.3, 1.1, 2.2; Mathlib `Representation.averageMap`, `Representation.isProj_averageMap`,
`NumberField.RingOfIntegers.instFintypeClassGroup`.

### 0.2d Certified Hecke matrices and the compact controlling operator

On analytic forms use the operators of GL2AutomorphicRepresentationsAndTransfer
§R17.3.8d with `Δ=Δ_P`. At `v∈P` with level component `K₀(𝔭_v^{t_v})` or
`K₁(𝔭_v^{t_v})`, `U_v=U_{ϖ_v}` has the `q_v` right cosets `x_α∈Σ₁(ϖ_v^{t_v})` of that
section. Away from `P` and the level use `T_w` and `S_w^{±1}`, and diamonds at `K₁`
places. The controlling operator is `U_P=∏_{v∈P}U_v`. Let `𝕋` be the `R`-algebra
generated by the `U_v`, the `T_w` and `S_w^{±1}` outside a finite set and the diamonds;
it is commutative by the Hecke-algebra statement of §R17.3.8d.

**Certificates.** For `UηU=⊔_tUx_t⊂Δ_P`, a Hecke certificate is a choice of
representatives `c_i` of `Cl(U)` and factorizations `c_ix_t⁻¹=d_{i,t}c_{π(i,t)}u_{i,t}`
with `d_{i,t}∈D^×` and `u_{i,t}∈U`. From §R17.3.8d's coset formula,
`(T_ηφ)(c_i)=∑_tφ(c_{π(i,t)})|(u_{i,t}x_t)`. Prove that `T_η` is the restriction to
`⊕_iA^{Γ_i}` of the block matrix `B_{ij}=∑_{t:π(i,t)=j}slash(u_{i,t}x_t)` of bounded
operators on `⊕_iA`. Two certificates give one operator on the invariant product,
although their block matrices on `⊕_iA` may differ when stabilisers act nontrivially;
with the projector `E` of §0.2c, `BE` is an ambient extension with image in the
invariant part. Neither the operator nor its determinant depends on the certificate or
the class representatives, nor, under the hypotheses of §R17.3.8c on the conjugating
element at the places of `P`, on the splitting, up to the right translation of §0.2e.

**Compactness.** Prove *the compactness of the controlling operator*. The coset
representatives at `v` contract the `v`-coordinates by `|ϖ_v|`, so `U_P` factors through
restriction from the stage of radius `r` to the stage of radius `r|ϖ_v|` at every `v∈P`,
followed by a bounded map back, of norm at most one when the automorphy factors have
Gauss norm at most one. Hence `U_P` is compact on every stage at or below the admissible
radius (CompactOperators §0.3), and norm-nonincreasing for such a weight. Compactness is
the row-decay property `IsRowCompact` of CompactOperators §0.2, equivalently
approximation by finite-rank operators (§0.1); the reverse implication is used only
where its finite-lifting hypotheses hold. It passes to the finite block decomposition
and through the bounded projection `E`. For weights with the coefficient bound of §0.2a
prove `‖B_{(i,m),(j,r)}‖≤∏_σs_σ^{m_σ}` with every `s_σ<1`. Prove the stage links: for
`r|ϖ_v|≤r′≤r` at every `v∈P`, restriction `α` from the stage `r` to the stage `r′` and
the map `c` back through the stage `r|ϖ_v|` satisfy `cα=U_P` on the stage `r` and
`αc=U_P` on the stage `r′`, Hecke-equivariantly. Restriction between arbitrary
admissible stages `r′≤r` is a finite composite of these primitive links.

- If one analytic variable is not contracted, the rows do not decay cofinitely; when the
  remaining coefficient factors are finite-dimensional, contraction in the analytic
  variables suffices.
- The operators of `𝕋` have norm at most the largest slash norm of their terms
  (§R17.3.8d), so at most one for isometric slash operators.

(Sources: Jacobs, *Slopes of compact Hecke operators*, §1.6, pp. 20–21, for certified
matrices over `ℚ`; [Buzzard,
Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf),
Lemma 12.2, pp. 78–79, for compactness, and Lemma 13.1, pp. 79–80, for links.)

**Checks.**

- For a single class with trivial stabiliser action, the matrix of `U_v` is the one
  entry `B_{11}=∑_tslash(u_{1,t}x_t)`, which has `q_v` terms.
- An element `s∈Γ_{c_j}` satisfies `c_js=δc_j` for some `δ∈D^×`, so the pair `(dδ⁻¹,su)`
  is another admissible factorization. It replaces `a|(ux_t)` by `(a|s)|(ux_t)`, which
  agrees on `A^{Γ_{c_j}}` but not on `A` when `s` acts nontrivially.
- Factorizations of `c_ix_t` instead of `c_ix_t⁻¹` compute the operator of `Uη⁻¹U`,
  which differs from `U_v`.
- In one variable with trivial weight, `diag(ϖ_v,1)` sends `f(z)` to `f(ϖ_vz)`; its
  matrix is diagonal with entries `ϖ_v^m`, which tend to zero, and finitely many copies
  of it behave the same way.
- The map `f(z₁,z₂)↦f(pz₁,z₂)` restricts to the identity on `K⟨z₂⟩`, so it is not
  completely continuous.
- With two analytic places, a single `U_v` leaves the other place's infinite-dimensional
  factor uncontracted and is not compact.

*Needs:* §§0.2a–0.2c; GL2AutomorphicRepresentationsAndTransfer §§R17.3.8c, R17.3.8d;
CompactOperators §§0.1–0.3.

### 0.2e Fredholm series, slopes and families

**Fredholm series.** For the compact operator of §0.2d define `H_κ(T)=det(1−TU_P)` as
Tau Ceti's `ContinuousLinearMap.charPowerSeries` (CompactOperators §1.5) on the property
(Pr) module of §0.2c. Evaluation at the class representatives and the projector `E` of
§0.2c form a retract presentation through the block model, a model space in coefficient
coordinates, whose extension of `U_P` is `BE`; so
`ContinuousLinearMap.IsPrCompact.charPowerSeries_eq` makes `H_κ` the block-model
determinant of `BE`, independent of the certificate and the representatives. Prove that
it does not depend on the splitting or, on overlapping admissible stages, the radius. For
the splitting, let `j′_v=h_vj_vh_v⁻¹` at a place `v∈P`, with `h_v∈GL₂(F_v)` meeting the
two assumptions of GL2AutomorphicRepresentationsAndTransfer §R17.3.8c, put
`w_v=j_v⁻¹(h_v)`, so that `j′_v(x)=j_v(w_vxw_v⁻¹)` on `D⊗_FF_v`, and let `w∈D_f^×` have
component `w_v` at `v` and 1 elsewhere. Those assumptions make `w` normalize the level
`U`: through `j_v` its component at `v` is `U′=K₀(𝔭_v^{t_v})` or `K₁(𝔭_v^{t_v})`
(§0.2d), the conjugate `h_vU′h_v⁻¹` is a group inside `Σ₀(ϖ_v^{t_v})`, hence inside the
unit group `K₀(𝔭_v^{t_v})`, the congruence on `d` keeps it inside `K₁(𝔭_v^{t_v})` when
`U′` is, and conjugation preserves Haar volume, so `h_vU′h_v⁻¹=U′`. Right translation
`R:φ↦φ(·w⁻¹)` then carries forms for `j_v` to forms for `j′_v` at the same level and
stage, since `φ(guw⁻¹)=φ(gw⁻¹)|j_v(wuw⁻¹)=φ(gw⁻¹)|j′_v(u)` for `u∈U`. It sends
evaluation at the class representatives `c_i` to evaluation at the representatives
`c_iw`, so it is an isometry for these and a bounded isomorphism for any others
(§R17.3.8b), and it commutes with restriction between stages. It carries the operator
of `UηU` for `j_v` to that of `Uw⁻¹ηwU` for `j′_v`, where `j′_v(w⁻¹ηw)=j_v(η)`, and
fixes the operators at the other places, so it intertwines the two operators `U_P`.
The conjugation invariance of CompactOperators §1.4 (Tau Ceti's
`ContinuousLinearMap.IsPrCompact.charPowerSeries_conj`, for a continuous linear
equivalence that need not be isometric) applied to `R` gives the splitting independence.
When the level at `v` is `K₀(𝔭_v^{t_v})` and `h_v∈K₀(𝔭_v^{t_v})`, `w` lies in `U` and
`R` is §R17.3.8c's coefficient map, the slash by `h_v⁻¹`; for other conjugating elements
a slash by `h_v^{±1}` need not act on the analytic coefficients, on which only
`Σ₀(ϖ_v^{t_v})` acts (Checks). The radius independence uses the links of §0.2d and the
cyclicity of CompactOperators §1.4 (Tau Ceti's
`ContinuousLinearMap.IsPrCompact.charPowerSeries_comp_comm`), which applies to a
link whose restriction `α` or return map `c` is row compact, as `α` is when `r′<r` at
every `v∈P`; density of one stage in another proves nothing here.
Over a complete field the nonzero eigenvalues of `U_P`, with algebraic multiplicity, are
the reciprocals of the zeros of `H_κ`, and CompactOperators Layers 3–4 give
finite-dimensional slope summands. Over a Noetherian affinoid `R`, a slope factorization
of `H_κ` gives a finite projective summand, which every operator of `𝕋` preserves since
it commutes with `U_P` (CompactOperators §§3.4–3.5 and 4.3); the image of `𝕋` in its
endomorphisms is finite over `R`, because the endomorphisms of a finite projective module
over the Noetherian ring `R` form a finite `R`-module. If the field is complete and
algebraically closed, `𝕋` has a common eigenvector in each nonzero slope summand and only
finitely many eigensystems there (CompactOperators §3.5). The ordinary part is the
slope-zero summand.

- The operators of `𝕋` preserve every slope summand.
- The eigenvalue zero is invisible to `H_κ`, and no global eigenbasis is asserted.
- If `‖U_P‖≤1`, the ordinary part is the summand of slope at most zero.

**Coefficient bounds.** When the `j`-th row of the ambient matrix has norm at most
`b_j`, with `b₀≥b₁≥⋯`, CompactOperators §1.2 gives `‖coeff_nH‖≤∏_{j<n}b_j`. With trivial
stabiliser action, one analytic variable, `h_U=#Cl(U)` and `b_j=s^{⌊j/h_U⌋}`, this is
`v_p(coeff_nH_κ)≥(−log_ps)∑_{j<n}⌊j/h_U⌋`. With `d≥1` variables order the multi-indices
by total degree, so that degree `m` occurs `h_U·binom(m+d−1,d−1)` times. An invariant
projection of norm at most `C` gives rows `Cb_j` for `BE` and the bound `C^n∏_{j<n}b_j`.
Through NewtonPolygons Layer 2 these bound the partial sums of the ordered slopes. In
the contractive one-variable case `s=|ϖ_v|`, the summand of slope at most `h` has
dimension at most the largest `n` with `v_p(ϖ_v)∑_{j<n}⌊j/h_U⌋≤nh`, and every such `n`
is smaller than `h_U(⌊2h/v_p(ϖ_v)⌋₊+2)`, for every real `h`, where `⌊x⌋₊=max(⌊x⌋,0)`.
Over the field `K`, a finite-dimensional `U_P`-stable subspace `W`, such as a classical
subspace, has a bounded complement in the property (Pr) module, because finitely many
coordinate functionals of the model space are independent on `W`; so the
block-triangular formula of CompactOperators §1.6 makes `det(1−TU_P|W)` a factor of
`H_κ`. That factor is Mathlib's `Matrix.charpolyRev` of a matrix of `U_P` on `W`, the
reflection at degree `d=dim W` of its characteristic polynomial (Mathlib
`Matrix.reverse_charpoly`, Tau Ceti `Matrix.charpolyRev_eq_reflect`), of degree at most
`d` (Tau Ceti `Matrix.natDegree_charpolyRev_le`).

- The bounds control sums of the first `n` slopes; a single slope is not bounded this
  way.
- Equality in a bound needs a separate argument, such as a dominant principal minor.
- Improving `C^n` to 1 needs a projection of norm at most one or a direct estimate on
  the invariant model; property (Pr) does not supply either.

**Scalar extension and families.** Prove that bounded scalar extension is compatible
with weights, form spaces, block matrices, determinants and separated slope summands,
using completed scalar extension and CompactOperators §1.7's `c0_completedBaseChange`
for infinite-dimensional modules; for a finite field extension identify the algebraic
and completed extensions. Over an affinoid domain of weights sharing one level and one
radius, with analytic bounds uniform on the domain and one finite quotient through which
all stabilisers act, build the Banach module of forms over the affinoid algebra and its
entire Fredholm series. Prove *the family specialization*: the series specializes to the
series of each member, is compatible with restriction to smaller domains and deeper
stages, and keeps nilpotent coefficients. For the universal character of `𝒪_v^×` fix
`N>e_v/(p−1)`, `e_v` the absolute ramification index of `F_v`, so that `log` is an
isometry from `1+ϖ_v^N𝒪_v` onto `ϖ_v^N𝒪_v` and `1+ϖ_v^N𝒪_v` is a free `ℤ_p`-module with
a basis `u_1,…,u_{d_v}`, `d_v=[F_v:ℚ_p]`. With `T_i=κ(u_i)−1`, construct the families of
analytic forms on the domains `max_i‖T_i‖≤b<1`, with level and radius depending on `b`,
by a uniform version of PadicFunctionalAnalysis §§5.4–5.5 for each `u_i`. For `F_v=ℚ_p`
this is the single coordinate `T=κ(exp(q))−1`, with `q=p` for odd `p` and `q=4` for
`p=2`. Every affinoid subdomain of the open weight polydisc lies in one of these
domains.

- Passing to a smaller domain or a smaller radius is equivariant, and the comparison of
  Fredholm series along it goes through the links of §0.2d.
- No single analytic stage serves the whole region `p⁻¹<|T|<1`.

(Source: the determinant and slope theory is that of CompactOperators Layers 1, 3 and 4,
and the base change that of CompactOperators §1.7 and LocallyAnalyticDistributions §4.2,
applied to §0.2d's operator; the counting bound
follows from `∑_{j<n}⌊j/h_U⌋=h_Um(m−1)/2+ρm` for `n=h_Um+ρ`, `0≤ρ<h_U`.)

**Checks.**

- If no variable is analytic, the forms are finite-dimensional and `H_κ` is the
  polynomial `det(1−TU)` of a matrix.
- The operator `f(z)↦f(ϖ_vz)` on `K⟨z⟩` has `H(T)=∏_{j≥0}(1−ϖ_v^jT)`, with slopes
  `0,1,2,…` in `v_{ϖ_v}`.
- A nilpotent `U` gives `H=1` and no finite slopes, although the space is nonzero.
- At `h_U=1` and `s=|p|`, `v_p(coeff_n)≥n(n−1)/2`, attained by `∏_j(1−p^jT)`.
- At `h_U=2` each slope of the lower polygon occurs twice: `0,0,1,1,2,2,…`.
- The classical operator `((0,1),(0,0))` has `det(1−TU)=1`, of degree `0<2`.
- Each coefficient of `H_κ` is unchanged by extending scalars to a finite splitting
  field.
- For a weight over `K[ε]/(ε²)`, setting `ε=0` recovers the series of the reduced
  weight. No field-valued point detects the `ε`-coefficient, so the compatibility must
  be proved as an identity of series.
- If the form space is zero, `H_κ=1`.
- At `p=3` take `n_w(u)=exp(w log u)` for `u∈1+3ℤ₃`, trivial on `±1`; then
  `T=exp(3w)−1`. Its Gauss norm on `K⟨w⟩` is `1/3`, since `3^n/n!` has `v_3≥2` for
  `n≥2`; it lies in the domain `‖T‖≤1/3`.
- For `F_v=ℚ₃(√−3)`, with `e_v=2`, the bound `N>e_v/(p−1)=1` is needed: `ζ₃` lies in
  `1+ϖ_v𝒪_v` for `ϖ_v=1−ζ₃` and `log ζ₃=0`, so `1+ϖ_v𝒪_v` has torsion and no
  `ℤ₃`-basis, while `1+ϖ_v²𝒪_v` is free of rank two.
- At `F_v=ℚ₂` and `t_v=1`, `h_v=((0,1),(2,0))` meets both assumptions of §R17.3.8c:
  `h_vγh_v⁻¹=((d,c/2),(2b,a))`, and every unit of `ℤ₂` is 1 modulo 2. Every scalar
  multiple of `h_v` or `h_v⁻¹` has lower-right entry 0 and so lies outside `Σ₀(2)`; its
  Möbius map `z↦1/(2z)` sends `1` to `1/2∉ℤ₂`, so no slash by it acts on `A_{κ,r}`.
  Right translation applies, since `h_v` normalizes `K₀(2)`, and it carries `U_2` for
  `j_v`, with `j_v(η)=diag(2,1)`, to the operator of `Uw⁻¹ηwU` for `j′_v`, where
  `j_v(w⁻¹ηw)=diag(1,2)` and `j′_v(w⁻¹ηw)=diag(2,1)`.
- At `F_v=ℚ₃` and `t_v=1`, `((0,1),(3,0))` also normalizes `K₀(3)` but fails the second
  assumption of §R17.3.8c: it conjugates `diag(2,1)` to `diag(1,2)`, and `2≢1` modulo 3.
  It does not normalize `K₁(3)`, which contains `diag(2,1)`.
- At level `K₀(𝔭_v^{t_v})` with `h_v∈K₀(𝔭_v^{t_v})`, `w` lies in `U`, so
  `φ(gw⁻¹)=φ(g)|h_v⁻¹` and right translation is §R17.3.8c's coefficient map. The slash by
  `h_v` instead satisfies `φ(gu)|h_v=(φ(g)|h_v)|(h_v⁻¹j_v(u)h_v)`, so it produces forms
  for `h_v⁻¹j_vh_v`, not for `j′_v`.

*Needs:* §§0.2c–0.2d; GL2AutomorphicRepresentationsAndTransfer §§R17.3.8b–R17.3.8d;
CompactOperators §§1.2, 1.4–1.7, Layers 3–4;
LocallyAnalyticDistributions §4.2; NewtonPolygons Layer 2; AdicSpacesPartII R0.5;
PadicFunctionalAnalysis §§2.2, 5.3–5.5; Mathlib `Matrix.charpolyRev`,
`Matrix.reverse_charpoly`; Tau Ceti `Matrix.charpolyRev_eq_reflect`,
`Matrix.natDegree_charpolyRev_le`, `ContinuousLinearMap.charPowerSeries`,
`ContinuousLinearMap.IsPrCompact.charPowerSeries_eq`,
`ContinuousLinearMap.IsPrCompact.charPowerSeries_comp_comm`,
`ContinuousLinearMap.IsPrCompact.charPowerSeries_conj`.

### 0.2f Bol's identity, partial theta maps and small-slope classicality

Keep `F` totally real and `D` totally definite and split at every place of `P`. A weight
`κ` has **classical shape at** `τ∈Σ_v`, `v∈P`, if `n(u)=τ(u)^{n_τ}n^τ(u)` with `n_τ≥0`
an integer, where on `1+ϖ_v^t𝒪_v` the expansion of `n^τ` does not involve the coordinate
`x_τ`. Since `n(cz+d)=n(d)n(1+cz/d)`, the automorphy factor is then `τ(cz+d)^{n_τ}`
times a factor free of `z_τ`, on every disc of every stage. Its **theta target** `κ′_τ`
replaces `τ^{n_τ}` by `τ^{−n_τ−2}` and multiplies the determinant character by the
algebraic character `x↦τ(x)^{n_τ+1}` of `F_v^×`, so it is not normalized; the scalar
action `n(u)ν₀(u)²` is unchanged. Put `r_τ=n_τ+1`. Over `ℚ` there is one label, the
polynomial degree is `n=n_τ`, and the factor `n^τ` of a classical-shape weight is
trivial on `1+p^tℤ_p`, so it is a nebentypus modulo `p^t`. The determinant character
is **algebraic** when `ν₀=∏_σσ^{s_σ}` with integers `s_σ`.

**Bol's identity.** For `N=az+b` and `L=cz+d` with `d≠0`, prove
`D^r(N^{j+r}L^{−(j+1)})=(ad−bc)^r(j+r)(j+r−1)⋯(j+1)N^jL^{−(j+r+1)}` for all `j,r≥0`,
as formal power series in `z` over any field. Use RestrictedPowerSeries §2.3's derivative, with
`D^rz^m=m(m−1)⋯(m−r+1)z^{m−r}`, operator norm bounded by one at unit radius and kernel
the polynomials of degree below `r` in characteristic zero; on a disc `z=a+ρw` it
carries the factor `ρ^{−r}`. Deduce *the analytic Bol identity*: applied in the variable
`z_τ`, `D_τ^{r_τ}(f|_κγ)=(D_τ^{r_τ}f)|_{κ′_τ}γ` for every `γ` at which both actions are
defined, first on polynomials and then by continuity.

- The kernel of `D_τ^{r_τ}` on a union of discs consists of the functions that are
  locally polynomial of degree at most `n_τ` in `z_τ`.
- For `r>0`, `D^r` has dense image on the closed unit disc but is not surjective.
- In one variable over `ℚ`, where the automorphy factors of `κ` and of the untwisted
  target `κ″` with the original determinant character are `u_γL^n` and `u_γL^{−n−2}` for
  one constant `u_γ`, the identity reads `D^r(f|_κγ)=det(γ)^r(D^rf)|_{κ″}γ`.

**Partial theta maps.** Define `Θ_τφ(g)=D_τ^{r_τ}(φ(g))`. Prove that it is a bounded map
`M_D(U,A_{κ,r})→M_D(U,A_{κ′_τ,r})` with `Θ_τT_η=T′_ηΘ_τ` for every double coset in
`Δ_P`. With the normalized determinant on both sides the relation acquires
`τ(ϖ_v)^{r_τe}` on a double coset of determinant valuation `e` at `v`. Thus
`Θ_τU_v=τ(ϖ_v)^{r_τ}U′_vΘ_τ`, while `Θ_τ` commutes with `U_w` for `w∈P−{v}` and with
`T_w`, `S_w` and diamonds away from `P`. The kernel of `Θ_τ` consists of the forms whose
values are locally polynomial of degree at most `n_τ` in `z_τ`. If `κ` has classical
shape at every label of `Σ_P` with `ν₀` algebraic and `n_σ+2s_σ` parallel, the
intersection of these kernels is a space of classical forms of §R17.3.8c, with the
normalized action at the places of `P` and the nebentypus given by the finite-order part
of `n`: of level `U` on a single-disc stage, and of the deeper level of §0.2c's
level/radius comparison on a stage of smaller radius.

Over `ℚ` write `r=r_τ` and put `c(g)=|nrd g|_f·nrd(g_p)`, with `|·|_f` the finite idelic
absolute value. It is a continuous homomorphism `D_f^×→K^×`. It is trivial on `D^×`,
because a nonzero element of the definite algebra `D` has positive reduced norm, its
image in `D⊗ℝ≅ℍ` having a sum of four squares as norm, so the product formula gives
`|nrd γ|_f=nrd(γ)⁻¹`; and it equals `nrd(u_p)` on compact subgroups. Multiplication by
`c^{−r}` carries the twisted target to the normalized one, and `Θ^r=c^{−r}D^r` satisfies
`Θ^rT_η=|nrd η|_f^{−r}T′_ηΘ^r`, where `|nrd η|_f^{−r}` depends only on the double coset.
For `F≠ℚ` no character of `D^×\D_f^×` restricts to `u↦τ(nrd u_v)^{r_τ}` on a compact
open subgroup, so the general statement keeps the twisted target.

- Over `ℚ`, `Θ^r=diag(c(c_i)^{−r})·D^r` in representative coordinates, and with trivial
  stabiliser action its kernel has dimension `h_U(n+1)`, or `h_Up^s(n+1)` on `p^s`
  discs.

**Determinant identity.** Suppose that every stabiliser acts trivially on both `A_{κ,r}`
and `A_{κ′_τ,r}`. Let `W_τ=ker Θ_τ`, closed and `U_P`-stable, with the bounded
complement `N_τ` spanned by the monomials of degree at least `r_τ` in `z_τ` in the disc
coordinates, so that `U_P` is block triangular, with `V` the operator induced on
`M_D(U,A_{κ,r})/W_τ≅N_τ`. After checking that the coordinate projections are bounded and
that `V` is compact, CompactOperators §1.6 gives `H_κ=H_{W_τ}H_V`. On `N_τ`, `Θ_τ` is a
shift followed by a diagonal map with nonzero entries (factorials and disc scales),
intertwining `V` with `c_τU′_P`, where `c_τ=τ(ϖ_v)^{r_τ}` in the normalized convention.
CompactOperators §1.4 then gives, with no bounded inverse to the diagonal,

`H_κ(T)=H_{W_τ}(T)·H_{κ′_τ}(c_τT)`,

the *partial determinant identity*. Over `ℚ` the kernel `W` is finite-dimensional, equal
to the classical subspace `M_cl` on a single-disc stage, and, with the untwisted target,
`H_κ(T)=det(1−TU_p|W)·H_{κ′}(p^rT)`.

**Classicality.** Prove that the normalized target operator `U′_v` has norm at most one
on every stage where the automorphy factors of `κ′_τ` on `U` and on the coset
representatives have Gauss norm at most one, as for field-valued weights. Then prove
*the strict small-slope criterion*: if `(U_v−μ)^Nf=0` with `μ≠0` and `v_p(μ)<r_τ/e_v`,
`e_v` the absolute ramification index of `F_v`, then `Θ_τf=0`, because
`U′_v−μ/τ(ϖ_v)^{r_τ}` is invertible by the Neumann series on the complete target.
Hence a simultaneous generalized eigenvector of
the `U_v`, `v∈P`, with nonzero eigenvalues `μ_v` and `v_p(μ_v)<min_{τ∈Σ_v}r_τ/e_v` for
every `v`, lies in every `ker Θ_τ` and is classical in the sense just described. When
every `U_v` has norm at most one, the classical and overconvergent summands of slope at
most `h` agree for `h<min_{v∈P,τ∈Σ_v}r_τ/e_v`. Over `ℚ` the cutoff is `r=n+1`.

- Another determinant normalization shifts the cutoff by the valuation of §R17.3.8a's
  scalar.
- The partial determinant identity needs trivial stabiliser action on both weights; the
  classicality criterion needs no condition on stabilisers.
- The criterion is one-directional: it gives no bound on the slopes of classical forms,
  no description of the critical slope and no comparison with `GL₂`.

(Source: [Buzzard, *On p-adic families of automorphic
forms*](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/GL1.pdf), §7,
pp. 18–19: Bol's identity, the compatibility of theta with Hecke operators, and
Proposition 4, whose `θ^{1−k}` and cutoff `k−1` are `Θ` and `r` here after `k=n+2`. The
labelled maps and the twisted target follow from Bol's identity in each variable.)

**Checks.**

- At `r=1` and `j=0`, `D(N/L)=(ad−bc)/L²`.
- An extra automorphy factor `1+cz` breaks Bol's identity: at `f=1` the derivative of
  the slash is `c`, while any formula in `D(f)` gives 0.
- At `γ=1` Bol's identity is `D^r(z^{j+r})=(j+r)⋯(j+1)z^j`.
- For `F_v=ℚ_p`, trivial `κ` (so `n_τ=0`, `r_τ=1`) and `γ=diag(p,1)`, `f|_κγ(z)=f(pz)`
  and `D(f(pz))=p·f′(pz)=(Df)|_{κ′_τ}γ`, because `κ′_τ` has automorphy factor
  `(cz+d)^{−2}=1` and determinant character `x↦x`; a normalized target loses the
  factor `p`.
- Over `ℚ`, `|nrd η|_f^{−r}` equals `p^r` for `U_p`, `ℓ^r` for `T_ℓ` and `ℓ^{2r}` for
  `S_ℓ`.
- Over `ℚ` at `n=0`, `Θ^1=c^{−1}D` kills exactly the forms with constant values on a
  single-disc stage.
- Omitting `c(c_i)^{−r}` multiplies the block `(i,j)` of the intertwining by
  `c(c_i)^r/c(c_j)^r`, which is not 1 when the representatives have different `c`.
- Over `ℚ(√2)` with `ε=1+√2`, some power `ε^m` lies in a given compact open level and is
  central, and `τ(nrd ε^m)^r=τ(ε)^{2mr}≠1`. So no global character untwists the target.
- Degree zero over `ℚ` has cutoff 1; rescaling `U_p` by `p` moves the cutoff by one.
- The inequality is strict: when `v_p(μ)=r`, the unit `μ/p^r` can be an eigenvalue of
  `U′_p` although `‖U′_p‖≤1`, and the Neumann series for `(U′_p−μ/p^r)⁻¹` diverges.
- At a place with `e_v=2` and `n_τ=0`, `|τ(ϖ_v)|=p^{−1/2}` and the cutoff is
  `v_p(μ)<1/2`; reading it as `r_τ=1` would wrongly cover an eigenvalue of valuation
  `3/4`.
- Over `ℚ` with `n=0`, one class and trivial stabilisers, the classical forms are the
  constants and `U_p` multiplies them by its number `p` of cosets; hence
  `H_κ(T)=(1−pT)H_{κ′}(pT)`. The constants have slope exactly `r=1`, outside the
  criterion; they are classical by definition.

*Needs:* §§0.2a–0.2e; GL2AutomorphicRepresentationsAndTransfer §§R17.3.8a, R17.3.8c,
R17.3.8d; RestrictedPowerSeries §2.3; CompactOperators §§1.4, 1.6; Mathlib
`PowerSeries.derivative`, `Nat.descFactorial`, `ContinuousLinearMap`.

### 0.3 Quaternionic finite-slope families

Over reduced affinoid weight discs `X` over a finite extension `K/ℚ_p`,
define the quaternionic finite-slope family on the analytic forms of
§0.2c, for a totally definite `D` over totally
real `F`, split above `p`, with specified tame
level, central character, `p`-level and admissible radii. Its classical JL
constituents are discrete series at finite places in `Ram(D)`. Use the affinoid
families of §0.2e, with their common finite stabiliser
quotients of invertible order and uniform analytic bounds, the central-character
projector of §0.2c, the Hecke actions of GL2AutomorphicRepresentationsAndTransfer
§R17.3.8d, and the Fredholm series and separated finite-projective slope summands
of §0.2e. Use the compact, fully contracting controlling operator `U` of §0.2d
to control slopes. For `X′⊆X`, the restriction and factorization maps of
§§0.2d–0.2e give a link
`α:M_X′→M_X⊗̂O(X′)`, a finite composite of primitive links, each a restriction
between admissible stages; by §0.2d each primitive link
between modules `M′` and `M` satisfies the Hecke-equivariant identities
`αc=U_M`, `cα=U_M′` for a compact reverse map `c:M→M′`. Prove the cocycle
identities of the composite links and their compatibility with weight
restriction, central character and finite coefficient extension. A dense
inclusion alone does not give these identities. On each adapted spectral
block let `N` be the finite-projective slope summand, and form the
actual image `B` of the commuting quaternionic Hecke algebra in `End(N)`.
Its spectral coordinate is the inverse of the controlling operator. Use the
affinoid gluing of RigidAnalyticGeometry Layers 1 and 6 to glue `Sp(B)`,
with the weight map, invertible controlling eigenvalue and universal Hecke
character. The target is this quaternionic family on the form modules of
§0.2c.

Retain `B` with its nilpotents before forming `B_red=B/√0`. Restriction and
primitive-link isomorphisms of the full charts must commute with the overlap
cocycles; they induce the gluing of `Sp(B_red)`. The family records both the
full space and its reduction, the canonical closed immersion from the latter
to the former, and the restricted weight, eigenvalue and Hecke maps. Prove
independence of the adapted cover for both spaces. Field-valued points of
both classify the same finite-slope quaternionic Hecke eigensystems in the
coefficient fibres, without recording generalized eigenspace multiplicities.
For a finite extension `K′/K`, prove the full-chart scalar-extension
isomorphism using flatness, then
`(B⊗̂_K K′)_red ≅ B_red⊗̂_K K′`, using separability in characteristic zero.
Affinoid restrictions give the corresponding comparisons on the reduced
charts. At a weight specialization use the nilpotent-kernel comparison
between the specialized image algebra and the fibre of `B`; a field-point
bijection alone supplies no isomorphism of these full algebras. Classicality
and density below concern the reduced quaternionic space.

Prove the family operator comparison after converting the right polynomial
action to a left action by the opposite-action/dual dictionary of
GL2AutomorphicRepresentationsAndTransfer §R17.3.8a. At an algebraic weight put `n_τ=k_τ−2` and let
`b_τ` be the determinant exponents of that coefficient module; in Buzzard's coordinates `w_B,τ=b_τ+n_τ+1`.
Retain its finite character and scalar-unit action
`n(u)ν₀(u)²`, and match the central character under the automorphic dictionary.
With `ν_alg(x)=∏_{τ|v}τ(x)^b_τ`, the normalized determinant extension has
`ν_norm(ϖ_v)=1`. For the same double coset `diag(ϖ_v,1)`, the coefficient
comparison `A` of §R17.3.8a gives `U_v^alg A=c_v A U_v^norm`,
where `c_v=ν_alg(ϖ_v)`. Carry any additional dual or character twist of the
Skinner dictionary explicitly. Thus on the family `α_alg=c_v α_norm`,
`H_alg(T)=H_norm(c_v T)` and slopes shift by `v_p(c_v)`.
These are specialization comparisons; an affinoid rescaling requires an
actual analytic unit with the prescribed values. The Skinner weight line
has fixed `b_τ`, so this determinant scalar is constant. In the final Skinner
normalization, the automorphic `U_v` eigenvalue is
`q_v^(1/2)α_v(ϖ_v)` and is the `φ^{f_v}` period eigenvalue used in §4.7.

For `F=ℚ`, the criterion of §0.2f has a single label, polynomial degree
`n=k−2` and cutoff `n+1=k−1`; translate it through this operator comparison.
For Skinner §2.4.2 assume `[F:ℚ]` even and `D` split at every finite place.
Over a finite `K/ℚ_p` containing every embedding of `F_v` for `v|p`, take a
classical-shape weight with integral determinant exponents and parallel
`n_τ+2b_τ`, with finite character constant on the chosen discs, on stages where
the automorphy factors of each theta target have Gauss norm at most one.
Section 0.2f then supplies, for each `τ|v`, the partial
theta map of order `k_τ−1` intertwining normalized `U_v` with
`τ(ϖ_v)^(k_τ−1) U′_v`, whose target replaces `n_τ` by `−n_τ−2` and `b_τ` by
`b_τ+n_τ+1`, preserving the central exponent; the bound `‖U′_v‖≤1`; and
classicality of a simultaneous finite-slope generalized eigenspace with
`v_p(α_v^norm)<min_{τ|v}((k_τ−1)/e_v)` for every `v|p`, where `v_p(p)=1` and
`e_v` is the absolute ramification index, at the level given by the
level/radius comparison of §0.2c.
Use the operator adapter to state the equivalent inequalities in Skinner's
normalization. On his weight line, shrinking the disc makes the positive
algebraic weights large relative to the fixed local slopes. Prove
classical density for these charts through the chosen
cuspidal eigenpacket, with their universal eigensystem and unramified
principal-series classical specializations, as
in Skinner pp. 253–255.

(Sources: [Buzzard, Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf),
§5, Lemmas 5.4–5.6, Construction 5.7 and Lemmas 5.9–5.10, pp. 33–42, for the
gluing; Skinner §2.4.2 pp. 253–255.)

**Checks.**

- For `M_X=O(X)` and `U_X` multiplication by a unit `a`, the spectral variety is
  `1−aT=0`, with `U`-eigenvalue `a`; its reciprocal coordinate is `a⁻¹`.
- Restricting a slope chart twice agrees with direct restriction and preserves
  its finite-projective rank.
- Over a point, on a two-dimensional slope summand with `U=1+J`,
  `J²=0≠J`, the Hecke image generated by `U` is `K[ε]/(ε²)` and its reduction
  is `K`. Both have the eigenvalue 1, but only the full chart retains the
  generalized eigenspace. Reduced weight space does not force reduced charts.
- In Buzzard's §5 example, `R=K⟨x,y⟩`, `U=1+xJ` and the commuting operator
  `yJ` give `B=R⊕(x,y)ε`, `ε²=0`. At `x=y=0` the specialized image is `K`,
  while `B⊗_R K` has a nonzero square-zero ideal of dimension two. Their
  reductions agree; their full algebras do not. Finite coefficient extension
  and affinoid restriction retain the stated full-chart comparisons.
- At `F=ℚ` choose `D` ramified at infinity and a finite `q≠p`. For its `JL`
  constituents discrete series at `q`, slope strictly below `k−1` is classical;
  the endpoint is outside this criterion. There is no definite `D/ℚ` split at
  every finite place: its ramification set would have odd cardinality.
- A zero `U_p` eigenvalue has infinite slope and belongs to no finite-slope chart.
- A nontrivial determinant twist over `ℚ` with `b=1` has `c_p=p`:
  `H_alg(T)=H_norm(pT)`. Its slope cutoff shifts from `k−1` to `k`;
  using the unshifted bound changes the classicality claim.
- On scalar units the determinant normalization changes no action;
  replacing `ν₀` by 1 would lose a nontrivial finite central character.
- Replacing `ϖ_v` by `uϖ_v` changes `c_v` by `ν_alg(u)`. The inverse change of
  the normalized operator preserves the algebraic Hecke and period eigenvalue.
- In the totally real normalized bound, a label `k_τ=2` at an unramified
  `p`-place gives cutoff 1, regardless of larger weights at other labels.
- At ramification index `e_v=2` and parallel weight two, the normalized cutoff
  is 1/2, not 1. Equality is outside the strict small-slope criterion.
- Over `ℚ` with one class at level `U₀(p^t)`, `t≥1`, trivial stabilisers and
  weight `k`, the classical subspace on a stage of `p^s` discs has dimension
  `p^s(k−1)`: it lies at the deeper level `U₀(p^{t+s})`, which has `p^s` classes,
  not at `U₀(p^t)`, where the dimension is `k−1`.

*Needs:* §§0.2a–0.2f; LocallyAnalyticDistributions §§4.2, 4.15–4.16;
CompactOperators §§1.7, 3.1–3.5, 4.3; RigidAnalyticGeometry Layers 1 and 6;
GL2AutomorphicRepresentationsAndTransfer §§R17.3.8a, R17.3.8d, R17.3.9, R16.6.3.

### 0.4 Crystalline periods in families

Prove the crystalline-period extension theorem in Kisin's `G_ℚ_p` setting: `R` is a
Tate `ℚ_p`-algebra, `M` a finite free continuous `R`-representation, `Y∈R×`,
`Sp(R)` is `Y`-small in the sense of §5.2, and the Sen polynomial is `TQ(T)`.
For each positive integer `k` require Tate `R`-algebras `R_i` such that
`∏_{j=0}^{k−1}Q(−j)` is invertible in every `R_i`, every equivariant map
`M^∨⊗R_i → B_dR^+/t^k ⊗̂ R_i` factors through the `φ=Y` crystalline periods,
and `R → ∏_i R_i` is injective. The conclusion is continuation for sufficiently
large truncations and a nonzero crystalline period at every continuous
specialization to a closed subfield of `ℂ_p`. Construct the required `G_{F_v}`
version with `φ^{f_v}`, retaining `Q(0)` as a non-zero-divisor on the family.
The API gives restriction to admissible affinoids, coefficient specialization,
the truncated comparison and the specialized eigenperiod. The attached-family
application and verification of these hypotheses are the target of §4.7.

(Sources: [Kisin](https://abel.math.harvard.edu/~kisin/dvifiles/fmform.dvi),
Proposition 5.14 and Corollary 5.15, pp. 26–27;
Skinner §2.4.2 pp. 253–255, footnote 9.)

**Checks.**

- A constant trivial line has `Y=1, Q=1` and the nonzero period 1 at each point.
- If `Q(−j)=0` for an index in the truncation, that chart fails the invertibility
  hypothesis; a dense set of other points does not repair it.
- Over a nonreduced affinoid, a nilpotent killed by all reduced points defeats
  injectivity to those fields. The asserted product map must be injective.

*Needs:* PadicPeriodRings §§4.1–4.3;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P7.1–R07.P7.2;
AutomorphicGaloisRepresentationsPartII AG2.P, finite-coefficient period API;
RigidAnalyticGeometry Layers 1 and 6.

### 0.5 Wach modules of crystalline lattices

Use PhiGammaModulesAndIwasawaCohomology §§6.0–6.1 for the Wach lattice
of every stable finite free `O_E`-lattice `T` in a crystalline representation
over finite unramified `K/ℚ_p`. Keep its specified embedding in the period
realization, its interval twist, semilinear Frobenius and `Γ` action, including
`p=2` and ramified finite `E/ℚ_p`. For weights `[−r,0]` in the convention
where `ε_p` has weight `+1`, the height bound uses `q^r`, where `q=φ(π)/π`.

The comparison target here is on the odd-prime, `E=ℚ_p`, nonpositive-weight
domain of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.26(ii): identify
its `N(T)` with the imported Wach lattice by their embeddings in the same
positive period realization and uniqueness. Transport the supplied Kisin–Ren
comparison along this identity. It is an identity for the specified lattice,
not just an abstract rational isomorphism. Section 5.2 applies the imported
construction to the fixed eigenform lattice with its declared dual/Tate twist.

- The comparison preserves the embedded lattice, `φ`, `Γ` and the height bound.
- Rationalization and reduction modulo `π` identify the two filtered
  crystalline realizations; the integral quotient alone is not `D_cris`.
- Coefficient extension and interval twists commute with this comparison
  wherever both realizations are defined, by the imported uniqueness theorem.

(Source: [Berger, Limites de représentations cristallines](https://arxiv.org/pdf/math/0201262v2),
§2.1, Lemmas 2.2–2.3 and Proposition 2.4, pp. 7–8, for uniqueness of the
embedded lattice; Theorem 3.5, p. 10, and Theorem 5.1, p. 13, for the height
bound and filtered crystalline comparison.)

**Checks.**

- For `p=2`, `K=ℚ₂`, ramified finite `E/ℚ₂` and trivial `T=O_E`, the imported
  construction gives `O_E[[π]]`, quotient `O_E`, rational crystalline module
  `E`, Frobenius 1 and height 0. The odd-prime R07 comparison is not needed.
- For odd `p`, `K=ℚ_p` and `T=ℤ_p`, both embedded realizations are
  `ℤ_p[[π]]` with Frobenius 1; replacing the embedded lattice by `pN(T)`
  would instead recover `pT` and fails the specified-lattice comparison.
- For `T=ℤ_p(−1)` the Wach basis `πe` has Frobenius `q`, with `q mod π=p`;
  both rational reductions have Frobenius `p` and filtration jump 1.
- A noncrystalline Tate-curve extension has monodromy of rank one and is
  outside the crystalline Wach category, even though it is de Rham.

*Needs:* PhiGammaModulesAndIwasawaCohomology §§6.0–6.1;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.26(ii);
PadicPeriodRings §§4.1–4.3.

### 0.6 The unitary and `GL₃` geometric realizations

Construct the specific Blasius–Rogawski instances of Skinner §§2.3.1–2.3.3.
For `E=FE₀` with `E₀` imaginary quadratic and `p` split in `E₀`, use `GU(Φ)` of signature
`(2,1)` at one place and `(3,0)` elsewhere, with its universal abelian scheme.
Construct the `U(2)` packet with nonstandard base change
`π_E⊗η|·|^{1/2}`, the endoscopic packet on `U(Φ)` with multiplicity `d(σ_f)=2`,
and the algebraic coefficient projector. Under the source's geometric Hilbert
hypotheses, including some `k_τ>2` in its non-discrete-series branch, realize
the prescribed CM base-change twist of `ρ_π` in that cohomology. Retain every
auxiliary character, Tate twist and multiplicity in the comparison.

For the symmetric-square application use the supplied adjoint lift and define
`Π=Ad(π)⊗(ω_π|·|⁻¹)=Sym²π⊗|·|⁻¹`. Its local parameter is the adjoint
parameter tensored by `ω_π|·|⁻¹`; its central character is `ω_π³|·|⁻³`.
Transport the archimedean exponents and good-place eigenvalues through this
twist before applying the following construction. The adjoint's trivial
central character is not the central character of `Π`.

For an essentially self-dual regular cuspidal `Π` on `GL₃(A_F)` whose archimedean
parameters restrict to
`z^{a_i}z̄^{b_i} ⊕ z^{b_i}z̄^{a_i} ⊕ (zz̄)^{(a_i+b_i)/2}`,
with `a_i≠b_i` and `a_i+b_i` even, construct the three-dimensional `ρ_Π` of
Skinner §2.3.3. Give its good-place WD comparison and realize its cuspidal
CM base-change twist in an abelian scheme over the Picard modular surface;
retain the character-induced alternative when that base change is not cuspidal.
For `Π=Ad(π)⊗(ω_π|·|⁻¹)` use precisely these converted parameters. At hyperspecial `p`-level with `Π` unramified, good reduction gives crystalline
periods and labelled degrees `−a_i,−b_i,−(a_i+b_i)/2`. The API comprises
coefficient change, Hecke and Galois equivariance, projector comparison,
the good-reduction model and the associated Frobenius polynomial.

(Sources: Skinner §2.3.1 pp. 247–248, §2.3.2 pp. 248–250 and §2.3.3
pp. 250–251; Blasius–Rogawski Proposition 4.1.2, Lemma 4.2.1 and
Theorem 3.3.1 as used there; Blasius §§4.1–4.6 for the `GL₃` construction.)

**Checks.**

- Signature `(2,1)` gives a surface; compact signature `(3,0)` at every place
  gives dimension zero and cannot replace it.
- A multiplicity-two cohomology factor is not itself the single rank-two
  Galois representation; extraction must retain the automorphic factor.
- If `π` has Satake roots `α,β` and `q` is the residue cardinality, `Π` has roots
  `qα²,qαβ,qβ²` and determinant `q³(αβ)³`; `Ad(π)` instead has determinant 1.
- For the symmetric-square input after the norm conversion of §3.12,
  `a=−2,b=0` gives degrees 2,0,1. These are the symmetric square of degrees 0,1.

*Needs:* PELModuli M0–M4; EndoscopicTransferAndUnitaryTraceComparison
§§13.1–13.4; EtaleCohomologyFoundations §§F.4–F.7;
AutomorphicGaloisRepresentationsPartII AG2.P, geometric period comparison,
and AG2.0, algebraic-character avatars;
GL2AutomorphicRepresentationsAndTransfer §R17.4.13.

### 0.7 Quaternionic surfaces and weight-monodromy

For `F` of even degree, construct the quaternionic Shimura surface for `B` split
at exactly two real places and every finite place, with its algebraic
coefficient system `W` and Hecke action. At a sufficiently small level and
a finite extension `L` containing the reflex data, prove the constituent
comparison of Blasius Proposition 6: the `π′_f`-part of degree-two cohomology
has the constituents of
`ρ_{π,λ}|G_L ⊗ {}^{τ₂}ρ_{π,λ}|G_L`.
Use intersection cohomology of the compactification when `B=M₂`, as in
Brylinski–Labesse; compact cohomology cannot be substituted in that case.
The quaternionic surface realization carries level and coefficient change,
Hecke/Galois equivariance, the two distinguished embeddings and this tensor
comparison. This comparison is applied after §3.10 constructs `ρ`; the surface
and coefficient system themselves use only the geometric suppliers.

For a smooth projective surface `X` over a finite `p`-adic field and `ℓ≠p`,
prove surface weight-monodromy: the monodromy-graded pieces of `H²_ét` have
weights `2+i` in grade `i`. Retain the finite semistable alteration and descent
needed for the original coefficient representation. Also prove the geometric
integrality input used by Blasius Proposition 2: Frobenius eigenvalues of
`H^j` of a smooth projective variety over a local field are integral Weil
numbers of integral weights, without claiming purity in arbitrary degree.
These are inputs to §4.2's exclusion of complementary series.

(Sources: [Blasius](https://arxiv.org/pdf/math/0511007v1), Proposition 2 p. 11,
§4.2 pp. 21–22 and Proposition 6; Rapoport–Zink Satz 2.13 and de Jong's
alterations as used in Proposition 2; Brylinski–Labesse for the split
intersection-cohomology case as cited in §4.2.)

**Checks.**

- A product of two elliptic `H¹` factors has `H²` tensor weight 2 at good reduction.
- `B=M₂` occurs in degree two and requires the compactification/intersection
  cohomology branch.
- A split multiplicative elliptic factor has `N≠0`. Its tensor contribution
  retains monodromy; the Frobenius polynomial alone does not specify it.

*Needs:* ShimuraVarieties Layers 1–4 and §§8.18–8.23; PELModuli M0–M4;
HilbertModularVarietiesAndShimuraCurves §R18.1.7, auxiliary PEL comparison;
EtaleCohomologyFoundations §§F.4–F.8; LefschetzPencilsAndVanishingCycles
LPV.0–LPV.2; DeligneWeightsAndPurity §§4.3, 7.15;
ArithmeticGaloisRepresentations §2.6. The tensor identification additionally
uses §3.10; none of the construction or surface weight theorems uses §4.2.

### Examples

For the local cyclotomic character at `ℚ_p`, the geometric uniformizer value
is 1 while its crystalline Frobenius is `p⁻¹`. The trivial lattice has a Wach
`π`-quotient `O_E⊗_{ℤ_p}O_K` and rational crystalline module `E⊗_{ℚ_p}K`. A zero
`U_p` eigenvalue lies outside the finite-slope families. The two-dimensional
special WD model of Layer 4 retains nonzero monodromy under these comparisons.

### Dependencies

The period, cohomology, PEL and analytic suppliers named above, including
PhiGammaModulesAndIwasawaCohomology §§6.0–6.1, and, for §§0.2a–0.3,
GL2AutomorphicRepresentationsAndTransfer §§R17.3.8a–R17.3.8d and
HilbertModularVarietiesAndShimuraCurves §§R18.5.16a–R18.5.16b.
The geometric
surface tensor comparison consumes §3.10 only when applied in §4.2;
§3.10 needs the curve construction, not the surface comparison.

## Layer 1: Classical cohomology and coefficient descent

### 1.1 Coefficient Eichler–Shimura

At a fine level `n≥3`, put `r=k−2` and take `p∤nℓ`. Use AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2 for the parabolic coefficient realization and its Eichler–Shimura operators. Transport them to the DFG action of §1.2 and prove in that convention `T_p=F+I_p^*V, FV=p^{r+1}`, and `R_p=p^rI_p^*`. Consequently `1−T_pX+pR_pX²=(1−FX)(1−I_p^*VX)`. The diamond factor `I_p^*` is essential away from level one. The underlying special-fibre correspondence comes from ModularCurvesPartII §§17.1–17.2; the coefficient and pairing comparison comes from R15.5A.2, and this target transports it to the DFG premotive. Its fibre tests distinguish `p+1` lines in the étale situation away from `p`, one supersingular subgroup scheme, and the connected/étale pair `μ_p` and `ℤ/p` at an ordinary characteristic-`p` fibre.

*Needs:* AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2; `ModularCurvesPartII:§§17.1–17.2`; `ModularCurvesPartII:§§14.1–14.4, 14.8, 14.11–14.12`; `ArithmeticGaloisRepresentations:Layer 6`.

See [Pierre Deligne](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf) — Proposition 4.8 and Theorem 4.9, printed pp. 166–167; [Pierre Deligne](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf) — Proposition 3.18(ii), printed p. 158.

- Pull–push of the ModularCurvesPartII §§17.1–17.2 correspondence on `Sym^r` coefficients and parabolic cohomology.
- Level change intertwines the higher-coefficient action.
- `T_q=F+I_q^*V, FV=q^{r+1}, R_q=q^r I_q^*`.
- `1−T_qX+qR_qX²=(1−FX)(1−I_q^*VX)`.

**Checks.**

- For a geometric point `s` of characteristic different from `p`, the geometric fibre of `q₁` has `p+1` points, the lines of `E_s[p]≅(ℤ/p)²`. Over an arbitrary residue field the fibre is finite étale of degree `p+1` and need not split.
- Over a geometric supersingular point in characteristic `p` the geometric fibre has the single point `ker F`.
- Over a geometric ordinary point in characteristic `p` the geometric fibre has two points: a definition that keeps only `ker F` is wrong.
- For `E:y²=x³−x` over `𝔽₁₇` with full rational level 4 and `p=3`, Frobenius has
  trace 2 and determinant 2 modulo 3. It cycles all four lines: the degree-four
  fibre is one closed point of degree four, with no `𝔽₁₇`-point.
- At level one `I_q^*=1` and for `r=k−2` the relation is `1−T_q X+q^{r+1}X²=(1−FX)(1−VX)`. For `r=0` (classical weight two) it agrees with the ModularCurvesPartII §17.2 Eichler–Shimura relation.

### 1.2 Parabolic realisations

Use the classical parabolic realization of AlgebraicModularFormsAndSerreWeights R15.5A.1 and its pairing from R15.5A.2. Compare it with the DFG package `M(N,ψ)_!`, with Betti conjugation, filtered de Rham and every `λ`-adic realisation and their comparisons. At an auxiliary fine level `M≥3` with `N|M` and the same excluded prime set, require canonical change-of-level identifications. For each coefficient embedding its rank is twice the dimension of the corresponding `ψ`-cusp space; its top filtration has the cusp-space dimension. After tensoring over `ℚ` with `ℂ` the top filtration is the product of those cusp spaces over all coefficient embeddings. The twisted Fricke pairing takes values in `M_ψ(1−k)` and is rationally perfect. Transport the full Hecke action with the DFG `ψ⁻¹` convention. Integral/crystalline comparisons are restricted by the excluded set; `λ`-adic existence is not. The parabolic image excludes Eisenstein boundary classes.

Here `k≥2, N≥1` and `ψ` has conductor dividing `N` and values in `K`. The excluded
set is `S_N={ℓ:ℓ divides Nk!}`, and the fine level satisfies `S_M=S_N`.
For DFG's action, `T_p` is the double coset of `diag(p,1)` multiplied by
`ψ(p_p)⁻¹`; for `p∤N` the scalar-`p` double coset multiplied by `ψ(p_p)⁻²`
acts by `ψ(p_p)⁻¹p^{k−2}`. These conventions hold on the entire parabolic
structure, before selecting a newform factor.

*Needs:* AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2; `ModularCurvesPartII:§§14.1–14.4, 14.8, 14.11–14.12`; Mathlib `ModularForm`; Mathlib `CuspForm`.

See [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — Theorem 2.4, p. 24 (arXiv v2); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §4.5, (28) and Lemma 4.12, p. 51 (arXiv v2); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — Proposition 5.6, p. 56 (arXiv v2); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §5.2, Lemma 5.2 and formula (29), pp. 53–54 (arXiv v2); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §1.3, p. 12 (arXiv v2).

- `M(N, ψ)_!` with Betti realisation `M_B` (with complex conjugation), de Rham realisation `M_dR` with Hodge filtration `Fil^•, λ`-adic realisations `M_λ` (every finite `λ`; crystalline comparison only for `λ ∉ S_N`) and the comparison isomorphisms `I_∞, I_λ`.
- `ℂ ⊗_ℚ Fil^{k−1} M_{!,dR} ≃ S_k(N, ψ)^{I_K}`, compatible with `q`-expansions (Lemma 4.12).
- The duality pairing `M(N, ψ)_! ⊗ M(N, ψ)_! → M_ψ(1 − k)` of formula (29) in `PM_K^S`, perfect after tensoring with `ℚ`.
- Module structure over the Hecke algebra `T`, compatible with every realisation and comparison; `T_p ↔ [U(p 0; 0 1)U]ψ(p_p)⁻¹`.
- Independence of the auxiliary level `M (N | M, S_M = S_N)` up to canonical isomorphism (§3.6).

**Checks.**

- For `k = 2` and `ψ = 1` the `λ`-adic realisation is `H¹_ét(X₀(N)_{ℚ̄}, K_λ)`.
- `dim_K M_{!,dR} = 2 dim S_k(N, ψ)`; for `N = 11, k = 2, ψ = 1` it is 2.
- The isomorphism with `S_k(N, ψ)` lands in Mathlib's CuspForm space for `Γ₁(N)` with character `ψ` (level and weight agree).
- An Eisenstein series of weight `k` lies in `Fil^{k−1} M_dR` but not in `Fil^{k−1} M_{!,dR}`: the parabolic part excludes the boundary.

### 1.3 Scholl's projector

For `k>2, r=k−2≥1` and `n≥3`, use the Kuga–Sato model `W_r`, equivariant
smooth resolution, full `Γ_r=((ℤ/n)²⋊μ₂)^r⋊S_r` action and Scholl projector
from WeightsInEtaleCohomology R34.5, “Classical Kuga–Sato and Hilbert projector
comparisons”, “The classical compactification” and “The higher-weight model
comparison”. Use that supplied `ε`-idempotent as the Scholl projector. Here
compare its parabolic image with the DFG premotive of §1.2, including Hecke
pull–push, Betti/de Rham/étale comparisons and fine-level transport. Keep the
DFG conjugate-form correction when comparing individual factors in §1.5.

The character `ε` is trivial on translations, the product of inversion signs
and the permutation sign. Its rational average requires the group-order
inverse. The model, boundary charts, equivariant resolution and parabolic
identification are supplied, including the denominators `2n·r!` and any extra
model denominators. They do not supply a saturated integral image or an
individual-newform Chow motive. Use Mathlib's `Representation.averageMap`
and `Representation.isProj_averageMap` for the linear averaging identities.

*Needs:* §1.2; WeightsInEtaleCohomology R34.5, the three targets named above;
EtaleCohomologyFoundations §§0.7, F.4.5–F.4.6, F.5–F.7.

See [Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf),
Theorems 1.2.1, 1.2.4 and §1.3.3, pp. 2–3; §4.1, p. 8;
DFG Theorem 2.4 and §§4.5, 5.2–5.4, pp. 24, 50–59.

- Identify the supplied parabolic projector image with
  the DFG rational premotive, preserving its Hecke action and comparisons.
- This identification commutes with fine-level
  transport over the stated common comparison base.

**Checks.**

- `r=1`: translations act trivially and inversion acts by `−1` on `H¹` of the elliptic fibre.
- `r=2`: omitting `sign(S₂)` changes the graded Künneth action and fails to recover `Sym²`.
- For `n=3,r=2, |Γ_r|=(2·3²)²·2!=648`; the averaging projector is rational, not an integral operator at 2 or 3.
- The `ε`-part of the cohomology of the smooth compactification is the parabolic image, not the cohomology of the open curve; the `ε`-part of compactly supported cohomology of the open fibre power is `H¹_c`, which is larger.

### 1.4 Rational orbit projector and coefficient descent

Use the primitive projector, coefficient-field model and descent of AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2. In the semisimple rational new Hecke quotient denote the supplied orbit idempotent by `e_[f]` and compare its image with the DFG factor. Its image on Betti, de Rham and `λ`-adic realisations has rank two over `K_f`; extension along an embedding `σ:K_f→L` identifies the `σ(f)` eigenspace. Transport the supplied `K_f`-action to the DFG factor itself; equality of traces alone does not identify coefficient actions. With Scholl's transposed Hecke action recover the cohomological trace `a_p`, and with the other action apply the DFG conjugate-form correction. Compare Betti `±` lines with the existing modular-symbol period lines. Intersect with the fixed integral module and state any saturation/torsion-freeness requirements. The full old Hecke algebra is not the semisimple new quotient used to select `e_[f]`.

*Needs:* AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2; [1.3 Scholl's projector](#13-scholls-projector); [1.2 Parabolic realisations](#12-parabolic-realisations); TauCetiRoadmap.ModularForms, layer 8 modular symbols the integral hecke algebra and coefficient fields; `ModularCurvesPartII:§§14.1–14.4, 14.8, 14.11–14.12`; `ModularCurvesPartII:§§16.2–16.3`; `ModularCurvesPartII:§16.4`.

See [A. J. Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf) — Theorem 1.2.4 and Remark 1.2.6, pp. 2–3; [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §1.2, pp. 8–10; §4.5, pp. 50–51; §§5.3–5.4, pp. 56–59; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Exercise 1.18, p. 30.

- The supplied central idempotent `e_[f]` of the rational new Hecke algebra.
- `e_[f]²=e_[f]` and `θ_f(e_[f])=1`.
- The supplied `K_f`-linear primitive image, transported to each DFG realisation.
- Extension along `σ:K_f→L` identifies the factor with the `σ(f)`-eigenspace.
- Its `K_f`-dimension is two.
- The Betti `±` lines and modular-symbol rational structure agree with the imported period lines.
- Intersect with the imported integral module and retain torsion-freeness and saturation hypotheses explicitly.

**Checks.**

- The degree-two coefficient field gives rational dimension four, not two.
- For `Δ` the factor has rank two over `ℚ` and is realised in degree eleven Kuga–Sato cohomology.
- Before scalar extension a single embedding of `ℚ(√5)` cannot replace the rational Galois-orbit factor.
- Changing a generator of a period line by a `K_f`-unit preserves the line; an unspecified lattice cannot select a numerical period.
- The old Hecke algebra of 11a1 at level 88 (the case `N = 88, p = 2` of Darmon–Diamond–Taylor Exercise 1.18) has nilpotents and is not the semisimple rational new quotient used by this projector.

### 1.5 Rank-two newform realisation

For a normalized cusp newform `g`, use the primitive rank-two realization, pairing and coefficient descent of AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2. Identify its DFG realization with the common kernel of the Hecke ideal in the rational parabolic premotive. The target here is this comparison and its character correction. DFG's factor `M_g^DFG` realizes the conjugate form, with geometric good polynomial `X²−ψ(p)⁻¹a_pX+ψ(p)⁻¹p^{k−1}`. Define our cohomological factor by `M_g=M_g^DFG⊗M_{ψ⁻¹}`; its polynomial becomes `X²−a_pX+ψ(p)p^{k−1}` and its arithmetic dual is the classical Galois representation. Identify the top Hodge line with `Kg` and show oddness at every `λ`. Rational irreducibility has its own target in §4.8. For `k=2` use the modular abelian quotient, and for `k>2` use the Kuga–Sato projector.

The restricted Fricke pairing on `M_g^DFG` is alternating and perfect, giving
`∧²_K M_g^DFG ≅ M_ψ(1−k)`. After the twist,
`∧²_K M_g ≅ M_{ψ⁻¹}(1−k)`. Thus the arithmetic dual satisfies
`ρ_{g,λ} ≅ M_{g,λ}^DFG(k−1)` and
`det ρ_{g,λ}=ψχ_ℓ^{k−1}`, with `ψ` interpreted by arithmetic reciprocity.
It is continuous and unramified outside `Nℓ`, and complex conjugation is
conjugate to `diag(1,−1)`. These rational statements hold at every finite `λ`.

*Needs:* AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2; [1.2 Parabolic realisations](#12-parabolic-realisations); [1.1 Coefficient Eichler–Shimura](#11-coefficient-eichlershimura); `ArithmeticGaloisRepresentations:§§1.1–1.10`; `ArithmeticGaloisRepresentations:Layer 6`; [1.4 Rational orbit projector and coefficient descent](#14-rational-orbit-projector-and-coefficient-descent).

See [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — Lemma 5.7, p. 58 (arXiv v2); [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Theorem 3.1(a)–(c), p. 86, the weight-two case (revision of 9 September 2007); [A. J. Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf) — Theorem 1.2.4(i), p. 2, with 1.0.0, p. 1, and 4.2.2, p. 9; [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §5.5, pp. 59–60, and p. 96 (arXiv v2).

For coefficient calculations the arithmetic good-prime polynomial is
`X²−aX+ψp^{k−1}`. At the same Frobenius its dual polynomial is
`X²−(a/d)X+1/d`, where `d=ψp^{k−1}`. The dual formula represents a
characteristic polynomial only when `d≠0`; it is the cohomological
representation evaluated at arithmetic Frobenius. The arithmetic dual of that
cohomological representation has the original polynomial. A natural-number
expression using `k−1` also makes sense for `k=0`, but the geometric
interpretation here assumes `k≥2` and must not use truncated natural subtraction
as a weight-zero formula.

**Checks.**

- For 11a1 at `3, a₃=−1, ψ=1` and `k=2` give `X²+X+3`; the dual polynomial is `X²+X/3+1/3`.
- For `Δ` at `2, a₂=−24` and `k=12` give `X²+24X+2048`; the dual has `X`-coefficient 3/256 and constant 1/2048.
- With `k=2, a=2, p=3` and `ψ=i`, retain constant `3i`; the dual has `X`-coefficient `−2/(3i)` and constant `1/(3i)`. Replacing `ψ` by `ψ⁻¹` fails both checks.

### 1.5a Coefficients and labelled Fontaine–Laffaille comparison

For finite unramified `K/ℚ_ℓ` of degree `f` and finite `E/ℚ_ℓ` containing all
embeddings of `K`, use the free-lattice and finite-torsion specialisations of
LocalGaloisDeformationRings §1.6 with its coefficient Fontaine–Laffaille specialization.
The supplied comparison retains the action of `A=O_E⊗_{ℤ_ℓ}O_K`, its factors
`A≅∏_{τ:K→E}O_E`, their labelled filtrations, and the Frobenius permutation
induced by `1⊗φ_K`. Its covariant DFG realization `V` is the `ℤ_ℓ`-dual of
the scalar contravariant `U_S` on free lattices and its Pontryagin dual
on torsion objects. A constant labelled rank-one jump `i` gives `ε_ℓ^{−i}`,
of `D_HT` degree `i`. Use its transported coefficient action to identify
the rational filtered module with `D_cris(V)` in the automorphic realizations.
In the common safe interval `[0,ℓ−2]`, apply the supplied exactness,
coefficient extension and reduction, kernel comparisons for coefficient-linear
endomorphisms preserving the filtration and commuting with divided Frobenius,
and lattice-quotient comparisons. The supplied torsion kernels carry the
induced strict filtration.

If the degrees lie in `[a,b]` with `b−a≤ℓ−2`, first apply the integral Tate
twist `T(a)`, whose degrees lie in `[0,b−a]`, and record it in the comparison.
Undo this twist on the lattice, filtration and residual characters. This
does not place an interval of greater length inside the safe range.

For rank two, prove the labelled tame-inertia formula for the semisimplified residual
inertia representation after extension to an algebraic closure of the residue
field. Choose compatible fundamental characters `θ_f` and `θ_{2f}`, with
`θ_{2f}^{ℓ^f+1}=θ_f`, and index labels by the Frobenius cycle of R07.3.9.
For safe labelled degrees `{a_i,b_i}, i` modulo `f`, the characters are either
`θ_f^{−∑a_iℓ^i}, θ_f^{−∑b_iℓ^i}` (allowing the choices at each label), or
`θ_{2f}^{−∑c_iℓ^i}` and its `ℓ^f`-power conjugate, where `i` modulo `2f` and
`{c_i,c_{i+f}}={a_i,b_i}`. The signs are those of `V`; for `U_S` they reverse.
For `T(a)`, multiply the resulting characters by the inverse a-th power of
the residual cyclotomic character to recover those of `T`. Both niveaux `f`
and `2f` occur; a rank-two simple residual factor need not split over the
residue field of `K`. For Hilbert members apply this comparison at unramified
`v|ℓ` with crystalline realization and a common safe interval after the
declared twist.

(Source: [Diamond–Flach–Guo](https://arxiv.org/pdf/2512.02348v2), §1.1,
pp.6–7, coefficient actions, `V` and integral comparison;
[Dimitrov](https://arxiv.org/pdf/math/0411152v1), §2.7, Proposition 2.12 and
Corollary 2.13, p.21, and Appendix A.6–A.7, pp.48–49, for the residual
weight calculation. The niveau-`2f` case follows from the simple-object formula
of R07.3.9 as well as the niveau-`f` case.)

**Checks.**

- For `K=ℚ_ℓ` and `ℓ≥3`, a jump 1 realizes `ε_ℓ⁻¹` under `V` and `ε_ℓ` under `U_S`.
  Their `D_HT` degrees are respectively 1 and `−1`, fixing the variance and cyclotomic sign.
- For unramified quadratic `K`, retain both `O_E` factors; Frobenius exchanges
  them. Distinct labelled jumps cannot be replaced by an unlabelled pair
  without losing the two inertia exponents.
- For 11a1 at `ℓ=19, a₁₉=0` and the safe degrees are `(0,1)`. Its supersingular
  inertia characters are `θ₂⁻¹` and `θ₂⁻¹⁹` in the cohomological convention;
  neither is a niveau-one character. The arithmetic dual has `θ₂, θ₂¹⁹`.
- An interval `[a,a+ℓ−2]` is carried to `[0,ℓ−2]` by `T(a)` and then restored.
  An interval of length `ℓ−1` fails this safe-range hypothesis.

*Needs:* LocalGaloisDeformationRings §1.6;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.9,
R07.3.12–R07.3.17; ArithmeticGaloisRepresentations §2.3;
AutomorphicGaloisRepresentationsPartII AG2.P, finite-coefficient periods.

### 1.6 Integral newform structures

Over `O_K` and the localization `O_S` with `S` containing primes dividing `Nk!`, construct finitely generated Betti, filtered de Rham and `λ`-adic integral modules, comparison maps and the Hecke-ideal kernel. Rationalization gives `M_g^DFG` and, after the `ψ⁻¹` twist, `M_g`. Identify the top de Rham module with integral `q`-expansions and identify it with `Hom_{O_S}(T,O_S)` by `f↦(T↦a₁(Tf))`. Outside `S` apply §1.5a to the stable torsion-free lattices for coefficient-linear Fontaine–Laffaille comparison with `0≤k−1≤ℓ−2`, retaining its kernel compatibility. Inside `S` retain the module, then explicitly take its image/torsion-free quotient when a lattice is required; freeness or integral perfection is not automatic. The normalized coefficient `a₁(g)=1` detects whether a scalar multiple is integral.

*Needs:* [1.2 Parabolic realisations](#12-parabolic-realisations); [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation); [1.5a Coefficients and labelled Fontaine–Laffaille comparison](#15a-coefficients-and-labelled-fontainelaffaille-comparison); `ModularCurvesPartII:§§14.1–14.4, 14.8, 14.11–14.12`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`.

See [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §1.2, p. 9 (arXiv v2); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §4.5, Lemma 4.12, p. 51 (arXiv v2); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §5.3, Lemma 5.5, p. 56 (arXiv v2); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §5.4, p. 58 (arXiv v2).

- An `S`-integral premotivic structure over `O_K`: finitely generated integral modules `𝓜_B, 𝓜_dR` (over `O_S`, filtered), `𝓜_λ`, the Fontaine–Laffaille objects `𝓜_{λ-crys} (λ ∉ S)` and integral comparison isomorphisms.
- `𝓜[I]` for an `O_K`-submodule `I` of `End 𝓜`, the common kernel of generators of `I`.
- `𝓜(N, ψ)_{M,!}` as an `S`-integral premotivic structure for `S ⊇ S_N^K`, with `K ⊗ 𝓜(N, ψ)_{M,!} = M(N, ψ)_{M,!}`.
- `Fil^{k−1}𝓜(N, ψ)_{M,!,dR} =` the cusp forms with `q`-expansion in `O_S[[q]]`.
- `f ↦ (T ↦ a₁(Tf))` is an isomorphism `Fil^{k−1}𝓜(N, ψ)_{M,!,dR} ≅ Hom_{O_S}(𝕋, O_S)`.
- `𝓜_g := 𝓜(N, ψ)_{M,!}[I_g]`.
- `K ⊗ 𝓜_g = M_g^{DFG}`, and `K ⊗ (𝓜_g ⊗ 𝓜_{ψ⁻¹}) = M_g` ([1.5 Rank-two newform realisation](#15-rank-two-newform-realisation)).

**Checks.**

- For 11a1 `(N = 11, k = 2, ψ = 1, S = {2, 11})`: `Fil¹𝓜_{g,dR} = ℤ[1/22]·f`.
- For `k=2` the prime 2 lies in `S`: the chosen Fontaine–Laffaille comparison requires `k−1≤ℓ−2` and does not apply at 2. This says nothing against a separate crystalline realisation at a good prime 2.
- `K ⊗ 𝓜_g` recovers the rank-two `M_g^{DFG}` with `Fil^{k−1} = Kg`; for trivial `ψ` this is `M_g` itself.
- If `c ∈ K` and `cg` has `q`-expansion in `O_S[[q]]` then `c ∈ O_S`, since `a₁(g) = 1`.

### 1.7 Higher-weight classical existence

Let `f≠0` be a form of weight `k≥2`, level `N` and type `(k,ψ)`, not necessarily cuspidal, normalized or new, that is an eigenvector of `T_p` for every prime `p∤N`, with eigenvalues `λ_p(f)`, over a number field containing these eigenvalues and the character values. Use AlgebraicModularFormsAndSerreWeights R15.5A.2 for the continuous semisimple arithmetic representation of `G_ℚ` at every finite `λ`, unramified outside `Nℓ`, with good polynomial `X²−λ_p(f)X+ψ(p)p^{k−1}` at arithmetic Frobenius `p∤Nℓ`. Full good polynomials characterize it up to isomorphism. For cusp forms prove that the supplied attachment agrees with the arithmetic dual of the DFG-corrected geometric factor of the normalized newform with the same good eigenvalues; for Eisenstein forms use the two Galois characters supplied by the cusp/Eisenstein decomposition. If such eigenforms `f,f′` of weights `k,k′≥2`, levels `N,N′` and characters `ψ,ψ′` have `λ_p(f)=λ_p(f′)` on a prime set of Dirichlet density one (natural density one implies this), then `k=k′`, `ψ(p)=ψ′(p)` and `λ_p(f)=λ_p(f′)` for every prime `p∤NN′`; neither eigenform need be cuspidal. The weight-two branch uses a modular abelian quotient; Scholl's higher-weight theorem excludes that branch.

*Needs:* AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2; [1.1 Coefficient Eichler–Shimura](#11-coefficient-eichlershimura); [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation); `ArithmeticGaloisRepresentations:§§1.1–1.10`; [1.4 Rational orbit projector and coefficient descent](#14-rational-orbit-projector-and-coefficient-descent); TauCetiRoadmap.ModularForms, layer 0 diamond operators and modular forms with character nebentypus; TauCetiRoadmap.ModularForms, layer 4 eigenforms newforms primitive forms the conductor.

See [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Theoreme 6.1, printed p. 520; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Remarque 6.2, printed p. 521; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Corollaire 6.3, printed p. 521, for the density-one rigidity, with Lemme 3.2, printed p. 513; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — footnote (1) to 3.1, printed p. 513; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Introduction, printed p. 507; [A. J. Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf) — Theorem 1.2.4(i), p. 2, with 1.0.0, p. 1.

**Checks.**

- `E₄=1+240q+2160q²+⋯` has `λ₂(E₄)=1+2³=9` but `a₂(E₄)=2160`. Its attachment
  `1⊕χ_ℓ³` has polynomial `(X−1)(X−8)=X²−9X+8` at arithmetic Frobenius 2 for
  `ℓ≠2`, which is `X²−λ₂X+2³`; with the coefficient `a₂` in place of `λ₂` the
  polynomial would have trace 2160.
- `Δ(3τ)` (weight 12) and `E₄(3τ)` (weight 4), both of level 3, have `a_p=0` at
  every prime `p≠3`, a set of density one, yet `12≠4`: rigidity stated with
  `q`-coefficients is false. Their eigenvalues `λ₂=τ(2)=−24` and `λ₂=9` differ,
  so the eigenvalue hypothesis fails and nothing is contradicted.
- `Δ` (level 1) and `Δ(3τ)` (level 3) have `λ_p` equal at every `p≠3`. The
  conclusion gives weight 12, trivial character and equal eigenvalues at every
  `p∤3`, while `a₂(Δ)=−24≠0=a₂(Δ(3τ))`: equality of good `q`-coefficients is not
  part of the conclusion.
- `2Δ` has `a₂=−48` and `λ₂=−24`; its attachment is that of `Δ`, with polynomial
  `X²+24X+2¹¹` at 2, so the attachment does not change under rescaling.

### Examples

At level 11 and weight two with `ψ=1`, the parabolic space has rank two and
the geometric good polynomial at 3 is `X²+X+3`. Its arithmetic dual has the same
polynomial at arithmetic Frobenius, whereas the cohomological object at
arithmetic Frobenius has `X²+X/3+1/3`. For `Δ` at level one and weight `12, t₂=−24`
gives `X²+24X+2048`, and the Hodge pair is `(0,11)`. The character-valued case must
keep the diamond operator and the DFG twist; neither trivial-character example
distinguishes `ψ` from `ψ⁻¹`.

For `r=2`, the tensor action of a transposition on two `H¹` factors carries a
graded sign. Scholl's `ε` includes the permutation sign to recover `Sym²`; an
unsigned average selects the wrong summand. A projector at the rational new
Hecke quotient does not assert that the full old Hecke algebra is reduced.

### Dependencies

Mathlib and Tau Ceti; TauCetiRoadmap.ModularForms; ModularCurvesPartII Layers 13–17; ArithmeticGaloisRepresentations Layers 1 and 6; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3; generic geometric comparison and resolution.

## Layer 2: Weight-one representations

AlgebraicModularFormsAndSerreWeights §§6.3–6.4 (R15.5A.2a–R15.5A.3) owns the
classical weight-one theory: the conjugate prime moments, the finite eigenvalue
sets off prime sets of small upper density, the Deligne–Serre image bound,
prime-to-order lifting, the characteristic-zero lift, cuspidal irreducibility
and the Artin attachment. This layer has the single target §2.10, which places
that attachment in the normalization of §1.5.

### 2.10 The weight-one Artin representation

For a nonzero weight-one form `f` of level `N≥1` and odd nebentypus `ψ` that
is an eigenvector of `T_p` with eigenvalue `λ_p=λ_p(f)` for every prime `p∤N`,
AlgebraicModularFormsAndSerreWeights §6.4 supplies the unique continuous
semisimple finite-image `ρ_f:G_ℚ→GL₂(ℂ)`, unramified outside `N`, with
arithmetic good polynomial `X²−λ_pX+ψ(p)` at `p∤N` and determinant `ψ`,
irreducible exactly in the cuspidal case. Prove that its dual `ρ_f^∨` has, at
geometric Frobenius `p∤N`, the same polynomial `X²−λ_pX+ψ(p)`, which is the
`k=1` specialization of §1.5's arithmetic good-prime polynomial
`X²−aX+ψp^{k−1}`, and that at the same arithmetic Frobenius `ρ_f^∨` has
polynomial `X²−(λ_p/ψ(p))X+ψ(p)⁻¹`. Thus `ρ_f` is in the position of the
arithmetic dual of §1.5 and `ρ_f^∨` in that of the cohomological factor, and
`det ρ_f=ψ` is the `k=1` case of `det ρ_{g,λ}=ψχ_ℓ^{k−1}`. Weight one does not
define a `Sym^{k−2}` DFG premotive or a regular Hilbert infinity type: the
comparison concerns polynomials and determinants, not a realization of §1.5's
premotive.

*Needs:* AlgebraicModularFormsAndSerreWeights R15.5A.3 (§6.4); §1.5's
polynomial normalization.

(Source: Deligne–Serre Théorème 4.1 with its footnote on Artin's Frobenius
convention, pp. 513–514, and Remarques 4.3–4.5, p. 514.)

**Checks.**

- For the dihedral newform `η(z)η(23z)` of character `χ_{−23}`, at `p=5` (inert
  in `ℚ(√−23)`) `λ₅=a₅=0` and `ψ(5)=−1`, and at `p=2` (split) `λ₂=a₂=−1` and
  `ψ(2)=1`.
  The arithmetic polynomials are `X²−1` and `X²+X+1`, and the same-Frobenius
  dual formula returns the same two polynomials. This is a control: the image
  `S₃` has a self-dual two-dimensional representation, so a missing dual is
  invisible here.
- For the weight-one Eisenstein eigensystem `1⊕χ`, with `χ` the odd character
  modulo 5 and `χ(2)=i`, `λ₂=1+i` and `ψ(2)=i`. Then `ρ_f^∨` at geometric
  Frobenius has `X²−(1+i)X+i=(X−1)(X−i)`, while at arithmetic Frobenius it has
  `X²−(1−i)X−i=(X−1)(X+i)`. A convention that evaluated the dual at the
  arithmetic Frobenius would report trace `1−i≠λ₂`.
- At `k=1` the constant `ψ(p)p^{k−1}` of §1.5 is `ψ(p)`, and the Hecke form
  `q_vs_v` with `s_p=ψ(p)p^{k−2}` also gives `ψ(p)`. Using `s_p` alone as the
  constant would give `ψ(p)/p`, which has absolute value `1/p` and cannot be a
  product of two roots of unity, contradicting the finite image.
- The determinant `ψχ_ℓ^{k−1}` of §1.5 specializes at `k=1` to the finite-order
  character `ψ`; an exponent `k` instead of `k−1` would give `ψχ_ℓ`, of infinite
  order, which no finite-image representation has.

### Examples

For `η(z)η(23z)` the supplied `ρ_f` has image `S₃` and factors through the
Hilbert class field of `ℚ(√−23)`, of degree three over it. The prime 2 splits
in `ℚ(√−23)` into non-principal primes, since `x²+xy+6y²=2` has no integral
solution, so its Frobenius has order three, matching `a₂=−1` and the
polynomial `X²+X+1`. The prime 5 is inert, so its Frobenius is a transposition,
matching `a₅=0`, `ψ(5)=−1` and `X²−1`. Complex conjugation also has trace zero
and determinant `−1`, as the odd character `χ_{−23}` requires.

### Dependencies

Layer 1 (§1.5); AlgebraicModularFormsAndSerreWeights R15.5A.3 (§6.4).

## Layer 3: Hilbert constructions and their arithmetic properties

### 3.1 The quaternionic multiplicity space

Choose `B/F` split at one real place `τ₁` and ramified at all the others, and split at every finite place except for one finite discrete-series place when `d` is even. Choose a finite Galois `E/ℚ` containing `F` and the coefficients of `π` and splitting `B`. Form the coefficient representation `⊗_τ det^{(w−k_τ+2)/2}Sym^{k_τ−2}`, of dimension `∏_τ(k_τ−1)`, whose center acts by the norm to the power `w`, and its lisse sheaf. Use HilbertModularVarietiesAndShimuraCurves R18.4.25's cohomological multiplicity extraction, with its actual coefficient models. For parallel weights use R18.3.29's attachment at type `(k,k−2)`, with the integral Tate transport for general `w`. Here identify the nonparallel multiplicity with Carayol's `σ_λ` and extend the early rank-two identification to those weights. Let `C` be the cuspidal automorphic representations with the specified coefficient and infinity types and Jacquet–Langlands discrete-series conditions at the ramification places of `B`. Choose `K` sufficiently small with `π_f^K≠0`. Write `σ_λ` as `Hom` from this nonzero finite automorphic factor to `H¹` of the Shimura curve, retaining the central-character conversion to the supplied arithmetic object. Matsushima–Shimura multiplicity gives dimension two for these `K`. Prove compatibility with level change among such `K` and the direct-limit decomposition into `π_f⊗σ_λ`. If `F=ℚ`, take the parabolic image rather than all `H¹`; the boundary cannot be absorbed into a cuspidal multiplicity space.

*Needs:* HilbertModularVarietiesAndShimuraCurves §§R18.3.29, R18.4.25; `HilbertModularVarietiesAndShimuraCurves:R18.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 2.2.3, p. 420; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 2.2.4, p. 420; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 2.3, p. 421.

- For `π ∈ C` and sufficiently small `K` with `π_f^K≠0, σ_λ(π) = Hom_{H(G(𝔸^f),K)}(π_f^K, H¹(M_K ⊗ F̄, F_λ))`; use parabolic `H¹` in the nonproper case over `ℚ`.
- For `π ∈ C` and sufficiently small `K` with `π_f^K≠0, dim_{E_λ} σ_λ(π) = 2`.
- Canonical identifications make `σ_λ(π)` independent of the sufficiently small `K` with `π_f^K≠0`.
- `lim_K H¹(M_K ⊗ F̄, F_λ) ⊗ Ē_λ ≅ ⊕_{π∈C} π^f ⊗ σ(π)` as `G(𝔸^f) × Gal(F̄/F)`-modules.

**Checks.**

- For the weight-two level-11 trivial-character eigensystem, the extracted
  `σ` has geometric polynomial `X²+X+3` at 3, using the parallel-weight supplier
  and its normalization; an arbitrary trivial rank-two representation fails.
- Twist this eigensystem by an order-eight character `η` modulo 17 with
  `η(3)=ζ₈`. Then `t₃=−ζ₈, s₃=ζ₈²=i`. The extracted `σ` polynomial is
  `X²+ζ₈⁻¹X+3ζ₈⁻²`, while `ρ` has `X²+ζ₈X+3ζ₈²`. The central-character
  conversion distinguishes these genuine multiplicities.
- At level `Γ₀(22)`, the level-11 weight-two old factor has automorphic
  multiplicity `dim π_f^K=2`. Its isotypic cohomology has dimension four,
  while `Hom` from the two-dimensional automorphic factor has dimension two.
- For 11a1 at full level 3, the factor at 11 is Steinberg and has no
  `GL₂(ℤ₁₁)`-invariants. Thus `π_f^K=0` and the finite-level `Hom` is zero;
  this `K` is outside the constructor's domain despite being a fine level.

- For `F = ℚ`, using the full `H¹` of the open modular curve adds Eisenstein classes, so `σ(π)` must be taken in parabolic cohomology.

**Coefficient-system Checks.**

- Parallel `k_τ=2` gives coefficient rank one.
- At weights `(2,4)`, the coefficient rank is three, independently of the
  rank-two Galois multiplicity.
- At weight 12 over `ℚ, Sym¹⁰` has rank eleven; it cannot itself be the
  rank-two extracted representation.

### 3.2 Twisting and the preliminary determinant

Twisting `π` by a character with component `t↦t^{-u}` on the positive real scalars changes `w` to `w+2u`. Carayol's multiplicity space changes contravariantly by that character's inverse. Prove the preliminary identity `det σ_λ=αχ_{π,λ}⁻¹ε_ℓ⁻¹` for a quadratic character `α`. Retain `α` until the normalized-cohomology calculation of §3.3 and the exact comparison of §3.3a.

*Needs:* [3.1 The quaternionic multiplicity space](#31-the-quaternionic-multiplicity-space); `HilbertModularVarietiesAndShimuraCurves:R18.4`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 3.3, Proposition, p. 422; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 5.5, pp. 428–429; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 5.6.1, p. 429.

### 3.3 Vanishing-cycle filtration

At the bad place, identify the two-step filtration of `σ_λ` furnished by vanishing cycles and the further decomposition of its first piece into supersingular and normalized-curve contributions. If the normalized contribution `σ̃₁` is nonzero, `π_v` is principal series. If `dim σ̃₁=2`, then `σ_v=σ̃₁`. For spherical `π_v=Ind(ξ₁,ξ₂)`, derive Carayol §5.4's three possibilities: the sum of the two expected characters, or either expected character repeated. Do not select the first possibility using the preliminary determinant. At a smooth unramified place the multiplicity is already the two-dimensional normalized cohomology. Import bad-reduction models and equivariant vanishing cycles, and retain the distinction between these geometrically defined pieces and residual characters. The weight-two exception in the cohomological argument must be retained.

*Needs:* [3.1 The quaternionic multiplicity space](#31-the-quaternionic-multiplicity-space); [3.2 Twisting and the preliminary determinant](#32-twisting-and-the-preliminary-determinant); `HilbertModularVarietiesAndShimuraCurves:R18.2`; `LefschetzPencilsAndVanishingCycles:LPV.0`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — §§5.1–5.4, pp. 425–428; 5.6, p. 429; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 11.1, p. 449.

Keep the term `A=ker(H²(special fibre,F)→H²(generic fibre,F))` in the exact
sequence before extracting the cuspidal multiplicity. If every `k_τ=2`, the
coefficient sheaf is constant on each irreducible component and `A` need not
vanish. Otherwise `H⁰` and `H²` on each component vanish. The action on `A` factors
through the idele norm, so `A` has no cuspidal automorphic constituent and its
localized cuspidal multiplicity vanishes even in weight two. These are the
distinct assertions in Carayol §4.4, p. 424, and §11.5, p. 451. A proof that
sets `A=0` before localization in weight two fails this target.


### 3.3a Exact determinant and principal series

Using §3.3's three spherical-prime possibilities and §3.2's twisting law,
prove `det σ_λ=χ_{π,λ}⁻¹ε_ℓ⁻¹`. The quadratic discrepancy `α` makes `απ≅π`
at almost every spherical place and hence globally by strong multiplicity one.
Twisting then gives `ασ≅σ`; comparing the three possibilities forces the
expected two-character sum at almost every place and `α=1`. Finish the
principal-series identification wherever `dim σ̃₁=2`, using the exact determinant.

(Source: Carayol §§5.4–5.6, printed pp. 428–429.)

*Needs:* §§3.1–3.3; GL2AutomorphicRepresentationsAndTransfer §R16.4.4,
strong multiplicity one; ArithmeticGaloisRepresentations Layer 5.

**Checks.**

- If the two expected spherical characters are distinct, duplicating one has
  the wrong exact determinant; the preliminary squared identity alone need
  not distinguish it when their ratio is quadratic.
- For 11a1 at 3 the resulting `σ` polynomial is `X²+X+3` and determinant 3.
- Under a nonquadratic unramified central value `s`, the determinant is `q/s`,
  not `qs`. A quadratic ambiguity must be removed globally before using it
  to select the normalized principal-series summand.

### 3.4 Special local components

If `π_v=χ·Sp`, identify the parameter as the indecomposable special representation with characters `χ⁻¹` and `χ⁻¹ε_ℓ⁻¹` in Carayol's convention. The normalized contribution is zero and the supersingular piece supplies the kernel line. Prove the Picard–Lefschetz surjectivity for Carayol's specific geometric `ℱ_λ`, and hence `N≠0` on the special multiplicity, with image the kernel of pullback from special-fibre `H¹` to the `H¹` of its normalization. The target is this kernel, not the opposite cokernel. Semisimplifying the two characters would erase the extension and give an incorrect special parameter.

*Needs:* [3.3 Vanishing-cycle filtration](#33-vanishing-cycle-filtration); [3.3a Exact determinant and principal series](#33a-exact-determinant-and-principal-series); `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `LefschetzPencilsAndVanishingCycles:§§7a.1–7a.3`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 6.7, Proposition, p. 432; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 6.7, Remarque, p. 432; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 11.4, Proposition, p. 451.

Use Carayol §§11.5–11.10: on each normalized component the geometric
coefficient sheaf is constant, or has `H⁰=H²=0`; duality identifies the relevant
incidence maps. The edge and vertex maps are the rational graph incidence
maps tensored with the fixed coefficient space. Their image/kernel
intersection is zero by the nondegenerate rational edge pairing. This is the
coefficient argument required here, beyond the supplied constant-`ℚ_ℓ` theorem.

**Checks.**

- For constant coefficients on a one-loop nodal graph, `N` has rank one and
  its image is the normalization kernel.
- For the special cuspidal multiplicity, the kernel line is nonzero and `N`
  maps onto it; replacing the local parameter by two characters gives `N=0`.
- On a nonseparating genus-two nodal smoothing with rank-two graph holonomy
  `U=[[1,1],[0,1]]`, put `A=U−1`. The coefficient model has
  `H¹=coker A⊕ker A⊕ℚ_ℓ⁴` and `N([x],y,z)=([y],0,0)=0` since `ker A=im A`,
  although `coker A≠0`. This arbitrary lisse sheaf lacks the geometric incidence
  identifications above and is outside the asserted coefficient theorem.

### 3.5 The local fundamental representation

The vanishing-cycle quotient `σ₂` is nonzero if and only if `π_v` is essentially discrete series. Identify `π_v⊗σ₂` with the `π̄_v^∨`-isotypic part of the representation `U` of the product of the local Weil group, `GL₂(F_v)` and the division-quaternion group. Construct `U` from the Drinfeld/supersingular geometry of
HilbertModularVarietiesAndShimuraCurves §§R18.2.3, R18.2.6 and R18.5.19–R18.5.21. This identifies the local Galois parameter independently of the global eigenform and supplies the cuspidal part of the geometric proof.

*Needs:* [3.3 Vanishing-cycle filtration](#33-vanishing-cycle-filtration); [3.3a Exact determinant and principal series](#33a-exact-determinant-and-principal-series); `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `HilbertModularVarietiesAndShimuraCurves:R18.5`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 10.6, Proposition, pp. 448–449.

The local fundamental representation is the direct limit
of the degree-one vanishing-cycle spaces of the universal height-two formal
`O_{F_v}`-module, with all level structures and quasi-isogeny components. Here
`ℓ` differs from the residue characteristic of `F_v`. Construct its commuting
continuous Weil action and smooth `GL₂(F_v)` and division-quaternion actions.
Identify the vanishing cycles with cohomology of the generic fibre of the
completed strict henselization, retaining the component and descent actions.
The API comprises level transition, coefficient extension, commuting actions
and the `π̄_v^∨`-isotypic multiplicity comparison above. (Carayol §§7–9,
§10.3 and Brylinski's appendix, in the scan cited above.)

**Checks.**

- Passing between two successive full local levels intertwines all three
  group actions; forgetting the level must not change the Weil normalization.
- A principal-series component has `σ₂=0`, whereas an essentially discrete-series
  component has `σ₂≠0`; the local construction cannot assign the same zero
  multiplicity to both.
- Twisting by a nonquadratic unramified character distinguishes the
  `π̄_v^∨`-isotypic convention from the `π̄_v`-isotypic convention. Its scalar
  value and inverse must be transported by the determinant dictionary.

### 3.6 Ordinary cuspidal local components

Here “ordinary cuspidal” means the dihedral local representation, not `p`-ordinary. For the quadratic local extension `L` and character `ξ`, identify Carayol's parameter with `Ind ξ⁻¹|·|⁻¹/²`. Globalize it by quadratic automorphic induction with the necessary prescribed local component and nonsplit auxiliary place, then compare global representations. This step imports the induction and globalization theorem; it does not construct a second induction functor.

*Needs:* [3.5 The local fundamental representation](#35-the-local-fundamental-representation); [3.3 Vanishing-cycle filtration](#33-vanishing-cycle-filtration); `GL2AutomorphicRepresentationsAndTransfer:R17.5`; [3.4 Special local components](#34-special-local-components); `ArithmeticGaloisRepresentations:§§1.1–1.10`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 11.3, p. 450.

### 3.7 Carayol's Theorem B

For the fixed geometric construction and auxiliary discrete-series place `v₀`, identify `σ_λ|W_v` at every `v≠v₀` away from `λ` except the extraordinary cuspidal case. Combine normalized cohomology for principal series, the special monodromy argument and the ordinary-cuspidal globalization. Both exclusions belong to the conclusion of this intermediate theorem and are discharged by the subsequent comparison steps.

*Needs:* [3.3 Vanishing-cycle filtration](#33-vanishing-cycle-filtration); [3.4 Special local components](#34-special-local-components); [3.5 The local fundamental representation](#35-the-local-fundamental-representation); [3.6 Ordinary cuspidal local components](#36-ordinary-cuspidal-local-components); [3.3a Exact determinant and principal series](#33a-exact-determinant-and-principal-series); `GL2AutomorphicRepresentationsAndTransfer:R17.3`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 11.1, pp. 449–450; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 11.3, p. 450.

### 3.8 Primitive two-dimensional restriction

For the extraordinary dyadic local case, the finite projective image is `A₄` or `S₄`. A local Galois quotient is solvable, so `A₅` does not occur here. Restrict to the cubic extension fixed by a 2-Sylow subgroup: it is normal in the `A₄` case and nonnormal in the `S₄` case, where the 2-Sylow subgroup `D₄` has three conjugates. The restricted representation is irreducible and monomial. Prove that matching restrictions together with matching determinants identify the original representations. The determinant condition is indispensable to this recognition.

*Needs:* `GL2AutomorphicRepresentationsAndTransfer:R16.3`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 12.1.3, p. 456.

### 3.9 The extraordinary cubic step

Carry out base change along the chosen degree-at-most-three extension and compare the resulting local parameter with restriction of the Galois representation. Use cyclic base change in the normal case and the separate nonnormal cubic theorem in the other case. At the chosen place the transferred principal/special/ordinary-cuspidal parameter must agree with restriction, not merely at almost all places. Globalize the primitive local representation using the tetrahedral/octahedral inputs, apply Theorem B upstairs and descend with the preceding restriction lemma. This also provides the final comparison at the auxiliary place.

The local statement applies to every extension `L/F_v` of degree at most three
and every extraordinary cuspidal `π_v`: its base-change lift corresponds to
the irreducible restriction of its Weil representation to `W_L`. The comparison
also holds in the Hecke normalization.

*Needs:* `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.5`; `GL2AutomorphicRepresentationsAndTransfer:R16.3`; `GL2AutomorphicRepresentationsAndTransfer:§R17.4.17`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 12.2.2, Proposition, p. 457; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 12.2.3, p. 458.

### 3.10 The unrestricted Hilbert constructor

For every `π` of type `(k,w)` as fixed above, construct a continuous semisimple `ρ_{π,λ}` over a sufficiently large `E_λ` for every finite `λ`, unramified outside `S_π` and `ℓ`, with good geometric polynomial `P_v`. No finite discrete-series place is required when `d` is even. For parallel weight `k`, normalize `π₀=π⊗|det|^j` with `j=(w−k+2)/2` to type `(k,k−2)`, apply HilbertModularVarietiesAndShimuraCurves R18.3.29 to `π₀`, and define this member as the dual of `r_π=r_{f₀}⊗ε_ℓ^j` after common coefficient extension. This includes that supplier's Taylor branch in even degree without a finite discrete-series place. For nonparallel weights use the geometric extension of §§3.1–3.9 where available, twisting Carayol's representation; otherwise use auxiliary `μ_s`-new congruences modulo `λ^s` and compatible trace/determinant reconstruction. The auxiliary prime can vary with `s` and imposes no hypothesis on `π`. Prove independence of construction, extension/conjugation of coefficients, twist compatibility and agreement with the classical `M_f`. Good polynomials characterize the semisimple representation, while minimal descent to `ℚ(π)_λ` is a separate assertion not made here.

*Needs:* HilbertModularVarietiesAndShimuraCurves §R18.3.29; IntegralIwasawaTheory §9.5, `finiteWeightHilbert_galoisOldform`, for the shared classical comparison; [3.7 Carayol's Theorem B](#37-carayols-theorem-b); [3.3a Exact determinant and principal series](#33a-exact-determinant-and-principal-series); `ArithmeticGaloisRepresentations:§§1.1–1.10`; `ArithmeticGaloisRepresentations:Layer 5`; `IntegralHeckeAndGaloisDeterminants:IHG.1`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `HilbertModularVarietiesAndShimuraCurves:R18.4`; `AutomorphicGaloisRepresentationsPartII:AG2.0, The l-adic character r_{l,ι}(χ)`.

See [Mark Kisin](https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf) — §4.1, p. 542; [Mark Kisin](https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf) — Proof of Theorem 4.3, pp. 543–544; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Introduction, p. 242, after equation (1); [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.5, printed p. 410.

For the shared parallel domain prove the following parallel-weight comparison.
For `π` of type `(k,w)`, put `j=(w−k+2)/2∈ℤ` and `π₀=π⊗|det|^j`, of type
`(k,k−2)`. Apply R18.3.29 to its actual non-norm definite or cohomological
eigenpacket `f₀`, with `k≥2` and the supplier's coefficient model, central
character and acting maximal ideal `m₀` for residual assertions. Choose common
finite coefficients containing both realizations. If `r_{f₀}` is the literal
fraction-field representation supplied by R18.3.29,
define `r_π=r_{f₀}⊗ε_ℓ^j` and provide the `G_F`-equivariant isomorphism
`r_π ≅ ρ_{π,λ}^∨`, with coefficient-extension and level
compatibility. The literal supplied member has `D_HT` degrees `{0,1−k}`;
`r_π` has degrees `{−j,1−k−j}`. For `j=0` this is the supplied member itself.
Writing `ψ₀=χ_{π₀,λ}⁻¹`, the transported arithmetic central character is
`ψ_arith=ψ₀ε_ℓ^{2j}=χ_{π,λ}⁻¹`. Hence
`det r_π=ε_ℓ ψ_arith`; equivalently
`σ_Carayol≅r_π⊗ε_ℓ⁻¹` and `ρ≅σ_Carayol⊗χ_{π,λ}`.
Twist the supplied stable arithmetic lattice by `O(ε_ℓ^j)` before dualizing
it to obtain a specified stable lattice in `ρ`. Its semisimplified reduction
is the dual of the correspondingly twisted supplied residual eigensystem;
no equality of arbitrary chosen lattices is asserted. Good polynomials and
semisimple uniqueness identify any other construction with this object.
On eigenpackets shared with IntegralIwasawaTheory §9.5,
`finiteWeightHilbert_galoisOldform`, its field-valued `r_f` and `r_{f₀}` have
the same arithmetic good polynomials, so semisimple uniqueness gives
`r_f≅r_{f₀}` and `r_f⊗ε_ℓ^j≅ρ_{π,λ}^∨`. This comparison includes every
coefficient prime and arbitrary totally real degree, without a residual
irreducibility hypothesis. It identifies the classical attachment; the
nonreduced oldform assembly remains with that supplier.
Transport HilbertModularVarietiesAndShimuraCurves' further local comparisons,
including their Tate twists, only in its ranges: hypothesis `(C)` away from
`ℓ`, and at `ℓ` either `(C)` or residual absolute irreducibility. The remaining
local assertions are the extensions of Layer 4, rather than extra conclusions
of this adapter.

(Source: HilbertModularVarietiesAndShimuraCurves §R18.3.29, “Normalization”,
and §R18.4.25; IntegralIwasawaTheory §9.5, `finiteWeightHilbert_galoisOldform`;
Carayol §§0.4–0.5, printed pp. 409–410, and §§2.2.3–2.3,
printed pp. 420–421; Kisin §4.1 and Theorem 4.3 with its proof, pp. 542–544.)

- The continuous semisimple `ρ_{π,λ}`: `G_F → GL₂(E_λ)` attached to `π` of infinity type `(k,w)` and `λ`.
- For `v ∉ S_π, v ∤ ℓ`: charpoly `ρ_{π,λ}(Frob_v^{geom}) = X² − t_vX + q_vs_v`, with `t_v, s_v` the eigenvalues of `T_v` and `S_v` defined by `ϖ_v`.
- `det ρ_{π,λ} = χ_{π,λ}·ε_ℓ⁻¹`, where `χ_{π,λ}` is the `λ`-adic character of the central character and `ε_ℓ` the cyclotomic character.
- For an algebraic Hecke character `χ` of `F`: `ρ_{π⊗(χ∘det),λ} ≅ ρ_{π,λ} ⊗ χ_λ`; in particular `ρ_{π⊗|det|⁻¹,λ} ≅ ρ_{π,λ} ⊗ ε_ℓ⁻¹`, and `π ⊗ |det|⁻¹` has infinity type `(k, w+2)`.
- Carayol's `σ_λ(π) ≅ ρ_{π,λ} ⊗ χ_{π,λ}⁻¹ ≅ ρ_{π^∨,λ}` ([3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem)).
- `ρ_{π,λ}^∨` has characteristic polynomial `X² − t_vX + q_vs_v` at an arithmetic Frobenius, and `ρ_{π,λ}^∨ ≅ σ_λ(π) ⊗ ε_ℓ`.
- Two continuous semisimple representations with the polynomials `X² − t_vX + q_vs_v` at a set of places of density one are isomorphic.
- Extension of `E` and conjugation: for `σ ∈ Aut(ℂ), ρ_{π^σ,σ(λ)}` is the `σ`-conjugate of `ρ_{π,λ}`.
- In the congruence branch, compatible traces and determinants modulo `λ^s` on `μ_s`-new Hecke quotients.
- For parallel type `(k,w)`, the supplied attachment `r_{f₀}` at `π₀=π⊗|det|^j, j=(w−k+2)/2`, gives `r_π=r_{f₀}⊗ε_ℓ^j≅ρ_{π,λ}^∨`, with the transported coefficient, central-character and stable-lattice identifications above. On common IntegralIwasawaTheory §9.5 eigenpackets, `r_f≅r_{f₀}`.
- For `F = ℚ` and a newform `f` of weight `k`, the automorphic representation `π_f` of infinity type `(k, k−2)` has `ρ_{π_f,λ} ≅ M_{f,λ}`, the cohomological realisation of [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation).

**Checks.**

- `F = ℚ, E = 11a1` with its unitary `π_E` of infinity type `(2,0)`: `t₃ = a₃ = −1, s₃ = 1`, so the geometric Frobenius polynomial at 3 is `X² + X + 3`, that of `H¹_ét(E_ℚ̄, ℚ_ℓ)`.
- `F = ℚ, π_Δ` of infinity type `(12,10)`: `t₂ = τ(2) = −24, s₂ = 2¹⁰`, polynomial `X² + 24X + 2048`.
- Replacing `π` by `π ⊗ |det|⁻¹` replaces `(t_v, s_v)` by `(q_vt_v, q_v²s_v)` and the polynomial by `X² − q_vt_vX + q_v³s_v`, whose roots are `q_v` times the old roots: the twist by `ε_ℓ⁻¹`.
- The polynomial `X² − τ_vX + q_vρ_v` built from Saito's inverse-uniformiser eigenvalues `τ_v = t_v/s_v, ρ_v = s_v⁻¹` is that of `σ_λ(π)`, not of `ρ_{π,λ}`: for `π_E ⊗ |det|⁻¹` at `p = 3` the two polynomials are `X² + 3X + 27` and `X² + X/3 + 1/3`.
- For `π` with a finite discrete-series place, the congruence branch and Carayol's branch give isomorphic representations.
- A multiweight with `k_τ ≢ w` mod 2 for some `τ` is not an infinity type `(k,w)` and is not covered.

**Parallel adapter Checks.**

- For 11a1, `j=0` and `r_π=r_{f₀}`. Its arithmetic Frobenius 3 and `ρ`'s
  geometric Frobenius 3 both have polynomial `X²+X+3`; `r_π` at geometric Frobenius has
  `X²+X/3+1/3`. Omitting the dual fails the comparison.
- After `π↦π⊗|det|⁻¹`, type `(2,2)` has `j=1` and the same normalized `π₀`.
  Now `r_π=r_{f₀}⊗ε_ℓ` has degrees `{−1,−2}`, while the literal `r_{f₀}`
  retains `{0,−1}`. The geometric `ρ` polynomial at 3 is `X²+3X+27`;
  `r_π` has this arithmetic polynomial and geometric polynomial
  `X²+X/9+1/27`. Coefficient extension alone cannot supply this change.
- For a finite central value `s` of order greater than two, `det ρ` at a good
  geometric Frobenius is `qs`, while `det r_π` there is `(qs)⁻¹`.
  The transported arithmetic `ψ` value there is `s⁻¹`. Dualizing the twisted
  lattice dualizes its residual determinant as well.
- In even degree without a finite discrete-series component, the early
  Taylor attachment exists; the adapter alone supplies no unrestricted
  bad-place local theorem.

### 3.11 The representation dictionary as a theorem

Prove all identities in the convention table, the inverse-uniformiser eigenvalue conversion, the determinant/twist formulas, the labelled Hodge degrees and the classical specialization. Use the parallel-weight adapter for the early parallel-weight arithmetic attachment, including the shared classical member of IntegralIwasawaTheory §9.5, with its normalizing integral Tate twist and chosen twisted dual lattice. The essential local identity is the duality relation for `GL₂` between `π_v` and its central-character inverse twist. Apply the de Rham algebraic-Hecke-character comparison when transporting this identity at `v|ℓ`. The `L`-factor and conductor translations apply at every place where local–global compatibility has been established. Test both a norm twist of a weight-two form and a nonquadratic nebentypus; otherwise inverse/dual errors can accidentally cancel.

*Needs:* [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); [3.7 Carayol's Theorem B](#37-carayols-theorem-b); [3.3a Exact determinant and principal series](#33a-exact-determinant-and-principal-series); [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation); `GL2AutomorphicRepresentationsAndTransfer:R16.3`; `ArithmeticGaloisRepresentations:§§1.1–1.10`; `ArithmeticGaloisRepresentations:§§2.1–2.6`; `AutomorphicGaloisRepresentationsPartII:AG2.0, The l-adic character r_{l,ι}(χ)`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.4–0.5, printed pp. 409–410; [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2) — §2, p. 9 of the arXiv version; [Mark Kisin](https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf) — §4.1, p. 542; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Introduction, p. 242; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — §2.4.2, p. 255; [C. M. Skinner and A. J. Wiles](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) — §2.1, p. 9; (3.1′), p. 30; (3.2)–(3.3), pp. 38–39; [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — §1.2, p. 5; §7, pp. 57–58, and Lemma 7.2, p. 60; §9.1.1, pp. 78–80 (authors' final version); [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf) — §5.2.1, pp. 44–45.

The coefficient formulas are `X²−tX+qs` in the geometric Hilbert convention and
`X²−(t/s)X+q/s` in Carayol's convention. The labelled degree pair is
`((w−k+2)/2,(w+k)/2)`, with sum `w+1` under parity and shift `(1,1)` for
`w↦w+2`. Require `q,s≠0` for the representation dictionary and `k≥2` with
`k≡w` mod 2 for the labelled-degree interpretation. The polynomial expressions
still exist algebraically outside these hypotheses; that does not make the
corresponding automorphic input admissible.

The Hilbert polynomial is IntegralHeckeAndGaloisDeterminants §3a.1's integral
`GL_n` Hecke polynomial at `n=2`, `X²−tX+qs`, at geometric Frobenius. The
inverse-operator eigenvalues `t/s, 1/s` in Carayol's polynomial and the
weight-one specialization of §1.5's arithmetic polynomial supply the additional
conventions here.

**Checks.**

- For 11a1 at `3, (t,s,q)=(−1,1,3)` gives `X²+X+3` in both polynomial conventions. Its labelled degrees at `(k,w)=(2,0)` are `(0,1)`.
- After the norm twist, `(t,s,q)=(−3,9,3)` gives `X²+3X+27` in the Hilbert convention and `X²+X/3+1/3` in Carayol's convention; equating the two loses the central-character factor. The degrees become `(1,2)`.
- With `t=0,s=q=1` both polynomial conventions give `X²+1`. At `(k,w)=(12,10)`, the labelled pair is `(0,11)`; the sum is 11.
- Taking `s=0` is outside the dictionary even though field division makes an algebraic expression. Taking `(k,w)=(2,1)` violates parity and must not create a half-integral Hodge type by integer rounding.

### 3.12 Hilbert Hodge–Tate property

At `v|ℓ` all unrestricted Hilbert representations have exactly the two labelled degrees specified above. When `d` is odd, there is a finite discrete-series place, some `k_τ>2`, or `π` is CM, obtain de Rham comparison from geometric cohomology up to an algebraic character twist, or from the induced CM character. In the remaining even-degree, parallel-weight-two, everywhere-principal-series, non-CM case, make a totally real abelian base change and a twist to `w=0`. Use §0.6's conversion `Π=Ad(π)⊗(ω_π|·|⁻¹)`, with its local parameters, central character `ω_π³|·|⁻³` and infinity exponents. Its symmetric-square realization comes from a unitary Shimura variety for `GU(Φ)`, over a CM field `E=FE₀` with `E₀` imaginary quadratic and `ℓ` split, with signature `(2,1)` at the distinguished archimedean place and `(3,0)` at the others. At the chosen good place the symmetric square is crystalline with degrees 0,1,2; lifting along `GL₂→GL₂/{±1}` gives a crystalline rank-two representation, with the original a possibly nontrivial quadratic twist. Hodge degrees survive this twist. Identification of its WD parameter with `π_v` requires the full coefficient-prime theorem, not just the symmetric-square argument.

*Needs:* [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); [3.1 The quaternionic multiplicity space](#31-the-quaternionic-multiplicity-space); `AutomorphicGaloisRepresentationsPartII:AG2.P, Finite-coefficient periods, descent and geometric comparison`; [0.2 Crystalline lifting through the central isogeny](#02-crystalline-lifting-through-the-central-isogeny); `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `GL2AutomorphicRepresentationsAndTransfer:§R17.4.13`, adjoint lift with the character conversion of §0.6; [0.6 The unitary and `GL₃` geometric realizations](#06-the-unitary-and-gl₃-geometric-realizations); `ArithmeticGaloisRepresentations:§§1.1–1.10`; `AutomorphicGaloisRepresentationsPartII:AG2.0, The l-adic character r_{l,ι}(χ)`.

See [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Introduction, p. 243; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — §2.4.1, p. 251; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — §2.4.1, p. 252.

### 3.13 Geometric characters and algebraic Hecke characters

Let `K` be a number field, `E_λ` a finite extension of `ℚ_ℓ` and
`χ:G_K→E_λ×` a continuous character, unramified outside finitely many places and
de Rham at every `v|ℓ`. Prove, after enlarging a coefficient number field and choosing
its embedding into `ℚ̄_ℓ`, that `χ` is the `λ`-adic avatar of an algebraic Hecke
character. The avatar uses geometric reciprocity, and its labelled degrees agree
with those of `χ`. Conversely the avatar of an algebraic Hecke character is
geometric. This is a statement about characters; it does not assert the
Fontaine–Mazur conjecture for higher-dimensional representations.

Use local rank-one de Rham classification to obtain a `ℚ`-algebraic character
`χ_alg` on an open subgroup of `∏_{v|ℓ}K_v×`. Define
`η(x)=χ(rec_K(x))χ_alg(x_ℓ)⁻¹`. It kills an open subgroup `U` of the ideles, but
on `K×` it equals `χ_alg⁻¹`, rather than 1. Choose `U` to include the connected
archimedean subgroup and a finite-conductor subgroup. Finiteness of the ray
class quotient `A_K×/(K×U)` gives finitely many representatives `x_j` and powers
`x_j^{h_j}∈K×U`. Their `η`-values therefore have algebraic powers, hence are
algebraic. Together with a field of definition of `χ_alg` they generate one
finite number field `L` containing every `η`-value. For each finite `v∤ℓ`
the local algebraic correction is absent, so `χ(W_v)⊆L×`. Choose a finite set
`Σ` containing the ramified, archimedean and coefficient places; this gives
the number-field-valued Weil-group hypothesis for `v∉Σ` in the converse lemma.
At `v|ℓ` use local algebraicity and the de Rham classification; the full
inertia image need not consist of algebraic numbers.
Then apply the converse in [Conrad's algebraic Hecke-character notes](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/algebraicHeckecharacters.pdf),
the second Lemma 1 and its proof, pp. 9–10.

If `K` is totally real, Dirichlet's unit theorem forces the algebraic exponents to
be parallel. Hence `χ=χ₀ε_ℓ^m` for an integer `m` and finite-order `χ₀`. In our grading
the labelled degree is `−m`. Use this consequence in the reducibility argument of
[Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf),
Remark, printed p. 256. Over a CM field retain the separate exponents at the two
conjugate embeddings; parallel exponents cannot replace the CM character used in
quadratic induction.

*Needs:* TauCetiRoadmap.ClassFieldTheory, global reciprocity with geometric
normalization; TauCetiRoadmap.GlobalNumberFields, ideles, ray class groups and
the unit theorem; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.3 and
AutomorphicGaloisRepresentationsPartII AG2.P, rank-one local algebraicity
and stability of de Rham representations under subquotients;
AutomorphicGaloisRepresentationsPartII AG2.0, algebraic characters and their
avatars.

- Construct the algebraic character and coefficient extension with the prescribed `λ`-adic realization.
- Over a totally real field identify `χ₀` and the single cyclotomic exponent `m`, with degree `−m`.
- Enlarging coefficients changes the chosen realization, not its conductor or labelled degrees.

**Checks.**

- The trivial character has `m=0` and the trivial finite-order factor; `ε_ℓ` has `m=1` and degree `−1`.
- For `K=ℚ`, `ℓ=3`, `χ=ε₃`, the coefficient-place inertia image is
  `χ(I₃)=ℤ₃×⊆χ(W₃)`, an uncountable group contained in no number field.
  Away from 3 the Weil images are rational, and the corrected `η` is
  number-field-valued even at 3.
- The CM elliptic character over `ℚ(i)` has unequal labelled degrees at conjugate embeddings; the totally real conclusion must not apply to it.
- A continuous local character with a nonintegral Sen weight fails the de Rham hypothesis and supplies no algebraic avatar.

### 3.14 Determinant, total oddness and absolute irreducibility

For the unrestricted `ρ_{π,λ}`, prove determinant `χ_{π,λ}ε_ℓ⁻¹`, determinant `−1` at complex conjugation at each real place, and absolute irreducibility. Use the exact determinant comparison to remove quadratic ambiguity. If a global decomposition existed, Hodge–Tate characters would be algebraic Hecke characters and the source's `L`-function pole argument would contradict cuspidality. Prove uniqueness from good Frobenius polynomials and identify totally real solvable cuspidal base change with restriction. Absolute irreducibility of the global representation does not rule out a reducible ordinary local restriction, nor does it imply residual irreducibility.

*Needs:* [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); [3.3a Exact determinant and principal series](#33a-exact-determinant-and-principal-series); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); [3.12 Hilbert Hodge–Tate property](#312-hilbert-hodgetate-property); `ArithmeticGaloisRepresentations:§§1.1–1.10`; `ArithmeticGaloisRepresentations:Layer 5`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `AutomorphicLFunctionsAndLocalFactors:AL.3`; `AutomorphicGaloisRepresentationsPartII:AG2.0, The l-adic character r_{l,ι}(χ)`; [3.13 Geometric characters and algebraic Hecke characters](#313-geometric-characters-and-algebraic-hecke-characters).

For a hypothetical decomposition write `ψ_i=θ_i|·|^a_i` with `θ_i` finite
order, and relabel so `a₁≥a₂`. Choose a finite set `S` containing the bad places
and places over `ℓ`; superscript `S` omits these finite Euler factors. Equality
of good Euler factors gives
`L^S(π⊗ψ₂⁻¹,s−1/2)=L^S(ψ₁/ψ₂,s)ζ_F^S(s)`.
The full character factor at `s=1` is `L(θ₁/θ₂,1+a₁−a₂)`: it is finite
and nonzero unless `a₁=a₂` and `θ₁=θ₂`, when it has a simple pole. Removing
Euler factors multiplies it by factors `1−θ(ϖ_v)q_v^(−t)` with `t≥1`
and `θ` finite order, or by 1 at ramified places; all are nonzero. The
truncated zeta function still has a simple pole. Thus the right side has a
pole of order one or two. The left side is entire by cuspidality, since
removing finite Euler factors multiplies by entire local reciprocal
polynomials. This uses finite `L`-functions throughout; archimedean factors
are absent.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — §§3.1–3.3, printed pp. 421–422; §5.5, printed pp. 428–429; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Remark, p. 256; [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2) — §2, p. 9 of the arXiv version.

**Checks.**

- A finite-order nontrivial `θ` has `L(θ,1)≠0`; `θ=1` gives a pole there.
  In Skinner's reducibility argument the latter increases the pole order
  instead of cancelling `ζ_F's` pole.
- For `θ|·|^a` at 1 evaluate `L(θ,1+a)`. The exponent ordering `a₁≥a₂` in the
  character ratio puts the argument in the nonvanishing range.
- Over `ℚ, ψ=|·|⁻⁴` has `L(ψ,2)=ζ(−2)=0`, with `ψ(ϖ_p)=p⁴`.
  Likewise |·|⁻³ at 1 gives the same zero. Algebraicity alone gives no
  nonvanishing at positive integers. The zeta zero is also the pinned
  `riemannZeta_neg_two_mul_nat_add_one` at `n=0`.

### 3.15 The CM predicate

On an existing regular Hilbert eigensystem define CM by `π_f=AI_L^F(α)`, for a totally imaginary quadratic `L/F` and the matching infinity type. The infinity exponents of `α` are half-integral; the algebraic character is `α′=α|·|_L⁻¹/²`. Its `λ`-adic induction is our `ρ`, and `α′_λ` must differ from its conjugate to give cuspidality and irreducibility. Carayol's inducing character is `(α⁻¹|·|_L⁻¹/²)_λ`; the arithmetic dual uses `(α′_λ)⁻¹`. Supply the inducing field, split/inert trace formulas and compatibility with twists and coefficient extension. The regular `k_τ≥2` definition does not silently include the different finite-order weight-one case.

At a complex embedding above `τ`, the prescribed component of `α` is
`z^{(k_τ−1−w)/2} z̄^{(−k_τ+1−w)/2}`, or its conjugate. Twisting by
`|·|_L⁻¹/²` makes both exponents integral because `k_τ≡w` modulo 2.

*Needs:* `GL2AutomorphicRepresentationsAndTransfer:R17.5`; [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); `ArithmeticGaloisRepresentations:Layer 5`; [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); `AutomorphicGaloisRepresentationsPartII:AG2.0, The l-adic character r_{l,ι}(χ)`.

See [Samit Dasgupta and Mahesh Kakde](https://math.iisc.ac.in/~maheshkakde/brumerstark.pdf) — §9.1, p. 66, CM definition; [Baskar Balasubramanyam, Eknath Ghate and Vinayak Vatsal](https://mathweb.tifr.res.in/~eghate/hilbertCM.pdf) — Introduction, p. 2, Remarks (i)–(ii).

- Existence of `L/F` and `α` with `π_f=AI(α)` and the matching induced Galois representation.
- A CM quadratic inducing extension, recorded with its embedding and nontrivial automorphism.
- Trace is zero at unramified primes inert in `L`.
- At a split prime the trace is `α′_λ(Frob_w)+(α′_λ)^c(Frob_w)`, for geometric Frobenius elements.
- A compatible algebraic character twist preserves CM, with inducing character multiplied by its restriction.
- CM is invariant under extending the coefficient field.

**Checks.**

- The weight-two form of `y²=x³−x`, conductor 32, is induced from `ℚ(i)`; unramified primes 3 mod 4 have trace zero.
- A finite-order character twist of this form has the same quadratic inducing field.
- The level-one form `Δ` has no CM quadratic self-twist.
- A split Frobenius acts diagonally by `α′_λ` and `(α′_λ)^c`; determinant is their product, whereas an inert Frobenius has trace zero.
- For `y²=x³−x` and `5=(2+i)(2−i)`: `a₅=−2`, and the values of `α′_λ` at the two geometric Frobenius elements above 5 are `−1±2i`, of absolute value `5^{1/2}` and sum `−2`; the values of `α` or of `α|·|_L⁻¹` there have absolute value 1 or 5.

### 3.16 Virtual reducibility characterizes CM

Suppose the regular, absolutely irreducible attached rank-two representation becomes reducible on an open subgroup. Compact semisimple Clifford theory and the infinite projective image forced by distinct labelled Hodge–Tate degrees give induction from a character of a quadratic extension. The algebraic character and archimedean parameter force that extension to be totally imaginary. Thus `f` is CM, and a non-CM regular form remains irreducible on every open subgroup. The infinite-projective-image condition and regular weight exclude the exceptional finite-image possibilities; the CM-field conclusion is not asserted for weight-one dihedral forms.

*Needs:* [3.14 Determinant, total oddness and absolute irreducibility](#314-determinant-total-oddness-and-absolute-irreducibility); [3.15 The CM predicate](#315-the-cm-predicate); `ArithmeticGaloisRepresentations:Layer 4; §§5.12, 7.6–7.7`; `GL2AutomorphicRepresentationsAndTransfer:R17.5`; [3.12 Hilbert Hodge–Tate property](#312-hilbert-hodgetate-property); `AutomorphicGaloisRepresentationsPartII:AG2.0, The l-adic character r_{l,ι}(χ)`; [3.13 Geometric characters and algebraic Hecke characters](#313-geometric-characters-and-algebraic-hecke-characters).

See [Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/invent_28.pdf) — Theorem 2.3 and proof, printed pp. 251–252; [Baskar Balasubramanyam, Eknath Ghate and Vinayak Vatsal](https://mathweb.tifr.res.in/~eghate/hilbertCM.pdf) — Remark (ii), p. 2; [Samit Dasgupta and Mahesh Kakde](https://math.iisc.ac.in/~maheshkakde/brumerstark.pdf) — §9.1, Lemma 9.1, p. 66, with its proof on p. 67.

### 3.17 Carayol's geometric Hilbert theorem

For `π` of type `(k,w)`, require additionally a finite essentially square-integrable place if `d` is even. Use HilbertModularVarietiesAndShimuraCurves R18.3.29 on the overlapping parallel-weight range. For nonparallel weights extend Carayol's `σ_λ` system, after enlarging the coefficient field, with the Hecke-correspondence local representation at every finite `v` of residue characteristic different from `λ`. For the nonparallel extension remove the auxiliary-place and extraordinary-place exclusions of Theorem B by base change and the primitive-restriction argument; compare with the supplied parallel theorem by good polynomials and semisimple recognition; the even-degree existence hypothesis is retained. Translate `σ_λ` to `ρ_{π,λ}` by the dictionary. This geometric theorem is distinct from the unrestricted Hilbert construction above.

*Needs:* HilbertModularVarietiesAndShimuraCurves §§R18.3.29, R18.4.25; `HilbertModularVarietiesAndShimuraCurves:R18.4`; `HilbertModularVarietiesAndShimuraCurves:R18.2`; [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation); [3.7 Carayol's Theorem B](#37-carayols-theorem-b); [3.8 Primitive two-dimensional restriction](#38-primitive-two-dimensional-restriction); [3.9 The extraordinary cubic step](#39-the-extraordinary-cubic-step); [3.3a Exact determinant and principal series](#33a-exact-determinant-and-principal-series); `GL2AutomorphicRepresentationsAndTransfer:R17.4`; [3.14 Determinant, total oddness and absolute irreducibility](#314-determinant-total-oddness-and-absolute-irreducibility); `ArithmeticGaloisRepresentations:§§1.1–1.10`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.3 and Theoreme (A), printed pp. 409–411; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — Theoreme (B), printed p. 411; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.11, printed p. 412; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 12.3.1, pp. 458–459; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 12.3.2, p. 459.

### Examples

For the elliptic representation with `(k,w)=(2,0), t₃=−1,s₃=1` gives
`X²+X+3`. Twisting `π` by `|det|⁻¹` changes the data to `t₃=−3,s₃=9` and the polynomial
to `X²+3X+27`. Carayol's inverse-uniformizer convention instead gives
`X²+X/3+1/3` at those twisted data. The distinct polynomials test the dictionary
even when the original central character was trivial.

The CM form of `y²=x³−x` has trace zero at unramified primes inert in `ℚ(i)`.
At 5 the two geometric inducing-character values are `−1±2i`, giving trace `−2`
and determinant 5. Its separate local lines do not contradict global absolute
irreducibility, and the regular-weight CM conclusion is not a weight-one theorem.

### Dependencies

Layer 1; HilbertModularVarietiesAndShimuraCurves R18.2, R18.4–R18.5; GL2AutomorphicRepresentationsAndTransfer R16.3, R17.3–R17.5; LefschetzPencilsAndVanishingCycles LPV.0 and §§7a.1–7a.3; ArithmeticGaloisRepresentations; AutomorphicGaloisRepresentationsPartII AG2.0 and AG2.P; §0.6; §§0.1–0.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P7.1–R07.P7.3 and R07.3.0–R07.3.3; AutomorphicGaloisRepresentationsPartII AG2.P; ClassFieldTheory and GlobalNumberFields.

## Layer 4: Local compatibility and geometric weights

### 4.1 Geometric weight-monodromy and strict compatibility

For Saito's geometric Hilbert range `g>1, w_S≥k_τ≥2` with matching parity, and a finite discrete-series place when `g` is even, prove strict compatibility away from the coefficient characteristic. Prove monodromy purity for both the étale WD representation away from `λ` and the log-crystalline `D_pst` representation at the coefficient characteristic. His cohomological representation has weight `w_S−1`; when `N≠0` its kernel and cokernel have weights `w_S−2` and `w_S`. In the fixed `ρ`-convention these become weight `3−w_S=w+1`, kernel weight `w` and cokernel weight `w+2`. Include the classical geometric weight theorem with its separate source. The imported log-crystalline/étale weight theorem is independent of the coefficient-prime application; otherwise the proof would be circular. This scope is narrower than the all-Hilbert purity target.

*Needs:* [3.1 The quaternionic multiplicity space](#31-the-quaternionic-multiplicity-space); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); [3.17 Carayol's geometric Hilbert theorem](#317-carayols-geometric-hilbert-theorem); `WeightsInEtaleCohomology:R34.3, Saito’s semistable model and period comparison`; `WeightsInEtaleCohomology:R34.6`; `WeightsInEtaleCohomology:R34.6, Transport through actual arithmetic comparisons`; `ArithmeticGaloisRepresentations:§§2.1–2.6`.

See [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2) — Theorem 2, p. 13 of the arXiv version; [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2) — Remark after Theorem 2, p. 13 of the arXiv version; [Takeshi Saito](https://www.ms.u-tokyo.ac.jp/~t-saito/pp/weightmonodromy.pdf) — Theorem 1, printed p. 429 (page image).

### 4.2 Hilbert Ramanujan–Petersson

For every regular cohomological cuspidal `π`, its unitary twist `π⊗|det|^{w/2}` is tempered at every finite place. At an unramified place all roots of `P_v` have complex absolute value `q_v^{(w+1)/2}`, and `|t_v|≤2q_v^{(w+1)/2}` at every embedding. Exclude complementary-series parameters using the integrality of geometric weights and the local classification. In the remaining parallel-weight-two case use the degree-two cohomology of the quaternionic Shimura surface and weight-monodromy for surfaces; other geometric cases use the curve/unitary realisations. No residual irreducibility or finite discrete-series place is part of the theorem.

*Needs:* [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); [3.1 The quaternionic multiplicity space](#31-the-quaternionic-multiplicity-space); `DeligneWeightsAndPurity:§§4.3, 7.15`; [0.7 Quaternionic surfaces and weight-monodromy](#07-quaternionic-surfaces-and-weight-monodromy); `HilbertModularVarietiesAndShimuraCurves:R18.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `GL2AutomorphicRepresentationsAndTransfer:R16.2`; [0.6 The unitary and `GL₃` geometric realizations](#06-the-unitary-and-gl₃-geometric-realizations); `GL2AutomorphicRepresentationsAndTransfer:R17.5`; `ArithmeticGaloisRepresentations:§§2.1–2.6`.

See [Don Blasius](https://arxiv.org/pdf/math/0511007v1) — Theorem 1, p. 1 (arXiv v1); [Don Blasius](https://arxiv.org/pdf/math/0511007v1) — §2.2, p. 15; [Don Blasius](https://arxiv.org/pdf/math/0511007v1) — §4.2, p. 21; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — §2.4.1, Remark, p. 252; [Don Blasius](https://arxiv.org/pdf/math/0511007v1) — Proposition 2, p. 11, and Proposition 5, pp. 16–17.

### 4.3 Hecke versus Langlands normalization

For every local `π_v`, Carayol's parameter `σ(π_v)` is the contragredient of the Langlands parameter after the `|·|^{1/2}` twist; characterize it by all twisted `L`- and `ε`-factors. For a unitary-induced principal series `Ind(ξ₁,ξ₂)` it is `ξ₁⁻¹|·|⁻¹/² ⊕ ξ₂⁻¹|·|⁻¹/²`. Prove `det σ(π_v)=χ_{π_v}⁻¹|·|⁻¹` and `σ(ηπ_v)=η⁻¹σ(π_v)`, and compatibility with coefficient automorphisms. In Carayol's geometric range, Theorem A identifies the actual `λ`-adic Weil representations at every `v∤ℓ`; this includes the monodromy operator, not just good Frobenius traces. Translate by the global dictionary to the parameter of `ρ` and deduce conductor and local-factor identities.

*Needs:* [3.17 Carayol's geometric Hilbert theorem](#317-carayols-geometric-hilbert-theorem); `GL2AutomorphicRepresentationsAndTransfer:R16.3`; `ArithmeticGaloisRepresentations:§§2.1–2.6`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.5, printed p. 410; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.5(a), printed p. 410; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — Théorème (A), printed pp. 410–411; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.8 Corollaire, printed p. 411, the conductor deduction in the case `F=ℚ, k=2`.

### 4.4 All-Hilbert compatibility away from `λ`

For every `π` of type `(k,w)`, including even degree and principal series at every finite place, prove at every finite `v∤ℓ` that `WD(ρ_{π,λ}|G_{F_v})^{F-ss} ≅ Rec_v(π_v⊗|·|⁻¹/²)`. Retain the monodromy operator under Frobenius-semisimplification. Deduce equality of Artin conductors, the shifted automorphic `L`-factor and `N≠0` precisely for a Steinberg twist. Carayol supplies the geometric case via the dictionary; the general assertion uses the unrestricted construction and its transfer compatibility. Equality of traces or semisimplified inertia is weaker than this target.

*Needs:* [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); [3.17 Carayol's geometric Hilbert theorem](#317-carayols-geometric-hilbert-theorem); [4.3 Hecke versus Langlands normalization](#43-hecke-versus-langlands-normalization); `GL2AutomorphicRepresentationsAndTransfer:R16.3`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `ArithmeticGaloisRepresentations:§§2.1–2.6`.

See [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Introduction, p. 242; [Don Blasius](https://arxiv.org/pdf/math/0511007v1) — §3, p. 18; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — Theorem A, printed pp. 410–411; §§12.2–12.3, printed pp. 457–459.

### 4.5 Geometric coefficient-prime comparison

On the shared parallel-weight eigenpacket domain, transport HilbertModularVarietiesAndShimuraCurves R18.3.29's coefficient-prime conclusions under `(C)` through the parallel-weight adapter, including its normalizing Tate twist. In the classical `k≥2` branch, at every `λ|p` identify the potentially semistable cohomological realisation and its full WD parameter with the corresponding local automorphic parameter. For Hilbert forms in Saito's range retain `g>1, w_S≥k_τ`, parity and the even-degree discrete-series place. Transport his representation through the dictionary. At a good prime the representation is crystalline, with the Euler-root polynomial and labelled Hodge filtration. The finite-extension comparison and Weil-action trace calculation must identify the monodromy operator as well. Weight-two Barsotti–Tate consequences require the separate `p`-divisible-group comparison and do not extend to all weights.

*Needs:* [1.3 Scholl's projector](#13-scholls-projector); [1.4 Rational orbit projector and coefficient descent](#14-rational-orbit-projector-and-coefficient-descent); [3.17 Carayol's geometric Hilbert theorem](#317-carayols-geometric-hilbert-theorem); [4.1 Geometric weight-monodromy and strict compatibility](#41-geometric-weight-monodromy-and-strict-compatibility); `AutomorphicGaloisRepresentationsPartII:AG2.P, Finite-coefficient periods, descent and geometric comparison`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; `ModularCurvesPartII:§§16.2–16.3`; [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); `AutomorphicGaloisRepresentationsPartII:AG2.0, The l-adic character r_{l,ι}(χ)`.

See [Takeshi Saito](https://doi.org/10.1007/s002220050175) — Theorem 1, Invent. Math. 129 (1997), for the classical `k≥2` branch at every `p`; [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2) — Theorem 1, p. 12 of the arXiv version, for Hilbert forms with `g>1`; [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2) — Claim 1, p. 12 of the arXiv version; [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2) — Abstract, p. 1 of the arXiv version; [Takeshi Saito](https://www.ms.u-tokyo.ac.jp/~t-saito/pp/weightmonodromy.pdf) — Theorem 3, printed pp. 429–430 (page image); [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Introduction, p. 243.

### 4.6 Kisin's coefficient-prime theorem

For parallel-weight eigenpackets consume HilbertModularVarietiesAndShimuraCurves R18.3.29(c) through the parallel-weight adapter, with the supplied residual representation Tate-twisted by `j=(w−k+2)/2` and then dualized accordingly. Extend this result here to arbitrary regular cohomological multiweight. For such `π` over a totally real `F, λ|p` and absolutely irreducible semisimplified residual representation, every `v|p` is potentially semistable with the prescribed labelled degrees and full Frobenius-semisimple WD parameter `Rec_v(π_v⊗|·|⁻¹/²)`. No parallel-weight, unramified-base or finite discrete-series assumption is imposed. In the proof the fixed-type quotient and finite-projective period module are defined over complete Noetherian local coefficient algebras, and are tested on finite `ℚ_p`-algebras with nilpotents. Do not substitute equality at field-valued points for this quotient property. The residual assumption belongs to this proof route and is removed by the next theorem.

*Needs:* [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); [4.5 Geometric coefficient-prime comparison](#45-geometric-coefficient-prime-comparison); `LocalGaloisDeformationRings:§§3.1–3.3`; `LocalGaloisDeformationRings:§§3.4–3.7`; `IntegralHeckeAndGaloisDeterminants:IHG.1`.

See [Mark Kisin](https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf) — Theorem 4.3 and proof, pp. 543–544; [Mark Kisin](https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf) — Theorem 2.5.5, pp. 530–531; Theorem 2.7.6 and Corollary 2.7.7, p. 534; [Mark Kisin](https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf) — §4.1, p. 542.

### 4.7 Skinner's full coefficient-prime theorem

For the unrestricted Hilbert representation and every `v|p`, prove potential semistability, the labelled degrees and the full local parameter, without residual irreducibility or a discrete-series place. After the geometric/CM cases, reduce the remaining parallel-weight-two case by abelian base change. The symmetric-square geometric realization and crystalline lifting give the parameter up to quadratic twist; the quaternionic eigenvariety and analytic continuation of a crystalline period remove that ambiguity. At `v|p` the continuation input uses `φ^{f_v}` and a Sen polynomial `P(X)=XQ(X)` with `Q(0)` not a zero divisor. Require this condition on the family, not merely at selected classical points. Import generic periods, unitary geometry, eigenvariety gluing and their exact coefficient hypotheses. An equality of Hodge numbers alone does not discharge this target.

For the period-continuation application, construct the attached family near the
chosen eigenpoint of §0.3 only after §§3.10 and 3.14. Interpolate the traces
and determinants of the attached classical members as a continuous
pseudorepresentation on the reduced one-dimensional Hecke chart. Prove the
boundedness and continuity needed for interpolation; density alone supplies
neither. Normalize the component and use IntegralHeckeAndGaloisDeterminants
IHG.1's characteristic-zero reconstruction over its fraction field. Construct
a finite stable module, use absolute irreducibility from §3.14 to identify
its point fibers with the attached members, and shrink around the chosen
point to make it finite free, as in Skinner pp. 255–256. No residual absolute
irreducibility assumption is imposed on this characteristic-zero step.

For that free family verify §0.4's injective specialization map,
Sen-polynomial and crystalline-period hypotheses, including `φ^{f_v}, Y`-smallness,
truncation invertibilities and `Q(0)` a non-zero-divisor. Apply
the crystalline-period extension theorem only after these verifications. On the overlap,
compare with AutomorphicGaloisRepresentationsPartII AG2.P's
`hilbertCoefficientPrimeComparison`, which supplies de Rhamness, spherical
crystallinity and Iwahori semistability on an independently given member;
the full WD identification asserted here is additional.

*Needs:* §0.4; IntegralHeckeAndGaloisDeterminants IHG.1, characteristic-zero reconstruction; AutomorphicGaloisRepresentationsPartII AG2.P, “Independent classical and Hilbert members”; [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); [3.12 Hilbert Hodge–Tate property](#312-hilbert-hodgetate-property); [3.14 Determinant, total oddness and absolute irreducibility](#314-determinant-total-oddness-and-absolute-irreducibility); [4.4 All-Hilbert compatibility away from `λ`](#44-all-hilbert-compatibility-away-from-λ); [4.5 Geometric coefficient-prime comparison](#45-geometric-coefficient-prime-comparison); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:§§R07.P7.1–R07.P7.3, R07.3.0–R07.3.3, R07.4.13`; `AutomorphicGaloisRepresentationsPartII:AG2.P, Finite-coefficient periods, descent and geometric comparison`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `GL2AutomorphicRepresentationsAndTransfer:§R17.4.13`, adjoint lift with the character conversion of §0.6; [0.6 The unitary and `GL₃` geometric realizations](#06-the-unitary-and-gl₃-geometric-realizations); [0.3 Quaternionic finite-slope families](#03-quaternionic-finite-slope-families).

See [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Theorem 1 and Hodge–Tate definition, p. 242; proof strategy pp. 243–244; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — §2.4, p. 251; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — §2.4.2, p. 254.

**Checks.**

- A chosen classical eigenpoint gives its actual rank-two member as the
  specialization, not the higher-rank Banach space of automorphic forms.
- Reduced field points annihilate a nilpotent; without the stated injection
  they cannot verify the period-continuation hypothesis.
- A symmetric square can hide a ramified quadratic twist of a crystalline
  rank-two member. Equality of Hodge degrees or the spherical crystallinity
  conclusion alone does not identify its full local parameter.

### 4.8 Classical characteristic-zero irreducibility

For a classical cuspidal newform of `k≥2`, prove absolute irreducibility at every `λ`. Distinct Hodge–Tate degrees, the algebraic-Hecke-character description of a hypothetical rank-one constituent and the Ramanujan/purity argument exclude a decomposition. This concerns the characteristic-zero global representation; it neither forces a residual representation to be irreducible nor prevents an ordinary decomposition group from preserving a line.

*Needs:* [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation); [1.3 Scholl's projector](#13-scholls-projector); [1.4 Rational orbit projector and coefficient descent](#14-rational-orbit-projector-and-coefficient-descent); `AutomorphicGaloisRepresentationsPartII:AG2.P, Finite-coefficient periods, descent and geometric comparison`; [3.13 Geometric characters and algebraic Hecke characters](#313-geometric-characters-and-algebraic-hecke-characters); `WeightsInEtaleCohomology:R34.6, Eigenform purity and the Ramanujan bound`.

See [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Remark, p. 256; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Theorem 3.1(a)–(c), p. 86, the weight-two case (revision of 9 September 2007).

### 4.9 The KW coefficient-prime local forms

Retain `p` unramified in `F`, parallel weights and the residual absolute-irreducibility assumptions of the KW application. An unramified local automorphic component gives a crystalline representation, including higher weights. In the weight-two tame-type branch the norm-factor character hypotheses give a potentially Barsotti–Tate representation; retain those character hypotheses separately from residual weight. For an unramified twist of Steinberg in weight two obtain semistability with nonzero `N` and arithmetic diagonal `χ_pγ,γ`, Hodge weights 0,1, hence failure of crystallinity. Prove the ordinary inertia characters from the selected unit-root local refinement, and use the weight-two equivalence of R07.4. These conclusions do not identify all higher-weight representations as Barsotti–Tate.

*Needs:* [4.6 Kisin's coefficient-prime theorem](#46-kisins-coefficient-prime-theorem); `AutomorphicGaloisRepresentationsPartII:AG2.P, Finite-coefficient periods, descent and geometric comparison`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem).

See [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — Lemma 7.7, p. 67 (authors' final version); [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — Corollary 7.8(i), p. 67; [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — Corollary 7.8, Steinberg case, p. 68.

The inertia formulas are proved here from the coefficient-prime comparison and the chosen ordinary refinement; they are not supplied by a later ordinary modularity-lifting theorem.


### 4.10 Finite-weight nearly ordinary data

For `F` totally real of even degree and `p` odd, fix the compact open `U` of
Skinner–Wiles, with `U_v=GL₂(O_{F_v})` for `v|p` before imposing the `p`-power level.
Use the existing cuspidal automorphic space at `k_τ≥2` of one parity and the
specified central character. Put `µ=max_τ(k_τ)−2` and
`v_τ=(µ+2−k_τ)/2`, so `v_τ≥0, min v_τ=0` and `k−2t+2v=µt`.
Define a nearly ordinary eigenpacket by a nonzero simultaneous eigenvector at
`U_a=U∩U(p^a)`, its eigencharacter `λ`, its chosen local refinements, and unit
eigenvalues of the normalized `T₀(v)`. Record the embeddings and all operator
normalizations. At parallel `κ, v=0` and `µ=κ−2`.

Here write `π_SW` for the source's representation, rather than silently using
its infinity type for the forward Hecke convention. The weight action in
§3.1, p. 28, gives positive-real central character `z↦z^µ`: inserting `zI` into
`j(u,z)^{−k}det(u)^{v+k−t}` gives this exponent. Thus `π_SW` has type `(k,−µ)`
and `Π=π_SW^∨` has type `(k,µ)` in this roadmap. Its cohomological representation
is `ρ_Π=σ(π_SW)`; the source's arithmetic representation is `ρ_Π^∨`.

Use the inverse double-coset action (3.1′), p. 30, and the modified `G(U_a)`
action, including `∏_{v|p}ω(a_v)^{−µ}`. The coordinates of `G(U_a)` on `p`-units
are `(a⁻¹d,a)`, §3.2, p. 32. Consequently `T_y=(y,1)` is represented by
`diag(1,y)` supported at the selected `p`-place. Its Teichmüller multiplier
is 1 because `a=1`; multiplying `T_y` by `ω(y)^{−µ}` would introduce a spurious
finite character. The central operators still require the modified action.

At a place `𝔭|p` put `K=F_𝔭` and `Σ_𝔭={τ:F↪E_λ inducing 𝔭}`; enlarge `E_λ` to
contain all embeddings. Define the algebraic character
`A_𝔭(x)=∏_{τ∈Σ_𝔭}τ(x)^{−v_τ}` on `K×`.
Choose `ϖ∈F×` which is a uniformizer at `𝔭` and a unit at the other `p`-places.
The source uses the *global* factor
`A_all(ϖ)=∏_ττ(ϖ)^{−v_τ}` in `T₀^SW(𝔭)`.
Put `c_out(ϖ)=∏_{τ∉Σ_𝔭}τ(ϖ)^{−v_τ}`; this is an `E_λ`-unit, and set
`T₀^loc(ϖ)=c_out(ϖ)⁻¹T₀^SW(𝔭)` and `α_𝔭=λ(T₀^loc(ϖ))`.
Both operators have unit eigenvalues simultaneously. Their eigenvalues need
not be equal. Equivalently `T₀^loc` uses `A_𝔭(ϖ)` in place of `A_all(ϖ)`, and can
be defined for any local uniformizer without a global representative.

Prove the following operator-to-character comparison on the chosen good line.
In the principal-series case
`π_SW,𝔭=Ind(η|·|⁻¹/²,ξ|·|⁻¹/²)`, or the special case with inducing
characters `ξ|·|⁻¹/²,ξ|·|¹/²`, put `ν=ιξ⁻¹`, the selected smooth WD character
of `Π_𝔭⊗|·|⁻¹/²`. Then

`λ(T_y)=ν(y)` for **every** `y∈O_K×`, and `α_𝔭=ν(ϖ)A_𝔭(ϖ)`.

Derive the first identity from inverse translation on the refined local
principal/special model, with the coordinate computation above; derive the
second from the scaled inverse-coset operator. This is a concrete application
of R16.2's local models, not a hypothesis that a Galois filtration already
exists. The restriction `ν|O_K×` has finite image, whereas `A_𝔭` generally does
not. Define the candidate character by

`δ_𝔭(yϖⁿ)=λ(T_y)A_𝔭(y)α_𝔭ⁿ=ν(yϖⁿ)A_𝔭(yϖⁿ)` for `n∈ℤ`.

It has values in `O_{E_λ}×` and is continuous. Local reciprocity extends it
uniquely to a continuous Galois character `η_𝔭` with
`η_𝔭∘rec_geom=δ_𝔭`. This extension uses the profinite completion and
compactness, not an assumed continuous extension of an arbitrary smooth
character with a nonunit uniformizer value. For `ϖ′=uϖ, u∈O_K×`, prove

`T₀^loc(ϖ′)=A_𝔭(u)T_uT₀^loc(ϖ)`,
`α_𝔭′=λ(T_u)A_𝔭(u)α_𝔭=δ_𝔭(u)α_𝔭`.

These laws make `δ_𝔭` independent of the uniformizer. For two admissible global
representatives also change `c_out`; the corresponding raw source eigenvalues
transform by `ν(u)A_all(u)`, before dividing out the new `c_out`. Omitting this
unit factor would give an incorrect local character.

The finite-weight interface includes this full locally algebraic character.
Define its ordinary predicate by `δ_𝔭|O_K×=1` at every `p`-place. The source's
condition `ξ` unramified agrees with that predicate when all local `v_τ=0`;
outside that range it describes the smooth factor only. A finite character
twist can remove finite unit ramification, but cannot remove nonzero labelled
algebraic exponents. In the parallel-weight range, the finite-character
extension of R17.5 supplies the global twist with the prescribed local
components; its weight, central character and every normalized Hecke value
must be transported. The Galois identification is the comparison target of
§4.11, not part of this data definition.

The coefficient expression for the all-unit value is
`νu * ∏_τ xu(τ)^{−v(τ)}`. Its local interpretation requires nonzero embedding
values and the finite smooth character above; the Galois character is supplied
by the reciprocity construction.

*Needs:* GL2AutomorphicRepresentationsAndTransfer R16.2, cohomological form
spaces and refined principal/special local models with inverse translation;
R17.5, the global finite-character extension with prescribed local components;
the Hecke action and coefficient representations of
HilbertModularVarietiesAndShimuraCurves R18.4; ClassFieldTheory local
reciprocity and profinite completion; [3.11 The representation dictionary as a
theorem](#311-the-representation-dictionary-as-a-theorem).

See [Skinner–Wiles](https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf),
§3.1 pp. 27–28 for the weight/action, (3.1′) and §3.2 p. 30 for inverse
translation and `T₀`, p. 31 for the selected `ξ` and good-line classification,
and p. 32 for the unit coordinates. These source formulas supply the
operator comparison above; they do not assert the general-weight Galois
identification proved in the next target.

- Bundle the eigenvector, refinements, eigencharacter, global/local normalized operators and unit eigenvalues.
- `δ_𝔭` on arithmetic reciprocity is the quotient of `ρ_Π^∨` by §4.11; its all-unit values are `λ(T_y)A_𝔭(y)`, its uniformizer value is `α_𝔭`, and its geometric avatar `η_𝔭` is the subcharacter of `ρ_Π`.
- Transport the weight, central character, all unit values and normalized roots by the specified global character, with the algebraic correction for a norm twist in §4.11.
- Require `δ_𝔭|O_K×=1` at every `p`-place.
- Transport the operator and root by `δ_𝔭(u)`, leaving the character unchanged.

**Checks.**

- At parallel `κ, v=0` gives the unscaled unit-root operator. `T_y` has Teichmüller factor 1 even at `κ>2`; only at `κ=2` is the exponent on every modified operator zero.
- A finite ramified character twist of an ordinary eigenpacket remains nearly ordinary, but need not satisfy the unramified ordinary predicate.
- A supersingular good-prime polynomial with both roots of positive valuation gives no unit-root eigenpacket.
- For nonparallel `k=(2,4), µ=2` and `v=(1,0)`, the quotient on a principal unit with `τ₁(u)=1+p` is `(1+p)⁻¹` when `ν(u)=1`. No finite twist can trivialize this on an open unit subgroup.
- For the all-unit coefficient expression, zero `v` and `νu=−1` give `−1`; for embedding values `(4,4)` and `v=(1,0), νu=1` gives 1/4; on the torsion unit `−1` with embedding values `(−1,−1)` and `νu=−1`, the same exponents give 1. These detect losing either the algebraic or finite factor. At `p=3, 4` is a principal unit.
- In `F=ℚ(√13), p=3` splits and `ϖ=4+√13` has norm 3. Choose `𝔭` where `√13≡−1`, so `ϖ` is a uniformizer there and a unit at the other 3-place. Put `k=4` at `𝔭` and `k=2` at the other place, giving `v=(0,1)`. If `θ` is the other embedding of `ϖ`, then `c_out=θ⁻¹`; a raw root `β=θ⁻¹` gives local `α=1`. Equating `β` with `α` fails this outside-place correction.
- At `p=3`, if `ν(4)=ζ₃, A_𝔭(4)=1/4` and `α=2`, changing `ϖ` to `4ϖ` gives `α′=ζ₃/2`. For `x=yϖⁿ` the new unit is `yu^{−n}`, so the new formula gives the same `δ_𝔭(x)`, also for `n<0`.

### 4.11 The nearly ordinary Hilbert construction

Let `p` be odd, `F` totally real of even degree, `U⊆GL₂(O_F⊗Ẑ)` open compact, `n` the product of its nonmaximal primes, and `π_SW` nearly ordinary of parallel `κ≥2` with Hecke eigencharacter `λ`. Attach Skinner–Wiles's continuous irreducible arithmetic representation. It is odd, unramified away from `np`, with trace `λ(T(v))` and determinant `Nv·λ(S(v))` at good arithmetic Frobenius, and determinant `χ_{π_SW,λ}ε_p`. For central `x∈ℤ(U)`, this is `λ^alg(S_x)ε_p(x)`, with the algebraic central specialization defined below. At each `v|p` its upper-triangular quotient character `ψ₂` has `ψ₂(y)=λ(T_y)` on local units and `ψ₂(ϖ_v)=λ(T₀(v))`. The quotient character is the character of the finite-weight eigenpacket of §4.10; its subcharacter is `det(V)` times its inverse. These formulas are proved as part of this target. A finite character twist makes the relevant form ordinary, giving the nearly ordinary construction from the ordinary one. Under their arithmetic reciprocity and inverse Hecke action the representation is `σ_λ(π_SW)^∨=ρ_{π_SW,λ}⊗ε_ℓ`; retain that twist in every later comparison.

*Needs:* [4.10 Finite-weight nearly ordinary data](#410-finite-weight-nearly-ordinary-data); [3.17 Carayol's geometric Hilbert theorem](#317-carayols-geometric-hilbert-theorem); [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); IntegralIwasawaTheory §9.5, `finiteWeightHilbert_galoisOldform`, for the shared ordinary comparison; [3.12 Hilbert Hodge–Tate property](#312-hilbert-hodgetate-property); [4.7 Skinner's full coefficient-prime theorem](#47-skinners-full-coefficient-prime-theorem); FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P7.1–R07.P7.3, R07.3.0–R07.3.3 and R07.4.13, with §0.1’s rank-one formula.

See [C. M. Skinner and A. J. Wiles](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) — §3.3, (3.2), p. 38 (Numdam PDF page 35; printed page = PDF page + 3); [C. M. Skinner and A. J. Wiles](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) — §3.3, p. 39; [C. M. Skinner and A. J. Wiles](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) — §2.1, p. 9, and (3.1′), p. 30.

For the central comparison, retain the difference between the finite-level
modified operator and its Galois character. On a `p`-unit idele `x` let
`θ_SW(x)=∏_{v|p}ω(x_v)^{−µ}`, the source's multiplier for its central operator.
Inverse translation gives
`λ(S_x)=θ_SW(x)χ_{π_SW,p}^{sm}(x)⁻¹`, where `χ^{sm}` is the smooth local
central character transported to `E_λ`. The algebraic specialization is

`λ^alg(S_x)=λ(S_x)θ_SW(x)⁻¹∏_ττ(x)^{−µ}`
`           =χ_{π_SW,λ}(rec_arith(x))`.

Thus `det S_SW(rec_arith(x))=λ^alg(S_x)ε_p(rec_arith(x))`.
At `κ=2, µ=0` and `λ^alg=λ`. At `κ>2` the raw finite-level `λ(S_x)` alone cannot
have the determinant's nonzero labelled algebraic degrees. Skinner–Wiles
(3.2), p. 38, writes the determinant as `λ(S_x)ε_p`; the comparison with its
weight-specialized central character must retain the algebraic correction
above when using the finite-level operators of §3.2. This correction also
follows independently from §3.11's exact determinant, so it does not assume
the local triangular statement to prove that determinant.

**General regular-weight comparison.** For any totally real `F`, any prime `p`,
and any cuspidal `Π` of type `(k,µ), k_τ≥2` of one parity, choose a place `𝔭|p`
and a principal/special refinement. Its selected smooth character `ν` is the
line in the full WD parameter of `Π_𝔭⊗|·|⁻¹/²`, with `N=0` on that line;
for a special parameter use `ker N`. Require the locally normalized
`α_𝔭=ν(ϖ)A_𝔭(ϖ)` to be an `E_λ`-unit. Use the local `A_𝔭` and `δ_𝔭` of §4.10.
In the Skinner–Wiles range `Π=π_SW^∨`, its operator comparison supplies exactly
these data. For other `F` or `p`, R16.2's same refined local models supply the
inverse unit/coset operators; the local comparison does not require the
even-degree or odd-`p` hypotheses of their global finite-weight Hecke algebra.
Put `V=ρ_{Π,λ}|G_K, D=det V=χ_{Π,λ}ε_p⁻¹`, and `η=η_𝔭` the continuous
character with geometric reciprocity `δ_𝔭=νA_𝔭`. Prove a `G_K`-stable exact sequence

`0 → E_λ(η) → V → E_λ(Dη⁻¹) → 0`.

Duality gives `0 → E_λ(D⁻¹η) → V^∨ → E_λ(η⁻¹) → 0`.
Since `rec_arith=rec_geom⁻¹`, this arithmetic-dual quotient has value
`δ_𝔭(y)=λ(T_y)∏_{τ∈Σ_𝔭}τ(y)^{−v_τ}` on every local unit and value `α_𝔭`
on `rec_arith(ϖ)`. Its labelled degrees in our grading are `−v_τ`; those of
its subcharacter are `−(µ+1−v_τ)`. In `V` the degrees are `v_τ` and `µ+1−v_τ`.
The representation's determinant recovers the second character, including all
finite and central-character factors. Do not infer a split representation.

The proof has the following exact inputs and intermediate targets.

1. Import the rank-one locally algebraic comparison: `η` is potentially
   crystalline, has labelled degrees `v_τ`, and its full WD character in
   geometric convention is `ν`. On arithmetic units `η` has value
   `ν(y)⁻¹A_𝔭(y)⁻¹`. After a finite extension killing finite inertia,
   [Conrad](https://math.stanford.edu/~conrad/papers/locchar.pdf),
   Appendix B, Definition B.1 p. 32, Proposition B.3 pp. 33–34 and
   Proposition B.4 pp. 35–36, identify the degrees and Frobenius.
   In the crystalline case his formula gives
   `φ^{f_K}=δ_𝔭(ϖ)A_𝔭(ϖ)⁻¹=ν(ϖ)`; use norm functoriality and descent
   for finite inertia. This removes the algebraic factor from the WD
   parameter while retaining it in the Galois character.
2. Import [3.12 Hilbert Hodge–Tate property](#312-hilbert-hodgetate-property)
   and [4.7 Skinner's full coefficient-prime theorem](#47-skinners-full-coefficient-prime-theorem).
   They give potential semistability, degrees `(v_τ,µ+1−v_τ)`, and the full
   Frobenius-semisimple WD parameter of `Π_K⊗|·|⁻¹/²`, including `N`.
   Its selected line is `ν`, with `N=0` on that line; in the special case
   it is `ker N`. This is a period line, not yet a Galois subrepresentation.
3. Twist `W=V⊗η⁻¹`. Its degrees are `(0,k_τ−1)`. Over a finite Galois `L/K`
   making `V` and `η` semistable, its selected period line has `φ^{f_L}=1`,
   `N=0` and Newton degree zero. The other Newton slope is positive,
   since weak admissibility of the whole module identifies its total
   Newton degree with the positive sum of the labelled `k_τ−1`.
   Thus the slope-zero line is unique, lifts from the Frobenius-semisimple
   parameter to the actual period module, and is preserved by descent.
   The monodromy relation also kills `N` on the minimal-slope line.
4. The ambient filtration has only nonnegative degrees, so the induced
   filtration on that line has nonnegative labelled degrees. Weak
   admissibility gives `t_H(line)≤t_N(line)=0`; hence every one of those
   degrees is zero. The line with its induced filtration is admissible.
   Use the semistable period functor's exactness and full faithfulness
   to obtain an invariant line in `W|G_L`. Its period module agrees with
   that of the trivial character. Uniqueness and descent make the line
   `G_K`-stable, and the full descended WD parameter identifies its
   character with 1, rather than an unspecified finite descent twist.
   Twisting back gives `η⊂V`.

The generic rank-one admissibility and fully faithful period-functor results
are supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.0–R07.3.3 and R07.4.13, with the coefficient action and finite
Galois descent retained. See
[Colmez–Fontaine](https://webusers.imj-prg.fr/~pierre.colmez/CF.pdf),
§3.4 pp. 21–22 for the subobject inequality, Proposition 4.2 and the
following equivalence p. 23 for the period functor, and Proposition 4.4 p. 24
for rank-one admissibility. For a finite coefficient field use Theorem A
p. 2 and the period equivalence on the underlying `ℚ_p`-module, retaining
its commuting `E_λ`-action. The selected module has slope and filtration zero
on every coefficient factor, so its underlying module is weakly admissible
as well; it is not necessary to identify an `E_λ`-line with a `ℚ_p`-line. The new target here is
their application to the selected modular parameter, not another construction
of the generic period equivalence. This proof uses the full theorem of §4.7;
a residual irreducibility assumption or a Hida-family control theorem is not
an extra hypothesis. Regularity `k_τ≥2` and the normalized unit-root condition
are essential.

To transport back to the fixed `ρ` for the source form, put `χ=χ_{π_SW,λ}`.
By §3.11, `D=χ⁻¹ε_p⁻¹` and the four ordered graded pairs are:

| Representation | Subcharacter | Quotient character |
| --- | --- | --- |
| `σ(π_SW)=ρ_Π` | `η` | `χ⁻¹ε_p⁻¹η⁻¹` |
| `S_SW=σ(π_SW)^∨=ρ_{π_SW}ε_p` | `χε_pη` | `η⁻¹` |
| `ρ_{π_SW}` | `χη` | `ε_p⁻¹η⁻¹` |
| `ρ_{π_SW}^∨` | `ε_pη` | `χ⁻¹η⁻¹` |

For any row evaluate its actual Galois characters on the stated reciprocity
map. In particular, the quotient of `S_SW` on `rec_arith` has values `δ_𝔭`;
the quotient of `ρ_{π_SW}^∨` has the further factor `χ⁻¹∘rec_arith`.
The latter two arithmetic representations cannot be identified without
that central correction. On coefficient-prime units
`ε_p(rec_geom(u))=N_{K/ℚ_p}(u)` and on a uniformizer
`ε_p(rec_geom(ϖ))=N_{K/ℚ_p}(ϖ)/q_K`.
These follow from ClassFieldTheory's arithmetic Artin normalization by
inversion and norm functoriality, as recorded in TauCetiRoadmap.LocalGaloisGroups
Layer 5. At `K=ℚ_p` and `ϖ=p` the value is 1, not `p⁻¹`. Use these formulas to
transport every cyclotomic factor in the table.

For a forward form `Π` of arbitrary type `(k,w)`, let `j=(w−µ)/2` and
`Π₀=Π⊗|det|^j`, of type `(k,µ)`. Obtain its canonical character `η₀` as above;
then `ρ_Π=ρ_{Π₀}ε_p^{−j}` and `η=η₀ε_p^{−j}`.
Writing `a_τ=v_τ+j=(w−k_τ+2)/2`, its geometric values are

`η(rec_geom(u))=ν₀(u)∏_ττ(u)^{−a_τ}`,
`η(rec_geom(ϖ))=α₀(N_{K/ℚ_p}(ϖ)/q_K)^{−j}`.

The smooth parameter is `ν=ν₀|·|^{−j}`, so the uniformizer value also equals
`ν(ϖ)∏_ττ(ϖ)^{−a_τ}`. These identities allow negative `j`, have the same
change-of-uniformizer law, and preserve unit-valued Galois characters.
The quotient of `ρ_Π^∨` is `η⁻¹`, with these same values under `rec_arith`;
its subcharacter is `(det ρ_Π)⁻¹η`. The quotient is unramified exactly when
all local `a_τ=0` and the finite unit factor is trivial. Distinct labelled
algebraic characters cannot be cancelled by a finite factor on an open
unit subgroup.

For common parallel ordinary eigenpackets, identify this exact sequence with
IntegralIwasawaTheory §9.5's `finiteWeightHilbert_galoisOldform` under
`r_f≅ρ_{π_f,λ}^∨` and the integral twists of §3.10. At type `(k,k−2)` its
arithmetic quotient `β_v` is unramified with value `α_v`, its subcharacter is
`ψ ε_p^{k−1}β_v⁻¹`, and the corresponding cohomological subcharacter is
`η=β_v⁻¹`. Regularity distinguishes the two graded characters, so the
comparison identifies the invariant line, not just its semisimplification.
This shared filtration applies at `p=2` and in every totally real degree.
The general regular-weight comparison above supplies the full labelled
nearly ordinary characters outside this common domain.

- Construct the invariant line and both graded characters of `ρ_Π` and its arithmetic dual under the stated regular-weight and unit-root hypotheses.
- Transport all four pairs by the determinant, central character and cyclotomic twist in the table.
- Compare the modified finite-level `λ(S_x)` with `λ^alg(S_x)`, hence with `χ_{π_SW,λ}` on arithmetic reciprocity, for all central `p`-units.
- Shift each labelled degree by `j` and transport unit/uniformizer values by `ε_p^{−j}`.

**Checks.**

- For canonical parallel `κ, v=0` and `c_out=1`. The quotient of `S_SW` on arithmetic reciprocity has values `λ(T_y)` and `λ(T₀^SW)`; this is exactly the parallel theorem above. If `ν` is unramified it is an unramified quotient.
- At nonparallel `(2,4), µ=2` and `v=(1,0)`, the two cohomological degree pairs are `(1,2)` and `(0,3)`. After twisting by `η⁻¹` they are `(0,1)` and `(0,3)`; a selected line with a positive labelled degree violates `t_H≤0`. On a principal unit with first embedding 4 at `p=3` and finite factor 1, the arithmetic quotient value is 1/4, not 1.
- At `v=(1,0)`, the torsion unit `u=−1` has `A_𝔭(u)=−1`. If `ν(u)=−1`, its quotient value is 1; a formula dropping either factor gives `−1`. Checking only a sufficiently small principal-unit subgroup misses this finite factor. Changing `ϖ` to `uϖ` leaves `α` unchanged, as `δ_𝔭(u)=1`.
- For a unit of norm 1 with `χ(rec_arith(u))=ζ₃≠1`, the quotient of `ρ_{π_SW}^∨` is `ζ₃⁻¹δ_𝔭(u)`, whereas that of `S_SW` is `δ_𝔭(u)`. A central character of order three detects the missing central correction.
- The central specialization has `λ^alg(S_x)=λ(S_x)` at `µ=0`. For `µ=2`, a local principal unit `u=1+p`, trivial smooth central character and `θ_SW(u)=1`, its values are `λ(S_u)=1` but `λ^alg(S_u)=u⁻²`, and `det S_SW` on `rec_arith(u)` is `u⁻³`. The raw central value would give `u⁻¹` and the wrong determinant degree. If instead the smooth central value at `u` is `ζ₃`, retain the additional `ζ₃⁻¹` in `λ^alg` and in the determinant; the algebraic correction cannot erase it.
- For canonical classical weight two at `ℚ_p`, twist the forward form by `|det|⁻¹`. Then `j=1, η=η₀ε_p⁻¹`, the cohomological degrees become `(1,2)`, unit values acquire `u⁻¹` and the value at `ϖ=p` stays `α₀`. Using `p⁻¹` for `ε_p` at this place gives the wrong uniformizer value.
- In a special parameter with `F=diag(1,q_K)` after twisting, `N=E₁₂` is nonzero and the selected line is `ker N`. The comparison gives a Galois line, not a split representation. A good supersingular parameter with both normalized roots of positive valuation fails the unit-root hypothesis and supplies no such line.

### 4.12 Nearly ordinary compatibility away from `p`

For that same Skinner–Wiles representation and every finite `v∤p`, prove the source's local formula with arithmetic reciprocity and its inverse inducing characters. In geometric reciprocity it becomes `Rec_v(π_v⊗|·|^{1/2})=σ_h(π_v)^∨`. This identifies the full local representation, not just its determinant, and keeps the same twist used by the global nearly ordinary construction.

*Needs:* [4.11 The nearly ordinary Hilbert construction](#411-the-nearly-ordinary-hilbert-construction); [4.3 Hecke versus Langlands normalization](#43-hecke-versus-langlands-normalization); `GL2AutomorphicRepresentationsAndTransfer:R16.3`; [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem).

See [C. M. Skinner and A. J. Wiles](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) — §3.3, (3.3), p. 39; [C. M. Skinner and A. J. Wiles](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) — §2.1, p. 9.

### 4.13 Shimura-curve Hyodo–Kato/de Rham multiplicity

In the CDN setup take a local field `F/ℚ_p`, a totally real `E` with `E_𝔭=F`, the quaternion algebra `B̌` ramified at `𝔭` and split at one real place, and its inner form `B` split at `𝔭` and compact at infinity, with the other prescribed invariants. For a two-dimensional supercuspidal `(φ,N,G_F)`-module `M` in `ΦN^ϖ`, require `ϖ` trivial on `JL(M)`, choose `n` with `JL(M)` trivial on `1+ϖ_D^nO_D`, and choose `Π̌∈SD_{2,n}` with local factor `JL(M)`. The real distinguished factor is holomorphic weight two with trivial central character there, and the other real factors are trivial; a globally trivial central character is not assumed. Extract `Hom_{Ǧ(A_f^p)}(Π_f^p,L⊗H¹_HK(Sh_n)) ≅ JL(M)⊗M`. For `K` containing `E` and `F` through the fixed embeddings the de Rham multiplicity is `JL(M)⊗(K⊗_F M_dR)`. Keep the coefficient completions, comparison map and group actions, and allow the source's globalization twist and extension of `L`. The étale multiplicity is `ρ_Π(−1)`, hence the CDN `ρ_Π` is the arithmetic dual in our dictionary. This identifies a multiplicity space rather than the whole cohomology.

*Needs:* [4.7 Skinner's full coefficient-prime theorem](#47-skinners-full-coefficient-prime-theorem); [4.4 All-Hilbert compatibility away from `λ`](#44-all-hilbert-compatibility-away-from-λ); `HilbertModularVarietiesAndShimuraCurves:R18.4`; `AutomorphicGaloisRepresentationsPartII:AG2.P, Finite-coefficient periods, descent and geometric comparison`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `GL2AutomorphicRepresentationsAndTransfer:§R16.4.4`; [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem).

See [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf) — §5.2.1 Proposition 5.2 and proof, pp. 43–45.

### Examples

A geometric rank-two special WD model at `q=3` has `F=diag(1,3)` and
`N=[[0,1],[0,0]]`. It satisfies `FNF⁻¹=3⁻¹N`. The model with the same `F` and `N=0`
has the same characteristic polynomial but a different local parameter and
conductor. Frobenius semisimplification retains the nonzero `N`.

In Saito's geometric range the fixed `ρ`-convention has total weight `w+1`, with
kernel weight `w` and cokernel weight `w+2` when `N≠0`. The all-Hilbert theorem
comes later from Ramanujan and full local compatibility; it does not inherit
the geometric range's even-degree discrete-series hypothesis.

### Dependencies

Layers 1 and 3; WeightsInEtaleCohomology R34.3–R34.6 with the independent geometric scope; the Hilbert/transfer suppliers of Layer 3; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P7.1–R07.P7.3 and R07.3.0–R07.3.3; AutomorphicGaloisRepresentationsPartII AG2.P; LocalGaloisDeformationRings §§3.1–3.7; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4; §§0.3–0.4 and their analytic suppliers.

## Layer 5: Ordinary lattices and crystalline factors

### 5.1 Ordinary refinement and the fixed lattice

For a classical `k≥2` newform, `p∤N` and `a_p` a `λ`-adic unit, choose the unit Euler root `α`. In the arithmetic representation prove `0→V⁺→V→V⁻→0`, with unramified quotient having arithmetic Frobenius `α` and subcharacter `ψχ_p^{k−1}(V⁻)⁻¹`. For the fixed stable lattice `T` define `T⁺=T∩V⁺` and `T⁻=T/T⁺`. Prove saturation, torsion-freeness and rank one of `T⁻` and compatibility with flat coefficient extension and the existing rational period line. On the cohomological realisation the ordinary line is instead the unramified subrepresentation at geometric Frobenius; use the annihilator under duality. For every regular Hilbert weight with the normalized unit-root refinement of §4.11 (given by §4.10 in the Skinner–Wiles range), use the rational filtration and exact graded characters proved in §4.11, then recover the other character from the determinant. The nearly ordinary quotient can be ramified; the unramified ordinary interface is its stated specialization.

*Needs:* [1.4 Rational orbit projector and coefficient descent](#14-rational-orbit-projector-and-coefficient-descent); [1.6 Integral newform structures](#16-integral-newform-structures); IntegralIwasawaTheory §9.5, `finiteWeightHilbert_galoisOldform`, for the shared rational ordinary filtration; [4.11 The nearly ordinary Hilbert construction](#411-the-nearly-ordinary-hilbert-construction), including the general regular-weight comparison; `ArithmeticGaloisRepresentations:§§1.1–1.10`.

See [C. M. Skinner and A. J. Wiles](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) — §3.3 equation (3.2), pp. 38–39; [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §1.2, pp. 8–10; §4.5, pp. 50–51; §§5.3–5.4, pp. 56–59.

The rational classical Hilbert filtration on common eigenpackets is supplied by
IntegralIwasawaTheory §9.5, `finiteWeightHilbert_galoisOldform`, and identified
with our realization by §§3.10–3.11 and 4.11, at every prime and in arbitrary
totally real degree. At good ordinary `p` the crystalline unit-root quotient
is unramified, and its arithmetic Frobenius value is `α`. This section
constructs its intersection with the fixed lattice and proves the stated
saturation and coefficient comparisons. For Hilbert weights, §4.11 identifies the arithmetic-dual quotient on all units
as `λ(T_y)A_𝔭(y)`, and its uniformizer value as the local normalized `α_𝔭`;
the determinant gives the other character. Use its central/Tate table when
the chosen realization is `ρ_{π_SW}` instead of `ρ_Π`. A quotient is unramified only under the
ordinary specialization, not for every nearly ordinary form. Fix the rational
line before intersecting with `T`. Algebraically the intersection is
`T ⊓ V⁺.restrictScalars O`, and its inverse image in the module `T` is the
submodule used to form the quotient. For a
DVR use a uniformizer `ϖ_λ`, so the nonsaturated competing submodule is
`ϖ_λOe₁`; `p` need not be a uniformizer in a ramified coefficient field.

The general regular-weight line is an output of §4.11's local period
comparison, before any lattice is chosen. For a stable full lattice in its
arithmetic-dual representation, intersection with the proved subline is
saturated, and the quotient is a rank-one lattice in `η⁻¹`. Its all-unit and
uniformizer characters remain those of §4.11; saturation does not change or
prove those formulas. The principal-unit expression agrees with
[Balasubramanyam–Ghate–Vatsal](https://mathweb.tifr.res.in/~eghate/hilbertCM.pdf),
§3, internal pp. 7–8, after translating their weights and reciprocity. The
all-unit/uniformizer comparison is obtained by the intervening argument of
§4.11, rather than an extension of the parallel Skinner–Wiles theorem.

- For the chosen regular Hilbert refinement, identify the rational line and both graded lattices with §4.11's characters; its ordinary specialization requires the quotient to be unramified.
- The unit root `α` and the specified ordinary filtration proved above of the fixed representation.
- The unramified quotient character with arithmetic `Frob` eigenvalue `α`.
- The subcharacter is `εχ_p^{k−1}` times the inverse quotient character.
- Intersection with the specified ordinary line gives an invariant `O_λ`-submodule. For a domain `O` with fraction field `K`, `T/T⁺` is torsion-free for every `K`-subspace `V⁺`, where `T⁺=T∩V⁺`.
- Flat coefficient extension transports the line and lattice intersection with the appropriate saturation comparison.
- Use the already specified rational period line under the realisation comparison.
- The inverse image of `V⁺` under `T↪V` is an `O`-submodule of `T`, with quotient `T/T⁺`.
- A finite full DVR lattice in a two-dimensional fraction-field space has free rank-one quotient by its intersection with a specified line.

**Checks.**

- `X²+X+3` has one 3-adic unit root; choose that root for the unramified quotient.
- `X²+2X+2` at 2 has no unit root; ordinary refinement is not defined.
- For a DVR `O` with fraction field `K`, the standard lattice `T=O²⊆K²` and `V⁺=Ke₁` have intersection `Oe₁`. The actual quotient `T/T⁺≃ₗ[O]O` is induced by the second coordinate; `ϖ_λOe₁` instead has torsion quotient and fails the contract.
- The two characters multiply to `εχ_p^{k−1}`, including the unramified unit-root factor.
- For `V⁺=0` the intersection in `V` and its inverse image in `T` are both zero; the quotient is `T`. In particular, `T=O²⊆K²` gives a torsion-free quotient of rank two.
- For `V⁺=V` the intersection is `T` and its inverse image is the whole module `T`; the quotient is zero.
- For a finite full `T⊆K²` and `V⁺=Ke₁` the two intersection presentations agree under `T↪V`, and the actual quotient has rank one over `O`.
- At `k=(2,4)`, the normalization has `v=(1,0)`; on principal units the algebraic factor is `σ₁(u)⁻¹`. For `σ₁(u)=1+p` and trivial `ε₁,p`, its value is `(1+p)⁻¹`, not 1. A formula using only the finite unit character fails this nonparallel control.

### 5.2 Good-prime crystalline and Wach factors

For every classical `k≥2` at `p∤N`, identify `D_cris` of `M_f` with the projector factor, with degrees `0,k−1` and `φ`-polynomial `X²−a_pX+ψ(p)p^{k−1}`. No ordinarity or Fontaine–Laffaille range is required for characteristic-zero crystallinity: for `p<k` the crystalline comparison and its Frobenius polynomial come from the classical branch of §4.5, not from a comparison restricted to `p≥k`. For a fixed lattice use §0.5's Wach interface after declaring the precise dual/Tate twist needed by its weight convention. Use PhiGammaModulesAndIwasawaCohomology §§6.0–6.1 for all primes and finite coefficient fields. On the odd-prime, `ℤ_p`-coefficient overlap, §0.5 identifies its embedded lattice with R07.4.26(ii)'s `N(T)` and transports the Kisin–Ren comparison. The quotient `N(T)/π` is an integral lattice; only after inverting `p` does it equal `D_cris(T[1/p])`. Transport `φ` and filtration. A chosen semilinear Frobenius matrix changes by `U⁻¹Pφ(U)`, not ordinary conjugation. Match the Euler roots used by regulator applications after a splitting coefficient extension, and require distinct roots before separating eigenlines or dividing by their difference.

*Needs:* [4.5 Geometric coefficient-prime comparison](#45-geometric-coefficient-prime-comparison); [1.6 Integral newform structures](#16-integral-newform-structures); [0.5 Wach modules of crystalline lattices](#05-wach-modules-of-crystalline-lattices); PhiGammaModulesAndIwasawaCohomology §§6.0–6.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.26(ii).

See [A. J. Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf) — Theorem 1.2.4(ii), p. 2, for `p≥k` only (Remark 1.2.5, p. 2); [Takeshi Saito](https://doi.org/10.1007/s002220050175) — Theorem 1, Invent. Math. 129 (1997), for every `p∤N`, the classical branch of §4.5 (its Hilbert sequel, [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2), records this elliptic case in its introduction, p. 1 of the arXiv version); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §1.2, pp. 8–10; §5.4, pp. 58–59.

- The crystalline factor of the cohomological eigenform realisation.
- `φ` has the Hecke Euler-root polynomial in the stated cohomological convention.
- The Wach module of §0.5 of the fixed lattice in its declared dual/twist convention.
- The quotient `N(T)/π` is an integral `O_λ`-lattice; after inverting `p` it identifies with `D_cris(T[1/p])`, compatibly with `φ` and the declared filtration convention.
- A semilinear matrix changes by `U⁻¹Pφ(U)`.
- After coefficient extension the regulator roots coincide with the crystalline roots; separate distinct and repeated roots.

**Checks.**

- At 2 the polynomial `X²+2X+2` has slopes 1/2,1/2 and gives a good nonordinary example.
- For `Δ` at `p=2<k=12` the `φ`-polynomial is `X²+24X+2048`, with Newton slopes 3 and 8 against Hodge degrees 0 and 11. The prime lies outside Scholl's range `p≥k` and the Fontaine–Laffaille range, yet the statement holds; a version restricted to `p≥k` would say nothing at the five primes `p<12`.
- Dual/Tate-twist transport changes `φ` eigenvalues and Hodge degrees according to the imported period-functor laws.
- Changing the basis preserves the `φ`-module under semilinear conjugation, not under ordinary matrix conjugation alone.
- For a two-dimensional Jordan `φ`-module with repeated root, the two formal roots do not provide two independent eigenlines.
- For a rank-one trivial crystalline `ℤ_p`-lattice, `N(T)/π≅ℤ_p` while `D_cris(ℚ_p)≅ℚ_p`. They identify after inverting `p`, not as integral modules.

### 5.3 Ordinary CM primes split

For a regular cohomological CM form induced from `L/F` and ordinary at every `v|p`, prove each such `v` splits in `L` and the inducing character has a compatible `p`-ordinary CM type. For the Hara–Ochiai converse keep its infinity-type/ordinary-CM-type condition; splitting alone is not that iff criterion. Distinct regular-weight local characters are part of the argument. Local induction from an arbitrary index-two subgroup need not be irreducible.

*Needs:* [3.15 The CM predicate](#315-the-cm-predicate); [5.1 Ordinary refinement and the fixed lattice](#51-ordinary-refinement-and-the-fixed-lattice); `GL2AutomorphicRepresentationsAndTransfer:R17.5`; [3.12 Hilbert Hodge–Tate property](#312-hilbert-hodgetate-property).

See [Takashi Hara and Tadashi Ochiai](https://arxiv.org/pdf/1507.07309v2) — Appendix A Proposition A.3 and proof, pp. 70–71; §2.1 (ord); [Samit Dasgupta and Mahesh Kakde](https://math.iisc.ac.in/~maheshkakde/brumerstark.pdf) — Lemma 9.2 proof, p. 67.

### 5.4 Complex conjugation moves the ordinary CM line

For the regular `p`-ordinary CM form, choose the ordinary line `V_{v,f}` specified by the ordinary-refinement target. At the split `v` it is one of the two global `G_L`-character lines, distinguished by the source's ramified/unramified local characters. Any element of `G_F` inducing the nontrivial conjugation of `L` interchanges these lines, so `V_{v,f}` is not stable under it. Keep `k>1` and the distinct-character hypotheses. A freely chosen invariant line when the characters coincide need not have this property.

*Needs:* [5.3 Ordinary CM primes split](#53-ordinary-cm-primes-split); [3.14 Determinant, total oddness and absolute irreducibility](#314-determinant-total-oddness-and-absolute-irreducibility); [5.1 Ordinary refinement and the fixed lattice](#51-ordinary-refinement-and-the-fixed-lattice).

See [Samit Dasgupta and Mahesh Kakde](https://math.iisc.ac.in/~maheshkakde/brumerstark.pdf) — Lemma 9.2 and proof, p. 67.

### 5.5 The endpoint-weight local contract

At a good classical prime with `k=p+1`, characteristic-zero comparison still gives crystallinity and arithmetic Hodge weights `0,p` with the full parameter. The integral Fontaine–Laffaille interval `[0,k−1]` is outside `[0,p−2]`, so that chosen small-weight integral comparison does not apply. Weight `p+1` does not make this representation Barsotti–Tate and does not prescribe a residual ordinary/flat lift from `a_p`. A weight-two potentially Barsotti–Tate conclusion must specify a different lift, its residual weight/type comparison and every residual-inertia, determinant, modularity and local-type hypothesis. Keep characteristic-zero Hodge type, residual Serre weight and deformation-lift type separate.

*Needs:* [4.5 Geometric coefficient-prime comparison](#45-geometric-coefficient-prime-comparison); [4.9 The KW coefficient-prime local forms](#49-the-kw-coefficient-prime-local-forms); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

See [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — Corollary 7.8, pp. 67–68; [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §1.2, pp. 8–10; §5.4, pp. 58–59.

The assertion of a different weight-two potentially Barsotti–Tate lift is
conditional on an independently specified lift with that exact type. The local
crystalline weight-`p+1` condition gives no existence theorem for it. The
optimized theorem in Layer 6 applies only after its own modularity, determinant,
semistable residual-type and quadratic-restriction hypotheses are established;
it cannot supply an unrestricted endpoint lifting criterion.


### Examples

For 11a1 at `3, X²+X+3` has exactly one 3-adic unit root `α`; the arithmetic
ordinary quotient has Frobenius `α`. At `2, X²+2X+2` has two slopes 1/2 and no unit
root, while crystallinity remains valid. For `T=O²` and `V⁺=Ke₁, T⁺=Oe₁` and
`T/T⁺≅O`. Substituting `ϖ_λOe₁` produces a quotient with `O/ϖ_λ` torsion and fails
saturation, also when `p` is ramified in `K`.

For the CM form at an ordinary split prime, conjugation exchanges the two
distinct global character lines. At weight `p+1` the characteristic-zero
crystalline statement gives degrees `0,p`; it provides no Fontaine–Laffaille
comparison in the small range and no automatic weight-two lift.

### Dependencies

Layers 1, 3 and 4; §0.5; PhiGammaModulesAndIwasawaCohomology §§6.0–6.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3–R07.4; algebraic-character induction and the labelled period functors.

## Layer 6: Integral Hecke families and deformation maps

### 6.1 Weight-two Tate-module decomposition

For a weight-two newform `f`, its modular abelian variety `A_f` has `V_ℓ(A_f)` free of rank two over `K_f⊗ℚ_ℓ`. Decompose along `λ|ℓ` and identify each factor with the arithmetic representation of `f`, giving `ℚ_ℓ`-dimension `2[K_f:ℚ]`. This requires the coefficient action, Weil-pairing adjointness and Eichler–Shimura, not just an equality of Hecke traces. The abelian quotient is specific to weight two; it is not a construction for arbitrary higher weight.

Use the imported quotient `A_f=J₁(N)/𝔭_fJ₁(N)`. The `λ`-factor is
`K_{f,λ}⊗_{K_f⊗ℚ_ℓ}V_ℓ(A_f)`, and the direct sum of these factors is
an isomorphism of `ℚ_ℓ[G_ℚ]`-modules preserving the `K_f`-action. For `K_f=ℚ`,
`A_f` is the elliptic curve `E_f`.

*Needs:* `ModularCurvesPartII:§§16.2–16.3`; `ModularCurvesPartII:§16.4`; `ModularCurvesPartII:§§17.1–17.2`; [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation); `ArithmeticGaloisRepresentations:Layer 6`; [4.8 Classical characteristic-zero irreducibility](#48-classical-characteristic-zero-irreducibility); `ModularCurvesPartII:§§13.3–13.6, 14.13–14.15`.

See [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Lemma 1.48, p. 46 (revision of 9 September 2007); [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §3.1, (3.1.1), p. 85; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Theorem 1.41, pp. 42–43, with Lemma 1.38, p. 41.

### 6.2 Residual newform representation

Use AlgebraicModularFormsAndSerreWeights §7.3's semisimple residual attachment
of the reduction eigensystem of `f`, at the specified coefficient place `λ`
and residue embedding. Compare it with the semisimplified reduction of the
arithmetic dual of the fixed DFG lattice of §§1.5–1.6. The comparison uses
that supplier's agreement with every attached lift and its full-polynomial
recognition, including in characteristic two; no second attachment is defined.

Prove that this object's prime-to-`ℓ` conductor divides `N`, using the local
compatibility of §§4.3–4.4 and the fixed-lattice comparison. It has
`det ρ̄(c)=−1` for complex conjugation. For odd `ℓ`, oddness implies that
irreducibility is equivalent to absolute irreducibility: an irreducible but
not absolutely irreducible rank-two representation has a quadratic scalar
endomorphism field, incompatible with the distinct eigenvalues `1,−1` of `c`.
At weight two with rational coefficients, identify it with `E_f[ℓ]^{ss}`.
A globally irreducible characteristic-zero representation can have reducible
reduction, and reductions before semisimplification need not be isomorphic.

- The DFG comparison identifies the imported object with the reduction of the
  specified lattice after semisimplification over a common residue field.
- Under a coefficient isomorphism `σ`, transport `f`, `λ` and the lattice;
  if `σ̄:κ_λ≃κ_{σ(λ)}` is induced on residue fields, transport the embedding
  `ι` to `ι∘σ̄⁻¹`. The comparison then commutes with reduction.
- The conductor bound, conjugation determinant and weight-two torsion
  identification are properties of this same imported attachment.

*Needs:* AlgebraicModularFormsAndSerreWeights §7.3; §§1.5–1.6, DFG realization
and integral comparison; §6.1, weight-two Tate-module comparison; §§4.3–4.4, local
conductors; ArithmeticGaloisRepresentations §§1.6–1.9, 5.1–5.7.

See [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf)
— §3.1, “Mod ℓ representations”, p. 87 (revision of 9 September 2007).

**Checks.**

- For 11a1 and `λ=5`, both the imported attachment and the DFG reduction give `1 ⊕ χ̄₅`; at 2 their polynomial is `(X−1)(X−2)=X²+2X+2` in `𝔽₅[X]`.
- For `k = 2` and `ψ = 1, det ρ̄ = χ̄_ℓ`.
- For `K_f = ℚ, ρ̄_{f,ℓ} ≅ E_f[ℓ]^{ss}` as `G_ℚ`-modules.
- For 11a1, `λ = 5`, different lattices give non-isomorphic reductions before semisimplification: the Tate modules of the isogenous curves 11a3 and 11a2 give the non-split `(1 ∗; 0 χ̄_5)` and `(χ̄_5 ∗; 0 1)`, and that of 11a1 itself gives the split `1 ⊕ χ̄_5`.
- Over `𝔽₄`, let `χ:C₃→𝔽₄×` have order three. The semisimple representations `1⊕1` and `χ⊕χ` both have identically zero trace, but determinant characters 1 and `χ²` differ. Full characteristic polynomials distinguish them.

- For coefficient transport with `a²+a−1=0`, take the two places above 11
  with `a=3` and `a=7`. Conjugation sends `a` to `−1−a`; its reduction at
  the transported place is `−1−7=3`, agreeing with the original reduction.
  Changing only the place gives `7≠3` and is not this comparison.

### 6.3 The full weight-two Hecke algebra

For `Γ_H(N)`, take `T_ℤ` generated by all `T_n` and diamond operators, and extend coefficients to `R`. It is finite free and acts faithfully on the weight-two space and the Jacobian. `V_ℓ(J_Γ)` is free of rank two over the full rational Hecke algebra; “full” retains generalized oldform eigenspaces and possible nilpotents. Its arithmetic Galois action has good polynomial `X²−T_pX+p〈p〉`. Field factors give characteristic-zero representations, while for odd `ℓ` its residual representation is the attachment of AlgebraicModularFormsAndSerreWeights §7.3 for the corresponding reduction eigensystem. A newform factor agrees with the previously constructed representation. Empty cusp spaces give the zero ring, not a rank-two representation over an invented coefficient field.

For an old eigenform the field-factor representation is the scalar extension
of the representation of its associated newform. Thus passing to an old level
does not construct a new Galois representation unrelated to that newform.

*Needs:* [1.1 Coefficient Eichler–Shimura](#11-coefficient-eichlershimura); [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation); [6.1 Weight-two Tate-module decomposition](#61-weight-two-tate-module-decomposition); `ModularCurvesPartII:§§13.3–13.6, 14.13–14.15`; `ArithmeticGaloisRepresentations:Layer 6`; `ArithmeticGaloisRepresentations:§§1.1–1.10`; `AlgebraicModularFormsAndSerreWeights:R15.2`.

See [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.1, p. 107 (revision of 9 September 2007); [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §1.6, Lemma 1.39, p. 42; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.1, "Associated Galois representations", p. 109; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.1, "The structure of TK", p. 110.

- `𝕋_R = 𝕋_ℤ ⊗ R` for `Γ_H(N)` in weight two, generated by the `T_n` and `⟨d⟩`.
- `𝕋_R` is finite free over `R` and acts faithfully on `S₂(Γ, R)`.
- `T_ℓ(J_Γ) ⊗ ℚ_ℓ` is free of rank 2 over `𝕋_{ℚ_ℓ}`.
- `ρ_𝔭` : `G_ℚ → GL₂(𝕋_K/𝔭)` for a maximal ideal `𝔭` of `𝕋_K`.
- For `p ∤ Nℓ`, the characteristic polynomial of `ρ_𝔭(Frob_p)` is `X² − T_pX + p⟨p⟩` mod `𝔭`.
- For `ℓ` odd, identify the imported residual attachment with the semisimplification at the acting maximal ideal `𝔪`, over `𝕋_𝒪/𝔪`.
- If `𝔭` corresponds to a newform `g, 𝕋_K/𝔭 ≅ K′_g` and `ρ_𝔭 ≅ ρ_g`.

**Checks.**

- For `Γ₀(11)` and `ℓ = 5`: `𝕋_ℤ = ℤ, 𝔪 = (5)` and `ρ_𝔪 ≅ 1 ⊕ χ̄₅`.
- For `Γ₀(88), T₂` on the old space of 11a1 generates `K[u]/(u²(u² + 2u + 2))`, in which `u(u² + 2u + 2)` is a nonzero nilpotent.
- For `Γ₀(N)` with `N ≤ 10, S₂(Γ₀(N)) = 0`, so `𝕋_ℤ = 0` and there are no maximal ideals.
- For a newform `g` of level `N, ρ_𝔭` agrees with [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation).

### 6.4 Classical conductors and bad Euler factors

For the arithmetic representation of a classical `k≥2` newform of level `N`, the Artin conductor away from `ℓ` is the prime-to-`ℓ` part of `N`. At `p≠ℓ` with `p∥N` and `p∤cond ψ`, its local matrix is an extension with diagonal `χ_uχ_ℓ,χ_u`, where `χ_u` is unramified with arithmetic Frobenius `a_p` and the extension has nonzero monodromy. If `p∥N` and `p|cond ψ`, the local representation is `χ_u⁻¹χ_ℓ^{k−1}ψ′ ⊕ χ_u`, where `ψ′` is the Galois character of `ψ`. On the inertia invariants of the cohomological dual, geometric Frobenius gives Euler factors `(1−a_pp⁻ˢ+ψ(p)p^{k−1−2s})⁻¹` for `p∤N` and `(1−a_pp⁻ˢ)⁻¹` for `p|N`. At a Steinberg place the arithmetic representation's own invariant line instead has arithmetic Frobenius `a_pp`. For rational weight two identify the associated elliptic curve's conductor `N` and `L`-function with those of `f`.

*Needs:* [4.3 Hecke versus Langlands normalization](#43-hecke-versus-langlands-normalization); [3.17 Carayol's geometric Hilbert theorem](#317-carayols-geometric-hilbert-theorem); [6.1 Weight-two Tate-module decomposition](#61-weight-two-tate-module-decomposition); `GL2AutomorphicRepresentationsAndTransfer:R16.3`; `ArithmeticGaloisRepresentations:Layer 6`; [4.4 All-Hilbert compatibility away from `λ`](#44-all-hilbert-compatibility-away-from-λ).

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — Théorème (A), printed pp. 410–411, with the Hecke correspondence of 0.5, printed p. 410, for every `k≥2` (over `F=ℚ` Carayol's even-degree hypothesis is void); [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Theorem 3.1(d)–(e), p. 86, the weight-two case, derived there from Carayol's Théorème (A), p. 87 (revision of 9 September 2007); [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.8, Corollaire, printed p. 411, the case `F=ℚ, k=2`, for the elliptic curve's conductor and `L`-function.

**Checks.**

- For `k=4`, `p∥N` and `p∤cond ψ`, the determinant of the extension with diagonal `χ_uχ_ℓ,χ_u` at arithmetic Frobenius is `a_p²p`, while `det ρ_f=ψ′χ_ℓ^{k−1}` gives `ψ′(p)p³`. Hence `a_p²=ψ′(p)p²` and `|a_p|=p`; the weight-two relation `a_p²=ψ′(p)` read in weight four would contradict this.
- For 11a1 at `p=11` (`k=2`, `ψ=1`), `a₁₁=1`: the local representation is the Steinberg-type extension with `χ_u(Frob₁₁)=1`, conductor exponent 1 and Euler factor `(1−11^(−s))⁻¹`, matching split multiplicative reduction.
- At `p∥N` with `p|cond ψ`, the summand `χ_u⁻¹χ_ℓ^{k−1}ψ′` is tamely ramified, the monodromy vanishes and the conductor exponent is 1. Purity of the unramified line gives `|a_p|=p^{(k−1)/2}`; a Steinberg-type answer would instead have nonzero monodromy and `|a_p|=p^{(k−2)/2}`.

### 6.4a Type-`Σ` index data

For odd `ℓ` and continuous absolutely irreducible modular `ρ̄`, define `δ(ρ̄)`
by the inertia cases preceding DDT Theorem 3.15, pp.90–91; this is the
weight-two optimization exponent used in §6.5.

For the type-`Σ` specialization fix finite `K/ℚ_ℓ`, its integers `O` and residue
field `κ`, and continuous irreducible modular `ρ̄:G_ℚ→GL₂(κ)` with
`det ρ̄=χ̄_ℓ`, semistability at `ℓ` and `#ρ̄(I_p)` dividing `ℓ` for `p≠ℓ`.
Let `Σ` be any finite set of primes. Put `δ_Σ=0` if `ρ̄` is good
at `ℓ` and `ℓ∉Σ`, and `δ_Σ=1` otherwise. Define the finite index set `𝓝_Σ` of
normalized weight-two newforms with trivial character, residual realization
`ρ̄` after a specified coefficient extension and residue embedding, and level
dividing `ℓ^{δ_Σ} N(ρ̄)∏_{p∈Σ\{ℓ}}p^{dim ρ̄^{I_p}}`, with `ℓ²∤N_f`.
Use the finite newform decomposition at this bounded level, retaining the
chosen coefficient realizations over `O`. Section 6.5 proves nonemptiness; §6.6 constructs the product algebra and local problems.

Define `Σ_ρ̄` as the set of primes `p` such that either `p=ℓ` and `ρ̄|G_ℓ` is
good and ordinary, or `p≠ℓ` and `ρ̄` is unramified at `p` (DDT Definition 3.25).
The hypothesis `Σ⊂Σ_ρ̄` is not part of §§6.4a–6.6; §6.7 assumes it. The
inertia-order condition makes `N(ρ̄)` squarefree in any case, since a nontrivial
`ρ̄(I_p)` of order `ℓ` is unipotent with a line of invariants. Under `Σ⊂Σ_ρ̄`
every `p∈Σ\{ℓ}` also has `dim ρ̄^{I_p}=2` and `p∤N(ρ̄)`, so the level bound
equals `ℓ^{δ_Σ}∏_{p|N(ρ̄)}p∏_{p∈Σ\{ℓ}}p²`.

(Source: [Darmon–Diamond–Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf),
§3.2, pp.90–91; §2.7, p. 76, for liftings of type `Σ` with `Σ` any finite set;
§3.3, Definition 3.25 and Lemma 3.26, pp.93–94, which hold for every finite
`Σ`; and §4.2, formula (4.2.1), p. 112, where `Σ⊂Σ_ρ̄` is assumed.)

**Checks.**

- If `ρ̄` is good at `ℓ` and `Σ=∅, δ_Σ=0` and the bound is `N(ρ̄)`.
- If `ρ̄` is good ordinary and `ℓ∈Σ, δ(ρ̄)=0` while `δ_Σ=1`. The two
  exponents serve different purposes and the index set allows an `ℓ`-factor.
- An unramified `p≠ℓ` in `Σ` contributes `p²` to the level bound since
  `dim ρ̄^{I_p}=2`.
- A ramified `p≠ℓ` in `Σ`, with `#ρ̄(I_p)=ℓ`, has `ρ̄|I_p` unipotent and
  nontrivial, so `dim ρ̄^{I_p}=1` and `p∥N(ρ̄)`; the level bound acquires
  `p·p=p²`. The product `∏_{p|N(ρ̄)}p∏_{p∈Σ\{ℓ}}p²` would give `p³` there: the
  two expressions agree exactly when `ρ̄` is unramified at every `p∈Σ\{ℓ}`,
  which `Σ⊂Σ_ρ̄` ensures.

*Needs:* §6.2; TauCetiRoadmap.ModularForms Layer 4, finite newform
decomposition and coefficient fields; FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.5, residual good/ordinary/semistable inertia.

### 6.5 Nonempty optimized weight-two eigensystems

Let `ℓ` be odd, `κ` a finite field of characteristic `ℓ`, and let `ρ̄:G_ℚ→GL₂(κ)` be
continuous, absolutely irreducible and modular. For `ℓ=3` also require absolute
irreducibility on `G_{ℚ(√−3)}`. With `δ(ρ̄)` defined in §6.4a, prove existence
of a weight-two newform `f` with
`N_f=N(ρ̄)ℓ^{δ(ρ̄)}`, residual realization `ρ̄` after coefficient extension, and
nebentypus of order prime to `ℓ`. This is [Darmon–Diamond–Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf),
Theorem 3.15, p. 91. Assemble this wrapper using
SerreWeightAndLevelOptimisation §§2.10, 2.13 for the overlapping
odd-characteristic lowering and full-conductor descent, §4.7 for the
coefficient-prime bridge in its stated weight/level range, and §4.8 for the
`ℓ≥5` finite-flat case under its local hypotheses. Complete the additional
characteristic-three character comparison under the quadratic restriction
here: §§2.13 and 4.7 do not prescribe a characteristic-zero tame character at
`ℓ=3`. Compare the local inertia cases with the weight-two realization to force
the exact exponent `δ(ρ̄)`; occurrence at a coefficient-prime level alone does
not determine that exponent or newness.

In the semistable type-`Σ` situation of §6.4a, prove absolute irreducibility
on `G_L` for `L=ℚ(√((-1)^{(ℓ−1)/2}ℓ))` by DDT Lemma 3.24, p.93, including
its separate `ℓ=3` argument. This verifies the quadratic restriction needed
at `ℓ=3` before applying the optimized weight-two theorem. Since
`det ρ̄=χ̄_ℓ`, the prime-to-`ℓ`-order nebentypus reduces to 1. Injectivity of
reduction on such roots of unity makes `ψ_f=1`. The semistable inertia cases
give `δ(ρ̄)=0` in the good case and `δ(ρ̄)=1` otherwise. The already defined
bound with `δ_Σ≥δ(ρ̄)` then includes this `f` for every finite `Σ`, so `𝓝_Σ` is nonempty (DDT p. 94 states this for all `Σ`).

*Needs:* SerreWeightAndLevelOptimisation §§2.10, 2.13, 4.7–4.8;
§6.4a; Layer 6's residual representation; AlgebraicModularFormsAndSerreWeights
R15.5, modular residual eigensystems and eigenvalue lifting; TauCetiRoadmap.ModularForms
Layer 4, newforms and degeneracy maps; FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.3–R07.4, the named good/ordinary/semistable residual inertia cases of R07.5;
ArithmeticGaloisRepresentations Layer 4, finite-image restriction and induction.

- Return the newform, coefficient embedding, exact optimized level and residual isomorphism.
- Under `det ρ̄=χ̄_ℓ`, reduce and identify the prime-to-`ℓ`-order nebentypus as 1.
- Insert the optimized form into the specified type-`Σ` index set.

**Checks.**

- For 11a1 at `ℓ=7`, the Frobenius polynomial at 2 is `X²+2X+2` with nonsquare discriminant 3 modulo 7, so the residual representation is irreducible and oddness makes it absolutely irreducible. Good reduction at 7 gives `δ=0` and the level bound includes level 11. At `ℓ=5` this example is reducible and fails the hypotheses.
- At `ℓ=3` retain the quadratic restriction hypothesis and the extra character comparison: the supplied bridge fixes only the residual tame character and does not itself give a prime-to-3-order nebentypus.
- Without `det ρ̄=χ̄_ℓ`, the theorem returns a prime-to-`ℓ`-order character and does not force trivial nebentypus.

### 6.6 Classical type-`Σ` Hecke representation

Use the semistable residual data, an arbitrary finite `Σ`, `δ_Σ` and the finite
index set `𝓝_Σ` of §6.4a. Use §6.5's absolute irreducibility on `G_L` for
`L=ℚ(√((-1)^{(ℓ−1)/2}ℓ))`, including its `ℓ=3` argument, and nonemptiness
of `𝓝_Σ`. Form the product of the
chosen coefficient integer rings indexed by `𝓝_Σ` and its `O`-subalgebra `T_Σ`
generated by `T_p` for `p∉Σ, p∤ℓN(ρ̄)`. Prove that `T_Σ` is reduced, local,
complete, Noetherian, finite free and has residue field `κ`. Construct its
arithmetic representation, unramified with trace `T_p` at those good primes,
lifting `ρ̄` with type `Σ`, and the unique surjection `R_Σ↠T_Σ` carrying the
universal lift to it. Enlargement `Σ⊆Σ′` gives `T_Σ′↠T_Σ`; extension `K⊆K′`
gives `T_Σ⊗_O O_{K′}`; projection to an eigenform factor gives its representation.

Define the type-`Σ` local problems here with fixed determinant `χ_ℓ`. At `ℓ`
use DDT's finite-flat (“good”) or ordinary semistable torsion-module category;
if `ρ̄` is good and `ℓ∉Σ` require good lifts. Away from `Σ∪{ℓ}`, require
unramified lifts where `ρ̄` is unramified, and inertia extensions of the trivial
character by itself in the ramified semistable case. At `Σ\{ℓ}` impose no
extra local condition. Use DDT §2.7, pp. 76–79, with its definitions of good,
ordinary and semistable torsion modules in §2.4, rather than a field-valued
WD test for an Artinian lift.

Prove the Artinian coefficient, strict-conjugation, injection, fiber-product
and separated-limit axioms of LocalGaloisDeformationRings F.3.1–F.3.2.
For the underlying torsion-module categories prove finite-product,
subobject and quotient closure inside their stated ambient categories;
fixed determinant is imposed separately on lifts. Use its §8.6 categorical
criterion, ordinary/flat targets, and FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.6.7. Then apply GlobalGaloisDeformations §3.4 to obtain `R_Σ`.

Prove the type-`Σ` property stated in DDT Lemma 3.27(a), whose verification
its proof on p. 95 leaves as an exercise: the ideals
`I_n=T_Σ∩∏_f λ_f^n` are cofinal with powers of the maximal ideal. The module
of the reconstructed lift modulo `I_n` embeds into the product of the
eigenform modules modulo `λ_f^n`, where the specified categorical conditions
hold; subobject closure gives those conditions, and quotient closure gives
every Artinian coefficient quotient by cofinality. This does not assert
that every Artinian quotient itself embeds into a product of eigenform
quotients.

*Needs:* LocalGaloisDeformationRings §§F.3.1–F.3.2, 8.6, 1.7, 4.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6.7;  [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation); [6.2 Residual newform representation](#62-residual-newform-representation); [6.3 The full weight-two Hecke algebra](#63-the-full-weight-two-hecke-algebra); [6.4 Classical conductors and bad Euler factors](#64-classical-conductors-and-bad-euler-factors); [4.5 Geometric coefficient-prime comparison](#45-geometric-coefficient-prime-comparison); `GlobalGaloisDeformations:R04.3`; [6.5 Nonempty optimized weight-two eigensystems](#65-nonempty-optimized-weight-two-eigensystems).

See [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §3.3, p. 93; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §3.3, Lemma 3.26, p. 94; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §3.3, Lemma 3.27 and its proof, pp. 94–95, for the statement and the integrality step; Example 3.28, p. 95, for the `57B` coefficient ring below.

**Checks.**

- For residual `57B` modulo 3 with `Σ=∅, T_Σ={(x,y)∈ℤ₃²:x≡y mod 3}`;
  the cofinal intersections prove the torsion local conditions even though
  `T_Σ/3T_Σ` is the dual-number ring, not a product of fields.
- If `ρ̄` is good at `ℓ` and `ℓ∉Σ`, the ordinary condition alone does not suffice:
  the required Artinian lifts remain in the good finite-flat category.
- A quotient by an arbitrary ideal need not embed into the product of the
  corresponding eigenform quotients. Use a contained cofinal `I_n` first,
  then quotient stability; the reduced `T_Σ` argument does not apply to a
  Hecke algebra with a nonzero generic nilpotent.

### 6.7 The specified reduced localization

Assume, in addition to the data of §6.4a, that `Σ⊂Σ_ρ̄` (DDT Definition 3.25), as DDT §4.2 does. Put `N_Σ=ℓ^{δ_Σ}∏_{p|N(ρ̄)}p∏_{p∈Σ\{ℓ}}p²`, which under this hypothesis is the level bound of §6.4a. For each newform `f∈𝓝_Σ` take the normalized eigenform `g` of level `N_Σ` with `a_p(g)=a_p(f)` if `p∤N_Σ/N_f`, `a_p(g)=0` at `p≠ℓ` dividing `N_Σ/N_f`, and `a_ℓ(g)` the unit root of `X²−a_ℓ(f)X+ℓ` when `ℓ|N_Σ/N_f`. The common residual eigenform has `a_p=tr(Frob_p on ρ̄'s I_p-coinvariants)` for `p=ℓ` or `p∉Σ` and `a_p=0` otherwise. It defines `m` in the full Hecke algebra, and the resulting localization is `T_Σ≅T_m`. This particular `T_m` is reduced: over a sufficiently large `K`, `T_m⊗K≅∏_{f∈𝓝_Σ}K`, with `T_p=0` at `p∈Σ\{ℓ}` and the unit-root choice at `ℓ∈Σ`. At `p|N(ρ̄)ℓ^{δ_Σ}` the arithmetic Frobenius on the representation's inertia coinvariants is `T_p`. This reduced statement depends on the prescribed `Σ` and residual localization; a full old Hecke algebra at an unrelated level may contain nilpotents.

Retain all hypotheses of the classical type-`Σ` Hecke-representation theorem
of §6.6, including odd `ℓ`, modular irreducible `ρ̄` with cyclotomic determinant,
semistability at `ℓ` and the inertia-order condition away from `ℓ`, and add
`Σ⊂Σ_ρ̄`, which §6.6 does not need. These hypotheses are part of the
reduced-localization theorem. The construction of `g` needs the added hypothesis: if
`ℓ|N_Σ/N_f` then `ℓ∈Σ`, so `ρ̄` is good and ordinary at `ℓ` and `a_ℓ(f)` is a
unit, which makes the unit root exist; and at `p∈Σ\{ℓ}` it makes the exponent
of `p` in `N_Σ` equal to that of the §6.4a bound.

**Checks.**

- For 11a1 at `ℓ=19` and `Σ={19}`: `a₁₉=0`, so `ρ̄` is good supersingular at
  19 and `19∉Σ_ρ̄`. Here `δ_Σ=1` and 11a1 lies in `𝓝_Σ` with
  `N_Σ/N_f=19`, but `X²−a₁₉X+19=X²+19` has both roots of valuation `1/2`, so
  there is no unit root to choose.
- For 11a1 at `ℓ=7` and `Σ={11}`: the minimal discriminant is `−11⁵` and 7 does
  not divide 5, so `ρ̄` is ramified at 11 and `11∉Σ_ρ̄`. The §6.4a bound is
  `11·11=121`, while the displayed `N_Σ` would be `11·11²=1331`.
- For the same `ρ̄` with `Σ={7}`: `a₇=−2` is a 7-adic unit, so `ρ̄` is good
  ordinary at 7, `7∈Σ_ρ̄`, `N_Σ=7·11=77` equals the §6.4a bound, and
  `X²+2X+7` has discriminant `−24≡4` modulo 7, so its unit root lies in `ℤ₇`
  and is `a₇(g)` for the level-77 form `g` attached to 11a1.

*Needs:* [6.6 Classical type-`Σ` Hecke representation](#66-classical-type-σ-hecke-representation); [6.3 The full weight-two Hecke algebra](#63-the-full-weight-two-hecke-algebra); [6.4 Classical conductors and bad Euler factors](#64-classical-conductors-and-bad-euler-factors); [4.5 Geometric coefficient-prime comparison](#45-geometric-coefficient-prime-comparison); `AlgebraicModularFormsAndSerreWeights:R15.2`; TauCetiRoadmap.ModularForms, layer 4 eigenforms newforms primitive forms the conductor.

See [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.2, p. 112; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.2, Lemma 4.6, p. 112; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.2, Proposition 4.7, p. 113; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.1, Lemma 4.4, p. 111.

### 6.8 The geometric Hecke determinant

Let `O` be a complete DVR and `T_m` a completed local finite `O`-flat Hecke algebra, including possible nilpotents. From the actual cohomology multiplicity construct a faithful generic rank-two `T_m[1/ϖ_λ]`-module with commuting continuous `G_{F,S}`-action. Descend its degree-two determinant law to all of `T_m`, with good geometric coefficients `T_v,NvS_v`, and prove continuity and compatibility with every finite quotient and coefficient change. `O`-flatness makes `T_m→T_m[1/ϖ_λ]` injective even with nilpotents. In weight two this module is `H¹`, dual to DDT's Tate module; its residual law is the dual of the arithmetic residual law. Use the full generalized oldform eigenspaces. Reduced eigenform points cannot supply the nilpotent coefficients; torsion/non-flat cohomological determinant construction is not implied by this flat-family theorem.

*Needs:* [1.4 Rational orbit projector and coefficient descent](#14-rational-orbit-projector-and-coefficient-descent); [3.1 The quaternionic multiplicity space](#31-the-quaternionic-multiplicity-space); [6.3 The full weight-two Hecke algebra](#63-the-full-weight-two-hecke-algebra); `IntegralHeckeAndGaloisDeterminants:IHG.4`; `ArithmeticGaloisRepresentations:Layer 5`; `HilbertModularVarietiesAndShimuraCurves:R18.4`.

See [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.1, the structure of the full Hecke algebra, pp. 109–110, and Lemmas 1.37–1.39; [Mark Kisin](https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf) — Proof of Theorem 4.3, pp. 543–544; [Gaetan Chenevier](https://arxiv.org/pdf/0809.0415v2) — §§1.1–1.5, pp. 7–9; §1.10, p. 12.

For descent use the whole-generic-algebra coefficient criterion of
TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §4.1, including
`Determinant.existsUnique_isCoefficientChange_of_compact` when its compact
coefficient hypotheses apply, and the integral generic-fibre criterion when
the source is `T_m[1/ϖ_λ]`. Check every group-algebra polynomial coefficient, not
only trace and determinant of single Frobenius matrices. Degree two's mixed
coefficient is `tr(A)tr(B)−tr(AB)`, a division-free identity valid also in
characteristic two. Integral topology and coefficient injectivity must be proved
for the actual geometric multiplicity module before invoking the supplier.


- The integral degree-two law from the actual geometric generic rank-two Hecke family.
- Its characteristic polynomial at good geometric Frobenius has coefficients `T_v,Nv S_v`.
- Compatible continuous laws over all finite quotients `T_m/m^n`.
- Coefficient quotient/extension commutes with the geometric determinant.
- Reduction identifies with `det ρ̄` of the residual eigensystem, `ρ̄` being taken in the geometric convention (the dual of the arithmetic residual representation).
- All identities hold over `T_m`, including its nilpotents, rather than only `T_m,red`.

**Checks.**

- Over `A=k[ε]/ε², diag(1+ε,1)` and identity have the same reduced point but different determinant at the generator of an infinite cyclic group.
- Reduction from `T_m/m^{n+1}` to `T_m/m^n` agrees with the `n`-th law.
- The cross coefficient `tr(g)tr(h)−tr(gh)` is integral in characteristic two; no 1/2 formula is used.
- Retain the nonzero nilpotent `u(u²+2u+2)` in the level-88 old Hecke factor instead of replacing that factor by its reduced quotient.

### 6.9 From a determinant law to a Hecke representation

Let `T` be complete local and let `D` be a continuous degree-two determinant over its entire group algebra. Suppose its residual law is split and comes from a specified absolutely irreducible rank-two representation over the finite residue field. Import henselian Cayley–Hamilton reconstruction to obtain a continuous representation into `GL₂(T)`, unique up to conjugacy and up to strict equivalence with fixed residual identification. The residue field need not be algebraically closed. Specialize through all coefficient quotients, including nilpotent ones. The good geometric polynomial is `X²−T_vX+Nv S_v`; take the arithmetic dual before a map to an arithmetic universal deformation problem.

*Needs:* `IntegralHeckeAndGaloisDeterminants:§1.3`; [6.8 The geometric Hecke determinant](#68-the-geometric-hecke-determinant); [6.2 Residual newform representation](#62-residual-newform-representation).

See [Gaetan Chenevier](https://arxiv.org/pdf/0809.0415v2) — Theorem 2.22(i), printed p. 34; split residual determinant definitions in §2.18–2.22.

The generic theorem is the henselian irreducible reconstruction of
IntegralHeckeAndGaloisDeterminants §1.3, stated there as
`Determinant.exists_realization_of_henselian`. This target specializes
it to the actual geometric law and its specified residual identification,
then proves the good-polynomial and arithmetic-dual comparison required by the
Hecke/deformation consumer. The generic Cayley–Hamilton quotient, matrix-unit
construction and GMA theory remain with that supplier.


### 6.10 Quaternionic Hecke-algebra representations

Use the Khare–Wintenberger setting: `F` totally real of even degree, `p` unramified in `F, D` definite at infinity and ramified at a finite even-cardinality set `Σ`, forms `S_{k,ψ}(U,O)`, and the Hecke algebra generated outside a bad set `S`. Take `k≥2` parallel, `k=2` if `p=2`; exclude `Σ∩{v|p}` if `k>2`. Choose a sufficiently large `p`-adic coefficient field containing the embeddings of `F`, splitting `D` at `p`, and a coefficient action with central restriction `ψ⁻¹` and `ψ` on sufficiently small `p`-units equal to the norm power `2−k`. For noncompact `U` at `p=2` specify the extension of the weight-two trivial action from the maximal compact subgroup. `S` includes infinity, `p, Σ`, nonmaximal level and nontrivial coefficient action. At a non-Eisenstein maximal ideal, whose residual representation is absolutely irreducible, construct the arithmetic representation over the completed local Hecke algebra, unramified outside `S` with good polynomial `X²−T_vX+Nvψ(ϖ_v)`. Use HilbertModularVarietiesAndShimuraCurves R18.3.29 for the individual parallel-weight attachment, compare its arithmetic dual convention using §3.11, and identify each specialization of the reconstructed integral representation with it. Construct the fixed-determinant deformation map; additional local conditions must be named individually.

The level `U=∏_v U_v` is open and compact modulo the centre in
`(D⊗_F A_F^∞)×`, and `ψ` is an `O`-valued character of
`F× ∖ (A_F^∞)×`. The representation is unique up to conjugacy, or up to
strict equivalence once its residual identification is fixed.

*Needs:* HilbertModularVarietiesAndShimuraCurves §§R18.3.29, R18.4.25; [6.9 From a determinant law to a Hecke representation](#69-from-a-determinant-law-to-a-hecke-representation); `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `IntegralHeckeAndGaloisDeterminants:IHG.1`; [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); `ArithmeticGaloisRepresentations:§§1.1–1.10`; `IntegralHeckeAndGaloisDeterminants:IHG.4`; `LocalGaloisDeformationRings:§F.2.5`; `LocalGaloisDeformationRings:§F.2.9`; `GlobalGaloisDeformations:R04.3`; [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem).

See [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — §9.1.1, pp. 78–80 (authors' final version, 30 May 2009).

### 6.11 A fixed character at quaternionic ramification places

Use HilbertModularVarietiesAndShimuraCurves R18.3.32, *Fixed ramified signs
throughout a localized eigensystem*. Retain `F` totally real of even degree,
`p` unramified in `F, D` definite with an even finite ramification set `Σ`,
parallel `k≥2` (`k=2` if `p=2`), `Σ` disjoint from `p` when `k>2`, the non-Eisenstein
acting maximal ideal and its common residual representation, and `ψ_v`
unramified for `v∈Σ`. For `p>2` take `U_v=O_{D_v}×` and, at `v∤p`, require
`Nv≢−1` mod `p` or residual ramification. At `v|p` use nontrivial cyclotomic
inertia. For `p=2` take `U_v=D_v×` at every `v∈Σ` with the fixed
central-compatible coefficient extension.

Here compare its arithmetic local form `(χ_pγ_v,*;0,γ_v)` with the fixed
cohomological representation: the dual has characters `γ_v⁻¹` and
`γ_v⁻¹χ_p⁻¹`, with the annihilator flag under duality. Transport the common
uniformizer value from right translation; inverse translation inverts it.
Compare the parallel-weight attachment of R18.3.29 with §3.10 by good
polynomials. The supplier owns existence and independence of `γ_v`; the
extension class need not be independent of the eigenform. An integral
family still requires a finite-projective invariant line beyond these
individual comparisons.

*Needs:* HilbertModularVarietiesAndShimuraCurves §§R18.3.29, R18.3.32;  [4.3 Hecke versus Langlands normalization](#43-hecke-versus-langlands-normalization); `GL2AutomorphicRepresentationsAndTransfer:R17.3`; [6.4 Classical conductors and bad Euler factors](#64-classical-conductors-and-bad-euler-factors); [6.10 Quaternionic Hecke-algebra representations](#610-quaternionic-hecke-algebra-representations); [4.5 Geometric coefficient-prime comparison](#45-geometric-coefficient-prime-comparison); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem).

See [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — Lemma 7.2 and its proof, pp. 60–61 (authors' final version); [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — Remark after Lemma 7.2, p. 61.

**Checks.**

- At `p=3` and `Nv≡−1` mod 3 with unramified residual pair `{1,−1}`, opposite
  signs give the same residual polynomial. That localization is outside
  the odd-prime sign-identification hypotheses.
- At `p=2` residual roots coincide. Full division level with its coefficient
  character fixes the uniformizer value; residual data alone do not.
- If `γ_v(Frob_arith)=2` and `q_v=3`, the arithmetic diagonal eigenvalues are
  6,2 and the cohomological dual's arithmetic eigenvalues are 1/6,1/2.
  Its geometric eigenvalues return to 6,2; a dual without Frobenius inversion
  would use the wrong polynomial.

### 6.12 Local conditions on the entire Hecke family

Let `O` be a complete coefficient DVR of residue characteristic `ℓ`, and let
`A` be the nonzero completed local finite `O`-flat Hecke algebra acting on the
specified geometric multiplicity of §§6.8–6.9, with its specified absolutely
irreducible residual representation. Use the arithmetic dual `r_A` when
mapping to an arithmetic deformation problem. Its determinant is fixed by
the weight and central-character quotient of the Hecke algebra; prove that
identity on the entire group algebra, not only at eigenform field points.
Each further factorization has its own application hypotheses below.

**Unramified and minimal applications.** At a finite `v∤ℓ` with hyperspecial
level, unramified coefficient system and good reduction of the geometric
realization, prove `r_A(I_v)=1` on the entire multiplicity module, and hence
on every Artinian quotient. For minimality in the classical semistable
weight-two case use precisely the type-`Σ` Hecke algebra of §6.6: the residual
hypotheses of §6.4a, trivial nebentypus and the bound
`N_f | ℓ^δ_Σ N(ρ̄) ∏_{q∈Σ∖{ℓ}} q^{dim ρ̄^{I_q}}` select its eigenforms.
Outside `Σ∪{ℓ}`, unramified residual places have unramified lifts, while
ramified semistable places retain extensions of the trivial inertia character
by itself. At `ℓ` the good residual case with `ℓ∉Σ` uses the finite-flat
condition, not merely ordinarity. Apply §6.6's cofinal-quotient and subobject
argument. A Hecke algebra at an arbitrary higher level is not asserted to
satisfy this minimal problem (DDT §3.3, Lemmas 3.26–3.27, pp. 94–95).

**Ordinary application.** Fix the weight, character, `ℓ`-level and refinements
of §4.10, and take the Hecke algebra acting on the ordinary summand where each
normalized `U_v` is invertible. For the ordinary, rather than merely nearly
ordinary, problem require the character `δ_v` of §4.11 to be trivial on
`O_{F_v}×`; its arithmetic Frobenius value is the selected unit `α_v`.
First construct the stable line on the entire generic multiplicity module
`A[1/ϖ_λ]²`, with quotient character `δ_v` and subcharacter
`det(r_A)δ_v⁻¹`, using the ordinary geometric summand. Its ordered characters
must take values in `A×`. The comparison must retain the generalized oldform
algebras; use IntegralIwasawaTheory §9.5 on the parallel-weight overlap and
§4.11's geometric comparison for the nonparallel application.

When the two residual ordered characters are distinct, choose a local element
`g` separating them. Put `a=(det(r_A)δ_v⁻¹)(g)` for the subcharacter
and `b=δ_v(g)` for the quotient character; then `a−b∈A×`.
Prove that `(r_A(g)−b)/(a−b)` is an idempotent with rank-one image over `A`,
and that its image is the generic subline's integral descent: invariance
holds generically and descends by `O`-flatness. This constructs a stable
rank-one direct summand and a rank-one projective quotient over the entire
ordinary Hecke algebra, and base change gives the flag over every Artinian
quotient. Identify its field specializations with §5.1's saturated lattice.

Without this separation, use LocalGaloisDeformationRings §1.9's flag scheme
pulled back to the ordinary Hecke family, with the specified ordered characters.
The universal flag exists on that space; its image in the unflagged Hecke
spectrum does not assert a flag over that ring. Keep the global deformation
map with this flag data, or prove descent before claiming an unflagged map
with an integral flag. This retains coincident-character and dyadic cases
without mistaking an ordinary image-ring point for a flagged point. The
ordinary flag construction and its base-change law are supplied by
LocalGaloisDeformationRings §§1.7–1.9; the Hecke multiplicity comparison is the
application here.

**Potentially semistable and crystalline applications.** Fix an algebraic
weight and a local type summand of the geometric family, with a specified
finite Galois extension `L_v/F_v` giving semistable reduction, coefficient
projector and descent action. Set its labelled Hodge type to that furnished
by §§4.5–4.6, dualizing the degrees for `r_A`; set its inertial type to the
actual descent action on the extracted period module. Prove over all of
`A[1/ϖ_λ]` that this period module is finite projective of rank two over
`A[1/ϖ_λ]⊗_{ℚ_ℓ}L_{v,0}`, where `L_{v,0}` is the maximal unramified subfield
of `L_v`, that the period comparison is an isomorphism, and that its filtration and inertia have
these types. Use good reduction for the crystalline branch and prove `N=0`
there. The geometric comparisons must act on generalized eigenspaces and
commute with every finite coefficient-algebra specialization. The conclusion
is factorization through the corresponding fixed-type quotient and the integral quotient defined by contracting its ideal, using
Kisin Theorem 2.7.6 and Corollary 2.7.7, printed p. 534; no arbitrary Hodge or
inertial type may be chosen independently of the geometric family.

For these `O`-flat families, vanishing of the defining ideal on the whole
generic algebra descends to `A`, including its nilpotents. Testing only
characteristic-zero field points proves less. For torsion coefficient rings,
use the exact ordinary-flag or finite-flat functor on all Artinian
truncations; a rational period condition by itself says nothing about them.
After these verifications, apply GlobalGaloisDeformations §3.4 to the selected
local problems and fixed determinant to construct the universal global map
to `A`; in the flagged case retain the corresponding map over the flag space.
For §6.6 this recovers `R_Σ↠T_Σ`. No surjectivity is asserted for an arbitrary
choice of extra refinement or flag parameters.

*Needs:* §§6.8–6.9, entire Hecke determinant and reconstruction; §§6.4a–6.6,
level and residual conductor hypotheses for the minimal application;
§§4.10–4.11 and 5.1, refinements, geometric ordinary line and fixed lattices;
IntegralIwasawaTheory §9.5, nonreduced parallel oldform assembly;
§§4.5–4.6, geometric coefficient-prime and fixed-type comparison;
LocalGaloisDeformationRings §§1.7–1.9, 3.1–3.7, 4.1, 8.6;
GlobalGaloisDeformations §3.4.

See [DDT](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf),
§2.4, pp. 62–66, §2.7, pp. 76–79, and Lemma 3.27, pp. 94–95;
[Kisin](https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf),
Theorem 2.5.5, pp. 530–531, Theorem 2.7.6 and Corollary 2.7.7, p. 534.

**Checks.**

- For `11a1: y²+y=x³−x²−10x−20`, at 19 the point count is 20, so
  `a₁₉=0`. The cohomological crystalline polynomial `X²+19` has slopes `1/2,1/2` and
  supplies no unit-root ordinary refinement. Its weight-two crystalline
  branch has trivial inertial type and remains available. The residual
  polynomial at 2 has discriminant `−4=15` modulo 19, a nonsquare;
  irreducibility and oddness give the required absolute residual irreducibility.
- At 3 the same curve has 5 points, so `a₃=−1`; `X²+X+3` has slopes 0,1.
  The unit-root refinement is admitted, with subcharacter `χ₃δ⁻¹` and
  unramified quotient `δ`. On inertia the residual characters are `χ̄₃,1`,
  so an element with values `−1,1` has unit difference `−2` in `ℤ₃`.
- For `r(g)=diag(a,b)` with `a−b` a unit, the displayed projector is
  `diag(1,0)`; its image and quotient both have rank one. If `a=b=1`, its
  denominator is zero and the construction is unavailable. A coincident
  residual pair is handled by the flag space, not this formula.
- Over `O[ε]/ε²`, an ideal generated by `ε` vanishes at every field point
  but not on the generic algebra `Frac(O)[ε]/ε²`. Flatness detects `ε≠0`;
  replacing the generic algebra by its reduced quotient loses this test.
- At a good weight-two crystalline place, the cohomological degrees are 0,1
  and those of `r_A` are 0,−1. A Hodge type with both degrees zero has
  filtration multiplicities `(2,0)` instead of `(1,1)` and cannot be selected.

### Examples

On the 11a1 old space at level 88, the `T₂` factor has relation
`u²(u²+2u+2)=0`. The nonzero class `u(u²+2u+2)` has square zero. Thus an integral
Hecke-family statement reconstructed from reduced field points loses data.
Likewise over `k[ε]/ε²` the matrix `diag(1+ε,1)` has determinant `1+ε`, invisible in
the residual field.

The type-`Σ` example with residual `57B` mod 3 and `Σ=∅` has coefficient ring
`{(x,y)∈ℤ₃²:x≡y mod 3}`. It is local and reduced, but is not a product of
coefficient fields. Its particular finite congruence quotients embed in
products of eigenform quotients; an arbitrary Artinian Hecke quotient need not.

### Dependencies

Layers 1, 3, 4 and 5; ModularCurvesPartII Layers 13–17; TauCetiRoadmap.ModularForms; AlgebraicModularFormsAndSerreWeights Layers 2 and 5, §7.3; HilbertModularVarietiesAndShimuraCurves R18.4; TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §1.3 and §4.1; LocalGaloisDeformationRings §§1.7–1.9, 3.1–3.7, 4.1, 8.6 and GlobalGaloisDeformations §3.4.

## Layer 7: Compatible systems and large images

### 7.1 The compatible-system carrier and operations

Use the shared raw compatible-system carrier of
SmallRamificationAndAbelianVarietyBaseCases §5.0d and its raw operations for arbitrary number fields and positive ranks. Its
coefficient field `M` is a field of good polynomials, and each
continuous semisimple member has a specified finite realization field
`L_λ/M_λ` and coefficient embedding. Descent to `M_λ` is not a field of the
carrier. It also records the base field, rank, bad set and labelled Hodge
multisets, without asserting any compatibility. Reuse the owner's operations
and identity/composition laws. For rank two
over `ℚ` with chosen `E_λ`-models, these data recover the five-tuple of
[Dieulefait–Pacetti](https://arxiv.org/pdf/2108.07577v2), Definition 1.10,
pp. 6–7; labelled multisets extend its parallel `{0,k−1}` field to the Hilbert
application.

On this shared carrier use AutomorphicGaloisRepresentationsPartII AG2.P's
`Weak` and `Strict` predicates. The supplied `Weak` predicate requires good-place
unramifiedness and the polynomial identity away from the coefficient characteristic, de Rhamness at
every `v|ℓ_λ`, the specified labelled degrees, and crystallinity at good `v|ℓ_λ`.
The supplied `Strict` predicate adds a coefficient-field-independent
Frobenius-semisimple WD parameter at every finite `v`, with its monodromy operator
retained, comparing `D_pst` when `v|ℓ_λ`. The parameter may be specified over `Ē` with
its field of definition; an `E`-rational isomorphism class need not have a model
over `E`. Enlarge `E` once when a model is needed. Semisimplifying the entire WD
representation would incorrectly discard Steinberg monodromy.

For a rank-two datum after specified coefficient extension to `E`, define
chosen Hilbert realization data as additional choices of continuous `E_λ`-models
`V_λ` and equivariant identifications of their scalar extensions with the
supplied members over a common algebraic closure, for every `λ` and coefficient
embedding. It contains no second polynomial, bad-set or Hodge data. The
existence of such choices is stronger than `E`-rationality of good polynomials;
it does not assert descent to the minimal rationality field. The model for
our fixed Hilbert family is `V_λ=ρ_{π,λ}`. No canonical basis or intertwiner is
part of the assertion. The Hodge labels use the `D_HT` grading with `ε` of degree
`−1`, and the member is `ρ`, rather than its arithmetic dual or `σ_Carayol`.

(Source: SmallRamificationAndAbelianVarietyBaseCases §5.0d, shared raw data
and operations; ACC+, §7.1, pp. 1084–1086;
AutomorphicGaloisRepresentationsPartII AG2.P, “Arbitrary-rank
compatible data and operations”, for the predicates, and AG2.6, “Strong coefficient field”;
Carayol Theorem A, printed pp. 410–411, for finite `E_λ`-realizations.)

For rank two define almost-strict compatibility by weak compatibility and a
common WD parameter, imposing the strict comparison at every pair `(v,λ)` except
when `v|ℓ_λ`, the global residual representation at `λ` is reducible, and either
`ℓ_λ=2` or the common WD parameter at `v` is ramified. Thus at an odd unramified
coefficient prime comparison is still required. For `F=ℚ` this is exactly the
exception of Definition 1.10; the displayed pairwise condition defines its
extension to a general `F`. Record the omitted pairs; no existence theorem for
almost-strict systems over general `F` is asserted by this definition. Strict
compatibility implies almost strict, which implies weak. The finite-exception
WD condition on §5.0d's arithmetic compatible family is a different
predicate: using that specialization here requires the chosen models and
every comparison at a non-omitted pair, including pairs at coefficient places
in its finite exceptional set.

Use SmallRamificationAndAbelianVarietyBaseCases §5.0d's coefficient extension,
direct sum, tensor product, dual, Tate twist and finite base restriction;
tensor with AG2.0's rank-one family
for an algebraic-character twist. Transport coefficient
conjugation with the specified field embedding. Polynomials are
computed from roots or exterior powers without choosing an ordering; dual roots
are inverse roots, and `ε_ℓ^m` twists geometric roots by `q_v^{−m}`. Hodge degrees
negate under duality, add under tensor product and shift by `−m` under `ε_ℓ^m`.
Pullback to `F′` uses the appropriate residue-degree power of Frobenius and base
change of the local WD parameter; retain finite ramification in the new `S`.
Use AG2.P's preservation of `Weak` and `Strict` on these operations, with the new rank,
Hodge multisets and bad set. Character twists use a compatible
rank-one algebraic-character family, and its ramified places enter `S`.
Almost-strict compatibility is a rank-two predicate: direct sum or tensor
product of two rank-two systems has rank four and is outside its domain.
For operations whose output still has rank two, prove almost-strict
compatibility only when each required output pair is inherited from a required
input comparison, or its comparison is supplied separately. In particular,
finite restriction or a ramified character twist can turn a ramified common
parameter into an unramified one at an odd coefficient prime with reducible
residual representation; the formerly omitted comparison is then required.
Coefficient extension, duality and conjugation retain the omitted-pair
bookkeeping. No potential modularity theorem is used to define the carrier or
any operation. Prove transport of these chosen realizations: whenever a
supplied operation has rank-two output, extension of scalars identifies the
operation on the chosen models with that output's supplied member. Use the
supplied member comparison, including semilinear coefficient embeddings,
with identity/composition compatibility; this is model transport over the
existing operations. It creates neither a new operation API nor a descent
claim for the raw carrier. Transport `Weak` and `Strict` along these actual
isomorphisms, and transport almost-strict comparisons only on the pairs
specified above.

Reuse that supplier's convention adapters: a geometric polynomial `P` of degree
`n` with `P(0)≠0` becomes `X^n P(1/X)/P(0)` at arithmetic Frobenius. In the WD
parameter invert the Frobenius matrix, retain inertia and `N`, and invert the Frobenius–`N`
conjugation factor. Changing the numerical Hodge-sign convention negates the
labels. These adapters describe the same representation; duality changes it.
For models with a marked abelian realization, use its §5.1 isogeny and base-change
transports of the chosen coefficient action before identifying `λ`-factors.

*Needs:* SmallRamificationAndAbelianVarietyBaseCases §§5.0d–5.1, raw carrier, operations, convention adapters and marked transports; AutomorphicGaloisRepresentationsPartII AG2.P, “Arbitrary-rank compatible data and operations”, compatibility predicates and preservation; ArithmeticGaloisRepresentations Layers 1–2, continuous semisimple
carriers, local WD functors and their tensor/dual laws; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P7.1–R07.P7.3,
labelled period functors; AutomorphicGaloisRepresentationsPartII AG2.0,
algebraic-character avatars; Layer 3's geometric-character theorem.

- The raw compatible-system carrier supplied by SmallRamificationAndAbelianVarietyBaseCases §5.0d.
- The weak and strict compatibility predicates supplied by AG2.P on that same carrier.
- Chosen rank-two `E_λ`-models over that carrier, with scalar-extension comparisons for the supplied operations.
- The rank-two predicate defined here with the omitted coefficient-prime pairs above.
- For a rank-two output, require comparisons at every output pair not covered by a required input comparison; an omitted input pair alone supplies no comparison.
- Preserve all weaker clauses without asserting their converses.

**Checks.**

- The trivial rank-one family has `P_v=X−1`, degree `0, N=0` everywhere and satisfies the strict predicate.
- The classical arithmetic cyclotomic family, read at geometric Frobenius, has `P_v=X−q_v⁻¹` and degree `−1`; its dual has `P_v=X−q_v` and degree 1.
- A weight-two Steinberg member has `N≠0`; replacing its WD module by the direct sum of its two characters fails strict compatibility although the Frobenius polynomial is unchanged.
- An arbitrary list of semisimple members with unrelated good polynomials inhabits the data carrier but fails weak compatibility.
- A member realized only over `L_λ/M_λ` remains valid shared data; its `M`-valued good polynomials alone do not provide an `M_λ`-model or chosen Hilbert realization data over `M`.
- Dualizing the chosen `Δ` model negates degrees `(0,11)` to `(0,−11)` and inverts geometric roots. An arithmetic-dual model cannot represent the same normalized shared member without that conversion.
- Extension `E⊆E′⊆E″` transports a chosen model and its comparison identically to direct extension `E⊆E″`; all scalar maps use the chosen coefficient embeddings.
- At a coefficient prime with reducible residual representation, the almost-strict exception does not authorize dropping the de Rham or good-prime crystalline clauses.
- At an odd unramified coefficient prime with reducible reduction, membership in the finite exceptional set of §5.0d's arithmetic compatible family does not remove the WD comparison required by almost-strict compatibility.
- For an elliptic Tate-module family at good `q`, the geometric polynomial `X²−(a_q/q)X+1/q` becomes `X²−a_qX+q` under the reciprocal adapter. Changing Hodge-sign convention sends its labels `{0,−1}` to `{0,1}` while keeping the same Tate module.
- The direct sum and tensor product of two rank-two systems have rank four; neither is an instance of the rank-two almost-strict predicate.
- At an odd coefficient prime with reducible residual representation, restrict a finite ramified scalar WD character to an extension that kills it, or twist by its inverse. The resulting unramified common parameter requires a coefficient-prime comparison that the original almost-strict hypothesis could omit.

### 7.2 Purity of the entire family

For the unrestricted Hilbert representation, the Frobenius-semisimple local parameter at every finite place is pure of weight `w+1`, including `D_pst` at the coefficient prime. Combine Ramanujan–Petersson with full local–global compatibility on both sides of the coefficient characteristic. If `N=0` all eigenvalues have the weight `w+1`. If `N≠0`, the monodromy kernel and cokernel have weights `w` and `w+2`. Distinguish this theorem from the narrower Saito geometric weight input: it does not acquire that input's degree or discrete-series hypotheses.

*Needs:* [4.4 All-Hilbert compatibility away from `λ`](#44-all-hilbert-compatibility-away-from-λ); [4.7 Skinner's full coefficient-prime theorem](#47-skinners-full-coefficient-prime-theorem); [4.2 Hilbert Ramanujan–Petersson](#42-hilbert-ramanujanpetersson); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); `ArithmeticGaloisRepresentations:§§2.1–2.6`; `GL2AutomorphicRepresentationsAndTransfer:R16.3`.

See [Don Blasius](https://arxiv.org/pdf/math/0511007v1) — Corollary 7, p. 20; [Don Blasius](https://arxiv.org/pdf/math/0511007v1) — Proposition 5, p. 16; [Takeshi Saito](https://www.ms.u-tokyo.ac.jp/~t-saito/pp/weightmonodromy.pdf) — Theorem 1, printed p. 429 (page image).

### 7.3 The fixed-eigenform compatible family

Use the supplied compatible-system carrier of §7.1 over one sufficiently large coefficient field `E`, with chosen Hilbert realization data given by the constructed `E_λ`-models and their scalar-extension identifications. Its `λ`-member is `ρ_{π,λ}`, its bad set is `S_π`, its good polynomial is `P_v∈E[X]`, its labelled degrees are the fixed pair above, and at every finite `v` its local parameter is `Rec_v(π_v⊗|·|⁻¹/²)`, with `N` retained. Full coefficient-prime compatibility together with away-prime compatibility proves strict compatibility; Ramanujan gives purity of weight `w+1`. Good polynomials alone do not establish `Weak`; its de Rham, labelled-degree and good coefficient-prime crystalline clauses must also be supplied. Kisin alone covers the residually absolutely irreducible coefficient primes and Saito alone his geometric range. Weight-one finite-image systems use their Artin construction, not this regular-weight carrier instance.

*Needs:* [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation); [4.4 All-Hilbert compatibility away from `λ`](#44-all-hilbert-compatibility-away-from-λ); [4.7 Skinner's full coefficient-prime theorem](#47-skinners-full-coefficient-prime-theorem); [7.2 Purity of the entire family](#72-purity-of-the-entire-family); [7.1 The compatible-system carrier and operations](#71-the-compatible-system-carrier-and-operations).

See [Luis Victor Dieulefait and Ariel Martin Pacetti](https://arxiv.org/pdf/2108.07577v2) — Definition 1.10 and following paragraph, pp. 6–7; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Theorem 1 and equation (1), p. 242.

Use the carrier and predicates of §7.1. There is no requirement that weak compatibility or potential modularity furnish this family: each member is the attached eigenform representation already constructed, and the local comparisons fill the strict predicate.


- The compatible family `{ρ_{π,λ}}_λ` over one coefficient field `E` with ramification set `S_π`.
- Its `λ`-member is `ρ_{π,λ}` of [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor).
- `P_v(X) = X² − t_vX + q_vs_v ∈ E[X]` for `v ∉ S_π`.
- At every finite `v` the parameter `ιRec_v(π_v ⊗ |·|_v^{−1/2})`, with `N`.
- Enlarging `E` or conjugating by `σ ∈ Aut(ℂ)` gives the family of `π^σ`.
- The family satisfies the strict predicate of §7.1 and is pure of weight `w + 1`.

**Checks.**

- For `Δ` (infinity type `(12,10)`): `P₂(X) = X² + 24X + 2048` for every `λ ∤ 2`, and the family is pure of weight 11.
- For 11a1 at `v = 11` the parameter is the twist of Steinberg with `N ≠ 0`, for every `λ ∤ 11`, and agrees with the Tate-curve representation `H¹_ét`.
- Good polynomials together with all clauses of `Weak`, without proved bad-place and coefficient-prime WD comparisons, do not establish `Strict`.
- For `d` even and `π` principal series everywhere the strict family still exists; it does not rely on a discrete-series place.

### 7.4 Dimitrov's residual large image

For a fixed regular non-CM Hilbert form, exclude a finite set of rational characteristics depending on the form, coefficient field, level and weights. For every remaining relevant `λ|ℓ`, after conjugacy its residual image contains `SL₂(𝔽_q)` for a finite subfield `𝔽_q⊆κ_λ` and lies in `κ_λ×GL₂(𝔽_q)`. In particular it contains a conjugate of `SL₂(𝔽_ℓ)`. Apply §1.5a at `v|ℓ` with `F_v/ℚ_ℓ` unramified, with the labelled degrees in a common safe interval after the recorded integral Tate twist, and retain both possible tame niveaux `f` and `2f`. Retain the coefficient embeddings and sufficiently large tame-inertia weight conditions used in the exclusions. The conclusion is a large subgroup with its subfield structure, not the entire `GL₂(κ_λ)`.

*Needs:* [3.15 The CM predicate](#315-the-cm-predicate); [3.14 Determinant, total oddness and absolute irreducibility](#314-determinant-total-oddness-and-absolute-irreducibility); `ArithmeticGaloisRepresentations:Layer 4; §§5.12, 7.6–7.7`; [1.5a Coefficients and labelled Fontaine–Laffaille comparison](#15a-coefficients-and-labelled-fontainelaffaille-comparison); [7.3 The fixed-eigenform compatible family](#73-the-fixed-eigenform-compatible-family).

See [Mladen Dimitrov](https://arxiv.org/pdf/math/0411152v1) — Proposition 3.1, p. 22; Proposition 3.5, p. 24; Proposition 3.8, p. 25; [James Newton and Jack A. Thorne](https://arxiv.org/pdf/2212.03595v2) — Proof of Lemma 5.7, printed p. 41.

### 7.5 Ribet–Momose classical large image

For a fixed non-CM classical cusp newform `k≥2`, the characteristic-zero Zariski closure contains `SL₂` over the algebraic closure for every `λ`. Residual absolute irreducibility holds outside a finite set of `λ`; residual image contains a conjugate of `SL₂(𝔽_ℓ)` outside a finite set of rational `ℓ`, including the sufficiently large split primes used by symmetric-power applications. Preserve the inner-twist fixed field and quaternion algebra in the open-image formulation. These can constrain coefficients and determinants, so full `GL₂(O_{K,λ})` is not the general conclusion.

*Needs:* [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation); [3.15 The CM predicate](#315-the-cm-predicate); `ArithmeticGaloisRepresentations:Layer 4; §§5.12, 7.6–7.7`; [7.3 The fixed-eigenform compatible family](#73-the-fixed-eigenform-compatible-family); [4.8 Classical characteristic-zero irreducibility](#48-classical-characteristic-zero-irreducibility); [6.4 Classical conductors and bad Euler factors](#64-classical-conductors-and-bad-euler-factors); [1.5a Coefficients and labelled Fontaine–Laffaille comparison](#15a-coefficients-and-labelled-fontainelaffaille-comparison).

See [Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/rankin.pdf) — Theorem 2.1 pp. 188–190; §3 and Theorem 3.1 pp. 190–192; [James Newton and Jack A. Thorne](https://arxiv.org/pdf/2009.07180v2) — Proof of Theorem 3.1, printed p. 26.

### 7.6 Residual ramification at the fixed squarefree level

Fix a non-CM weight-two newform `f` of squarefree level `N` and trivial character.
For every sufficiently large rational `p` and every `λ|p`, prove that `ρ̄_{f,λ}` is
ramified at every `q|N`. First choose `p≥5` outside the level and exceptional
residual-reducibility set. If a reduction is unramified at `q`, use the
weight-two squarefree-level lowering theorem with `q≠p` and absolute residual
irreducibility to obtain a weight-two form of level dividing `N/q` with the same
prime-to-`Np` residual eigensystem. Only finitely many newforms occur at those
divisor levels. Congruence to one of them at infinitely many coefficient primes
forces equality of every fixed good coefficient, and strong multiplicity one
contradicts `f`'s conductor `N`. This is the argument of
[Skinner](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf),
§3, printed p. 350.

Apply SerreWeightAndLevelOptimisation §2.10 to obtain the public
squarefree level lowering wrapper in this weight-two, trivial-character
setting. The wrapper requires only `p≥3`, `p∤N`, `q|N`, squarefree `N`,
absolute residual irreducibility and unramifiedness at `q`: set `M=N/q`, so
`q∤Mp`. It returns a weight-two trivial-character cuspidal eigenform `g` at
level `M`, coefficient embeddings `E_f→L` and `E_g→L` into a common number
field, a prime `μ|p` of `L` restricting to the chosen `λ` of `E_f`, and an
isomorphism of the two semisimplified residual representations over `κ_μ`.
Here `ν` is the restriction of `μ` to `E_g`, and both residual representations
are extended along `κ_λ→κ_μ` and `κ_ν→κ_μ`, respectively. Passing to the
primitive associate gives a newform of level dividing `M`. The lowering theorem
and its residual-support proof belong to the supplier. Prove the finite-newform
and strong-multiplicity-one deduction of fixed-form residual ramification
here. The theorem is
not inferred from semisimplification of the characteristic-zero local parameter:
a nontrivial integral extension can become split after reduction at finitely
many `λ`. The output is uniform over all `λ` above a sufficiently large `p` and over
the finite set of `q|N`.

*Needs:* SerreWeightAndLevelOptimisation §2.10; Layer 7's Ribet–Momose finite
residual exception set; Layer 6's residual representations and classical
conductor theorem; TauCetiRoadmap.ModularForms Layer 4, finiteness at fixed weight and
bounded level; GL2AutomorphicRepresentationsAndTransfer R16.6, strong multiplicity
one.

- Produce one rational bound working for every `λ|p` and `q|N`.
- Specialize the supplied theorem with `M=N/q`, returning the lower-level eigenform, coefficient embeddings and residual isomorphism for odd `p∤N` under absolute residual irreducibility and unramifiedness at `q`.

**Checks.**

- For level 11 the only proper divisor level is 1, whose weight-two cusp space is zero; this rules out an unramified residual representation at 11 once the hypotheses hold.
- The bound excludes the finite residual-reducibility set; the reducible mod-5 representation of 11a1 cannot be used as a counterexample.
- For squarefree `N` and `q|N`, the adapter still applies when `q≡1` or `q≡−1` modulo the odd coefficient prime `p`, provided `p∤N` and the residual hypotheses hold; it uses no residual multiplicity-one assumption.
- Level `p` or nonsquarefree `N` does not satisfy this target and cannot be inserted without new local hypotheses.

### 7.7 Density-one ordinary primes for the fixed weight-two form

Fix a non-CM weight-two newform of squarefree level `N` and trivial nebentypus. The rational primes `p∤N` at which some `λ|p` is ordinary have density one. For all sufficiently large such rational primes, every `λ|p` has absolutely irreducible residual representation ramified at each `q|N`. The norm/trace-zero density argument provides ordinarity; large image supplies irreducibility and level lowering supplies ramification. Thus one can choose `p≥5` and an ordinary `λ` while retaining all residual conditions. Preserve the different “some `λ`” and “every `λ`” quantifiers, and exclude the finite coefficient-ramification and small-prime exceptions.

*Needs:* [7.5 Ribet–Momose classical large image](#75-ribetmomose-classical-large-image); `ArithmeticGaloisRepresentations:Layer 5`; [7.6 Residual ramification at the fixed squarefree level](#76-residual-ramification-at-the-fixed-squarefree-level); `GL2AutomorphicRepresentationsAndTransfer:§R16.4.4`; [7.3 The fixed-eigenform compatible family](#73-the-fixed-eigenform-compatible-family).

See [Christopher Skinner](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf) — §3, p. 350, first three paragraphs; [Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/rankin.pdf) — Theorem 2.1, pp. 188–190.

Suggested.lean states the density conclusion as
`fixedSquarefreeForm_ordinary_density_one`, using `HeckeRing.GL2.Newform N 2`
with squarefree `N` and trivial nebentypus. These hypotheses exclude CM.
The definition `ordinaryGoodPrimes` uses the native coefficient field
`TauCeti.CoefficientField f`: a good rational prime `p` belongs when the integral
coefficient `a_p` lies outside some nonzero prime ideal above `p`. Rational
primes are represented by the nonzero prime ideals of `𝓞 ℚ`, with `p` their
absolute norm. The conclusion uses `NumberField.Set.HasNaturalDensity` with
value 1. The residual irreducibility and ramification conclusions require the
attached residual representations specified in §§6.2 and 7.6.

**Checks.**

- For 11a1, whose coefficient field is `ℚ`, the good prime 3 has `a₃=−1`, a unit; `−1∉(3)`, so 3 belongs to `ordinaryGoodPrimes`.
- For 11a1 the good prime 19 has `a₁₉=0`, and `0∈(19)` at the only coefficient prime above 19; the existential over `λ` fails and 19 does not belong.
- For 11a1 the Steinberg prime 11 has the unit coefficient `a₁₁=1`, but `11∣N`, so the bad-prime clause excludes 11 from the set.

### Examples

For a fixed non-CM weight-two form and a sufficiently large unramified
`p`, if every `λ|p` is nonordinary then the integral `a_p` has norm divisible by
`p^[E:ℚ]`. The Ramanujan bound makes a nonzero norm impossible for `p>4`, so
`a_p=0`. Trace-zero density zero then gives ordinary primes of density one,
with at least one ordinary `λ` above each such rational prime; it does not say
that every `λ` is ordinary.

A CM form has trace zero at inert primes and fails that non-CM conclusion.
The strict compatible family still exists for CM forms. At a bad Steinberg
place its common WD parameter retains `N≠0`, unlike a list of good polynomials.

### Dependencies

Layers 1, 3, 4 and 6; SmallRamificationAndAbelianVarietyBaseCases §§5.0d–5.1; AutomorphicGaloisRepresentationsPartII AG2.P, compatibility predicates and preservation; ArithmeticGaloisRepresentations Layers 2, 4 and 5; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3; modular newform and local inertia contracts; generic `p`-adic analytic Chebotarev with the stated trace-zero hypothesis.


## Downstream consumers

Serre-weight and level optimization use the attached residual representation,
the explicit endpoint boundary and the weight-two optimization interface.
Ordinary modularity lifting uses the specified ordinary line, saturated lattice
and exact graded characters. Potential modularity and compatible systems use
the common carrier and operations, the strict fixed-eigenform family and the
geometric-character converse. Generalized Heegner cycles use the Kuga–Sato
realization, coefficient projector and fixed rational/integral period lines.
Crystalline regulators and explicit reciprocity use the actual Wach module and
semilinear Frobenius with the chosen lattice. Modular and Hilbert deformation
arguments use the whole integral Hecke determinant and the exact local-functor
factorizations, including nilpotent quotients. SmallRamificationAndAbelianVarietyBaseCases §5.0d
supplies the shared raw compatible-system carrier and operations; AG2.P supplies its weak and strict predicates. Its independent
rank-two period input has the scope stated above.


## References

Citations above use printed journal pages for the published scans and internal pages for the specified author or arXiv versions. Those are different from the published page ranges when an author version is used.

- [Pierre Deligne and Jean-Pierre Serre, *Formes modulaires de poids 1*](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf). Ann. Sci. École Norm. Sup. (4) 7 (1974), 507–530; printed journal pages in the Numdam scan.
- [Pierre Deligne, *Formes modulaires et representations l-adiques*](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf). Séminaire Bourbaki, 1968/69, exposé 355, published 1971, 139–172; printed pages in the Numdam scan.
- [Henri Carayol, *Sur les representations l-adiques associees aux formes modulaires de Hilbert*](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf). Ann. Sci. École Norm. Sup. (4) 19 (1986), 409–468; printed journal pages in the Numdam scan.
- [Takeshi Saito, *Hilbert modular forms and p-adic Hodge theory*](https://arxiv.org/pdf/math/0612077v2). arXiv:math/0612077v2 (11 December 2006), internal pages; published in Compositio Math. 145 (2009), 1081–1113.
- [Takeshi Saito, *Modular forms and p-adic Hodge theory*](https://doi.org/10.1007/s002220050175). Invent. Math. 129 (1997), 607–620; cited by theorem number.
- [Gaetan Chenevier, *The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings*](https://arxiv.org/pdf/0809.0415v2). arXiv:0809.0415v2 (18 July 2013), internal pages.
- [Luis Victor Dieulefait and Ariel Martin Pacetti, *A simplified proof of Serre's conjecture*](https://arxiv.org/pdf/2108.07577v2). arXiv:2108.07577v2 (3 May 2022), internal pages.
- [F. Diamond, M. Flach and L. Guo, *Adjoint motives of modular forms and the Tamagawa number conjecture*](https://arxiv.org/pdf/2512.02348v2). arXiv:2512.02348v2 (11 December 2025), internal pages; revised author version of Ann. Sci. École Norm. Sup. 37 (2004), 663–727.
- [H. Darmon, F. Diamond and R. Taylor, *Fermat's Last Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf). Author revision of 9 September 2007, internal pages; article originally published in Current Developments in Mathematics 1995.
- [C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (II)*](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf). Author final version of 30 May 2009, internal pages; published in Invent. Math. 178 (2009), 505–586.
- [C. M. Skinner and A. J. Wiles, *Residually reducible representations and modular forms*](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf). Publ. Math. IHÉS 89 (1999), 5–126; printed journal pages in the Numdam scan.
- [A. J. Scholl, *Motives for modular forms*](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf). Author copy of Invent. Math. 100 (1990), 419–430; internal author-copy pages.
- [Mark Kisin, *Potentially semi-stable deformation rings*](https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf). J. Amer. Math. Soc. 21 (2008), 513–546; printed journal pages in the AMS PDF.
- [Christopher Skinner, *A note on the p-adic Galois representations attached to Hilbert modular forms*](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf). Documenta Math. 14 (2009), 241–258; printed journal pages in the EMS PDF.
- [Mladen Dimitrov, *Galois representations modulo p and cohomology of Hilbert modular varieties*](https://arxiv.org/pdf/math/0411152v1). arXiv:math/0411152v1, internal pages; published in Ann. Sci. École Norm. Sup. 38 (2005), 505–551.
- [Samit Dasgupta and Mahesh Kakde, *On the Brumer–Stark conjecture*](https://math.iisc.ac.in/~maheshkakde/brumerstark.pdf). Author copy of Ann. Math. 197 (2023), 289–388; internal pages.
- [Baskar Balasubramanyam, Eknath Ghate and Vinayak Vatsal, *On local Galois representations associated to ordinary Hilbert modular forms*](https://mathweb.tifr.res.in/~eghate/hilbertCM.pdf). Author copy of Manuscripta Math. 142 (2013), 513–524; internal pages.
- [Takashi Hara and Tadashi Ochiai, *The cyclotomic Iwasawa main conjecture for Hilbert cuspforms with complex multiplication*](https://arxiv.org/pdf/1507.07309v2). arXiv:1507.07309v2, internal pages; published in Kyoto J. Math. 58 (2018), 1–100.
- [Kenneth A. Ribet, *On l-adic representations attached to modular forms*](https://math.berkeley.edu/~ribet/Articles/invent_28.pdf). Invent. Math. 28 (1975), 245–275; printed journal pages in the author-hosted scan.
- [Kenneth A. Ribet, *On l-adic representations attached to modular forms II*](https://math.berkeley.edu/~ribet/Articles/rankin.pdf). Glasgow Math. J. 27 (1985), 185–194; printed journal pages in the author-hosted scan.
- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, *Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1*](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf). Author copy GPW5, internal pages 43–45 for the Shimura-curve comparison.
- [James Newton and Jack A. Thorne, *Symmetric power functoriality for holomorphic modular forms, II*](https://arxiv.org/pdf/2009.07180v2). arXiv:2009.07180v2, internal pages; published in Publ. Math. IHÉS 134 (2021), 117–152.
- [James Newton and Jack A. Thorne, *Symmetric power functoriality for Hilbert modular forms*](https://arxiv.org/pdf/2212.03595v2). arXiv:2212.03595v2 (19 February 2025), internal pages; published in Ann. Math. 203 (2026), no. 1.
- [Christopher Skinner, *A converse to a theorem of Gross, Zagier, and Kolyvagin*](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf). Ann. Math. 191 (2020), 329–354; printed journal pages in the published PDF.
- [Don Blasius, *Hilbert modular forms and the Ramanujan conjecture*](https://arxiv.org/pdf/math/0511007v1). arXiv:math/0511007v1 (1 November 2005), internal pages; published in Noncommutative Geometry and Number Theory, Aspects Math. E37 (2006), 35–56.
- [Takeshi Saito, *Weight-monodromy conjecture for `ℓ`-adic representations associated to modular forms. A supplement to the paper [10]*](https://www.ms.u-tokyo.ac.jp/~t-saito/pp/weightmonodromy.pdf). The Arithmetic and Geometry of Algebraic Cycles (2000), 427–431; printed pages in the author-hosted scan.

- [Brian Conrad, algebraic Hecke-character seminar notes](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/algebraicHeckecharacters.pdf), the second Lemma 1, internal pp. 9–10; local algebraicity and the global converse are distinguished.

- [Brian Conrad, *Lifting global representations with local properties*](https://math.stanford.edu/~conrad/papers/locchar.pdf). Author copy, internal pages; Appendix B, Definition B.1 p. 32, Propositions B.3–B.4 pp. 33–36 and Example B.5 p. 36.
- [Pierre Colmez and Jean-Marc Fontaine, *Construction des représentations p-adiques semi-stables*](https://webusers.imj-prg.fr/~pierre.colmez/CF.pdf). Author copy, internal pages; Theorem A p. 2, §3.4 pp. 21–22, Proposition 4.2 p. 23 and Proposition 4.4 p. 24.

- [Laurent Berger, *Limites de représentations cristallines*](https://arxiv.org/pdf/math/0201262v2). arXiv:math/0201262v2; §2.1, Theorems 3.5 and 5.1.
- [Kevin Buzzard, *Eigenvarieties*](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf). Author manuscript, internal pages: §5, Lemmas 5.4–5.6, Construction 5.7 and Lemmas 5.9–5.10, pp. 33–42; §§9–10, p. 70, for weights and their dictionary; §10, pp. 70–73; Proposition 11.1, p. 75; Lemmas 12.1–12.2, pp. 78–79; Lemma 13.1, pp. 79–80.
- [Kevin Buzzard, *On p-adic families of automorphic forms*](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/GL1.pdf). Author manuscript of 12 October 2004, internal pages; §7, pp. 18–19, Bol's identity, the theta–Hecke relation and Proposition 4.
- Daniel Jacobs, *Slopes of compact Hecke operators*, PhD thesis, Imperial College London (2003); §1.5, Definition 1.27 and equation (1.5.13), p. 19, and §1.6, pp. 20–21.
- [Jean-Pierre Wintenberger, *Propriétés du groupe tannakien des structures de Hodge p-adiques et torseur entre cohomologies cristalline et étale*](https://www.numdam.org/article/AIF_1997__47_5_1289_0.pdf). Ann. Inst. Fourier 47 (1997); Theorem 2.2.2, pp. 1310–1311.
