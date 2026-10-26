# Roadmap: commutative algebra for deformation theory and patching

**Summary.** Build the local algebra that turns deformation rings and families of finite complexes into freeness, Cohen–Macaulayness and support statements. The construction starts with ordinary adic graded modules and labelled complete local coefficients, passes through minimal presentations, duality and Hilbert–Samuel multiplicity, and ends with simultaneous patching of perfect complexes and their actions. Its principal conclusions are the balanced module patching theorem, Cohen–Macaulay concentration from codimension and Tor amplitude, compatibility of patching with canonical duality, and transport of support between paired systems. The geometry or arithmetic that supplies a deformation problem, a complex, a dimension bound or a comparison between two systems remains an explicit input.

## Scope and ownership

This is Part I. It owns coefficient-category adapters, relative local presentations and their relation spaces; the commutative algebra needed to use finite actions; canonical CM duals and explicit duality comparisons; graded Hilbert series and multiplicity comparisons on the shared Hilbert–Samuel polynomial; the algebraic finiteness and point arguments for complete local rings; balanced module patching; component and specialization comparisons; finite-order approximation and coefficient comparisons; and the simultaneous patching and support arguments themselves.

The following boundaries are part of the specification. They prevent two constructions with the same mathematical meaning from acquiring incompatible APIs.

- `GroebnerGeometry` G4 owns the ordinary ideal-power associated-graded ring on native direct sums and quotients, including multiplication, homogeneous classes, induced maps and generator/coefficient-change maps. Sections 1.1–1.2 here construct its ordinary-Rees-quotient and coordinate comparisons, preserving those classes and maps.
- `SchemeAndStackFoundations` §0.17 owns depth, its residue-Ext comparison, Cohen–Macaulay modules and rings, Serre conditions and flat-local depth formulas; its geometric layers own catenarity, excellence and their scheme forms. Layer 4 owns abstract deformation functors, smooth transformations, hulls and Schlessinger's criterion. Here the new content is their labelled coefficient comparison, presentations, relation-obstruction bound and concrete framed matrix realization. Layer 2 owns scheme cohomology and both affine and scheme dualizing complexes: its coherent-duality targets `Coherent.DualizingComplex` and `Coherent.NormalizedDualizing` include homothety, biduality, normalization and finite-local pushforward. Layer 5 owns geometric cycle carriers and Chow specialization for its stated geometric hypotheses.
- `PadicLocalLanglandsForGL2Qp` §0.4 owns the continuous framed lifting functor of a profinite group and its chosen representing pair `(R^□,ρ^□)` with the actual universal lift, together with the unique universal-lift-preserving comparison of two presentations. Its §0.5 owns affine module cycles `moduleCycle d M` on the native cycle carrier of `Spec A`, their uniformizer specialization `moduleCycle_specialization` with its agreement theorem, the module-relative Hilbert–Samuel polynomial for an ideal of definition, the dimension-normalized multiplicity and the associativity formula. Here §2.7 compares the matrix presentation of §2.6 with that pair; §§3.11–3.12 add the graded Hilbert series, the degree and scaling theorems and the completion and finite-map comparisons on the shared polynomial; §6.7 adds the generic/special-component applications.
- `ModularCurves`, §§4D and 7D, owns its completion/regularity and finite-map miracle-flatness statements, and its Witt-vector test algebras and elliptic deformation problem. Only adapters to the more general finite-module or arbitrary labelled-coefficient setting occur here.
- `AdicSpacesPartII` §R0.1b owns Noetherianity of adically complete rings and adic completions. Its §R0.3 owns completed tensor products along adic structure maps and their topological universal property; the comparison here uses that supplier only when the coefficient maps are adic. The construction here identifies the complete-local coproduct, its joint formal presentation, residue field, cotangent space and finite-module comparisons. `PadicMeasuresIwasawaAlgebras` Layer 1 owns completed group algebras and their augmentation maps. Section 7.5 here constructs the completed-direct-sum/restricted-coefficient comparison and complete-flat models over complete Noetherian local rings, including DVRs. The finite group-algebra coefficient duality is supplied by `TauCeti.MonoidAlgebra.dualLinearEquiv` in `TauCeti.Algebra.MonoidAlgebra.Dual`.
- `DerivedModuleAlgebra` §§0.2, 1.1.1, 1.3–1.5, 1.E.0–1.E.1, 0.K.1 and 1.T owns native module-derived tensor and Hom, K-flat replacements, perfectness, pseudo-coherence, all-module Tor amplitude, cotangent and Koszul complexes, strict linear towers, Milnor sequences, derived completion and effectivity of compatible perfect systems. Its §§1.M.1–1.M.2 own Matlis duality, including arbitrary residue fields and completion. Here the extra content is finite-order approximation, chosen minimal chain representatives, signed representative comparisons and compatible actions on those towers. `EnhancedDerivedSheaves` §§E1.1, E1.3 and E1.8 supplies the geometric enhancement and affine comparison; §E1.6 supplies regular homological dimension and Kunz's criterion.
- `IntegralHeckeAndGaloisDeterminants`, Layer 2, supplies bounded finite-cohomology Hom finiteness, ghost nilpotence, derived idempotent splitting and finite complete-local factor decomposition, as well as finite derived Hecke images. We consume those actions. We neither reconstruct Hecke operators nor turn an action in a derived category into an unproved strict chain action.
- `AlgebraicVectorBundles`, Layers 0B–0C, owns finite locally free duals, exterior powers, determinant lines and their affine/pullback comparisons. `PadicMeasuresIwasawaAlgebras` §5.1 supplies determinant exact-sequence, quasi-isomorphism and acyclic comparisons. The extra assertion here is the trivialization of a line bundle admitting a finite free resolution. `GrothendieckEulerForms`, Layer 5, owns finite-support Euler characteristics and their triangle additivity. The extra assertions here concern local multiplicity and finite-action specialization.
- `DGAInfinity` Layer 5 owns its dg perfect envelope and idempotent completion. Only the comparison with bounded finite module complexes and isolated blocks for a finite action is needed here. `LocalFieldsRamification`, Layer 0, supplies integer rings and topologies of finite valued extensions. A ring-theoretic integral point is first constructed algebraically, before making this comparison.
- `DeformationAndDerivedPatchingAlgebraPartII` owns p-standard and secant sequences for Macaulayfication, annihilators of local cohomology used to choose blowup centres, Cohen–Macaulay blowups, strict transforms and Macaulayfication. Its §§K0.1, K0.4–K0.7 also own the Čech/local-cohomology comparison, CM concentration, regularity of secant sequences on CM modules, normalized local duality for finite modules and the Matlis annihilator comparison. Its §K3.1 owns ordinary Rees modules. `ArithmeticGaloisDuality` §D7.1 owns local duality for bounded finite complexes over complete local rings. The extension here is its noncomplete bounded-complex comparison and the ordinary graded quotient of the supplied Rees module.
- This roadmap owns the generic labelled completed coproduct (§1.12), minimal relative presentation and relation-obstruction algebra (§§1.9, 2.1–2.5), fixed-basis matrix presentation (§2.6) and its continuous comparison with PadicLocalLanglandsForGL2Qp §0.4's framed representing pair (§2.7), canonical module/type algebra (§3.9) and pointed tensor-domain comparison (§4.6). Specialization to a coefficient DVR uses these same carriers and maps. Arithmetic tangent and obstruction assignments, local deformation conditions and the graded canonical-module comparison belong to `LocalGaloisDeformationRings`. The framed representing pair itself is PadicLocalLanglandsForGL2Qp §0.4's; an arithmetic representability proof imports that pair, and §2.7 contributes only the identification of the matrix presentation with it.
- Sections 7.3, 7.5 and 7.8 here own the commutative minimal-model, complete-flat basis/matrix/retract and finite-derived-Hom completion comparisons. Their common carriers are the native cochain complex, `IsMinimal` and `CompleteFlatComplex`; application namespaces use aliases to these predicates and specialize the same comparison maps. The downstream interface for `PadicFamilies` §0a.0 is specified below. Ordinary projectors, operator equivariance and their coefficient-tower diagrams belong to that application; generic perfect-system effectivity remains in `DerivedModuleAlgebra` §§1.E.0–1.E.1.
- Galois deformation conditions, Selmer groups, arithmetic tangent and obstruction computations, Taylor–Wiles primes, locally symmetric spaces and automorphy lifting are downstream uses. An obstruction space below is an algebraic lifting interface, not an assertion that a particular Selmer group supplies it.

## Conventions

Rings are commutative with identity unless a group algebra is explicitly used. A local ring is nonzero. Noetherianity, finiteness of a module, completeness, flatness and finiteness of a residue field are separate hypotheses. Write `(A,m,k)` for a local ring with a specified residue map. Fix a complete Noetherian local coefficient ring `Λ` with labelled residue `k`; in the DVR setting write `O`, its uniformizer `π`, fraction field `E`, and residue characteristic `p`. A statement for a complete DVR includes equal characteristic and ramified mixed characteristic unless it explicitly assumes that `E` is a finite extension of `Q_p`. The parameter in formulas is `π`, not necessarily `p`.

Completions are separated adic inverse limits. Powers begin with `I^0=A`; Artinian maximal-ideal truncations are `A/m_A^(n+1)` with `n∈N`, so level `0` is the residue field; statements using `A/m_A^n` specify `n≥1` explicitly. A finite residue field is required when finitely many underlying objects or matrices are selected, not for formal evaluation or for linear compactness of finite modules over a complete local ring. A choice of residue field section, Cohen map, basis, ultrafilter, minimal model or coefficient lift remains visible. None is declared canonical merely because its isomorphism class is determined.

Complexes are cochains: `d:C^i→C^(i+1)` and `C[n]^i=C^(i+n)` with shifted differential `(-1)^n d`. Thus a module in degree `b` is `M[-b]`. On homogeneous tensors,

```text
d(x⊗y)=dx⊗y+(-1)^i x⊗dy,     x∈C^i,
τ(x⊗y)=(-1)^(ij)y⊗x,          y∈D^j,
δ(f)=d_D f-(-1)^n f d_C,       deg(f)=n.
```

The perfect dual has `(C*)^n=Hom_A(C^(-n),A)` and differential `(-1)^(n+1)` times precomposition by `d_C`. Bidual evaluation in degree `n` is `x↦(λ↦(-1)^n λ(x))`. The cone of `f:C→D` has `Cone(f)^n=D^n⊕C^(n+1)` and differential `(y,x)↦(d_D y+f x,-d_C x)`. The tensor-cone comparison therefore signs the shifted summand; it is never an unsigned interchange of factors.

Tor amplitude `[a,b]` tests derived tensor with **every module in degree zero**. Width is `b-a`; the number of possibly nonzero cohomological degrees is `b-a+1`. These give different constants in the codimension inequality and ghost nilpotence. Native homological `Tor_n` occurs in cohomological degree `-n`.

Depth of zero and grade when `IM=M` are `∞`; dimension of the zero module or complex is `-∞`, and the projective dimension of zero is bottom. Numerical equalities involving ordinary integers exclude zero. Use `Module.IsCohenMacaulay` from `SchemeAndStackFoundations` §0.17: the zero module is CM, and for a nonzero finite module over a Noetherian local ring it is equivalent to equality of depth and support dimension. For nonzero finite modules, MCM means that depth equals the ring dimension. Full support is a third condition. A nonzero MCM module over a reducible ring can omit components.

These are PadicLocalLanglandsForGL2Qp §0.5's conventions. For an ideal of definition `I` on a finite module, use the **cumulative** function `H_I(M,n)=length_A(M/I^(n+1)M)`, not the length of the degree `n` graded piece. If the support dimension is `d`, intrinsic multiplicity is `d!` times the coefficient of `X^d` in its eventual rational polynomial. A separate extraction `e_D` uses one common ambient dimension `D`; it is §0.5's dimension-normalized multiplicity at `D` and vanishes on smaller-dimensional modules. Set intrinsic multiplicity of zero to zero. No subtraction of infinite lengths, or coercion of infinity to a natural number, is permitted.

A derived action is an algebra map to `End_D(A)(C)`. A strict action consists of actual chain maps satisfying multiplication on the nose; a cohomology action is weaker. Patching retains the diagrams needed for the chosen kind of action. Paired patching uses one ultrafilter, compatible coefficient maps and the specified residual identifications on rings, complexes and action images.

## Exact supplier contracts

### From Mathlib

At Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, use `Ideal`, `Submodule`, quotient maps, `Localization.AtPrime`, `PrimeSpectrum`, `Module.support`, associated primes, `Module.length` and finite-length additivity. The intended carriers are the native modules, ideals and spectra; set-theoretic support is not replaced by a new spectrum.

`RingTheory.Sequence.IsWeaklyRegular`, `RingTheory.Sequence.IsRegular`, their flat-base-change API, `Module.Flat`, `Module.FaithfullyFlat`, `Module.Projective`, `Module.Free`, `IsRegularLocalRing`, `ringKrullDim`, and `CategoryTheory.projectiveDimension` supply the basic predicates. `ModuleCat.exists_isRegular_tfae` already identifies regular sequences in an ideal with the corresponding finite-module Ext vanishings under `IM<M`; its two directional theorems in `RingTheory.Depth.Rees` are used rather than replanned. In particular `ModuleCat.projectiveDimension_quotSMulTop_eq_succ_of_isSMulRegular` and `ModuleCat.projectiveDimension_quotient_eq_length` are already available; only the missing local comparisons and end formulas are built here.

Use `AdicCompletion`, `AdicCompletion.map_exact`, `IsAdicComplete`, `IsHausdorff`, the adic tensor comparison for finite modules, and `MvPowerSeries.eval₂Hom`, `MvPowerSeries.aeval`, `MvPowerSeries.eval₂_unique`. Formal evaluation is not a new sum of a series. The additional theorem is surjectivity from the labelled relative cotangent generators. `reesAlgebra`, native polynomial modules, `DirectSum`, `GradedAlgebra`, `GradedModule` and their decompositions provide the algebraic carriers for the ordinary adic adapters.

`CochainComplex`, `HomotopyEquiv`, `QuasiIso`, `DerivedCategory`, its localization functor and cohomology, the standard t-structure, projective resolutions, `CochainComplex.isKProjective_of_projective`, `CochainComplex.IsKProjective.quasiIso_iff` and `ChainComplex.quasiIso_iff_of_projective` supply the native homotopical framework. `CategoryTheory.Tor` is used with its left/right comparison stated explicitly. Existing `localCohomology` is the target of the Čech cohomology comparison, rather than a second local-cohomology group definition.

Use native `Ultrafilter`, germs, localization, finite products and cofiltered finite-choice results, `WittVector`, `TrivSqZeroExt`, integral closure, finite field extensions and the existing Weierstrass and integrality tools. For group algebras use the native monoid algebra and the consistently chosen left-module convention.

### From Tau Ceti

At Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, use `TauCeti.ArtinRees.exists_controlled_lift`, the finite-length comparisons in `TauCeti.RingTheory.Length`, finite integral dimension comparison `TauCeti.ringKrullDim_eq_of_isIntegral_of_faithfulSMul`, and `TauCeti.RingTheory.MvPowerSeries.Evaluation` for adic evaluation bounds. `TauCeti.IsInjectiveEnvelope` and `TauCeti.IsInjectiveEnvelope.exists_linearEquiv` in `TauCeti.Algebra.Module.Injective.Envelope.Basic` supply the injective-envelope predicate and uniqueness used when selecting the residue injective hull. `TauCeti.fittingIdeal` in `TauCeti.RingTheory.FittingIdeal.Basic` supplies Fitting ideals of finite modules; `TauCeti.fittingIdeal_baseChange` in `TauCeti.RingTheory.FittingIdeal.BaseChange` supplies arbitrary scalar extension. Their presentation and base-change calculus is consumed in §9.1. `TauCeti.linearHomComplexEnrichedCategory` supplies the linear Hom-complex enrichment and its actual composition signs.

Tau Ceti also supplies `TauCeti.IsRegularLocalRing.isDomain`, `TauCeti.IsRegularLocalRing.quotient_span_singleton`, `TauCeti.IsRegularLocalRing.quotient_span_singleton_iff`, and `TauCeti.IsRegularLocalRing.isDiscreteValuationRing_iff_ringKrullDim_eq_one` in `RingTheory.RegularLocalRing.Basic`. Their hypotheses include regular locality, and the quotient equivalence requires a nonzero element in `m`. These are supplier statements, including the regular-parameter example, rather than new goals.

`TauCeti.RingTheory.ReesAlgebra.Grading` provides the grading of the existing Rees algebra, `reesAlgebra.grade`, `reesAlgebra.isInternal_grade`, its degree-zero equivalence and degree-one generators. `RingTheory.GradedAlgebra.Homogeneous.Quotient` supplies the quotient grading of a homogeneous ideal, and `RingTheory.GradedAlgebra.Completion` supplies its graded-component series map. Below only identification of the **ordinary adic quotient and module**, their native degree pieces and their coefficient-change comparisons are additional. Generic internal-decomposition, orthogonality and homogeneous-quotient machinery is consumed through these interfaces.

`TauCeti.RingTheory.Length` also supplies `Ideal.isFiniteLength_quotient_of_radical_eq_maximalIdeal` for a Noetherian local ring, and `TauCeti.length_self_eq_top_of_ringKrullDim_pos`. The module annihilator and coefficient comparisons below extend these ring-quotient statements.

### From other Tau Ceti roadmaps

The named boundaries above are used with the following precise contracts. A missing extension of a supplier is a prerequisite theorem with the stated mathematical content, never a hypothesis saying that the final conclusion is already true.

- [GroebnerGeometry G4](https://github.com/TauCetiProject/TauCetiRoadmap/pull/899) supplies `Gr_I A=⊕_(n≥0) I^n/I^(n+1)` for every ideal of a commutative ring, its graded `A/I`-algebra structure, homogeneous quotient classes and their zero/product formulas, induced maps with identity/composition, and generator and coefficient-change maps. The carrier of `adicExpansion` in §1.1 is this supplied direct sum. The names in §§1.1–1.2 describe its comparison with the ordinary Rees quotient and transport of the supplied API through that comparison.
- `SchemeAndStackFoundations` §0.17 supplies `Module.depth`, its weak-regular-sequence and residue-Ext comparisons, associated-prime bound, CM localization and flat-local depth formulas, and Serre conditions. Short-exact depth comparisons and regular-local maximal-depth freeness are prerequisite targets in §3.1. Section 4.2 supplies `ArtinLocalAlg`, `CompleteLocalAlg`, `IsSmallExtension` (a surjection with nonzero principal kernel killed by the maximal ideal) and Artinian pullbacks. Sections 4.3–4.5 supply H1–H4, hull existence and prorepresentability. Its `ObstructionTheory` tests nonzero one-dimensional small kernels; the all-finite-socle interface used here is defined in §2.3.
- `DerivedModuleAlgebra` §0.2 and §1.1.1 supply tensor and Hom on the native `DerivedCategory (ModuleCat A)`, K-flat/K-injective models, symmetry, adjunction, base change and product Hom comparisons. Its §0.K.1 supplies the Koszul complex and its exterior algebra signs. Its §§1.E.0–1.E.1 supply `IsPerfect`, `IsPseudoCoherent`, `HasTorAmplitude`, their isomorphism/shift/triangle/retract/base-change API, the residue-amplitude criterion over local rings, `PerfectSystem`, `FiniteFreeSystemModel`, compatible based models and perfect inverse-system effectivity. Its §1.T supplies native linear `lim`, `lim¹`, strict-tower `Cone(1-shift)[-1]`, natural linear Milnor sequences and cofinal comparison; §§1.3–1.5 supply derived completion and the Noetherian finite-cohomology comparison. All towers used here live in that strict diagram category.
- `EnhancedDerivedSheaves` §§E1.1 and E1.3 supply the dg module-sheaf category and its enhancement; §§E1.8 and E1.8.DMA.1 supply the affine comparison with native module-derived tensor. These comparisons identify the geometric realization of the module constructions, preserving cohomology and scalar extension. Its §E1.6 supplies `isRegularRing_projectiveDimension_le`, `isRegularLocalRing_of_projectiveDimension_residueField`, `frobenius_flat_of_isRegular` and `isRegular_of_frobenius_flat`. The regular-local finite-module specialization is in §3.2.
- `DerivedModuleAlgebra` §§1.M.1–1.M.2 supply a chosen residue injective hull `E_A`, its canonical completion action, exact contravariant `D_A=Hom_A(-,E_A)`, `End_A(E_A)≃Â`, the Artinian `A`/finite `Â` equivalence and biduality, and the completion restriction/extension adjunction. No finite-residue hypothesis is used in these contracts. `DeformationAndDerivedPatchingAlgebraPartII` §K0.1 supplies its native Čech comparison and support operations, §K0.4 its CM/local-cohomology criterion, §K0.5 regularity of secant sequences on CM modules, and §K0.7 normalized finite-module local duality and the Matlis annihilator comparison. `ArithmeticGaloisDuality` §D7.1 supplies the complete-local bounded-finite-complex local-duality equivalence with its naturality. Its maximal-ideal Hilbert–Samuel polynomial and multiplicity are the `I=m_A`, `D=dim A` specializations of PadicLocalLanglandsForGL2Qp §0.5 and are not used here separately. Its bounded-perfect/algebra-coefficient Tor spectral sequence is the common-hypothesis comparison for §7.10. Part II §K3.1 supplies `reesModule I M=⊕_n I^nM` with its graded Rees action and monomials.
- `SchemeAndStackFoundations` §§2.18–2.21 supply native affine coherent duality, `Coherent.DualizingComplex`, `Coherent.NormalizedDualizing`, finite-map derived Hom, finite-local normalization and shift/localization comparisons. They also supply the geometric lci predicate in §2.19 and Picard/restriction carriers. The CI parafactorial theorem itself is a target here in §6.9. Tau Ceti `RingTheory.Syntomic.StandardSyntomic` supplies `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension`, its finite-presentation constructor, base change and finite presentation; `Syntomic.Smooth` and `Syntomic.Localization` supply the smooth and localization charts. The extra relative comparison in §3.14 specifies how continuous formal regular presentations relate to those algebraic charts.
- `SchemeAndStackFoundations` SF.2 supplies affine comparison, uniformly bounded-below filtered colimits in `D_qc`, and finite perfect approximations. SF.5 supplies general geometric cycle carriers; its dimension-graded Chow construction is for schemes locally of finite type over a field. The affine module cycles over Noetherian rings are PadicLocalLanglandsForGL2Qp §0.5's. `GrothendieckEulerForms` Layer 5 supplies the alternating finite-length Euler characteristic, its triangle additivity and its Grothendieck-group descent.
- `ModularCurves` §4D supplies its regularity/completion/dimension and finite equal-dimensional regular-base flatness results. Its §7D test-algebra data are compared by identity on rings and the labelled residue map. `AlgebraicVectorBundles` 0B–0C supplies duals, determinant lines and their affine/pullback comparisons. `PadicMeasuresIwasawaAlgebras` §5.1 supplies `detLine_shortExact`, `detLine_quasiIso` and `detLine_acyclic`; §6.9 applies these over the affine ring and then the associated-sheaf comparison.
- `PadicMeasuresIwasawaAlgebras` L1 supplies `O[[Z_p^q]]`, finite group-ring quotients and the augmentation. Section 7.5 constructs the adic completion of a free direct sum and its restricted coefficient expansion over complete Noetherian local rings. The pinned `TauCeti.MonoidAlgebra.dualLinearEquiv` and its coefficient-at-one, inverse-coefficient and naturality equations in `TauCeti.Algebra.MonoidAlgebra.Dual` supply finite group-algebra coefficient duality. Here no general Pontryagin duality is inferred over a ramified coefficient ring.
- `PadicLocalLanglandsForGL2Qp` §0.4 supplies, for any profinite group `Γ`, rank `n≥1` and continuous fixed-basis residual `ρ̄:Γ→GLₙ(k)` with finite `k`, the continuous framed lifting functor, its pro-representability and Noetherianity under Mazur's `Φ_p` condition, the chosen representing pair `(R^□,ρ^□)` with its actual continuous universal lift, compatibility with coefficient change and the fixed-determinant fibre, and the unique continuous local isomorphism carrying one universal lift to the other for two presentations of the functor on the same coefficient category. Section 2.7 consumes that pair at the same `Λ`, `k`, `n` and residual basis.
- `PadicLocalLanglandsForGL2Qp` §0.5 supplies, for Noetherian `A` and finite `M` with `dim Supp M≤d`, the dimension-graded module cycle `moduleCycle d M` on Mathlib's cycle carrier of `Spec A` with coefficient `length_(A_p)(M_p)` at primes with `dim A/p=d`, its additivity, closed-immersion, flat and power-series pullbacks. For Noetherian local `A`, finite `M` and `I⊆m_A` with `M/IM` of finite length it supplies the unique eventual polynomial of `length(M/I^(n+1)M)` (its statement exists_hilbertSamuel_polynomial), the dimension-normalized multiplicity of `M` at a bound `d≥dim M` with polynomiality, integrality, positivity at `d=dim M`, additivity under a common bound, the associativity formula and power-series invariance, and the intrinsic/ambient multiplicity comparison. For complete equidimensional Noetherian local `O`-flat `A` of dimension `d+1` and finite `O`-flat `M` it supplies `moduleCycle_specialization` from `(d+1)`-cycles to special-fibre `d`-cycles and its agreement with the module cycle of `M/πM`. Sections 3.11–3.12 and 6.7 use these objects; their graded series and applications are additional.
- `ProfiniteProPGroups` Layers 0, 3 and 4 supply closed normal quotients, the maximal pro-p quotient, finite generation in the required extension and the free profinite group on a finite set with its continuous universal property. `LocalGaloisGroups` supplies the arithmetic instances of these finiteness conditions; the generic matrix construction below imposes them as inputs.
- `TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants.HeckeImage.derived_hom_finite` supplies finite native derived Hom for bounded finite cohomology over Noetherian coefficients. In the same namespace `ghost_nilpotence` and `action_annihilator_power` use exponent `b-a+1`, `exists_idempotent_splitting` splits actual derived idempotents, and `finite_local_factors` decomposes a finite algebra over a complete Noetherian local base. These general statements already include the perfect-complex cases used here. `DGAInfinity` Layer 5 supplies the ambient idempotent splitting comparison. `LocalFieldsRamification` Layer 0 identifies the finite integral closure with the integer ring of a finite extension when the base field is local. `AdicSpacesPartII` §R0.1b supplies `isNoetherianRing_of_isAdicComplete` and `IsAdicRing.adicCompletion`: a separated complete ring with finitely generated defining ideal and Noetherian quotient is Noetherian, and completion of a Noetherian ring is Noetherian. Its §R0.3 supplies the topological tensor comparison for adic structure maps. The local coefficient maps in §1.12 are continuous but need not be adic; that section constructs their coproduct directly on native `AdicCompletion` and compares with §R0.3 at its hypotheses.

## How to read the build

The ordinary associated-graded subtarget of GroebnerGeometry G4 is a prerequisite of Layer 1. Layer 1 constructs the ordinary graded adapters and their initial-ideal comparisons, then builds the labelled coefficient category using the supplied Noetherian completion criterion. Build §1.13 immediately after §1.5, before the residue-extension construction of §1.10. Layer 2 translates abstract deformation theory into equations and relations. Layer 3 adds the homological, duality and multiplicity algebra. Build §§7.1–7.3 immediately after Layer 3, before §§5.1 and 5.9, to supply cohomological Tor and minimal finite-complex representatives. Layer 4 obtains finiteness and integral points, Layer 5 patches modules, and Layer 6 controls support, cycles and maps on components. The remaining Layer 7 sections then supply the signed-duality and strict-tower comparisons. Layer 8 patches complexes and actions simultaneously. Layer 9 combines codimension, amplitude and specialization to produce the final Cohen–Macaulay and support conclusions. A reference to an earlier mathematical subsection names its precise output, not every result of its layer. The statement file [Suggested.lean](Suggested.lean) contains representative signatures whose carriers already exist.

The headline statements in `Suggested.lean` use `Der`, `Cpx` and `H` as abbreviations for native derived modules, cochain complexes and cohomology, and `derivedSupport` for the union of cohomology supports. The presentation condition `HasSquarePresentation` and native group ring `PatchingGroupRing` express the balanced input of §5.5. The ideals `patchingRelations` and `patchingAugmentation` express the scalar quotient and augmentation of §5.6.

The predicates `IsMinimal` and `CompleteFlatComplex` express the representative theorems of §§7.3 and 7.5.

The functions `hilbertSamuelFunction` and `multiplicityCoefficient` are PadicLocalLanglandsForGL2Qp §0.5's cumulative length function and dimension-normalized coefficient extraction; with the predicate `FormallyUnmixed` they express §§3.11–3.13. The function `residueExtDepth` is the least degree of nonzero native residue Ext, with infinity when all degrees vanish; §3.1's statement uses this description of the supplied depth. The function `localizedLength` is native module length after prime localization, the coefficient of §0.5's module cycles, and expresses §6.7's cycle formula without converting infinite lengths. Each definition has its actual native carrier and formula.

## Layer 1: ordinary adic algebra and labelled coefficients

### 1.1 Ordinary associated graded rings

For an ideal `I` of a commutative ring `A`, use GroebnerGeometry G4's native direct-sum ring `Gr_I A=⊕_(n≥0) I^n/I^(n+1)`. Define `adicGradedRing` as the quotient of the existing Rees algebra by the homogeneous coefficient ideal whose degree `n` coefficient is `I^(n+1)`, with its inherited `A/I`-algebra structure, and identify it with that supplied ring. The degree-`n` map `adicClass n` sends `a∈I^n` to the actual Rees monomial class; its kernel is exactly `I^(n+1)`. Prove `adicClass_mul`, with degrees adding, and `adicClass_zero_iff`. The degree-zero equivalence is `A/I`; the degree-one map has kernel `I²` on `I`. This uses the supplied Rees grading, rather than a second Rees-algebra construction (Stacks, Algebra §10.58, associated graded rings; completion proof Lemma 10.97.5, tag [05GH](https://stacks.math.columbia.edu/tag/05GH)).

The comparison `adicExpansion` is a graded `A/I`-algebra equivalence from the supplied direct-sum ring to `adicGradedRing`. It sends every supplied homogeneous quotient class to `adicClass`, preserving multiplication and the induced coefficient-change maps. Specify its inverse by actual quotient coefficients: `adicCoeff n [f]=[coeff n f]`. The coefficient maps are additive and `A/I`-linear; they retract inclusion in the same degree, kill every other degree and detect equality. Their finite sum reconstructs an element. The native homogeneous projection is inclusion after `adicCoeff`, hence is idempotent and orthogonal to projections of a different degree. These are the required `adicExpansion_inverse`, `adicCoeff_inclusion`, `adicProjection_eq` and `adicProjection_ext` interfaces; the finiteness of the support is essential.

**Checks.**

- For `I=0`, only degree zero survives and `adicGradedRing A 0≅A`; positive-degree monomials are zero.
- For `A=k[[x]]`, `I=(x)`, the class of `x^n` in degree `n` is nonzero and the product of the degree-one class with itself is the degree-two class of `x²`.
- For `I=A`, every quotient piece and the entire associated graded ring are zero. Replacing the denominator `I^(n+1)` by `I^n` would incorrectly kill the preceding DVR example as well.

*Needs:* GroebnerGeometry G4's ordinary associated-graded carrier and class/map API; the native Rees algebra, its supplied grading, homogeneous quotient grading and polynomial coefficients.

### 1.2 Degree-one generation and change of coefficients

If `I=(a_i)` for a finite family, transport GroebnerGeometry G4's generator map through `adicExpansion` to obtain `adicGeneratorMap:(A/I)[X_i]→adicGradedRing A I`, with `X_i↦adicClass 1 a_i` and the degree-zero coefficient map. It is a surjective graded algebra map; its uniqueness is determined by these coefficient and variable equations. In particular the graded ring is finite type over `A/I`, and algebra maps from it are determined on degree zero and degree one. No linear independence of the degree-one generators is asserted (Stacks Algebra §10.58 and Lemma 10.97.5, tag 05GH).

For a ring map `f:A→B`, use `J=I.map f` and transport the supplied graded map to `adicMap f:adicGradedRing A I→adicGradedRing B J`. Prove that this is the map induced by applying `f` coefficientwise to Rees polynomials and passing to the coefficient-ideal quotient. The comparison square with `adicExpansion` commutes on every homogeneous class. Thus `adicMap_class`, its coefficient/residue formula, identity, composition and homogeneous-projection comparisons are the transported supplier API. On a degree `n` representative its vanishing means `f(a)∈J^(n+1)`. Thus `adicMap` is injective exactly when `f⁻¹(J^(n+1))∩I^n=I^(n+1)` for every `n`; injectivity of `f` alone does not imply this. A surjective `f` gives a surjective map, and a ring equivalence gives `adicEquiv`, with inverse obtained from its inverse coefficient map and the same monomial formula.

**Checks.**

- For the identity of `(A,I)`, every degree class, coefficient and projection is fixed, not merely the underlying ungraded ring.
- For `k[[x]]→k`, `I=(x)`, the map kills every positive-degree piece and is the identity on degree zero.
- The injective map `k[[x]]→k[[t]]`, `x↦t²`, with target ideal `(t)`, kills the first initial class. The image-ideal construction instead uses `(t²)`, making the distinction between a chosen larger target ideal and `I.map f` explicit.
- Even for the image ideal, injectivity can fail: in `A=k[[t²,t³]]⊂B=k[[t]]` with `I=t²A` and `J=t²B`, `t⁵∈I` has nonzero class modulo `I²=t⁴A`, while its image lies in `J²=t⁴B`. This tests the contraction criterion with exactly the specified target ideal.

*Needs:* §1.1 and GroebnerGeometry G4's generator, functoriality and coefficient-change maps; ideal-power transport and homogeneous quotient maps.

### 1.3 Ordinary graded modules and their coordinates

For any `A`-module `M`, use the supplied ordinary Rees module and define `adicGradedModule I M` as its quotient by the degree-zero action of `I`, with degree `n` equal to `I^nM/I^(n+1)M`. Use the same graded ring from §1.1; its degree `r` scalar times a degree `s` vector has degree `r+s`. The Rees-module monomial sends an actual element of `I^nM` to that coefficient and degree. Its zero criterion is membership in `I^(n+1)M`. Constants embed `M` in the Rees module and their images generate the graded module in degree zero. A chosen finite family generating `M` gives chosen generators of both modules; hence a finite `M` has finite associated graded module (Stacks Algebra §10.58 and the Hilbert polynomial argument in §10.59).

The intended `adicModuleExpansion`, `adicModuleCoeff`, `adicModuleInclusion` and `adicModuleProjection` compare the **actual quotient carriers**, not unrelated abstract copies of their dimensions. State additivity, scalar compatibility, the same-degree identity, the other-degree zero law, finite recomposition and both inverse equations. The image submodule of each inclusion is the registered homogeneous component; membership there is equivalent to being fixed by its projection. A zero projection is exactly a zero quotient coefficient, and equality follows from equality of every projection. For `M=A`, the regular-module comparison agrees with the ring adapter and its multiplication, not just its additive group.

**Checks.**

- For `M=0`, every piece and projection is zero and the finite generating family may be empty.
- For `M=A/(x²)` over `A=k[[x]]`, `I=(x)`, degrees zero and one have dimension one and all later degrees vanish; multiplication by the degree-one class sends `[1]` to `[x]` and `[x]` to zero.
- For `I=0`, `adicGradedModule I M` is `M` in degree zero. The scalar ring is `A`, whereas for `I=A` the scalar ring and module are both zero.

*Needs:* §1.1, native polynomial modules, scalar towers, quotients and graded module decomposition.

### 1.4 Homogeneous kernels, cokernels and the length recurrence

Let `S` be a graded `R`-algebra with `S₀=R` Artinian, generated by a specified finite list of degree-one elements. Let `G` be a finite nonnegatively graded `S`-module and `x∈S₁`. The map `x:G_n→G_(n+1)` has actual kernel `K_n`, image and quotient `Q_(n+1)`. Set `Q_0=G_0`. Define `gradedMultiplicationComponent` and `gradedQuotientComponent` with the representative formulas `g↦xg` and `g↦[g]`. Their range/kernel equality is the exact sequence

```text
0 → K_n → G_n --x→ G_(n+1) → Q_(n+1) → 0.
length G_(n+1)-length G_n = length Q_(n+1)-length K_n.
```

Every displayed length is finite, since each graded piece is finite over the Artinian degree-zero ring (Stacks Lemma 10.58.6, tag 00K0). The natural-number additive versions precede the signed integer recurrence; no truncated subtraction is used. The degree-zero quotient map is injective as well as surjective. The degree shift of multiplication has zero degree-zero output, and its higher projections agree with multiplication on the preceding projection (Stacks Algebra §10.59, Hilbert polynomial proof).

Equip the actual kernel, range and cokernel with their homogeneous components. For the kernel and range these are intersection with the ambient components; for the cokernel they are images under the quotient map. Prove independence, spanning, finite decomposition and agreement of each internal projection with the ambient one or its quotient. In particular quotient projections commute with the quotient map, are orthogonal idempotents and characterize homogeneous elements. Multiplication by `x` kills both the kernel and the cokernel. Their actions therefore factor through the scalar quotient by `(x)`; representative independence and the scalar tower are explicit parts of `gradedKernelQuotientAction` and `gradedCokernelQuotientAction`. If the original scalar algebra has chosen degree-one generators `x,x_2,…,x_r`, the remaining variables give a surjection `R[X_2,…,X_r]→S/(x)`, with its coefficient, variable and degree equations. Both kernel and cokernel are finite over this smaller polynomial algebra. This supplies the actual smaller-ring objects in induction on the number of generators.

**Checks.**

- In `G=k[X]`, multiplication by `X` has zero kernel and cokernel `k` in degree zero; the recurrence gives constant graded lengths one. The infinitely generated algebra `k[X₀,X₁,…]` is excluded: its degree-one piece has infinite length, even though it is cyclic as a module over itself.
- In `G=k[X]/X²`, the kernel is `kX` in degree one and the cokernel is `k` in degree zero. The recurrence at `n=1` is `0-1=0-1`, which detects a reversed kernel sign.
- If `x=0`, the kernel is all of `G` and the cokernel is all of `G`. If there are no remaining variables, a finite graded `R`-module has only finitely many nonzero degrees; a grading with an infinite tail is excluded.

*Needs:* §§1.1–1.3, Noetherianity of a polynomial algebra over an Artinian ring, and finite-length exact additivity.

### 1.5 Homogeneous generators, initial ideals and completion

A finite graded module over a Noetherian graded ring admits finitely many homogeneous generators: decompose a finite generating family and retain its finitely many components. Their degrees have a common upper bound. If the scalar ring is concentrated in degree zero, every higher component vanishes; in particular the empty-variable Hilbert-polynomial induction starts with the zero eventual polynomial for the graded pieces. For a polynomial algebra, `X_i^r`, a monomial and a homogeneous polynomial act by their respective total degrees. The registered graded action must agree with these actual multiplications (Stacks Algebra §§10.58–10.59).

For a separated `I`-complete ring `T` and an ideal `K`, define its initial homogeneous ideal in `Gr_I T` as the image of `(K∩I^n)/(K∩I^(n+1))` in each degree. If `Gr_I T` is Noetherian, choose homogeneous generators represented by `g_j∈K∩I^(d_j)`. The correction theorem says: for `z∈K∩I^r`, there are `a_j∈I^max(r-d_j,0)` with `z-Σ a_jg_j∈K∩I^(r+1)`. Successive corrections converge, their errors tend to zero, and `g_j` generate `K`. The correction theorem assumes Noetherianity of the actual associated graded ring and does not require a chosen finite generating family for `I`. Its comparison with associated graded rings of the completion must preserve the chosen classes (Stacks Lemma 10.97.5, tag 05GH, proof; the complete-ring argument there).

**Checks.**

- For `T=k[[x]]`, `K=(x²+x³)` and `I=(x)`, the initial generator has degree two, and correcting its coefficient recovers the unit factor `1+x`.
- For `I=0`, completion and the initial ideal reduce to the original Noetherian ring and its ideal; no positive-order term is required.
- For `I=T`, the separated completion is zero. The theorem concerns that completion; it does not infer that an arbitrary original ring is Noetherian from its zero quotient.

*Needs:* §§1.1–1.4, native completeness and separatedness, homogeneous finite generation and convergence of coefficient corrections; the Noetherian completion criterion is supplied by `AdicSpacesPartII` §R0.1b as recorded in the boundaries.

### 1.6 Labelled coefficient-category comparisons

Use the supplier's local-algebra data, supplemented by an actual surjective residue map `q_A:A→k`, its equation `ker q_A=m_A`, and compatibility with `Λ→A`. `labelledCoeffHom` consists of `Λ`-algebra maps `f` satisfying `q_B∘f=q_A`. Such maps are local, satisfy `f⁻¹(m_B)=m_A` and are continuous for maximal-adic topologies. Compare the Artinian full subcategory `CoeffArt` and the complete separated Noetherian full subcategory `CoeffCNL` with the existing deformation categories. This comparison retains the label and all maps, rather than making a new abstract Artin category (Stacks Formal deformation theory, Definitions 3.1–3.2 and 4.1, pp. 4–5 and 9).

Expose identity, composition, extensionality, the forgetful full faithfulness and transport along a residue-compatible ring equivalence. An Artinian object has finite length over `Λ`, by a composition series whose simple quotients are the labelled `k`. A local ring map between fixed-residue objects is automatically continuous, but an unlabelled local map inducing a field automorphism is not an arrow in this category. For algebraically closed `k` of characteristic `p`, the specialization to the native Witt coefficients agrees with `ModularCurves` §7D on its existing test-algebra carrier and residue equation.

**Checks.**

- `O` and `O[[X_1,…,X_r]]` have their usual labelled residue maps; for `r=0` the latter is the coefficient object itself.
- For `k=𝔽_(p²)`, the Frobenius automorphism of `k` fails `q_B∘f=q_A` for the object `k`, although it is an isomorphism of local rings.
- `k[X]_(X)` is local Noetherian with the right residue, but fails completeness; an inverse system with unbounded cotangent dimension cannot be admitted merely because every level is Artinian.

*Needs:* the coefficient objects from `SchemeAndStackFoundations` SF.4 and `ModularCurves` §7D; native local ring and adic predicates.

### 1.7 Small extensions and fibre products

Use `SchemeAndStackFoundations` §4.2's `IsSmallExtension` on the underlying arrow of the labelled coefficient comparison in §1.6. Define an elementary socle extension to have finite-dimensional kernel killed by `m_B`, including zero; a square-zero extension only requires `I²=0`. Prove the labelled kernel/vector-space comparison, the square-zero consequence for a supplied small extension, stability of the labelled comparison under pullback, and a residue-compatible finite small factorization of every proper Artinian surjection. The latter first filters the nilpotent kernel by socle quotients and then refines a vector-space basis, retaining the residue labels (Stacks Formal deformation theory, Lemma 3.3, pp. 4–5, and §10, p. 26).

For `A→C←B` the algebraic pullback with the common residue label is Artinian local. If `B→C` is surjective its projection to `A` is surjective and has the same kernel as `B→C`. This hypothesis is used for the projection, not silently in a claim about arbitrary projections. Split square-zero objects `k⊕V`, with multiplication `(a,v)(b,w)=(ab,aw+bv)`, use the specified coefficient map and identify their tangent kernel with `V` (Stacks, Lemma 3.8 and Example 3.7, pp. 6–7).

**Checks.**

- `k[ε]/ε²→k` is small, with kernel `kε`; its pullback along `k[δ]/δ²→k` is the expected two-direction fibre product.
- `k[x,y]/(x,y)²→k` is elementary and square-zero with two-dimensional kernel, hence is not small.
- `k[t]/t⁴→k[t]/t²` is square-zero but not elementary, since `t·t²=t³≠0`. The identity of any labelled local coefficient ring is elementary but fails the nonzero small-kernel condition.
- With coefficient ring `Z₂` and residue `F₂`, the labelled quotient `Z/4→Z/2` is small: its kernel is generated by `2` and its maximal ideal kills that kernel. The quotient `Z/8→Z/2` is not small, because `2·2=4≠0` in `Z/8`. These compare the labelled adapter with the supplier in mixed characteristic.

*Needs:* §1.6, `SchemeAndStackFoundations` §4.2 (`IsSmallExtension`, `ArtinLocalAlg.pullback`, `dualNumbers`), native ring pullbacks, `TrivSqZeroExt` and finite length.

### 1.8 Truncations and complete towers

For `A∈CoeffCNL`, define the labelled truncation `coeffTrunc A n=A/m_A^(n+1)`, using `n∈N` so that every level is a nonzero Artinian coefficient object. Expose the quotient and transition maps, their surjectivity, the residue and locality equations, and the compatible map `A≅lim_n coeffTrunc A n`. A map from `A` to an Artinian object factors through some such quotient. Maps into a complete object are equivalent to compatible maps into every truncation, with uniqueness and composition preserved (Stacks Formal deformation theory, Lemmas 4.2–4.8, pp. 10–12).

The positive truncations carry `Nontrivial` and `IsLocalRing` on the native quotient `A ⧸ maximalIdeal A ^ (n + 1)` for every local ring `A`, without Noetherianity or completeness. The ideal power lies in the proper maximal ideal. Noetherianity supplies Artinianity when forming `coeffTrunc`. The quotient `A→coeffTrunc A n`, transitions `coeffTrunc A (n+1)→coeffTrunc A n`, and maps induced by labelled coefficient morphisms are themselves coefficient morphisms: retain their coefficient and residue equations, locality, and composition squares.

For a functor `F` on labelled complete coefficients, let `D(A)⊆F(A)` be a subfunctor closed under inverse limits of compatible points along separated surjective Artinian towers, and assume `F` identifies points over such a limit with compatible points over the tower. The target `mem_iff_forall_truncate` gives `x∈D(A) ↔ ∀ n, F(A→coeffTrunc A n)(x)∈D(coeffTrunc A n)`. Pushforward gives the forward implication; inverse-limit closure gives the reverse. In particular, for a complete labelled `B`, a closed ideal `J⊆B`, and a coefficient map `f:B→A`, the condition that `f` factors through `B/J` is detected on all truncations: each element of `f(J)` lies in every maximal-ideal power and hence is zero. This is the coefficient interface for deformation problems with these closure properties; the representation-specific problem and its axioms belong to the arithmetic consumers. Source: Stacks Definition 90.4.1, tag [06GW](https://stacks.math.columbia.edu/tag/06GW), Definition 90.7.1, tag [06H3](https://stacks.math.columbia.edu/tag/06H3), and Remark 90.7.11, tag [06HE](https://stacks.math.columbia.edu/tag/06HE); the separated-limit argument just given.

Conversely a surjective tower of Artinian labelled coefficient objects with a uniform finite bound on the dimensions of their relative cotangent spaces has a complete Noetherian local limit: choose bounded compatible generators, evaluate a finite-variable series ring, and use its surjectivity. A uniform bound, rather than finiteness of each level separately, is needed. An ideal quotient of a complete Noetherian local object is complete Noetherian; the unit ideal gives the zero ring outside the nonzero coefficient category. A labelled complete morphism that induces isomorphisms at every truncation is an isomorphism.

**Checks.**

- For `A=O`, level `n=0` is `k`, and the inverse limit of `O/π^(n+1)` is `O`.
- For `A=k[[X]]`, the dimensions of `m/m²` in the positive truncations are bounded by one; their limit is Noetherian.
- A tower adding an independent square-zero residue direction at every stage has unbounded tangent dimension; the converse theorem must not declare its limit Noetherian. A quotient by the unit ideal is zero, not a new labelled residue-`k` object.
- For `A=ℤ₂`, the quotient maps to `ℤ/2^(n+1)` and the transitions preserve the `ℤ₂` coefficient map and the labelled residue `𝔽₂`, including level zero.
- For `B=A=k[[t]]`, `J=(t²)` and `f=id`, the residue truncation kills `J` but the level-two quotient `k[[t]]/(t³)` does not. Membership cannot be detected from the residue point alone. For `f(t)=0`, all truncations factor through `B/J` and so does `f`.

*Needs:* §§1.5–1.7, inverse limits of surjective coefficient towers and native adic completeness.

### 1.9 Relative cotangent spaces and formal presentations

For a labelled map `A→B`, define `relativeCotangent A B=m_B/(m_B²+m_A B)` with its actual `k`-vector-space structure. It is finite for complete Noetherian coefficient objects. Expose the covariant map on cotangents, contravariant dual map on tangents, identity/composition, quotient formula and power-series direct-sum formula. Restriction of derivations gives `Der_A(B,k)≅Hom_k(relativeCotangent A B,k)`, using the specified residue action. The construction uses equality modulo `m_B²+m_A B`, not a false finite expansion of every element of `B` in chosen lifts (Stacks Formal deformation theory, Lemma 4.6, pp. 11–12; Khare–Wintenberger II §2.1, p. 6).

A coefficient morphism is surjective if and only if its relative cotangent is zero. More generally, chosen lifts of cotangent generators give a surjection `A[[X_1,…,X_r]]↠B`. This is the local adapter to native series evaluation. Its variables, coefficient restriction, continuity, uniqueness and composition are the imported evaluation equations; the new theorem is `seriesPresentation_surjective`. For a quotient `B/J`, relative cotangents quotient by the image of `J`. For the split dual numbers, the fibre of the tangent identification over a residue section has the usual derivation action; no canonical residue section is inferred over an imperfect base.

**Checks.**

- `relativeCotangent O O=0`, although `m_O/m_O²` is one-dimensional.
- `relativeCotangent O O[[x,y]]≅k²`. For `k[[x]]/(x²)` the relative tangent remains one-dimensional, because the relation is quadratic.
- Evaluating at `ε` in `k[ε]/ε²` gives `c_0+c_1ε`, while sending `X` to `1` is not continuous local evaluation of arbitrary formal series. The zero-variable presentation is surjective exactly when the coefficient map is.

*Needs:* §§1.6–1.8, native series evaluation, finite-dimensional residue modules and Nakayama with complete successive approximation.

### 1.10 Coefficient choices and residue extension

The coefficient choices below require the named Cohen-structure targets, with their actual maps. For a Noetherian local ring `R`, the adapter `residueExtensionData` records an actual faithfully flat local map `R→R'`, a specified compatible residue extension `k→K`, completeness and Noetherianity of `R'`, and **equality** `m_R R'=m_R'`. Such data exist for every field extension `K/k`: lift one residue generator by a monic polynomial or a localized polynomial variable, pass through the required directed/transfinite extensions, and complete at `m_R S`. Apply §1.13's `flatCompletion_finiteComparison` to the flat intermediate `R`-algebra `S`; its completion is flat and local over `R`, hence faithfully flat. Its maximal ideal is generated by the finitely generated `m_R` and its residue is `K`; `AdicSpacesPartII` §R0.1b then gives Noetherianity. No canonical functor or Noetherianity before completion is asserted. Finite generation of an `R`-module is equivalent to finite generation after this faithfully flat extension (Stacks Lemma 10.159.1, tag [03C3](https://stacks.math.columbia.edu/tag/03C3); Lemma 10.97.5, tag 05GH).

A `strictCohenRing` adapter records a characteristic-zero complete DVR with maximal ideal `(p)` and a labelled residue map to a characteristic-`p` field. The targets `strictCohenRing_exists`, `cohenTruncatedFormalSmooth` and `cohenCompatibleLift` assert existence, truncated formal smoothness over `Z/p^n`, and a compatible coefficient map into a prescribed complete local target, respectively. For `cohenCompatibleLift`, fix a unital residue map `C/p→R/m_R` and construct compatible maps `C/p^n→R/m_R^n`: truncated formal smoothness lifts across each square-zero transition, and the limit gives `C→R`. The lift may be noninjective and is a choice. This works with `p`-torsion in R; it uses Stacks Lemmas 10.160.6–10.160.7 and the proof of Theorem 10.160.8, tag [032A](https://stacks.math.columbia.edu/tag/032A), rather than a Cohen-to-Cohen embedding alone. The additional comparisons retain the chosen coefficient map in finite series presentations and in separable residue extensions. Over perfect `k` use the existing `W(k)`; over imperfect `k` keep a Cohen ring. A coefficient map into a ring with `p`-torsion need not be injective. A chosen embedding `C(k)→W(k^perf)` gives a faithfully flat completed coefficient change with residue `k^perf`; perfection is not called separable. Preservation of reducedness under that operation is a separate geometric-regularity theorem, not a consequence of faithful flatness (Stacks Definition 10.160.5 and Theorem 10.160.8; André §4.2 and §4.4(1), printed pp. 86–88; Anscombe–Jahnke, Theorem 4.1, pp. 8–9 and Corollary 6.5, p. 14).

**Checks.**

- For complete Noetherian local `R`, the identity is residue-extension data, and `k[[X]]→K[[X]]` has extended maximal ideal `(X)` and the required residue.
- A ramified DVR extension with `π=u(π')^e`, `e>1`, is flat local but fails equality of maximal ideals. It is not this kind of residue extension.
- For an infinite-dimensional `k`-vector space `V`, the local square-zero ring `R=k⊕V` is non-Noetherian and admits no faithfully flat map to a Noetherian ring: contraction of extended ideals would make every ascending ideal chain stabilize.
- `C/(p²)` is not a strict Cohen ring; `Z_p` is one with labelled residue `F_p`; a ramified extension with `p=uπ^e`, `e>1`, fails the maximal-ideal condition. For a perfect residue field the untruncated Witt ring is strict; for an imperfect field no identification with `W(k)` is asserted. The lift `C→C/(p²)` reduces to the identity on residue and is noninjective, testing the torsion-target case.

*Needs:* §§1.5–1.9, 1.13, native faithfully flat descent, Witt vectors and the three Cohen targets with the truncated lifting proof just stated.

### 1.11 Formal smoothness with labelled complete lifts

Compare `coeffFormallySmooth f`, the small-Artinian-diagram lifting property for a labelled complete map `f:A→B`, with the supplier's smooth transformation `h_B→h_A`. It is equivalent to a residue-compatible continuous `A`-algebra isomorphism `B≅A[[X_1,…,X_r]]`, with `r=dim_k m_B/(m_A B+m_B²)`. This assertion is relative: coefficient maps and the labelled residue are retained. The chosen isomorphism is not functorial (Stacks Formal deformation theory, Lemmas 8.6–8.8, pp. 21–23).

The API includes lifts of variables across a small extension, the first relative truncation from a chosen cotangent basis, compatible lifts through every positive truncation, and lifting over a surjection of complete objects with a prescribed finite truncation. At the induction step, the map

```text
D/m_D^(n+1) → (D/m_D^n) ×_(E/m_E^n) (E/m_E^(n+1))
```

is surjective for a surjective complete coefficient map `D→E` and `n≥1`. The limit lift commutes with the original coefficient map. These are existence statements, with no unique lift assertion.

**Checks.**

- The identity has the lifting property and relative dimension zero.
- `A→A[[X_1,…,X_r]]` has it for every finite `r`, including zero, by choosing lifts of all variables.
- `k→k[ε]/ε²` fails it: the identity cannot lift to `k[t]/t³→k[t]/t²`. In characteristic two the square of a lift of `t` is still `t²`, so this remains a negative control.

*Needs:* §§1.7–1.9, the supplier's smooth transformation criterion and countable compatible coefficient limits.

### 1.12 The complete-local tensor comparison

For labelled `A,B∈CoeffCNL_Λ`, construct `coeffCompletedTensor A B` on the native carrier `AdicCompletion J (A ⊗[Λ] B)`, where `J` is generated by the images of `m_A` and `m_B`. Identify it with the coproduct in the labelled complete-local category. When both coefficient structure maps are adic, compare it with the completed tensor of `AdicSpacesPartII` §R0.3, preserving the two inclusions and topology. A joint presentation is

```text
Λ[[X]]/I  ⊗̂_Λ  Λ[[Y]]/J  ≅  Λ[[X,Y]]/(I,J).
```

It is complete Noetherian local with residue `k`. Its two inclusions agree on `Λ`; compatible continuous labelled maps to a complete coefficient object extend uniquely. State `coeffTensor_lift`, its two inclusion equations, extensionality, symmetry, associativity, quotient by closed ideals, and the direct-sum formula for relative cotangents. These construct the complete-local coproduct for arbitrary labelled coefficient maps. Its comparison with the supplied topological tensor retains the adic-map hypotheses of that supplier (Khare–Wintenberger II §§2.1–2.3, pp. 6–10; Calegari–Geraghty, Lemma 4.2, printed p. 355).

For a labelled base map `Λ→D`, the same construction with coefficient base `D` gives `A⊗̂_D B` for labelled complete Noetherian local `D`-algebras `A,B`. In the coefficient-DVR category it is the same joint-maximal-ideal completion, with the same inclusions. Any coproduct obtained from another presentation has a unique isomorphism to this one preserving both inclusions; the uniqueness makes the symmetry, associativity and coefficient-change diagrams commute. No adic hypothesis on `D→A` or `D→B` is added.

A finite `Λ`-module factor needs no further completion; in particular if `A` is finite over `Λ`, `A⊗_Λ B→A⊗̂_Λ B` is an isomorphism without assuming `A` flat. If `B` is `Λ`-flat, completed tensor with a finite `Λ`-module preserves short exact sequences. Separate ring-flatness, dimension and domain conclusions require their later hypotheses.

**Checks.**

- `A⊗̂_Λ Λ≅A`, with both inclusion and augmentation equations.
- `O[[x]]⊗̂_O O[[y]]≅O[[x,y]]`; the relative cotangent is `kx⊕ky`.
- The ordinary `k[[x]]⊗_k k[[y]]` does not replace the completed ring: a diagonal series with coefficients of unbounded tensor rank need not be an algebraic finite sum of pure tensors. The finite-factor comparison does apply to `k[x]/x²`.
- For `D=O[[t]]`, `D[[x]]⊗̂_D D[[y]]≅D[[x,y]]`; the two maps send `t` to the same element. Identifying only the residue maps would instead leave two coefficient variables.

*Needs:* §§1.5–1.9, native `AdicCompletion` and algebraic tensor, finite-module completion and the joint power-series topology; `AdicSpacesPartII` §R0.3 for the comparison under adic structure maps.

### 1.13 Flat completion and finite modules

Let `R` be Noetherian, `I⊂R`, and let `S` be any flat `R`-algebra; `S` need not be Noetherian, separated or finite. Prove `flatCompletion_finiteComparison`:

```text
M⊗_R Ŝ ≅ lim_n (M⊗_R S/I^nS)
```

for every finite `R`-module `M`, and exactness of completion of a short exact sequence of finite `R`-modules after tensoring by `S`. Use Artin–Rees on `M_1⊂M_2`: for sufficiently large `c`, `M_1∩I^nM_2=I^(n-c)(M_1∩I^cM_2)`, so the induced filtration is cofinal with the ordinary one. The comparison is natural in the finite module, the algebra and cofinal filtrations. Consequently `Ŝ` is flat over `R`; the same comparison over `R̂` gives the `R̂`-flat statement (André, Lemma 1.1.1 and proof, printed pp. 75–76).

For faithfulness state the sufficient assumptions explicitly: `S` faithfully flat and `I⊂Jac(R)` suffice. Alternatively one may use faithful flatness with `IS⊂Jac(S)` to ensure the needed residue fibres survive. Completion at an arbitrary ideal is not automatically faithfully flat. The finite-module comparison does not interchange an arbitrary infinite presentation with the limit.

**Checks.**

- For `S=R` this is the ordinary finite-module completion comparison; for `I=0` it is the identity on `M⊗S`.
- If `I=R`, the completion is zero. Flatness survives but faithfulness fails for a nonzero base.
- For `R=O` and a polynomial algebra `S` of arbitrarily many variables, the flat-completion conclusion still applies although no Noetherian hypothesis on `S` is available.

*Needs:* §1.5, native Artin–Rees, finite presentations, the supplied native Mittag–Leffler exactness and cofinal comparison from `DerivedModuleAlgebra` §1.T.

### 1.14 Quotients, finite algebras and cofinal completions

For a possibly non-Noetherian local ring `A` whose maximal-adic completion `Â` is Noetherian, every `A/m^n`, `n≥1`, is Artinian. For a finitely generated ideal `J`, prove `quotientCompletionComparison:Â/JÂ≅(A/J)^hat`; no finite generation of `m_A` is assumed. For `J=A` both sides are zero. The comparison is induced by the actual quotient map and respects all finite truncations (Paškūnas–Quast, Lemma 5.15, printed pp. 38–39). For mutually cofinal ideal-power filtrations, `cofinalCompletionEquiv` is the identity-induced ring equivalence with both quotient and original-ring maps fixed (Stacks Lemma 10.96.9, tag [0319](https://stacks.math.columbia.edu/tag/0319)).

For a finite algebra `S` over Noetherian `R` and a prime `p`, give the natural comparison

```text
R_p^hat ⊗_R S ≅ ∏_(q over p) S_q^hat.
```

The additional comparison retains the maps from `S` and the base completion, and every Artinian reduction. Apply the supplied finite complete-local factor decomposition. Over a complete local base a finite domain has one factor; a domain before base completion can have several factors (Stacks Lemmas 10.97.7–10.97.8, tags [0394](https://stacks.math.columbia.edu/tag/0394) and [07N9](https://stacks.math.columbia.edu/tag/07N9)).

**Checks.**

- For `A=O`, `J=(π²)`, the comparison gives `O/π²` with its usual quotient, while the unit ideal gives zero.
- The finite algebra `R×R` has two factors after completion. Even the domain `Z_(5)[i]` gives two factors over `Z_5`, corresponding to `i=±2` modulo 5; domain before completion does not imply one factor.
- For a finite local map, the two maximal-adic filtrations are cofinal, although their powers need not be equal at the same index.

*Needs:* §§1.8 and 1.13, finite generation of `J`, cofiltered finite-product limits and finite-algebra localization.

### 1.15 Pro-comparison, Chevalley and parameter quotients

For finite `R`-modules `M,N` over a Noetherian ring and ideal `I`, the maps

```text
Hom_R(M,N)/I^n Hom_R(M,N) → Hom_R(M,N/I^nN)
```

form a pro-isomorphism: the kernel and cokernel towers are pro-zero. Consequently `lim¹ Hom_R(M,N/I^nN)=0`, even though its transitions need not be surjective. The limit identifies with the completed finite Hom module. This is a specialization of the supplied pro-tower formalism, not a new definition of pro-isomorphism (Bhatt, Lemma 5.3, pp. 9–10).

For finite `M` over complete Noetherian local `R`, decreasing submodules `N_n` with intersection zero eventually lie in every `m^qM`; more generally apply this to the quotient by their intersection. An injective local map of complete Noetherian local rings induces exactly the source maximal-adic topology. The comparison provides indices, not equality of powers (Stacks Formal deformation theory, Lemma 4.7, pp. 11–12).

For `I=(x_1,…,x_d)` and `n≥1`, `I^(d(n-1)+1)⊂(x_1^n,…,x_d^n)⊂I^n`. If `I` is maximal-primary these powers are cofinal with the maximal-adic filtration. In `W(k)[[T_1,…,T_r]]`, the ideals `(p^m,T_1^(p^m),…,T_r^(p^m))`, `m≥1`, decrease and contain `m_A^(m+r(p^m-1))` while lying in `m_A^m` (André §3.4, printed p. 84).

**Checks.**

- With `R=O`, `M=N=O/π`, the Hom comparison stabilizes to the identity after the first quotient; it is not justified by exactness of Hom on every quotient sequence.
- For `d=0`, `I=0` and the empty generated ideal is zero; the cofinal assertion only applies when zero is an ideal of definition.
- For `r=0`, the mixed parameter ideal is `(p^m)` and the exponent bound becomes `m`. With two variables the pigeonhole exponent is `2n-1`, and `x^(n-1)y^(n-1)` shows why `2n-2` would be insufficient.

*Needs:* §§1.8 and 1.13–1.14, native Hom, Artin–Rees, supplied pro-zero and `lim¹` interfaces, and finite monomial combinatorics.

### 1.16 Maps on local completions and regular-source squares

For a local map `f:A→B` of Noetherian local rings, `localCompletionMap f:Â→B̂` is the native completion map induced by `f(m_A^n)⊆m_B^n`. Its API specifies its composite with `A→Â`, its residue map, locality, identity and composition. If `f` is flat, this map is flat. The natural closed-fibre map identifies `B̂/m_ÂB̂` with the maximal-adic completion of `B/m_AB`; if the latter is finite-dimensional over `k_A`, its completion is itself. These are map-level comparisons, rather than consequences of completeness of a single finite module (Stacks §15.44, Lemma 15.44.8; Algebra §10.97, quotient/completion comparison).

For any local map between complete Noetherian local rings, `regularSourceSquare` chooses regular complete local rings `Q,P`, surjections `Q↠A`, `P↠B` and a local map `Q→P` making the square commute. A regular parameter system of `Q` maps to a subset of a regular parameter system of `P`; hence `Q→P` is flat with regular closed fibre. There is no separability assumption on the residue extension. Lift the Cohen power-series map across `P↠B` by continuous formal smoothness over the integers, then add formal variables to separate its parameter images. The choices and both surjections remain part of the output (Stacks Lemmas 15.38.5, 15.40.1 and 15.40.3, tag [07NN](https://stacks.math.columbia.edu/tag/07NN)). This does not prescribe an arbitrary prior embedding of one Cohen coefficient ring into another target.

**Checks.**

- The identity induces the identity on the actual completion and its closed fibre; when the ring is already regular complete, the identity square is an admissible regular-source square.
- For `k[x]_(x)→k[x,y]_(x,y)`, the induced map is `k[[x]]→k[[x,y]]`, and the closed fibre is `k[[y]]`, the completion of `k[y]_(y)` rather than the original fibre.
- For `A→A/I`, the completion map has the extended ideal as kernel and unchanged residue field. For `k[[x]]→k`, a regular-source square can use `P=k[[y]]→k`, `Q=k[[x]]→P`, `x↦y`: taking `P=k` would incorrectly lose the source parameter.
- For a purely inseparable field extension `k→K` in equal characteristic, `Q=k`, `P=K` is a regular-source square with empty parameter system and regular closed fibre `K`; a separable-only lift would wrongly exclude it. A finite-dimensional closed fibre is already complete.

*Needs:* §§1.5, 1.10–1.14, native completion maps, finite-ideal quotient comparison and continuous Cohen formal lifting. Layer 3 uses this square for presentation independence and flat-local CI comparisons.

### Examples

For `A=O[[x,y]]`, evaluation of the variables at elements of the maximal ideal gives the labelled maps, `relativeCotangent O A=k²`, and the joint tensor presentation recovers `O[[x]]⊗̂_O O[[y]]`. The quotient by `(π^m,x^(p^m),y^(p^m))` is Artinian. Its finite-level data can later be selected because `k` is finite, while all preceding presentation statements work with arbitrary `k`.

For `A=k[t]/t⁴`, the extension to `k[t]/t²` has square-zero kernel `(t²,t³)` but is not killed by `m_A`. Filtering first by `(t³)` and then by the image of `(t²)` gives two genuine small extensions. This separates the three extension notions used in obstruction arguments.

### Dependencies

This layer uses GroebnerGeometry G4's ordinary associated-graded ring and class/map API, together with native adic completion, series, modules, Rees and grading machinery; the labelled comparisons consume the coefficient and Cohen interfaces from `SchemeAndStackFoundations` and `ModularCurves`; the complete-local tensor is constructed in §1.12, with its adic comparison supplied by `AdicSpacesPartII` §R0.3 and Noetherian completion supplied by its §R0.1b. Limit and pro-tower exactness uses the `DerivedModuleAlgebra` §1.T contract in the boundaries. No multiplicity, Auslander–Buchsbaum, patching or higher arithmetic theorem enters the Noetherian completion proof.

## Layer 2: Minimal equations and deformation hulls

### 2.1 Minimal relative presentations

Let `R` be a complete coefficient algebra over `Λ`, with the labelled residue field `k`. Choose lifts of a basis of `m_R/(m_R²+m_ΛR)`, of dimension `d`. Evaluation gives a surjection

`q : S = Λ[[X₁,…,X_d]] → R`.

Call this a **minimal relative presentation**. Its defining condition is that the induced relative cotangent map is an isomorphism, equivalently `J = ker q ⊆ m_S²+m_ΛS`. The API retains the chosen generators, evaluates each `X_i` to its chosen lift, identifies `S/J` with `R`, characterizes minimality by this kernel inclusion, and compares the number of variables under a change of basis. The presentation is a choice; its variable count is invariant. For a hull `h_R → F`, the imported tangent isomorphism identifies `d` with `dim_k T_F`.

Taking any labelled complete Noetherian local `B` as coefficient base gives the relative presentation for `B→R`. In the coefficient-DVR category this uses the same evaluation map, kernel ideal and quotient `J/m_SJ` as §§2.2–2.4. Transport along an isomorphism of chosen presentations must preserve relation classes and their obstruction evaluations; arbitrary choices of presentation are not identified without such an isomorphism.

**Checks.**

- For `R=Λ`, `d=0` and the presentation is the identity.
- For a complete DVR `Λ` and `R=k`, `d=0` but `J=(π)`; replacing the relative condition by `J⊆m_S²` would fail.
- The surjection `k[[X,Y]]→k[[X]]` killing `Y` is not minimal: it has a nonzero linear relation.

**Targets.** Construct evaluation from the selected lifts using §1.9 and prove the two minimality criteria. Source: Schlessinger, Notation 2.6 and proof of Theorem 2.11, pp. 211, 213–214; Khare–Wintenberger II, Lemma 4.4, pp. 41–42. Needs: Layer 1 and the representable-functor comparison with SchemeAndStackFoundations, Layer 4.

### 2.2 Relation spaces

For a chosen surjection `q:S→R`, define its **relation space** to be the actual quotient module `E(q)=J/m_SJ`. Scalar restriction through `S/m_S≃k` makes it a finite-dimensional `k`-space. This differs from the conormal `R`-module `J/J²`. The API includes the class map from `J`, its zero criterion `j∈m_SJ`, the natural equivalence

`Hom_k(E(q),I) ≃ Hom_S(J,I)`

when `I` has the residue action, and Nakayama's equivalence between bases lifted from `E(q)` and minimal ideal generating tuples of `J`. In particular `dim E(q)` is the minimal number of relations of this presentation.

**Checks.**

- `J=0` gives the zero vector space.
- For `(X²)⊂k[[X]]`, the class of `X²` is a basis.
- For `(X,Y)²⊂k[[X,Y]]`, the classes of `X²,XY,Y²` are a basis, including over `𝔽₂`.
- Presenting `k` as `k[[Y]]/(Y)` gives a one-dimensional relation space, whereas its zero-variable presentation gives zero. Presentation independence requires additional structure and is not asserted.

**Targets.** Construct this quotient over the native ideal module and prove the API. Source: Khare–Wintenberger II, §4.2 around Lemma 4.6, pp. 43–45; Gee, Lemma 3.13, p. 13. Needs: §2.1 and native quotient modules/Nakayama.

### 2.3 Relation evaluation as a complete obstruction

Fix a minimal relative presentation. Let `e:B→A` be an Artinian coefficient surjection with finite-dimensional kernel `I` and `m_B I=0`. For a point `f:R→A`, lift the images of the variables to `m_B` and evaluate `S→B`. Restriction to `J` lands in `I`, kills `m_SJ`, and gives the **presentation obstruction**

`ob_q(e,f) ∈ Hom_k(E(q),I) ≃ E(q)* ⊗_k I`.

The API proves independence from all variable lifts, the formula on each relation class, naturality for commuting extension squares and arbitrary linear pushouts of kernels, and `ob_q(e,f)=0` if and only if the specified point lifts to `B`. The relative minimality condition makes the differences of evaluations vanish: quadratic terms contain a maximal-ideal factor, and coefficient-linear terms contain an `m_Λ` factor. No functor defined only on Artinian objects is evaluated on an infinite quotient.

**Checks.**

- The relation-free presentation has zero obstruction for every such extension, including `I=0`.
- For `R=k[[X]]/(X²)` and `k[t]/t³→k[t]/t²`, the point `X↦t` has obstruction `[X²]↦t²≠0`.
- For `R=k` over a DVR `Λ`, the extension `Λ/(π²)→k` sends the relation class of `π` to its nonzero kernel class.
- Without minimality, evaluation is not independent: for `k[[Y]]→k`, lifts `Y↦0` and `Y↦ε` into `k[ε]` give different values.

Define `CompleteSocleObstruction F V` to consist of obstructions in `V⊗_k I` for every finite-dimensional kernel `I` with `m_B I=0`, vanishing exactly when the specified point lifts, and natural under every commuting extension square and linear kernel pushout, including the zero pushout. Its API includes restriction to one-dimensional small extensions, transport by a linear equivalence of `V`, and the presentation instance `V=E(q)*`. The four computations above test that instance: the relation-free zero case, the quadratic obstruction, the coefficient obstruction and the nonminimal failure. This is stronger than a small-kernel-only detector; no automatic extension of such a detector is assumed. **Targets.** Prove the lift criterion and tensor-valued naturality for kernels of every finite dimension. The principal-small-extension detector alone is insufficient for §2.5. Source: Stacks, Artin's Axioms, Definition 98.22.1 and Example 98.22.4, tags [07YG](https://stacks.math.columbia.edu/tag/07YG), [07YI](https://stacks.math.columbia.edu/tag/07YI); Gee, Lemma 3.13, p. 13. Needs: §§1.7, 2.2 and the new `CompleteSocleObstruction` interface.

### 2.4 An Artinian extension testing all relations

Choose `N≥1` with `J∩m_S^N⊆m_SJ`, using Artin–Rees. The **relation test extension** is

`B_N=S/(m_SJ+m_S^N) → A_N=S/(J+m_S^N)`.

Both objects are Artinian. Its kernel is canonically `E(q)`, killed by the maximal ideal, and the point `R→A_N` has obstruction `id_E`. The API includes existence of an exponent, the kernel equivalence on relation classes, the identity-obstruction formula, reduction between larger admissible exponents with identity kernel map, and pushout by `λ:E→k`. A nonzero `λ` gives a principal small extension to which this point cannot lift. When `E=0`, the displayed extension is an isomorphism.

**Checks.**

- With `J=0`, the two quotients coincide.
- For `J=(X²)` and `N=3`, this is the cubic-to-quadratic truncation, with one-dimensional kernel.
- For `J=(X,Y)²` and `N=3`, the kernel has dimension three; calling it principal small would be wrong.
- For the nonminimal presentation `J=(Y)`, `N=2`, the resulting dual-number extension has a coefficient section, so the minimality hypothesis in the non-lifting assertion is necessary.

**Targets.** Construct these finite quotients and all kernel pushouts. Source: Khare–Wintenberger II, proof of Lemma 4.6, pp. 43–45; Schlessinger, Definition 1.2 and proof of Theorem 2.11, pp. 209, 213–214. Needs: §§2.2–2.3 and native Artin–Rees.

### 2.5 Bounding equations of a hull

Suppose `h_R→F` is a hull in the classical labelled coefficient category. Suppose `F` has a finite-dimensional complete obstruction space `V`: for every finite socle extension, obstructions lie in `V⊗I`, vanish exactly on liftable points, and commute with every kernel pushout. Applying it to §2.4 gives an injection `E(q)*→V`. Thus

`R ≃ Λ[[X₁,…,X_d]]/(f₁,…,f_r)`, `d=dim T_F`, `r=dim E(q)≤dim V`.

In particular `V=0` implies that the hull is a power-series ring. A nonzero, nonminimal obstruction space does not imply that the functor is obstructed. The proof must use the hull's smooth lifting property when comparing a lift of its image in `F` with the original representable point.

The smooth-transformation comparison identifies smooth `h_S→h_R` with formally smooth `R→S` in §1.11. Such `S` is a finite-variable power-series algebra over `R`, with the number of variables its relative cotangent dimension. For a hull, surjectivity of `F(B)→F(A)` on all Artinian surjections is equivalent to formal smoothness of `Λ→R`. These are coefficient-specific transports of SchemeAndStackFoundations' criterion, rather than a second representability theorem.

Source: Khare–Wintenberger II, Lemma 4.6, pp. 43–45; Gee, Proposition 3.24(2), p. 18; Schlessinger, Definition 2.2, Proposition 2.5, Theorem 2.11, pp. 210–215. Needs: §§2.1–2.4 and the exact SchemeAndStackFoundations, Layer 4 contracts above. The hypothesis is `CompleteSocleObstruction F V` of §2.3, including its higher-dimensional pushout maps.

### 2.6 Fixed-basis matrix equations

Fix finite `d,n`, residual lifts `L_i∈GL_n(Λ)` and a set `W` of words in the free group on `d` generators, all satisfied by their reductions. In `S=Λ[[X_{i,a,b}]]`, put `U_i=L_i+(X_{i,a,b})`. Each `U_i` is invertible. Define the **framed matrix ring** as `S/J_W`, where `J_W` is generated by the entries of `w(U)-1` for all `w∈W`. The residue condition puts `J_W` in `m_S`. An infinite set of words is permitted because `S` is Noetherian.

Its API gives universal matrices, their entry formulas, the natural evaluation bijection between labelled maps to an Artinian `A` and tuples of matrices satisfying the equations with the prescribed reductions, the empty-relation identification with `S`, and the bound `dim T≤dn²`. The basis is part of the points; no conjugacy quotient enters this definition.

**Checks.**

- With no words, the ring is the full series ring; with `d=0` or `n=0` it is `Λ`.
- One scalar generator with residual value `1` and relation `g²=1` gives `k[[X]]/(X²)` over `Λ=k` of characteristic two.
- Over `Λ=k` of characteristic different from two, `(1+X)²-1=X(2+X)` has a unit second factor, so the same ring is `k`.
- Over `Λ=ℤ₂`, the same relation gives the reduced ring `ℤ₂[[X]]/(X(2+X))`, whose special fibre is `𝔽₂[[X]]/(X²)`.
- A word not satisfied residually would give an ideal containing a unit and the zero quotient, which is not a coefficient object.

**Targets.** Construct the quotient and evaluation equivalence. Source: Kisin, Lecture 1, Proposition 1.2.1(1), p. 2, and Remark 1.1.2(1), p. 1; Gee, Lemma 3.2 and Exercise 3.11, pp. 12–13. Needs: Layer 1, native matrices/free groups/power series.

### 2.7 Continuous framed representations

Now let `k` be finite of characteristic `p` and let `Γ` be profinite with a continuous fixed-basis residual representation. The continuous framed ring and its universal lift are PadicLocalLanglandsForGL2Qp §0.4's representing pair `(R^□,ρ^□)` at the same `Λ`, `k`, `n` and residual basis. Use `TauCeti.IsTopologicallyFinitelyGenerated` from `TauCeti.Topology.Algebra.Group.Generation` for topological finite generation of a group; a chosen finite generating tuple witnesses that predicate. For such a tuple, form its free profinite presentation. The universal matrices of §2.6 give a continuous representation of that free profinite group by passage to the finite groups over `S/m_S^a`, and the entries of the relations in the closed kernel generate a closed ideal `J` of `S`.

**Presentation theorem.** The quotient `S/J` with the induced representation of `Γ` satisfies the natural evaluation equivalence with actual continuous framed lifts on Artinian coefficients, so §0.4's unique universal-lift-preserving isomorphism identifies it with `(R^□,ρ^□)`; under this identification the generators of `S` map to the entries of `ρ^□(γ_i)−L_i`. Consequences are compatibility with the discrete word construction of §2.6, the tangent bound `dim m_(R^□)/(m_Λ R^□+m_(R^□)²)≤dn²`, and reduction to the maximal pro-`p` quotient of the residual kernel: every Artinian lift kills the corresponding pro-`p` kernel, and finite generation of that quotient suffices even when `Γ` itself is not finitely generated. The identification respects coefficient change and the fixed-determinant fibre because §0.4's comparison does. Arithmetic conditions ensuring this finite generation belong to the Galois deformation suppliers. The isomorphism preserves the actual lifts, rather than only their conjugacy classes.

**Checks.**

- For the trivial group the ring is `Λ`.
- A free profinite group on `d` generators gives all `dn²` variables.
- For `C₂`, scalar residual representation `1`, and `Λ=k` of characteristic two, the ring is the nonsmooth quadratic ring of §2.6.
- Finite-word equations over an arbitrary infinite residue field do not supply this continuity theorem: finiteness of the discrete quotients is used in constructing the profinite map.
- In rank one for `Γ=ℤ_p` and trivial residual character, the presentation with one generator and no relation is `Λ[[T]]` with `T` the entry of `ρ^□(1)−1`, so the identification with §0.4's pair sends its universal value at `1` to `1+T`. Changing `T` to `T+T²` is a ring automorphism but does not preserve that universal lift, so it is not a second identification.

**Targets.** Prove the presentation theorem and the reduction and evaluation statements on §0.4's pair. Source: Kisin, Lecture 1, Proposition 1.2.1(1) and Remark 1.1.2(1), pp. 1–2. Needs: §2.6, PadicLocalLanglandsForGL2Qp §0.4's representing pair and its universal-lift-preserving comparison, the free profinite and maximal pro-`p` interfaces of ProfiniteProPGroups, and native profinite limits. The generic free profinite construction is supplied by `ProfiniteProPGroups` Layers 0, 3 and 4; only its continuous matrix-presentation comparison is new here.

### 2.8 A hull with nonunique compatible automorphisms

For Artinian local `k`-algebras define the **principal-unit orbit functor** `F(A)=m_A/(1+m_A)`, where multiplication by units with residue one defines the orbit relation. Coefficient maps transport the orbits. Its API provides this transport, the natural orbit map `h_{k[[X]]}→F`, its smoothness and tangent isomorphism, the continuous automorphism `X↦X+X²`, and invariance of the orbit map under that automorphism. Thus it is a hull whose compatible automorphisms need not be unique.

**Checks.**

- `F(k)` is a singleton.
- On `k[ε]`, multiplication by `1+bε` fixes every `aε`; the tangent map is the identity of `k`.
- In `A=k[t]/t³`, `B=k[t]/t²`, the elements `(t,t)` and `(t,t+t²)` of `A×_B A` have different principal-unit orbits. Indeed the first-order coefficients of a unit in the two factors must agree, and therefore it cannot change just the second `t²` coefficient. Their component orbits agree, so the self-pullback map is not injective.
- The degree-two coefficient of `X+X²` is nonzero over every field, including `𝔽₂`; its formal inverse exists because its linear coefficient is one.

**Targets.** Verify the hull properties and the explicit failure of the imported prorepresentability criterion. Source: Schlessinger, Proposition 2.9, Theorem 2.11 and Remark 2.15, pp. 211–215; the orbit computation supplies the concrete witness. Needs: §§1.7, 2.5 and native power-series substitution.

### Examples

The characteristic-two involution combines a tangent direction and one quadratic obstruction. The residue algebra over a mixed-characteristic DVR shows why minimal relative equations may have a coefficient-linear term. The orbit functor distinguishes a smooth tangent-bijective hull from a prorepresenting object without using Galois cohomology.

### Dependencies

Layer 1; SchemeAndStackFoundations, Layer 4, and the new finite-socle obstruction interface of §2.3; PadicLocalLanglandsForGL2Qp §0.4's continuous framed representing pair; the profinite interfaces of LocalGaloisGroups; native matrices, free groups, power series, quotient modules and Artin–Rees. No arithmetic deformation condition is used.

## Layer 3: Homological dimension, local duality and multiplicity

### 3.1 Finite resolutions and depth

Use the supplied depth and CM predicates. Construct the **short-exact depth comparison** `depth_shortExact`: for an exact sequence `0→L→M→N→0` of finite modules over a Noetherian local ring `A`, prove

```text
depth M ≥ min(depth L, depth N),
depth N ≥ min(depth M, depth L − 1),
depth L ≥ min(depth M, depth N + 1).
```

Use extended nonnegative depths, with truncated subtraction and `∞−1=∞`; zero modules have depth `∞`. Derive the inequalities from the supplied residue-Ext characterization and the native long exact Ext sequence, treating zero endpoints separately. Source: Stacks Lemma 10.72.6, tag [00LX](https://stacks.math.columbia.edu/tag/00LX). Needs: supplied depth/Ext and native long exact Ext.

**Checks.**

- Over a field, `0→k→k²→k→0` with coordinate inclusion and projection has all three depths zero; the inequalities read `0≥0`.
- Over a DVR, `0→O --π→ O→k→0` has depths `1,1,0`; the last two bounds are equalities, including the shift by one.
- In `0→0→M --id→ M→0`, the first two bounds are equalities and the last has left side `∞`. The sequence `0→M --id→ M→0→0` tests the other zero endpoint.

Next prove `regularLocal_maximalDepth_free`: a finite module of depth `d` over a regular local ring of dimension `d` is free. This precedes Auslander–Buchsbaum. A regular parameter is module-regular: the associated-prime depth bound and the regular local dimension formula force every associated prime of a nonzero maximal-depth module to be zero. Reduce by that parameter, apply induction and lift a basis of the free quotient; Nakayama and regularity of the parameter kill the relation kernel. This proof also works over finite residue fields. The base case is a field, the zero module is free independently, and the residue module over a positive-dimensional DVR fails the maximal-depth hypothesis. Source: Stacks Algebra, Lemma 10.106.6, tag [00NT](https://stacks.math.columbia.edu/tag/00NT). Needs: regular-local parameters, supplied depth/Ext, finite local Nakayama and the regular-local dimension formula.

The **resolution comparison** identifies `pd_A M≤n`, for finite `M` over a Noetherian local `A` and `n≥0`, with a native projective resolution whose terms are finite free and vanish above `n`. For every finite module, first construct its minimal bounded-above finite-free resolution by successively resolving finite syzygies, even when projective dimension is infinite. Its differential images lie in the maximal ideal times their targets. Under the displayed projective-dimension bound this resolution stops at that degree. For nonzero `M`, its last nonzero degree is its projective dimension. The API compares this resolution with the native categorical projective dimension, tensors it to the residue field, and equips native `Tor_j(M,k)` with its actual residue-field vector-space structure. Identify the term ranks with these finite residue Tor dimensions in every degree. In particular the first two ranks compute generator and relation counts without any finite-projective-dimension hypothesis.

**Checks.**

- A nonzero finite free module has minimal resolution only in degree zero.
- Over a DVR, `k` has resolution `0→A --π→ A→k→0` and projective dimension one.
- Over `k[ε]/ε²`, the minimal resolution of `k` has a nonzero term in every degree; finite generation does not imply finite projective dimension.
- The zero module has the zero resolution and bottom projective dimension; it has no last nonzero degree.

**Targets.** Prove Auslander–Buchsbaum (`auslanderBuchsbaum` in `Suggested.lean`) for nonzero finite `M` of finite projective dimension:

`pd_A M + depth_A M = depth A`.

The proof uses the supplier's depth–Ext comparison, annihilation of `Ext_A^i(k,N)` by `m`, vanishing of the maps on residue Ext induced by minimal matrices, and the depth drop in a minimal free injection. State also the syzygy bound `depth K_j≥min(depth A,depth M+j)` using `depth_shortExact` for every finite segment `0→K_(j+1)→F_j→K_j→0`, without finite-projective-dimension assumptions. Killing an element in `m` regular on both `A` and `M` preserves this projective dimension after quotienting. Source: Stacks, Algebra §§10.102, 10.109, Proposition 10.111.1, tags 00MT, 0CXE, 0CXF, 065R, [090V](https://stacks.math.columbia.edu/tag/090V), pp. 243–244, 262–268. Needs: native projective resolutions, `depth_shortExact` and `regularLocal_maximalDepth_free` above; the proof must not use this formula to justify that input.

### 3.2 Regular local homological comparisons

Consume `EnhancedDerivedSheaves` §E1.6's regular homological-dimension theorem and residue-field converse. The regular-local specialization records its finite-module bound, the minimal-resolution step in the proof of `isRegularRing_projectiveDimension_le`; combine it with §3.1 to obtain `pd_A k=dim A`. Construct the comparison at every prime localization with that homological characterization, then obtain the native `IsRegularRing` instance. The local bound does not presuppose this instance. This localization assertion is required in addition to the supplier's completion comparison.

For a finite module of finite projective dimension over a Noetherian local ring, the alternating ranks of a finite free resolution give an integer rank independent of the resolution. At every associated prime of `A`, the localization is free of this rank, by Auslander–Buchsbaum at depth zero. This allows zero rank and does not imply global projectivity. When `A` is regular local of dimension `d`, the residue Koszul comparison gives `RHom_A(k,A)≃k[-d]` and `Ext_A^*(k,k)≃∧^*((m/m²)*)`, with generators in degree one.

For a general Noetherian local ring, Lescot's criterion asserts that `A` is regular exactly when `Ext_A^n(k,A)→Ext_A^n(k,k)` induced by the residue quotient is nonzero for some `n≥0`. More generally, for **each nonzero finite module M of finite projective dimension**, the same equivalence holds with the quotient `M→M/mM`, as stated by `lescot_module_regular_iff` in `Suggested.lean`. In the regular case degree `d=dim A` works: the top Koszul cokernel map is the identity on the nonzero vector space `M/mM`. Nonzeroness of the module is essential.

The prerequisite `regularGenerators_iff_koszulAcyclic` is the following local converse to the supplier's Koszul resolution theorem: for a nonzero finite M over Noetherian local A and a finite list x in m, x is M-regular if and only if `H₁(K(x)⊗M)=0`, if and only if all positive Koszul homology vanishes. Prove the converse by induction on the list: the last-variable exact sequence makes multiplication by the last element surjective on finite H₁ of the prefix, so Nakayama kills that group, and injective on H₀ of the prefix. Include the empty list, a DVR uniformizer, and the zero element over a field as Checks: their H₁ groups are respectively zero, zero and the field. The assumption x⊆m excludes a unit, whose Koszul complex is acyclic while its quotient is zero. This uses the supplied Koszul carrier, not a new complex (Stacks, Lemma 15.31.7, tag [09CC](https://stacks.math.columbia.edu/tag/09CC)).

The following targets supply the stable-cohomology argument, independently of Martsinkovsky's proof.

- `boundedStableHomComparison`: for projective resolutions `P→M`, `Q→N`, use the supplied native Hom complex, whose degree terms are products. Its **bounded Hom subcomplex** consists of maps with only finitely many nonzero resolution components; the **stable Hom complex** is the quotient by that subcomplex. Construct the short exact complex sequence, its natural long exact cohomology sequence, comparison under resolution homotopy equivalences, the ordinary-to-stable map, and the composition bimodule actions: left `Ext_A^*(N,N)` and right `Ext_A^*(M,M)`. For `M=N=k`, retain the left action of `E=Ext_A^*(k,k)`. The API retains the inclusion and quotient chain maps and their naturality in `N`. For a bounded resolution either source or target gives zero stable cohomology. For `k` with a degreewise finite free resolution, stable cohomology in the second argument commutes with arbitrary direct sums of copies of `k`. This last assertion is a theorem about these resolutions and the quotient, not a rule interchanging arbitrary products and sums.
- `boundedResidueExt_leftTorsion`: every class of bounded `Ext_A^*(k,k)` is killed by all sufficiently high positive degrees of `E`. A bounded representative lands below a fixed target resolution degree; postcomposition with a sufficiently high positive-Ext-degree lift lowers that target index below zero, so the composite is zero. The map from bounded to ordinary Ext is left `E`-linear.
- `residueExt_evenRegularOperator`: if `A` is singular, there is `θ∈Ext_A²(k,k)` whose left multiplication on `E` is injective. Construct the homotopy graded Lie algebra `π_A` from Γ-derivations of a minimal residue acyclic closure `A⟨X⟩`. Its degree-one stage is the Koszul complex K on minimal generators of m; the degree-two variables kill a k-basis of `H₁(K)`. This space is nonzero precisely when A is singular, by the Koszul regular-sequence criterion. The specific comparison target `residueExt_envelopingComparison` constructs `U(π_A)≃E`, identifies `π_A²≃Hom_k(kX₂,k)`, and proves that E is free as a left module over `k[θ]` for any nonzero even `θ∈π_A²`. Its API includes invariance under completion and change of acyclic closure, the degree-two Koszul-homology identification, the normal-monomial basis and its graded PBW filtration. Order a basis with θ first on the left to obtain this freeness. Odd elements carry their square operation, including in characteristic two; the ordinary ungraded Lie enveloping algebra is not a substitute. No minimal Cohen presentation is assumed in mixed characteristic.

  Build the acyclic closure by successively adjoining divided-power variables to kill minimal homology generators. Lifting the coordinate functionals to Γ-derivations gives a triangular evaluation matrix on its monomial basis; its diagonal entries are one. This proves minimality and the enveloping comparison, not merely existence of a Lie bracket (Avramov, Construction 6.3.1, Lemma 6.3.3, Theorems 6.3.5 and 10.2.1). The graded PBW normal forms use arbitrary exponents on even generators and exponents zero or one on odd generators. Check π²=0 for fields and regular DVRs, π²=k for dual numbers, and the nonzero odd square over `𝔽₂[ε]/ε²`. These distinguish the square operation and degree-two criterion from an exterior algebra in every characteristic.
- `stableResidueComparison_injective`: for singular `A`, the comparison `Ext_A^n(k,k)→stableExt_A^n(k,k)` is injective in every degree. Indeed the preceding two targets force the bounded-to-ordinary map to be zero: its image is left torsion, whereas successive multiplication by `θ` is injective. Exactness gives the injection. Negative ordinary degrees are zero. These constructions use native resolution/Hom/divided-power carriers; no new derived category is constructed.

**Checks.**

- Over a field, stable residue cohomology is zero but ordinary degree-zero Ext is `k`; the comparison is not injective. Over a regular DVR the analogous obstruction occurs in ordinary degree one. The singularity hypothesis cannot be removed.
- For `A=k[ε]/ε²`, the residue resolution has differential multiplication by `ε` in every homological degree. Ordinary Ext is `k` in every nonnegative degree; stable Ext is `k` in every integer degree, and the comparison is an isomorphism in nonnegative degrees. The degree-two periodicity operator is injective. This calculation holds for `k=𝔽₂`; it does not require the square of an odd Ext generator to vanish.
- For a finite free resolution the bounded Hom complex is the full Hom complex, so the stable quotient is zero. A zero module also gives zero; an infinite residue resolution does not.
- The resolution disk `A --π→ A` in homological degrees `1,0` has dual differential `-π` in cohomological degrees `0,1`, by δ(f)=d f-(-1)^n f d. Thus `Ext_A¹(k,A)=k` over a DVR and its map to `Ext_A¹(k,k)=k` is the identity, while the degree-zero map has zero source. For π=2 the dual differential is -2, not +2; its cokernel is still A/(π). This pins the direction of the quotient-induced map.
- The constant component sequence `(1,1,…)` in the degree-zero Hom product of an infinite rank-one resolution is not in the bounded subcomplex. A direct sum used as the full Hom complex would make the stable quotient incorrectly zero.

To finish `lescot_module_regular_iff`, prove the stronger `finitePdToSocle_ext_zero`: for singular `A`, an `A`-linear map `β:M→V` with `mV=0` factoring through **any module of finite projective dimension** induces zero `Ext_A^n(k,M)→Ext_A^n(k,V)` for all `n≥0`. The stable map factors through zero; the natural comparison square and injectivity for `V=⊕k` force the ordinary map to vanish. Apply this to `M→M/mM` and the identity finite-pd factor. This also gives the ring case `M=A`. The proof uses no finiteness assumption on `V` or on the intermediate module.

Source: Stacks, Algebra Propositions 10.110.1, 10.110.5, Lemma 10.110.6, tags 00O7, 00OC, [0AFS](https://stacks.math.columbia.edu/tag/0AFS), pp. 265–267; Avramov–Veliche, *Stable cohomology over local rings*, §§1.3–2.1, Lemma 1.3.2, pp. 4–7, §5.1, Lemma 5.1.7 and Theorem 5.1.8 with its proof, pp. 15–16 (arXiv version 3); Avramov, *Infinite free resolutions*, §§6.2–6.3, pp. 56–60, §7.1, pp. 62–63, and §§10.1–10.2, pp. 95–99, especially Theorem 10.2.1 with proof; Avramov–Iyengar, Proposition 1.3 and Theorems 2.1, 2.4 with proofs, pp. 2–4. The enveloping comparison and the bounded-Hom construction are named proof prerequisites here; cotangent-complex existence alone supplies neither. Needs: §3.1, `EnhancedDerivedSheaves` §E1.6, Layer 1 Cohen presentations, supplier Koszul/native Hom and divided powers, and the specific residue acyclic-closure/PBW comparison just described.

### 3.3 Finite actions and flat fibres

If `S` is Noetherian, `M` finite over `S`, and a commutative `S`-algebra `R` acts compatibly, its image in `End_S(M)` is finite over `S` and equals `R/ann_R M`. For a local map of Noetherian local rings `S→R`, a nonzero `R`-module finite over `S` has the same depth and support dimension over both rings. The proof applies finite-map comparisons to the action image, not to an unproved finite map `S→R`. For a finite semilocal algebra use the minimum of local depths and the maximum of support dimensions; CM at all local factors implies CM over the base only when the relevant dimensions agree.

The **finite-action adapter** exports the image equivalence, scalar compatibility, support-image formula, depth and dimension comparisons, and the consequences: a nonzero CM module finite over a regular local `S` is `S`-free if its support dimension is `dim S`; for a local map of equal-dimensional Noetherian local domains `S,R`, an `S`-finite `S`-faithful nonzero module is also `R`-faithful and `R` is `S`-finite. If both domains are regular and the module is finite projective over `S`, it is finite projective and faithful over `R`.

The global target `finiteProjectiveFaithful_of_equalDimensionDomains` retains the version needed after inverting a uniformizer: for a map `A→D` of Noetherian domains of the same finite dimension and a nonzero `D`-module `L` finite projective over `A`, the map is finite and `L` is `D`-faithful; if both rings are regular, `L` is finite projective over `D`. Neither ring is assumed local. First embed the action image into `End_A L`, use positive constant rank over the domain `A` and dimension to kill its kernel in `D`, and then localize and complete at corresponding primes. The finite algebra decomposes over the completed local base, and each module factor is a base-projective direct summand. Apply the local depth comparison and Auslander–Buchsbaum to that factor. This is Kisin, Lemma 3.3.4, p. 1159; it is a separate global statement, not an inference that localization of a local map stays local at arbitrary primes.

**Checks.**

- The zero module has zero action image; it cannot prove that either ring acts faithfully.
- `S→S[[T]]` acting on `S` by `T=0` has finite image but is not itself finite.
- Over `k[[x,y]]/(xy)`, the module `A/(x)` is MCM and misses a component; the domain assumption in the faithfulness conclusion matters.
- For a product of two finite local algebras with modules of unequal dimensions, minimum depth and maximum dimension do not give a CM equivalence.

**Targets.** Prove these adapters and the following genuinely module-level flatness statements. For local Noetherian `A→B→C` and nonzero finite `C`-module `M`,

`(M is A-flat and M/m_A M is B/m_A B-flat)`

is equivalent to `(B is A-flat and M is B-flat)`. If `A` is regular, `M` is CM over `B`, and `dim Supp_B M=dim A+dim Supp_(B/m_A B)(M/m_A M)`, then `M` is `A`-flat. The finite-map ring specialization is consumed from ModularCurves §4D. For a finite `B`-module `N` flat over `A`, a fibre nonzerodivisor lifts and its quotient is `A`-flat; a free closed fibre lifts to a free `B`-module when `B` is `A`-flat. A flat local map with regular closed fibre of dimension `d` gives `pd_B N≤d` for such `N`. The fibre injection criterion allows an arbitrary flat `A`-module `P`: an `A`-linear `N→P` injective modulo `m_A` is injective with `A`-flat cokernel.

Source: Kisin, Lemma 3.3.4, p. 1159; EGA IV₂, Proposition 5.7.9 and Corollary 5.7.10, pp. 106–107; EGA IV₃, Theorem 11.3.10 and Lemma 11.3.10.1, pp. 138–140; Pilloni, Lemma 10.1.1 and proof of Lemma 10.3.1, pp. 57, 60; Stacks, Algebra §§10.99, 10.163, tags 00ME–00MH, 0338, and More on Algebra, Lemma 15.79.6, tag 09PC. Needs: §3.1 and the supplier's flat-local depth/dimension formulas. Nonzero finite `C`-module hypotheses remain in the fibre criterion; no claim is made for arbitrary modules.

### 3.4 Regular-sequence ideals and complete intersections

Define a **regular-sequence ideal** by existence of a finite native regular list generating it. The list has nonzero final quotient. Its API includes the empty-list zero ideal in a nonzero ring, exclusion of the unit ideal, transport by equivalences, and faithfully flat base change. Descent of the existence of a generating regular list is asserted for faithfully flat **local maps of Noetherian local rings** and proper extended ideals. There one can choose minimal generators downstairs, compare their number after the residue extension, and descend exactness of their Koszul complex. Replacement by any minimal local generating list has the same local hypotheses. Over a CM Noetherian local ring, a list of `c` elements in `m` is regular exactly when its quotient has dimension `dim A-c`.

**Checks.**

- The zero ideal of a nonzero ring has the empty regular generating list.
- A unit generates the unit ideal but is excluded by the nonzero-quotient convention.
- `(X²,XY)⊂k[[X,Y]]` has height one and two minimal generators; that generating pair is not regular.
- `(X²,Y²)` is regular, even in characteristic two, whereas repeating `X` is not.
- Global existence does not have the unrestricted faithfully flat descent property: the nonprincipal invertible ideal `(2,1+√(-5))` in `Z[√(-5)]` becomes principal on a finite principal-open trivializing cover. The product of the corresponding localization rings is faithfully flat. Its extended ideal has a one-element regular generating list, whereas the original ideal has none: a nonzero proper regular-sequence ideal in this Dedekind domain must be principal. Its norm is two, and `a²+5b²=2` has no integral solution, which detects nonprincipality.

An **absolute local complete intersection** is a Noetherian local ring whose completion is a quotient of a regular local ring by such an ideal. A **locally complete-intersection ring** is Noetherian and has that property at every prime. The API compares complete presentations, tests a chosen regular-local surjection, localizes at primes, and detects the global property at maximal ideals. A surjection of regular local rings has kernel generated by a prefix of a regular parameter system. Changing between two regular local presentations preserves the regular-ideal condition. Complete intersections are CM. These absolute predicates differ from the supplier's relative lci morphism predicate.

**Checks.**

- Fields and complete DVRs are absolute local complete intersections of codimension zero.
- `k[[X]]/(X²)` is a codimension-one CI, although it is nonreduced and not regular.
- `k[[X,Y]]/(X,Y)²` is not CI: its dimension is zero and its relation space has dimension three, exceeding the codimension two.
- The local map `k[t]_(t)→k`, although its target is absolutely regular, has a nontrivial relative equation; absolute regularity is not relative smoothness.

**Targets.** For regular local `A`, `I⊆m`, and `dim(A/I)+c=dim A`, prove that `A/I` is CI exactly when `I/I²` has at most `c` generators. Lifting conormal generators generates `I` by Nakayama. For nested `I⊆J⊆m`, finite projective dimension of `A/J` over `A/I` forces `I∩mJ=mI`; if `J` is regular, both `I` and `J/I` are regular ideals. Across a flat local map with regular closed fibre, and flat induced quotient map, `J` is regular exactly when the base ideal and fibre quotient ideal are. Deduce the flat-local CI criterion: the target is CI exactly when base and closed fibre are CI.

Use `regularGenerators_iff_koszulAcyclic` from §3.2. Its generator-change adapter here is the exterior-power chain isomorphism induced by an invertible matrix, giving invariance under minimal generating lists. The completion map and `regularSourceSquare` of §1.16 then give presentation independence; this argument does not assume a separable residue extension.

The conormal injection requires the finite-variable Tate resolution and its divided-power derivation argument: construct the resolution with finitely many generators in each degree, extend degree `-2` derivations compatibly with divided powers, and use a nonzero relation to force nonzero Tor in arbitrarily high even degrees. Mere existence of a cotangent complex does not supply this proof. The generic Koszul, divided powers and cotangent carriers are imported.

Source: Stacks, More on Algebra §15.31, tags 09CC, 066A, pp. 78–81; Divided Power Algebra §§23.6–23.8, Lemmas 23.6.9, 23.7.1–23.7.6, 23.8.1–23.8.9, tags 09PS–09PX, 09PZ–09Q7, pp. 16–22. Needs: §3.1, Layer 1, the supplied Koszul complex and the native divided-power algebra.

### 3.5 Dimension criteria for formal equations

Let `A` be complete local CM and let `B=A[[X₁,…,X_r]]/(f₁,…,f_t)` be nonzero, all `f_i` in the maximal ideal. If `dim B≤dim A+r-t`, equality holds and the displayed list is regular. If `A` is CI, so is `B`. If also `dim(B/m_A B)≤r-t`, then `B` is `A`-flat. This uses the actual number of displayed equations, including redundant ones; such redundancy prevents the assumed dimension bound. The closed-fibre dimension hypothesis is separate from the total dimension bound. Source: Paškūnas–Quast, Lemma 3.9, p. 22; Stacks, Algebra Lemma 10.104.2, tag 02JN, p. 250. Needs: §§3.3–3.4, formal-variable dimension and supplier CM parameters. With `r=t=0` it recovers the identity map; quotienting a DVR by `π` satisfies the total dimension equality but not the extra flatness bound.

### 3.6 Prime-local tests and symbolic squares

Use native associated primes. Add the element-detection theorem: over Noetherian `A`, an element of an arbitrary module vanishing at every associated-prime localization is zero. For finite `M,N`, `Ass Hom_A(M,N)=Supp M∩Ass N`: after localization its socle is `Hom_k(M/mM,soc N)`, and Nakayama detects `M_p≠0`. Under `R→S` with `S` Noetherian, associated primes of any `S`-module contract exactly to its `R`-associated primes; finiteness of the map is not needed. Use the supplier's Serre criterion and normal-domain height-one DVR/intersection theorem where already available; the finite-module application detects fractions and homomorphisms on these localizations, including the empty height-one set for a field.

Define `symbolicSquare p`, the **second symbolic power** of a prime `p`, as the contraction of `p²A_p`. Its API is membership `a∈p^(2) ↔ ∃s∉p, sa∈p²`, inclusion of `p²`, localization equality, and transport under ring equivalence. It uses native ideal localization rather than a new localization carrier.

**Checks.**

- For `p=(0)` in a domain, both squares are zero.
- For the maximal ideal of a local ring, symbolic and ordinary squares agree.
- In `k[x,y,z]/(xz-y²)`, for `p=(x,y)`, `x` belongs to the symbolic square since `zx=y²`, with `z∉p`, but `x∉p²` by degree. This calculation works in characteristic two.

Source: Iyengar–Khare–Manning, before Lemma 3.4, p. 18, and Lemma 7.5, p. 33; Stacks, Algebra §§10.63, 10.157, tags 05BW–05DZ, 0311, 031T. Needs: native support/associated primes/localization and the SchemeAndStackFoundations normality contract. No duplicate definition of associated primes or Serre conditions is introduced.



### 3.7 Dimension and top local cohomology

For a nonzero finite module `M` over a Noetherian local ring `(A,m)`, prove `localCohomology_top_nonzero`: `H_m^i(M)=0` for `i>dim Supp M` and `H_m^(dim Supp M)(M)≠0`. The zero module has zero cohomology in every degree and is excluded from the nonvanishing statement. This is the dimension/nonvanishing assertion beyond the supplied depth and CM criteria.

For a parameter system of a `d`-dimensional Noetherian local ring, construct `topLocalCohomology_tensor`: the natural isomorphism `H_m^d(A)⊗_A N≃H_m^d(N)` for **every** module `N`. Use the supplied Čech complex: its last cohomology is a cokernel, so right exactness of tensor gives the comparison; this does not assert that lower local cohomology commutes with arbitrary tensor. Its API includes the formula on the final localization classes, identity/scalar naturality and agreement with finite direct sums.

**Checks.**

- Over a field `d=0`, the comparison is `k⊗N≃N`, including `N=0`; for a nonzero finite vector space the top group is in degree zero.
- Over a DVR, `H_m^1(A)=E_frac/A≠0`, while its tensor with `k` is zero, agreeing with `H_m^1(k)=0`. The lower group `H_m^0(k)=k` does not arise from tensoring `H_m^0(A)=0`.
- For `A=k[[x,y]]/(xy)`, the top group is degree one and nonzero; the class of `x^(-1)` in the punctured Čech quotient survives. Its tensor with `A/(x,y)` is zero, although that module has nonzero degree-zero cohomology.

Also prove `grade_eq_inf_localDepth`: for finite `M`, grade is the infimum of local depths on `Supp M∩V(I)`, with the empty infimum `∞`. In particular depth at least two there kills `H_I^0,H_I^1`. Source: Stacks Local Cohomology, Lemmas 51.4.7 and 51.4.9, tags [0DXC](https://stacks.math.columbia.edu/tag/0DXC), [0DXE](https://stacks.math.columbia.edu/tag/0DXE), and Dualizing Complexes Lemma 47.11.1, tag [0AVZ](https://stacks.math.columbia.edu/tag/0AVZ), together with the final-term cokernel argument just specified; Hochster, Theorem 11.5 and Remark 11.6, pp. 40–41. Needs: the exact local-cohomology, Čech and Matlis contracts in the boundaries, supplied depth and finite support dimension.

### 3.8 Explicit Cohen models and noncomplete complex local duality

For complete Noetherian local `A` with a **chosen** regular complete local Cohen presentation `Q↠A`, construct `cohenDualizingModel`: the signed representative comparison, obtained by dualizing a bounded finite-free Q-resolution of A, of the supplied normalized dualizing object with `RHom_Q(A,Q[dim Q])`. The resulting A-action is derived; this does not assert a finite-free A-model for a non-Gorenstein ring. The extra assertion specifies the Q-chain representative and its signed evaluation under change of presentation; abstract affine duality, finite-local normalization and their adjunctions are inputs. Its API retains the coefficient map, compares the residue-normalizing map, and gives the change-of-presentation cocycle. A prime localization uses the supplier's recalculated normalized shift.

**Checks.**

- For a field with its identity presentation, the representative is degree zero and evaluation on `1` is `1`.
- For a DVR with its identity presentation, it is `O[1]` in degree `-1`; the unshifted model fails residue normalization.
- For `A=Q/(f)`, `Q` regular of dimension `d+1` and `f` regular, the two-term model gives `A[d]`, decreasing the shift by one. For two successive regular quotients the two normalization maps compose to the same map, with the cochain signs of §7.6.

For a Noetherian local `A` admitting a supplied normalized dualizing complex `ω_A`, and `K` with bounded finite cohomology, construct `noncompleteComplexLocalDuality`:

`LΛ_m RHom_A(K,ω_A) ≃ RHom_A(RΓ_m K,E_A)`.

Unlike the supplied complete-local bounded-complex theorem, this retains the completion for noncomplete `A`. Extend the supplied finite-module comparison by finite smart-truncation triangles; specify the natural comparison maps first, then prove they are isomorphisms, so arbitrary choices of triangles do not define the functor. The reverse comparison is `RΓ_m K≃RHom_A(RHom_A(K,ω_A),E_A)`. Its API includes triangle compatibility, scalar restriction and agreement with the finite-module and complete-local comparisons.

**Checks.**

- For `K=A` over an incomplete DVR with `ω_A=A[1]`, the left side `LΛ_m RHom_A(A,ω_A)` is `Â[1]`, not `A[1]`; omitting completion fails.
- For a field and `K=k[0]⊕k[-1]`, the two sides have the corresponding dual degrees `0,-1`, with the same signed maps.
- For `K=A/(π)[0]` over a DVR the comparison gives the residue Matlis dual in degree zero, whereas ordinary `Hom_A(k,A)` vanishes. Zero gives the zero comparison.

Source: Stacks Dualizing Complexes Lemmas 47.15.8–47.15.10, Proposition 47.15.11, §§47.16, 47.18, tags 0AX0, 0A7K, 0AX1, [0A84](https://stacks.math.columbia.edu/tag/0A84); the signed representative and finite-truncation constructions above. Needs: §3.7 and the exact dualizing, Matlis and local-duality supplier contracts in the boundaries, and §1.10 for the chosen Cohen presentation.

### 3.9 Canonical modules, type and trace

For local `A` of dimension `d` with normalized `ω`, its **canonical module** is `K_A=H^(-d)(ω)`. For a finite nonzero CM module of support dimension `s`, its **CM dual** is `M^∨=H^(-s) RHom_A(M,ω)`. The API identifies the full derived Hom with `M^∨[s]`, gives natural biduality, preserves support dimension and is exact on short exact sequences of CM modules of the same dimension. For a CM ring, `K_A` is MCM.

For a surjection from a complete regular local ring `S` of dimension `n` onto a nonzero complete CM local ring `A` of dimension `d`, finite-local duality compares the chosen normalized `ω` with `RHom_S(A,S)[n]`. Taking degree `-d` gives `K_A≅Ext_S^(n-d)(A,S)`. Normalized dualizing-complex comparisons give presentation independence up to module isomorphism; no unique module isomorphism is asserted without chosen duality data. For a regular sequence `x₁,…,x_r` in `m_A`, prove `K_(A/(x))≅K_A/(x)K_A`, and for formal variables prove `K_(A[[T]])≅K_A⊗_A A[[T]]`. These identify the Ext and normalized-duality constructions on the same canonical-module interface, including the type and socle comparisons below. The additional graded Ext/completion comparison is outside this interface.

**Checks.**

- Over a field these are ordinary finite vector-space duals.
- Over a regular local ring `K_A≃A`; for `A/(x)` with `x` regular, its dual is read in degree `-(d-1)`, rather than `-d`.
- For a nonzero finite-length module over a DVR, the CM dual is its Matlis dual, whereas `Hom_O(M,O)=0`.

A **Gorenstein local ring** is Noetherian local with finite self-injective dimension. Its API compares this condition with normalized dualizing complex `A[d]`, and with CM plus `K_A` free of rank one. In dimension zero it is equivalent to one-dimensional residue socle and self-injectivity. For a CM ring, its **canonical type** is the minimal generator number of `K_A`, equivalently the residue-socle dimension after any regular parameter system. The API proves independence from that system and invariance under formal variables. For a complete local CM `O`-algebra `B` and complete local CI `O`-algebra `C`, `B⊗̂_O C` is CM of the same type as `B` when at least one factor is `O`-flat. For a finite flat local `O`-order `A`, `K_A≃Hom_O(A,O)`. This extends the order specialization in GlobalNumberFields; the group-algebra coefficient pairing itself is the pinned `TauCeti.MonoidAlgebra.dualLinearEquiv`.

**Checks.**

- Fields, DVRs and `k[ε]/ε²` are Gorenstein of type one.
- `k[x,y]/(x,y)²` has socle dimension two and is not Gorenstein.
- Adjoining any finite number of formal variables preserves type; quotienting by a zero divisor is not covered by regular-parameter invariance.
- For `S=k[[x,y]]` and `A=S/(x²,y)`, the Ext degree is `2`, and `Ext_S²(A,S)≅A` agrees with the type-one socle of `k[x]/x²`. A change of regular presentation changes the Ext degree along with `dim S`, not the canonical-module isomorphism class.

`traceIdeal A M`, the **trace ideal** of an arbitrary module, is the image ideal of evaluation `M⊗Hom_A(M,A)→A`. Its API includes the span-of-values formula, functoriality under isomorphism and direct sums, and the local splitting criterion: `tr(M)=A` exactly when `A` is a direct summand of the arbitrary module `M`.

**Checks.**

- `tr(0)=0`, and `tr(A)=A`.
- Over a DVR, `tr(k)=0` although `k≠0`.
- For the ideal `(x,y)` in `k[[x,y]]`, the trace is `(x,y)`, so it has no free rank-one summand.

Source: Stacks, Dualizing Complexes §§19–21, tags 0AWR, 0AWS, 0DW7, 0AWX, 0BJJ, 0DWA, pp. 35–39; Iyengar–Khare–Manning, (4.2)–(4.3), Proposition 4.4 and Lemma 9.3, pp. 21–22, 38; Calegari–Geraghty, §4.1 before Lemma 4.1 and Lemmas 4.1–4.2, pp. 355–356 (arXiv pp. 43–44). Needs: §§3.4, 3.8, SchemeAndStackFoundations §2.21's normalized finite-local duality and the finite-order/group-algebra suppliers.

### 3.10 Abelian group-ring complete intersections

Let `O` be a complete DVR with residue characteristic `p`, and let `Δ=∏_i Z/p^(n_i)` be finite abelian. Compare the supplied group algebra with

`O[[T₁,…,T_r]] / ((1+T_i)^(p^(n_i))-1)_i`.

The API sends `T_i` to the selected generator minus one, compares augmentation ideals, and proves that the displayed relations form a regular sequence. Thus `O[Δ]` is local, finite free over `O`, and CI of dimension one. For complete local CM `B` over `O`, `B[Δ]` has the same canonical type as `B`. The CI conclusion is restricted to abelian groups; balanced modules later allow nonabelian finite `p`-groups.

**Checks.**

- For the trivial group this is `O` with no variables or relations.
- For `C₂` in residue characteristic two the relation is `T²+2T`; modulo `π` it has a repeated root and is not an étale equation.
- For `C_p×C_p` the residue ring is `k[T₁,T₂]/(T₁^p,T₂^p)`, with one-dimensional socle generated by `T₁^(p-1)T₂^(p-1)`.

Source: Calegari–Geraghty, §4.1 and proof of Lemma 4.11, pp. 356, 364. Needs: §§3.4, 3.9, PadicMeasuresIwasawaAlgebras L1 and `TauCeti.Algebra.MonoidAlgebra.Dual`.

### 3.11 Hilbert polynomials from graded modules

For finite `M` over Noetherian local `A` and every ideal `I⊆m_A` with `M/IM` of finite length, the cumulative function `hilbertSamuelFunction A M I n=length(M/I^(n+1)M)` and its unique eventual polynomial are PadicLocalLanglandsForGL2Qp §0.5's; the maximal-ideal polynomial is its value at `I=m_A`. Define the **graded Hilbert series** by the lengths of `I^nM/I^(n+1)M`; its cumulative coefficients are that function. The API relates the two series by division by `1-t`, compares graded pieces with §1.3, commutes with finite direct sums and keeps the coefficient ring explicit. For a finite graded module over an Artinian degree-zero ring with finitely many degree-one generators, prove eventual polynomiality of its degree lengths by induction on the number of generators. The exact kernel/cokernel sequence of §1.4 yields `P_Q(n)-P_K(n-1)` for the first difference; the cutoff is enlarged before taking differences. The eventual polynomial of the graded pieces is the first difference of §0.5's polynomial, by uniqueness of eventual polynomials. The cumulative polynomial has degree `dim Supp M` for `M≠0`.

**Checks.**

- For a field and nonzero finite-dimensional `M`, the cumulative polynomial is the constant `dim M`.
- For a DVR and `M=O`, it is `n+1`; the graded-piece series is `1/(1-t)` and the cumulative series is `1/(1-t)²`.
- For `R=k[[x,y]]`, `hilbertSamuelFunction R R m_R n=choose(n+2,2)`: the surviving monomials have total degree at most `n`. Its cumulative polynomial is `(n+1)(n+2)/2`.
- For `M=0`, the polynomial is zero and has no natural-number degree assigned as a nonzero module's dimension.

**Targets.** The statement `hilbertSamuel_polynomial` in `Suggested.lean` restates §0.5's unique eventual polynomial at the given `I` and `M` and adds the identification of its degree with the support dimension; integrality and positivity of the normalized coefficient at that dimension are §0.5's. Identify the degree with support dimension through prime filtrations, Artin–Rees for induced filtrations, and the dimension bound from generators. Prove invariance of top coefficients under bounded shifts of a good filtration. A nonzero homogeneous relation in `k[X₁,…,X_d]` lowers eventual growth degree; include `d=0` and `d=1` separately. This proves the polynomial tangent-cone comparison for a regular local ring, rather than assuming it from the domain theorem. The map sends each polynomial variable to its chosen parameter's initial class and is a graded isomorphism. Source: Stacks, Algebra §10.58, especially Lemma 10.58.10, tag 00K3, pp. 137–138; §10.60 and Lemma 10.106.1, tag 00NO, pp. 140–145, 253; Stone, §§1.2–2, pp. 4–10. Needs: §§1.1–1.4, PadicLocalLanglandsForGL2Qp §0.5's module-relative Hilbert–Samuel polynomial and the native graded suppliers.

### 3.12 Intrinsic and ambient multiplicities

The raw extraction `multiplicityCoefficient d P=d!·coeff_d(P)` is defined for every rational polynomial, including zero. On §0.5's polynomial at a specified bound `D≥dim Supp M` it is §0.5's dimension-normalized multiplicity, the **ambient multiplicity** `e_I^[D](M)`; at `D=dim Supp M` for nonzero `M`, and zero for `M=0`, it is the **intrinsic multiplicity** `e_I(M)`. Section 0.5 supplies integrality, positivity in the nonzero intrinsic case, additivity of ambient multiplicity in short exact sequences with a common bound `D`, and the intrinsic/ambient comparison. The additional theorems here are vanishing of ambient multiplicity on modules of support dimension below `D` and `e_(I^r)(M)=r^d e_I(M)` for `r≥1`.

**Checks.**

- Over a DVR `e_(π)(O)=1` and `e_(π^r)(O)=r` for `r≥1`. On the native carrier `Z`, `hilbertSamuelFunction Z Z (2^r) n=r(n+1)` for every `r,n≥0`, since the quotient is `Z/(2^(r(n+1)))`. At `r=0` it is zero; this length formula does not assert a unit-ideal multiplicity.
- The length-`s` module `O/π^s` has intrinsic multiplicity `s` and ambient dimension-one multiplicity zero.
- `O⊕k` has intrinsic dimension-one multiplicity one; intrinsic multiplicity is therefore not additive across modules of different dimensions.
- No power-scaling assertion is made with `r=0`, since the unit ideal is not an ideal of definition on a nonzero module.

**Targets.** The associativity formula

`e_I(M)=Σ_(dim A/p=d) length_(A_p)(M_p) e_I(A/p)`

is §0.5's. The sum ranges only over the finitely many top-dimensional minimal support primes, and all localized lengths are finite before conversion to integers. Prove the scaling and vanishing theorems above and the following comparisons. Completion preserves Hilbert functions and multiplicities. A flat local map with `m_B=m_A B` preserves them under scalar extension, with lengths measured in their own residue fields. For a finite local map use the factor `[k_B:k_A]` in length and multiplicity, and retain the ideal `m_A B` rather than substituting `m_B` without equality. Source: Stone, Lemma 8, Theorem 10 and Proposition 14, pp. 9–10, 13–14, 18–20; Emerton–Gee, Lemma 2.2.8, p. 7; Stacks, Algebra §§10.52, 10.97. Needs: §3.11, PadicLocalLanglandsForGL2Qp §0.5's dimension-normalized multiplicity, associativity formula and intrinsic/ambient comparison, native finite-length additivity and completion.

### 3.13 Parameters and initial-form inequalities

For nonzero finite `M` of dimension `d` and a parameter list `x` of length `d`, its Koszul homologies have finite length and

`e_(x)(M)=Σ_i (-1)^i length H_i(x;M)`.

The partial Euler characteristic inequality gives `length(M/(x)M)≥e_(x)(M)`, with equality exactly when `M` is CM. It concerns the parameter ideal, which need not be the maximal ideal.

Define **formally unmixed** to mean that every associated prime `p` of `Â` has `dim(Â/p)=dim A`; embedded primes are included in this test. Its API is invariance under completion and local ring equivalence, implication to equidimensionality and absence of embedded primes after completion, and the following criterion in **every characteristic**:

`multiplicityOne_regular`: for a nonzero Noetherian local ring `A`, formally unmixed together with `e_m(A)=1` is equivalent to regular locality. No perfectness, finiteness or infinitude of the residue field is assumed.

The proof prerequisites are `superficialMultiplicityReduction` and `multiplicityOne_normalizationDescent`. For an infinite residue field and an m-primary ideal `I`, the first chooses `x∈I` with `(I^(n+1):x)∩I^c=I^n` eventually, gives preservation of multiplicity on quotient for dimension greater than one, and selects a parameter ideal `Q⊆I` of the same multiplicity. In dimension one a regular superficial `x` gives `e_I(A)=length(A/xA)`. The second states: for a complete local domain `A` with infinite residue field and `e_m(A)=1`, its finite normalization `B` is regular, has the same residue field, and equals `A`.

Prove the criterion by induction on dimension after completion. Associativity and positivity from §3.12, together with formal unmixedness, force a unique associated prime and generic length one when `e_m=1`; hence the complete ring is a domain. At dimension zero its length is one. In positive dimension choose a superficial element. Remove the embedded primary components of its principal ideal: the resulting quotient is complete unmixed of dimension one less and multiplicity one, hence regular by induction. Apply the same argument to the finite normalization `B`. The extension formula gives `e_(mB)(B)[k_B:k_A]=1`, so `k_B=k_A` and `e_(mB)(B)=e_(m_B)(B)=1`. Normality supplies `S₂`, so a nonzero principal quotient has no embedded primes; the preceding unmixed quotient is therefore the whole quotient. It is regular, forcing `B` regular. Choose a parameter reduction `Q⊆m` with `e_Q(A)=1`. Then `length_B(B/QB)=e_(QB)(B)=1`, so `QB=m_B=mB`. Nakayama on the finite A-module `B/A`, using the common residue field, gives `A=B`. This proves the normalization-descent target and the induction step without a coefficient field.

For finite residue fields use `A(t)=A[t]_(mA[t])`: its residue is `k(t)`, its maximal ideal is `mA(t)`, and §3.12 preserves multiplicity. Formal unmixedness ascends to this ring; the requisite target `unmixed_genericResidueExtension` is proved from primary decomposition, faithful flat completion and the dimension formula (Nagata's Lemmas 8.1–8.2 and their corollary). Regularity descends, equivalently the embedding dimension and dimension are preserved by this flat local extension with field fibre. Finite normalization and `S₂` are imported from the excellence/normality supplier for complete local domains, rather than inferred from a coefficient field. Regularity implies formal unmixedness and multiplicity one by the supplied completion theorem and §3.11's polynomial tangent cone.

**Checks for the criterion and its prerequisites.**

- A field has length and multiplicity one, with the empty parameter system. A complete DVR, including `k[[π]]` and ramified mixed characteristic with residue `𝔽₂`, has `H(n)=n+1` and multiplicity one. Adjoining `r=0,1,2` formal variables gives the regular examples of dimensions `1,2,3`.
- `k[ε]/ε²` is formally unmixed but has length and multiplicity two, so it is not regular. A unit ideal is excluded from the m-primary parameter-reduction input on a nonzero ring.
- Formal unmixedness fails for `A=k[[x,y]]/(x²,xy)`. This ring has `H(0)=1`, `H(n)=n+2` for `n≥1`, and multiplicity one, but embedding dimension two and dimension one. Its embedded associated prime `m` has zero-dimensional quotient. Equidimensionality of minimal components cannot replace formal unmixedness.
- Over a finite residue field the generic residue extension is used before choosing superficial degree-one parameters. Its own residue is infinite; it is not asserted to be an integral finite extension.
- The rank-one finite birational normalization has extension factor one only after keeping the factor `[k_B:k_A]`. Dropping that factor would falsely identify multiplicities measured over different residue fields.

For `x∈m^r`, `r≥1`, let `C_A(t)=H_A(t)/(1-t)`. Prove coefficientwise

`C_(A/(x))(t) ≥ (1-t^r) C_A(t)`.

Equality in every degree forces `x` regular and the exact filtered multiplication condition. If `x` has exact order `r`, equality is equivalent to regularity of its initial form on `gr_m A`. Regularity of `x` alone is insufficient. For a genuinely graded ring and homogeneous `x`, there is no loss of order and equality is equivalent to its regularity. Standard graded CM algebras over an infinite field admit degree-one regular parameters; extend the residue field before asserting this over a finite field.

**Checks.**

- Over a DVR, `x=π^r` gives equality and quotient length `r`.
- In `A=k[[u,v]]/(u²-v³)`, `u` is regular of order one, but its initial form in `k[u,v]/(u²)` is a zero divisor; the inequality is strict.
- For `x=0` in a nonzero ring, equality fails; for a field there is no nonzero maximal-ideal parameter.
- In a one-dimensional CM ring the parameter length equals its parameter-ideal multiplicity; adding a finite-length embedded summand to the module can increase that length without its dimension-one multiplicity.

Source: Hochster, April 17–18 lectures, pp. 165–169; Nagata, *The theory of multiplicity in general local rings*, §5, Lemmas 5.3–5.4, Theorem 1 and Proposition 5, pp. 204–205; §8, Lemmas 8.1–8.2, their corollary and Theorem 6 with proof, pp. 214–216; §11, Theorem 9 and Corollary 1, pp. 219–220; Stone, Theorem 16, p. 20, for the field-containing specialization; Calegari–Geraghty, Lemma 4.4 and its counterexample, pp. 357–358, and Lemma 4.6, pp. 359–360. Needs: §§3.11–3.12, the supplied Koszul complex, and the excellence/finite-normalization and normal-S₂ contracts of SchemeAndStackFoundations. The first equivalence printed in Lemma 4.4 is used only with the corrected initial-form/filtered condition.

### 3.14 Frobenius and local loci

Use excellence, catenarity, Serre conditions, formal fibres and regular-locus openness from SchemeAndStackFoundations and ModularCurves. The additional ring-module comparison identifies the CM locus of a finite module, when a dualizing complex exists, with the appropriate vanishing conditions on localized dual cohomology; it is open in its support. Completion preserves depth, support dimension and CM. Ascent of `S_n` along a flat map requires the base and every relevant fibre to satisfy `S_n`; a hypothesis only at the closed fibre does not give the assertion at all points.

For prime characteristic `p`, define **F-finite** to mean that the native Frobenius makes its target a finite module. Its API identifies the field case with `[k:k^p]<∞`, preserves the property under quotients, localization, finite-type extension and finite-variable formal power series over a Noetherian base, and proves that a complete Noetherian local ring with F-finite residue is F-finite. Henselization and strict henselization preserve it. Use `EnhancedDerivedSheaves` §E1.6's `frobenius_flat_of_isRegular` and `isRegular_of_frobenius_flat` for Kunz's criterion on Noetherian characteristic-`p` rings; with F-finiteness it is finite flat, and at a regular local point with perfect residue its rank is `p^(dim A)`.

**Checks.**

- A perfect field has Frobenius rank one, including `𝔽₂`.
- On `k[[x₁,…,x_d]]` with perfect `k`, the monomials with exponents in `{0,…,p-1}` form the Frobenius basis of size `p^d`.
- A field with infinitely many independent `p`-basis elements has flat Frobenius but is not F-finite.
- On `k[ε]/ε²`, Frobenius kills `ε` and is not flat; a finite Frobenius alone does not give regularity.
- For `k=𝔽₂` and infinite-dimensional `V=⊕_(n≥0) k e_n`, the square-zero ring `A=k⊕V` is local, separated and complete since `m_A²=0`, with F-finite residue `k`. Its Frobenius is `(a,v)↦(a,0)`; the Frobenius module is the infinite-dimensional `k`-space `k⊕V` with action through `k`, so it is not finite. Noetherianity is essential to the complete-local assertion.

**Targets.** Supply the affine Frobenius comparisons and `formalRegularPresentation_lciComparison`: under an essentially finite-type presentation compare the regular-source/regular-target ring criterion with the supplied geometric lci predicate, and under a continuous complete-local presentation state its formal analogue. The continuous statement does not assert algebraic finite presentation of a formal series map. The standard syntomic chart predicates and their algebraic constructors are supplied in the boundaries; here compare their relation-count/fibre-dimension hypotheses with this regular-sequence presentation. A flat local CI-fibre criterion requires the stated local-presentation hypotheses. Source: *Frobenius Singularities*, Chapter 1, §1, Proposition 1.21(b), for the complete Noetherian local assertion; Stacks, Dualizing Complexes Lemma 47.20.4, tag 0EHS, p. 37; Local Cohomology Lemma 51.17.6, tag 0EC0; tags 0E9K, 069I, 07D3, 09Q7; Clausen–Mathew–Morrow, Definition 5.1 and Example 6.7, pp. 38, 53; Bhatt–Mathew, §4.4, PDF pp. 20–21. Needs: §§3.4, 3.8, `EnhancedDerivedSheaves` §E1.6 and the generic affine lci/excellence suppliers.

### 3.15 Formal jets and a plane-curve calibration

Let `R=k[[X_i]]` with finitely many variables, and `v` the ideal algebraically generated by them. Compare `g∈v^r` with `order(g)≥r`, including `r=0`, the empty variable set and zero-divisor coefficient rings. The **total-jet comparison** descends the existing `MvPowerSeries.truncTotalAlgHom` to `R/v^r≃k[X_i]/(X_i)^r`. Its API gives both representative formulas, equality detected by coefficients of total degree below `r`, and a basis indexed by those monomials, whose coordinate is the native coefficient. For two variables the basis cardinal is `choose(r+1,2)`. The residue equivalence comes from constant coefficient, so for a field `k` the native `R`-length of this finite quotient equals its `k`-dimension. Generic residue-field length restriction is supplied by native local-ring length, not rebuilt.

**Checks.**

- At cutoff `r=0` the jet is zero and the basis is empty; at `r=1` it is the constants.
- In two variables the cutoffs `1,2,3` have lengths `1,3,6`.
- Over `k[ε]/ε²` the same monomial coordinate basis is free over the coefficient ring; its rank is not its length as a coefficient module.

For `order(f)≥d` and `d≤N`, the **shifted jet multiplication** is the actual linear map `R/v^(N+1-d)→R/v^(N+1)`, `[g]↦[fg]`. Its API proves well-definedness, identifies its range with the kernel of the projection onto `R/((f)+v^(N+1))`, and proves surjectivity of that projection. Injectivity requires exact finite order `d` and coefficients without zero divisors, using native `order_mul`. If `N<d`, the equation is invisible at this cutoff and the projection is an isomorphism; no shifted injection is asserted in that branch.

**Checks.**

- A unit has order zero and induces an isomorphism of equal jets, with zero equation quotient.
- For `f=x^4`, `N=0`, the equation does not change the residue jet; a falsely truncated short exact sequence would give the wrong answer.
- For a coefficient zero divisor `ε` and `f=εx`, exact order does not force injectivity, since multiplication kills the class of `ε`.

For a field and two variables, `A=R/(f)`, `q=vA`, and exact finite order `d`, compute in all nonnegative indices

`length(A/q^(N+1))=choose(N+2,2)-choose(N+2-d,2)`,

`length(q^N/q^(N+1))=min(N+1,d)`.

Subtraction inside the binomial argument and between counts is natural subtraction. The eventual rational polynomial is `P_d(T)=d(T+1)-d(d-1)/2`, with rational subtraction after casting. Its defect from the actual cumulative function is `choose(d-N-1,2)`. Agreement is equivalent to `d≤N+2`; the graded function stabilizes at `d≤N+1`. Thus the first permanent cumulative agreement is `max(0,d-2)` and the first graded stabilization is `max(0,d-1)`. If `d≥3`, the preceding cumulative index `d-3` has defect one. The polynomial is uniquely determined by any tail. For `d>0`, it has degree one, leading coefficient and intrinsic multiplicity `d`, and ambient dimension-two extraction zero. For a unit, `d=0`, the quotient and polynomial are zero, with no nonzero local-ring instance. The zero equation has infinite order and instead has cumulative polynomial `(T+1)(T+2)/2`, graded function `N+1`, dimension two and multiplicity one.

The **principal tangent-cone comparison** has a separate general statement: for any finite variable set and any coefficient domain `B`, and a series of exact finite order `d`, identify `gr_q(B[[X_i]]/(f))` with `B[X_i]/(in_d f)`. The plane-curve numerical formulas require a field and two variables, but this comparison does not. For an arbitrary coefficient ring, define the polynomial-valued degree component `D_n:v^n→B[X_i]_n` and inclusion `L_n:B[X_i]_n→v^n`; they satisfy `D_n L_n=id`, `ker D_n=v^(n+1)` and multiplication with summed degrees. The actual map `φ_n:v^n→R/((f)+v^(n+1))` has image `q^n/q^(n+1)`. Set `ψ_n=φ_n L_n`, and identify `B[X_i]_n/ker ψ_n` with that image, preserving representatives in both directions. This image comparison also holds for the zero equation and coefficient zero divisors; it does not assert that all of the equation jet lies in the degree-`n` image.

For the domain and exact-order statement, these maps assemble through `DirectSum` to the tangent-cone equivalence. Its API takes the degree-`n` homogeneous polynomial to the actual adic Rees class, identifies its kernel with degree `n-d` multiples of `in_d f` for `n≥d`, proves injectivity below `d`, compares every native homogeneous projection, and multiplies representatives with summed degrees. Polynomial-valued homogeneous components are unique finite polynomials representing the native series components. Their orthogonality, coefficient and product formulas give the full principal kernel, not just the fact that the initial equation vanishes. For `f=0`, the comparison is the polynomial ring without a principal relation.

**Checks.**

- A linear equation gives cumulative `N+1` and multiplicity one from index zero.
- For `f=x^4` the cumulative values at `N=0,1,2` are `1,3,6`; `P_4(0)=-2`, `P_4(1)=2`, `P_4(2)=6`, so the threshold and defect are visible.
- For `f=x^2-y^3` the tangent-cone relation is `x²`, including in characteristic two; reducedness of `A` is not required for the formulas.
- Unit and zero equations have different quotient and polynomial branches; treating infinite order as zero order fails both.

The length adapters also cover scalar restriction along surjections, with actual quotient representatives preserved. Enlarging an ideal `I` to `I+ann M` changes neither `I^nM`, the adic quotients, graded pieces nor any Hilbert coefficient. For finite nonzero local modules this preserves the ideal-of-definition criterion; for zero modules treat the unit annihilator separately. Finite length is equivalent to annihilation by a maximal-ideal power; once `I^sM=0`, the cumulative function is `length M` and positive graded pieces vanish from that cutoff. The principal quotient maps, monotonicity as the equation ideal grows, and the case of an equation already below the cutoff are included in these representative comparisons.

Source: the elementary jet count from native `MvPowerSeries.truncTotalAlgHom`, `MvPowerSeries.order_mul` and local length restriction; Stacks, Algebra §§10.52, 10.58 and 10.106, tags 00K3, 00NO, pp. 137–138, 253; Stone, §§1.2–2, pp. 4–10, for the Hilbert-polynomial framework. The displayed short exact sequence, count and defect calculation give the proof of this particular calibration. Needs: §§1.1–1.3, 3.11–3.12 and native formal-series homogeneous components. The jet and tangent-cone comparisons are additional to generic homogeneous quotient grading.

### Examples

The DVR computes every shift in local duality and separates intrinsic from ambient multiplicity. The node and hypersurface examples distinguish regularity, CI and Gorensteinness. A finite action on a free base module can prove freeness at a regular target point, while a component module on a reducible ring shows the limit of that argument. The initial-form example prevents an ordinary nonzerodivisor from being mistaken for a strict filtered one.

### Dependencies

Layer 1; the depth, CM, Serre and excellence contracts of SchemeAndStackFoundations; PadicLocalLanglandsForGL2Qp §0.5's Hilbert–Samuel polynomial and multiplicity; ModularCurves §4D; the supplied native Koszul and module tensor/Hom/completion interfaces; native projective resolutions, Ext, local cohomology and finite length; Tau Ceti injective envelopes, Artin–Rees and the pinned regular-local results.

## Layer 4: Finiteness, integral points and completed local coordinates

### 4.1 Finiteness from a residual fibre

Let `A` be a maximal-adically complete separated local ring and `B` a Noetherian local `A`-algebra with local coefficient map. If `B/m_A B` is finite dimensional over `k_A`, then `B` is finite over `A`. The target need not initially be complete and the map need not be injective. The finite-module version takes a finite `B`-module `M` with finite-dimensional `M/m_A M`. Choose lifts of residual generators to obtain an `A`-linear map `A^r→M` surjective modulo `m_A`. Since `m_A B⊆m_B`, Krull intersection on the finite `B`-module `M` gives `⋂_n (m_A B)^n M⊆⋂_n m_B^n M=0`. Thus `M` is separated for the source ideal; completeness of `A^r` and native `surjective_of_mkQ_comp_surjective` give surjectivity. Taking `M=B` proves the ring statement. Apply it also to a specified map between completions, using `AdicSpacesPartII` §R0.1b for Noetherianity of the target completion and the actual induced local map.

For a complete DVR with finite residue, a Noetherian local `O`-algebra is finite over `O` exactly when `A/πA` has finite cardinality. No flatness is implicit. The dimension-zero finite-ring deduction uses native Artinianity and finite maximal-ideal quotients; if all prime quotients of a Noetherian local ring are finite, the ring itself is finite. The finite faithful-action conclusion of §3.3 is a second route to finiteness, with different hypotheses.

**Checks.**

- `O/π^n` is finite over `O` for `n≥1`, although not flat; `n=1` gives the residue field.
- `O[[X]]/π` has an infinite-dimensional residual fibre and is not finite over `O`.
- With `A=k` and `B=k[ε]/ε²`, the fibre is two dimensional and the theorem gives a finite algebra, not a field.
- A finite action image on `M=O` for `O[[X]]` acting by `X=0` cannot replace finiteness of the residual fibre of the ring.
- In `B=A[ε]/ε²`, the image `A·1` of the scalar inclusion is not a `B`-submodule, since `ε·1` lies outside it. The separated target, rather than an assumed `B`-module cokernel of an `A`-linear map, supplies the completion argument.

Source: native `surjective_of_mkQ_comp_surjective` (Mathlib `RingTheory.AdicCompletion.Functoriality`), `AdicCompletion.piEquivFin`, `AdicCompletion.of_surjective_iff`; Stacks Lemma 10.51.4, tag [00IP](https://stacks.math.columbia.edu/tag/00IP), for target separatedness. Khare–Wintenberger II §9.1, p. 88, and Kisin §3.3, pp. 1157–1159, are applications at their stated hypotheses. Needs: §§1.5, 1.13, native complete-module surjectivity and Krull intersection.

### 4.2 Algebraic and valued integral points

The statement `exists_integral_point_of_not_nilpotent` in `Suggested.lean` gives the algebraic integral point constructed here. For a finite local algebra `A` over a DVR `O`, with local coefficient map, `dim A≥1` is equivalent to the image of `π` being nonnilpotent. If the fraction field `E` has characteristic zero, choose a prime of `A[1/π]`, its finite residue extension `E'/E`, and an embedding in a chosen algebraic closure. Integrality sends `A` to the integral closure of `O` in `E'`, which is finite over `O` by the separable normalization theorem. This gives a local algebraic point. Only when `E` is a nonarchimedean local field do the LocalFieldsRamification interfaces identify this closure with `O_E'` and equip it with the required valuation and topology. Prove continuity of the local point for the maximal-adic source topology.

The **integral point data** records the finite extension, its embedding, integer-ring algebra structure and the actual local map. Its API is scalar compatibility, image integrality, unit reflection, the valued comparison when available, and transport under a finite extension of the target. It does not impose a fixed target residue field.

**Checks.**

- `A=O` gives the identity point and dimension one.
- `A=O/π^n`, `n≥1`, has nilpotent `π` and cannot map as an `O`-algebra to a characteristic-zero integer domain.
- `A=O[ε]/ε²` has dimension one and admits a point killing `ε`; the theorem does not imply that `A` is reduced.
- A ramified `O` uses its own uniformizer; nilpotence of the scalar named `p` is not the definition.

Source: Khare–Wintenberger II, Corollary 4.7, pp. 45–46; Stacks, Algebra Lemma 10.161.8, tag [032L](https://stacks.math.columbia.edu/tag/032L); LocalFieldsRamification, Layer 0, finite-extension integer rings. Needs: §4.1, native integrality, finite separable extensions and integral closure.

### 4.3 Points through formally smooth maps

Given a formally smooth labelled complete local map `A→B`, an integral point `A→O'`, compatible residue extension and a starting residue point of `B`, choose successive lifts to `O'/m'^n` and pass to the native complete limit. The lifted map is local because its residue map reflects units; its reductions agree with the selected maps at every level. Formal smoothness must be available in this residue-changed category. If an actual presentation `B≃A[[X₁,…,X_d]]` is supplied, zero evaluation gives the point directly, even without completeness of the target for this particular evaluation.

This lifting API retains the starting residue point, coefficient compatibility, levelwise equations, locality, continuity and the dependence on choices. With any positive number of variables and nonzero `A`, `A[[X₁,…,X_d]]` is not finite over the coefficient ring `O`: its variable powers are an infinite `A`-linearly independent family. Thus framing can preserve points while losing module finiteness.

**Checks.**

- At `d=0`, zero evaluation is the original point.
- Over `O[[X]]`, sending `X` to any element of `m_O'` gives a local continuous evaluation; sending it to `1` is not a local series evaluation.
- The nonsmooth equation `X²=π` may require a ramified target extension; a residue solution by itself does not supply a lift to the original `O`.

Source: Khare–Wintenberger II, Proposition 2.1 and Corollary 4.7, pp. 7–8, 45–46; native `IsAdicComplete.mkₐ_comp_liftAlgHom` and `MvPowerSeries.isUnit_iff_constantCoeff`. Needs: §§1.10–1.11, 4.2.

### 4.4 Generic fibres and punctured spectra

Let `O` be a complete DVR with finite residue, and `A` a complete Noetherian local `O`-algebra with finite residue extension. Its generic fibre is Jacobson, every maximal residue is a finite extension of `E`, and the associated map from `A` lands in that extension's integer ring. A coheight-one prime of `A` has fraction residue either finite over `E` or a characteristic-`p` local field. Compare the quotient adic topology on `A/p` with its subspace topology in the valuation ring.

For a finite-type algebra over a complete local base, the inverse image `V` of a nonempty open `U` in the punctured spectrum is Jacobson, its closed points lie over coheight-one base points with finite residue extensions, and

`dim V ≤ dim U + max_(y closed in U) dim V_y`.

When every component under consideration meets the closed fibre, its closure has dimension `dim V+1`. Dominant finite-type maps of Noetherian Jacobson universally catenary schemes satisfy the corresponding dimension inequality; over a complete local base retain the condition that every source component meets the closed fibre. Empty loci are separated before taking a maximum. Source: Böckle–Iyengar–Paškūnas, Lemmas 3.14, 3.17–3.18 and Remarks 3.19–3.20, PDF pp. 16–19; Khare–Wintenberger II, Proposition 2.2(i), pp. 9–10; Paškūnas–Quast, Lemma 14.2 and Remark 14.3, pp. 72–73. Needs: Layer 1, supplier catenarity and finite-type dimension theory, §4.2.

The target `genericSeriesRegular` gives the regularity input for §5.7. If `B` is complete Noetherian local and `B[1/π]` is regular, then `B[[X₁,…,X_r]][1/π]` is regular. Prove that the local map `B→B[[X]]` is formally smooth for the target maximal-adic topology by lifting the variables, hence is a regular map: the source completion map is the identity, so André's theorem applies. Localize this regular map and use regularity of its generic source. For a characteristic-zero field `E`, the exact smoothness input implying regularity of `B[1/π]` is that, for every prime `q` not containing `π`, `E→B_q` is formally smooth for the `qB_q`-adic topology. Denote this pointwise lifting condition by `GenericFormallySmooth E B π`; its API is transport by algebra equivalences, localization at generic primes and implication to generic regularity. It is not identified with an unqualified algebraic formal-smoothness instance. Source: Stacks, More on Algebra, Theorem 15.41.1 and Theorem 15.50.3, tags [07EL](https://stacks.math.columbia.edu/tag/07EL), [0H7U](https://stacks.math.columbia.edu/tag/0H7U); Kisin, proof of Proposition 3.3.1, p. 1159. Needs: §§1.11, 1.13, formal lifting for power series, and the supplier's regular-map localization and composition API.

**Checks.**

- For `B=O` and `r=0`, the generic ring is the field `E`; for `r=1`, the conclusion concerns `O[[X]][1/π]`, with no asserted equality to `E[[X]]`.
- For `B=O[ε]/ε²`, the generic local ring still contains nonzero nilpotent `ε` and is not regular. It fails the pointwise lifting condition.
- In characteristic `p`, a purely inseparable field extension can be a regular ring without being geometrically regular over the coefficient field. The characteristic-zero hypothesis is needed for the stated equivalence with formal smoothness.
- For a characteristic-zero field `E`, `E⟦X⟧` is formally smooth over `E` for the `X`-adic topology (Stacks tag 07EL). When `Ω_(E/ℚ)` is infinite-dimensional, it fails formal smoothness for the discrete topology, the notion used by Mathlib's `Algebra.FormallySmooth`. This applies to `E=ℚ_p`, whose transcendence degree over `ℚ` is uncountable. Thus the topology specified in `GenericFormallySmooth E B π` is essential.

### 4.5 Separable coefficient diagonals

The general comparison `separableCoefficientDiagonal` has the following local formulation. Let `O` be **any complete DVR**, with residue `k` and uniformizer `π`. Let `F/k` be a separable field extension in the general field-extension sense, and assume `r=dim_F Ω_(F/k)` is finite. Choose `t₁,…,t_r∈F` whose differentials form a basis. Let `A` be any Noetherian local O-algebra with a specified compatible residue identification `κ(A)=F` and local coefficient map. Choose a complete DVR O-algebra `Λ` with `m_Λ=πΛ` and specified residue `F`. Set `B=Λ⊗_O A`, with `q` the kernel of its multiplication residue map to `F`. There is a chosen O-map `j:Λ→Â` inducing the identity on `F`; for lifts `b_i∈Λ` of `t_i`, construct an Â-algebra isomorphism

`Â[[T₁,…,T_r]] ≃ completion_q(B_q)`,

sending `T_i` to `b_i⊗1-1⊗j(b_i)`. The right-hand copy of `Â` is fixed. The left Λ-map is the deformation of `j` with `b_i↦j(b_i)+T_i`, not the constant map `j`. The diagonal kernel need not be finitely generated before completion, and no Noetherianity of `B_q` is assumed. Conclude faithful flatness over `Â`, dimension increase by `r`, and equivalence of regularity and absolute CI on both sides.

Its API retains the two coefficient maps, the residue equation, the variable formula, dependence on the chosen lift and basis, and transport under specified local coefficient isomorphisms. The following named prerequisites give a proof, including the existence of the coefficient ring.

- `separableCoefficientDVR_exists`: lift the formally smooth k-algebra `F` over `O` by Stacks Lemma 15.41.6. The resulting complete Noetherian local `Λ` is flat over `O` with closed fibre `F`, hence `m_Λ=πΛ` and `π` is regular. Thus it is a DVR. This construction works over ramified O and does not identify Λ with an absolutely unramified Cohen ring. For any such Λ, flatness and the geometrically regular closed fibre make `O→Λ` formally smooth for the target maximal-adic topology. Successive lifts to `A/m_A^n` give the chosen `j`.
- `coefficientJetCoordinates`: the conormal exact sequence and `m_Λ=πΛ` identify `Ω_(Λ/O)⊗_Λ F` with `Ω_(F/k)`. For an Artinian local A-algebra `C` with labelled residue `F`, local O-maps `Λ→C` inducing that label are parametrized by the tuple `(f(b_i)-j(b_i))∈m_C^r`. Across a small extension with kernel `I`, formal smoothness gives a lift; its differences form `Der_O(Λ,I)=Hom_F(Ω_(F/k),I)≃I^r`. Adjust by the unique derivation with the prescribed r coordinate differences. Induction on Artinian length gives both existence and uniqueness for each tuple. The `j` on C means its reduction from `Â`, which is available since `m_C` is nilpotent.
- `diagonalCompletion_artinComparison`: maps `B_q→C` inducing the specified residue map are precisely those Λ-lifts. The cotangent space of `B_q` is finite-dimensional: its quotient by the image of `m_A/m_A²` is the diagonal conormal `Ω_(F/k)`. Consequently every `B_q/q^n` has finite length, since its associated graded pieces are quotients of symmetric powers of that cotangent space. Compare these Artinian quotients with the preceding coordinate functor and pass to inverse limits. This proves the displayed isomorphism and Noetherianity of the completion **after** its identification with a finite-variable series ring. No application of Noetherian completion flatness to the uncompleted tensor ring enters the argument.

The same argument over a coefficient **field** `k`, with `Λ=F`, gives `completion_q(F⊗_k A)=Â[[T₁,…,T_r]]` whenever A is Noetherian local with residue F. In particular it computes the multiplication diagonal of `F⊗_k F`. For a finite separable generic extension `F/E`, take base E, Λ=F and r=0; the diagonal completion is `Â`. Thus the generic-field case over any complete DVR is valid when that residue extension is finite separable, in either characteristic.

For a perfect field `k` of characteristic `p>0` and `F=k′((t))`, with `k′/k` finite, `F/k` is separable and `Ω_(F/k)=F dt`. Indeed `k⊆F^p` and `1,t,…,t^(p-1)` is a basis of F over `F^p`, so the p-basis calculation gives exactly this differential module. This proves `localFieldDiagonalCompletion` with one variable over **any** such k, and the DVR comparison applies with this F for arbitrary O as above. For `A=A_p` in a finite-type algebra application, the hypothesis that `κ(p)` is finite over the residue at its contracted punctured-spectrum point is supplied explicitly by §4.4 when applicable; finite type alone does not imply it.

**Checks.**

- A finite separable residue extension has r=0, so the completion is `Â`; for `F=k` the identity choice `Λ=O` gives this directly. Rank r=2 gives two independent coordinate differences rather than one.
- For `F=k((t))` with k perfect of characteristic p, the first-order lift `t↦t+ε` has difference `+ε`; `ε=0` gives the diagonal. In `F[T]/T³`, the two expressions `t+T` and `t` differ by `+T`, including at truncations n=1,2,3. Interchanging the two tensor factors changes the sign. This pins the coefficient and variable direction.
- Every equal-characteristic or ramified mixed-characteristic O with the specified special residue F uses its own π. No assertion requires π=p, finite k, or unramified O.
- A finite purely inseparable degree-p extension `L/K` has diagonal ring `L[ε]/ε^p`, already complete at its nilpotent maximal ideal. It is not L. Separability cannot be dropped; in characteristic two the nonzero ε still has square zero.
- In characteristic zero, algebraic `Ω_(k((t))/k)` need not have dimension one. Without the finite-dimensional differential hypothesis the finite-variable conclusion is not asserted. A merely chosen Cohen lift does not imply the diagonal identification.

Source: Stacks, Algebra §10.158, Lemmas 10.158.7–10.158.8 (tag [031U](https://stacks.math.columbia.edu/tag/031U)) for separability/formal smoothness; More on Algebra, Proposition 15.41.5 ([07NQ](https://stacks.math.columbia.edu/tag/07NQ)) and Lemma 15.41.6 ([07NR](https://stacks.math.columbia.edu/tag/07NR)), with their proofs, for the coefficient construction and lifting; Algebra §10.131 for derivations and the conormal sequence. The Artinian coordinate argument above proves the diagonal extension from these inputs. Böckle–Juschka, Corollary 3.3.4 and Lemma 3.3.5, published pp. 17–19, give the local-field special case and its localization comparison; Böckle–Iyengar–Paškūnas, Lemmas 3.35–3.37, PDF pp. 27–28, published pp. 24–25, give the arithmetic specializations. Needs: §§1.10–1.14, 3.4, native Kähler differentials, and §4.4 only for the punctured-spectrum application.

### 4.6 Pointed tensor domains and components

Let `A,B` be complete Noetherian local `O`-flat domains with the common residue field and `O`-valued points. If their generic fibres are regular, the pointed local coordinate argument proves `A⊗̂_O B` is a domain. The prerequisite `pointedRegularCoordinates` identifies the completion of a regular local `K`-algebra with residue `K` and a specified coefficient section with `K[[x₁,…,x_e]]`, sending variables to selected cotangent lifts. Combine §1.9 surjectivity with completion regularity and equality of dimensions to prove injectivity. A field gives zero variables; `K[t]_(t)` gives one, while `K[t]/t²` fails regularity and cannot give an isomorphism to `K[[t]]`. This coordinate proof precedes the tensor-domain argument. The argument for regularity of its entire generic fibre is asserted here in the local-field setting `E/ℚ_p` finite; pointwise formal coordinates alone do not prove global generic regularity over an arbitrary complete DVR.

For component bookkeeping impose geometric integrality on each domain quotient: after every finite extension of coefficient DVR the completed scalar extension is still a domain. Under reducedness, equidimensionality and `O`-flatness, the completed tensor has dimension `dim A+dim B-1`, and its minimal components are indexed by pairs of components with these geometric-integrality hypotheses. A pair may split without them. Scalar extension and component identification must commute with the selected maps, not only give a count of components.

**Checks.**

- `O[[X]]⊗̂_O O[[Y]]=O[[X,Y]]`, with dimension three.
- The degree-zero pointed factor `A=O` changes neither the other factor nor its dimension.
- Finite field extensions can split after tensoring with themselves; arbitrary domains do not satisfy an unconditional tensor-domain theorem.
- Let `O=ℤ_p`, `p` odd, and `O'=O[α]` with `α²=p`. This is a complete DVR with the same residue field and regular generic fibre, but has no `O`-valued point. Its finite-factor product `O'⊗̂_O O'=O'⊗_O O'` has nonzero factors `α⊗1−1⊗α` and `α⊗1+1⊗α` whose product is zero. Its generic fibre is `E'×E'`, so the pointed hypothesis excludes it.

Source: Khare–Wintenberger II, Proposition 2.2(ii), pp. 9–10; Thorne, definition before Lemma 1.3 and Lemma 1.4(1),(2),(4), pp. 5–6; Böckle–Iyengar–Paškūnas, Lemma 6.3, PDF pp. 52–53. Needs: §§1.12, 4.5 and supplier excellence/regular-locus comparisons.

### 4.7 Valued points detect quotients and module images

For complete local `O`-algebras with finite residue, a reduced `O`-flat quotient is the intersection of kernels of all its integral points in `O_E'` for finite `E'/E`. Two such quotients of a fixed ring are equal when their point sets agree in every finite coefficient extension. The flat-reduced hypotheses convert generic Jacobson density into an integral ideal equality; special-fibre points alone do not suffice.

For finite `M` and an integral point `x:A→O'`, define its **torsion-free specialization** as `(M⊗_A O')/(O'-torsion)`. Its API is the quotient map, functorial transport, finite freeness over `O'`, and the universal property for maps into torsion-free modules. A torsion kernel of a specialized map implies injectivity after taking these quotients; arbitrary base change need not preserve injection. The finite-module projection onto this quotient splits noncanonically, so additive functors preserve this split epimorphism.

**Checks.**

- `M=A^r` specializes to `O'^r`, including `r=0`.
- `M=A/π^n` specializes to a torsion module and has zero torsion-free specialization.
- The inclusion `(π)↪O` becomes the zero map after reduction modulo `π`; injection before coefficient change cannot replace the stated torsion-kernel criterion at an integral point.
- A finite rank-one torsion-free quotient of an image can be the proper ideal `π'^vO'`; torsion-free does not force surjectivity onto `O'`.

Source: Khare–Wintenberger II, Corollary 2.3, pp. 9–10; Iyengar–Khare–Manning, §2.1, p. 13; Le–Le Hung–Levin–Morra, before (5.9), p. 126. Needs: §§4.2–4.4, native torsion submodule and finite-module structure over a DVR.

### Examples

A finite ring with nonnilpotent uniformizer has an integral characteristic-zero point; the same ring with a framing variable remains pointed but ceases to be finite. The extra diagonal variable at a characteristic-`p` local-field point is essential in dimension counts. Paired geometric components, rather than arbitrary pairs of domains, control completed tensor components.

### Dependencies

Layers 1 and 3; native completion, integrality and localization; SchemeAndStackFoundations' excellence/Jacobson/dimension interfaces; LocalFieldsRamification Layer 0; the completed tensor supplier. No generic-fibre dimension or regularity statement is obtained just by forgetting a topology.

## Layer 5: Balanced modules and simultaneous ring-module patching

### 5.1 Balance is a presentation condition

For any ring `S` and left module `M`, `HasSquarePresentation S M` means existence of a square presentation `S^d→S^d→M→0` for some natural `d`; the first map need not be injective. For finite `M` over a Noetherian local `S`, put `β₀=dim_k M/mM`, `β₁=dim_k Tor₁^S(M,k)` and define its **defect** as the integer `β₀-β₁`. Call `M` **balanced** when this is nonnegative. The API compares this with `β₁≤β₀` and `HasSquarePresentation S M`; one can take `d=β₀`. It exposes generators, relations, residue reduction and isomorphism invariance. The Betti-number formulation is stated over commutative `S`; over a possibly noncommutative finite `p`-group algebra the same calculation uses the augmentation residue module and minimal left-module resolutions.

For a finite `p`-group `Δ` and `S=O[Δ]`, if `r=rank_O M_Δ`, the base-change Tor calculation gives

`defect_S(M)=r-dim_k(Tor₁^S(M,O)/π)`

for every finite `S`-module. In the long exact sequence for `O --π→ O→k`, the torsion contributions of `M_Δ` to `β₀` and `β₁` cancel, leaving its rank. Keeping the remaining Tor correction is essential; free coinvariants alone do not imply that it vanishes.

**Checks.**

- `M=0` is balanced with the empty square presentation; `S^r` has defect `r`.
- Multiplication by the nilpotent parameter gives a square presentation of `k` over `k[ε]/ε²` despite its infinite projective dimension.
- There is no square presentation for the residue field over `k[[x,y]]`: it has `β₀=1, β₁=2` and is not balanced.
- For the trivial group, `S=O` and a finite free module has zero Tor correction and defect its rank.

Source: Calegari–Geraghty, Definitions 2.1–2.2 and the paragraph following them, PDF p. 11; the group-ring Tor calculation in the proof of Proposition 2.3. Needs: native presentations and Tor, §§3.1, 3.11. The comparison with cohomological Tor uses §7.1, but the square-presentation formulation makes the module patching theorem independent of complex patching.

### 5.2 Finite decorated data

Use `S=O[[z₁,…,z_q]]`, its augmentation ideal `a`, and finite quotients `T=S/I`, `D=R/J`. Fix a complete Noetherian local coefficient source `A`, with the same finite labelled residue field as `T,D`. All action and quotient maps are local coefficient maps, with the action map viewed as a surjection onto its finite image. Keep `A` fixed when counting equivalence classes. A **finite module patch datum** records a based matrix `P:T^r→T^d`, its actual quotient `X`, a compatible action `A→End_T(X)`, a local surjection `φ:A→D`, and a surjection `X→H₀` with kernel `aX`. It includes the equation that the action on `H₀` factors through `φ`. Equivalence preserves the matrix, bases, both actions and specialization maps; a module isomorphism alone is insufficient. Its API gives reduction to smaller cutoffs, identity/composition of these reductions, transport of bases and the induced specialization equivalence `X/aX≃H₀`.

**Checks.**

- For `O=Z₃`, `T=F₃[z]/z²`, `A=T`, `D=H₀=F₃` and `X=T`, the standard rank-one basis and empty relation matrix give augmentation kernel `zX`.
- The actions `z↦0` and `z↦z` give inequivalent based data with the same reduction modulo `z`; both induce the residue action on `H₀`.
- With the identity comparison on `H₀`, twice the augmentation gives a different based datum: a map preserving the selected basis of `X=T` is the identity, and `2≠1` in `F₃`.
- Over finite `k`, the complete local square-zero source `k⊕⊕_i ke_i` has infinitely many actions on `k[z]/z²`, sending one chosen `e_i` to `z` and all others to zero. Their image sizes are uniformly bounded; this source fails Noetherianity.

**Targets.** At fixed finite `T,D,H₀,d,r`, there are finitely many such decorated equivalence classes. Prove finiteness of actions as well as matrices: if `|X|≤K=|T|^d`, the finite local image of `A` in `End_T(X)` has cardinal at most `K^K`, and its maximal-ideal powers vanish before a uniform finite bound by Nakayama. Thus the action factors through `A/m_A^b` for a uniform `b`; this quotient is finite because the fixed source is Noetherian with finite residue. The same argument bounds the quotient maps to `D`. Treat `X=0` separately. Finite residue and bounded sizes are used here; infinite residue fields do not give finite matrix sets. Source: Calegari–Geraghty, Proposition 2.3, PDF pp. 11–14; Taylor, proof of Theorem 4.1, pp. 218–221. Needs: Layer 1 and finite local rings.

### 5.3 Cofinal cutoffs and diagonal extraction

The group-ring quotients are supplied by PadicMeasuresIwasawaAlgebras and §3.10:

`S/((1+z_i)^(p^N)-1)_i ≃ O[(Z/p^N)^q]`.

The ideals `b_N=(π^N,((1+z_i)^(p^N)-1)_i)` are descending, open and cofinal with maximal-ideal powers. For nonzero finite `O`-module `H` with an action of a coefficient ring `R`, put `J=ann_R H`; then `d_N=(π^N,J^N)` are cofinal open ideals of `R` and act on `H` through `π^N`. Their use depends on `H≠0`; the zero case is handled separately.

A **compatible presentation tower** consists of finite data at descending cofinal cutoffs and specified reduction isomorphisms preserving every decoration. The API forms the genuine inverse-system functor, compares iterated reductions, restricts to cofinal subsequences and retains two strictly increasing indices: original level and cutoff level, with original level at least cutoff level. Given arbitrarily large original levels supplying each finite cutoff, finite decorated choice gives such a tower. Original modules need not have transition maps.

**Checks.**

- At `q=0`, the group part disappears and `b_N=(π^N)`.
- Take `O=Z₃`, `q=0`, `A=R=O` and `T_n=D_n=O/3^n`, with standard reductions and rank-one bases. Zero one-by-one matrices give `X_n=T_n`; for `H=O`, augmentation is the identity to `H/3^nH`. Every reduction square commutes and the limit is `O`.
- With the same coefficient rings, the one-by-one matrices `[3]` give `X_n=F₃`. For `H=F₃`, the augmentations and transition maps are the identity on `F₃`; their limit is `F₃`.
- With `H=O`, `X_n=T_n` and the fixed standard bases and reductions, alternating augmentations `id` and `2·id` give distinct adjacent composites modulo `3`. Identical ranks and isomorphic modules therefore do not give a compatible decorated tower.
- `H=0` has annihilator the unit ideal, so the displayed `d_N` are not open proper coefficient cutoffs.

Source: Calegari–Geraghty, proof of Proposition 2.3, PDF pp. 11–14; Kisin, proof of Proposition 3.3.1, pp. 1157–1159. Needs: §5.2, finite-choice compactness and the supplied group algebra.

### 5.4 The limit presentation and its actions

For a compatible tower of matrices `(S/I_n)^r→(S/I_n)^d`, lift coefficients to `P_∞:S^r→S^d` and define the **patched module** as `coker P_∞`. Its API identifies reduction modulo every `I_n` with `X_n`, compares it with `lim X_n` as an adic topological module, and supplies the exact presentation. Construct the action `A→End_S(M_∞)` and the local map `φ_∞:A→R` from the compatible finite actions and maps. The latter is surjective by compactness of the finite-level fibres. The endomorphism topology is equivalently evaluation on a finite generating set or its finite-module adic topology.

When `X_n/aX_n≃H/L_nH` compatibly and `L_n` is cofinal, the specialization is `M_∞/aM_∞≃H`, with its actual `A`-action through `φ_∞`. The API retains every chosen comparison. If the scalar image of `S` at all levels is in the `A`-image, compactness puts its limit in that image. For nonzero `M_∞`, locality of the image ring permits chosen lifts of the `z_i` to `m_A` and hence a continuous local scalar map `S→A` inducing that action. Augmentation containment in `ker φ_n` is separate; it gives containment in `ker φ_∞+ann_A M_∞`.

**Checks.**

- A tower of based free modules of fixed rank `d`, with no relations, gives `S^d`.
- The constant one-by-one relation matrix `π` gives `S/π`, rather than a free module or an injective specialization map.
- A zero relation matrix need not be injective, even though its cokernel has the displayed exact presentation.
- The scalar lift to `A` can change by elements annihilating `M_∞`; it is not canonical.

**Targets.** Prove these comparisons and compatibility with a specified coherent equivalence of towers, including cofinal restriction. There is no independence theorem for unrelated subsequences or unrelated action maps. Source: Calegari–Geraghty, Proposition 2.3, PDF pp. 11–14; Taylor, proof of Theorem 4.1, pp. 218–221; Kisin, Proposition 3.3.1, pp. 1157–1159. Needs: §§1.13–1.15, 5.2–5.3 and finite-module completeness.

### 5.5 Numerical depth and balanced patching

Let `S` be regular local of dimension `d` and `A` Noetherian local acting on a nonzero module finite over both through a local map `S→A`. If the module has an `S`-free resolution of length at most `l` and `dim A≤d-l`, then the depth and dimension comparisons force

`depth_A M=dim Supp_A M=dim A=d-l`.

For an `S`-free module use `l=0`. For a square presentation over the domain `S` with support dimension strictly below `d`, the relation map becomes an isomorphism over the fraction field and is injective; for nonzero cokernel the projective dimension is exactly one. The source's dimension deficit is what turns a square presentation into a resolution. MCM over a domain gives near faithfulness; over a regular target it gives freeness. Component support over a reducible target requires Layer 6.

**Balanced patching theorem (`balanced_module_patching`).** Let `O` be the integers of a finite extension of `ℚ_p`, `p≥3`, `q≥1`, `A=O[[x₁,…,x_(q-1)]]`, `R` a complete Noetherian local coefficient algebra and `H` finite over `R` and `O`. For every `N≥1`, assume a local continuous surjection `φ_N:A→R` and a module `H_N` over `A⊗_O O[(Z/p^N)^q]` such that:

- `H_N` is finite balanced over the group algebra;
- its augmentation quotient is the specified `H`, `A`-linearly through `φ_N`;
- the group-algebra scalar image is contained in the `A`-image;
- the augmentation image is contained in the image of `ker φ_N`.

Then `H` is `R`-free. For `H≠0`, the construction gives an `A`-free nonzero `M_∞`, a local scalar lift `ι:S→A`, `ker φ_∞=ι(a)A`, and `R≃A/ι(a)A`. For `H=0`, the conclusion is rank zero without the nonzero cutoffs. In the boundary `q=1`, `A=O`; the dimension computation still uses `dim S=2` and `dim A=1`. No claim here extends the source's stated `p≥3` range merely from the characteristic-two group-ring checks.

The signature uses `PatchingGroupRing O p q n=O[(Z/p^(n+1))^q]` on the native monoid algebra. Its coefficient hypotheses present `O` as a complete DVR finite over `Z_p`, of characteristic zero and with residue characteristic `p`. The map from each module to `H` is surjective with kernel the augmentation submodule, and intertwines the displayed actions; this states the specified augmentation quotient without a separate patch-datum carrier. The input is one datum for each level; reduction maps between original levels are not hypotheses. Section 5.3 constructs the compatible cutoff tower.

**Checks.**

- `H=0` has the rank-zero free conclusion and needs no faithful patched action.
- At `q=1`, the formal coefficient source has zero variables; the numerical dimensions remain `dim S=2` and `dim A=1`.
- The relation matrix `π` gives a balanced torsion module over the group ring, so balance alone gives no freeness without the scalar and augmentation hypotheses.

Source: Calegari–Geraghty, Proposition 2.3 and proof, PDF pp. 11–14; the numerical module form also follows from §3.1. Needs: §§3.1, 3.3, 5.1–5.4 and Layer 6 only for the separate component conclusion.

### 5.6 Patching a ring and a based free module

Fix the Kisin parameters: `S=O[[y₁,…,y_(h+j)]]`, `S₀=O[[y_(h+1),…,y_(h+j)]]`, a complete local `O`-flat domain `B` of dimension `d+1`, `h+j≥d`, and `C=B[[x₁,…,x_(h+j-d)]]`. Let `M≠0` be free of rank `s` over `S₀`. A **ring-module patch datum** at a finite cutoff records maps

`S/c_m → D → R/(c_m R+m_R^[r])`, `C↠D`,

and a based `D`-module `L` free of rank `s` over `S/c_m`, with a compatible surjection to `M/c_mM`. Here

`c_m=(π^m,((1+y_i)^(p^m)-1)_(i≤h),(y_i^(p^m))_(i>h))`,

and `m_R^[r]` means the ideal generated by individual `r`th powers, not the ordinary ideal power. Require `r>0` and `m_D^[r]=0`. The API reduces all ring maps, bases, module actions and surjections together, gives finite uniform cardinal bounds, and extracts a compatible system. If `h+j=0`, handle the direct finite case without a zero-exponent cutoff.

**Checks.**

- For `O=Z₂`, `h=j=d=0`, `B=C=R=M=O` and `m=r=s=1`, take `D=L=F₂` with its standard rank-one basis. Here `c_1=(2)`, both specialization maps are the identity of `F₂`, and `m_D^[1]=0`.
- For `h=d=2`, `j=0`, `B=C=Z₂[[u,v]]`, `R=M=Z₂`, `m=1`, `r=2`, `s=1`, take `D=L=F₂[y₁,y₂]/(y₁²,y₂²)`. The standard `S`-action identifies `S/c_1` with `D`; all maps to `R` or `M` specialize variables to zero. Every element of `m_D` has square zero, while `y₁y₂≠0`, so `m_D^[2]=0` and `m_D²≠0`.
- In that datum, the `C`-surjections `(u,v)↦(y₁,y₂)` and `(u,v)↦(y₁+y₂,y₂)` give inequivalent decorations. An equivalence preserving the `S`-action fixes `D`, and one preserving the rank-one basis fixes `L`; neither can change the image of `u`.
- The rank-zero module cannot give a faithful patched action and is excluded in this criterion.

**Targets.** Under the finite-level assumptions of §5.7, construct `C↠R_∞`, `S→R_∞↠R` and `M_∞≃S^s`, with augmentation ideal `a=(y₁,…,y_h)`, `R_∞/a≃R`, `M_∞/aM_∞≃M`, and all action compatibilities. These are literal maps and equivalences. Source: Kisin, proof of Proposition 3.3.1, pp. 1157–1159, author PDF pp. 75–77. Needs: §§5.2–5.4 and finite local coefficient bounds.

<a id="patching-surjection-iso"></a>

**Free-module patching consumer (`patching_surjection_iso`).** Let `O` be a complete DVR with finite residue field `k` of characteristic `p`, including `p=2` and equal characteristic. Fix `r≥0`, `s>0`, `S=O[[z₁,…,z_r]]`, `A=O[[x₁,…,x_r]]`, `a=(z₁,…,z_r)` and `J_n=((1+z_i)^(p^(n+1))−1)_i`. Let `R` be a complete Noetherian local labelled `O`-algebra. Let `f:R↠T` be a surjective `O`-algebra map and let `M≠0` be a finite `O`-module with compatible `R`- and `T`-actions, faithful over `T`. For each `n≥0`, supply independently:

- local continuous coefficient maps `ι_n:S→A` and `ψ_n:A↠R` with `ψ_n(ι_n(z_i))=0` for every `i`;
- a finite `A`-module `N_n`, with scalar action through `ι_n`, together with a specified `S`-linear equivalence `N_n≃(S/J_n)^s`;
- an `A`-linear equivalence `N_n/aN_n≃M`, where `A` acts on `M` through `ψ_n`.

Then `f` induces an `O`-algebra isomorphism `R≃T`, and `M` is finite free and faithful over both rings. Moreover there are `f₁,…,f_r∈m_A` forming an `A`-regular sequence and an `O`-algebra equivalence `T≃A/(f₁,…,f_r)`. Thus `T` is a finite free complete intersection over `O`, with exactly `r` equations in `r` variables; `M` has `O`-rank `s`. The datum has no maps or compatibility conditions between distinct original levels.

Sections 5.2–5.4 extract a compatible cutoff tower and a nonzero module `N_∞` finite over `A`, free of rank `s` over `S`, with scalar map `ι_∞:S→A`, surjection `ψ_∞:A↠R` and augmentation quotient `M`. The regular-base depth comparison of §5.5 makes `N_∞` free over `A`. Faithfulness then gives `ker ψ_∞=ι_∞(a)A`, so `M` is free and faithful over `R`, and the compatible action through `T` makes `f` injective. Finiteness of `A` over `S` follows from its faithful action on the finite `S`-module `N_∞` (§4.1). The images of `π,z₁,…,z_r` form a parameter sequence in the regular local ring `A`; their regularity, with permutation in this local setting, proves the displayed complete-intersection and `O`-freeness conclusions. Depth is the supplied `Module.depth` of SchemeAndStackFoundations §0.17.

Source: Kisin, proof of Proposition 3.3.1, pp. 1157–1159, specialized to the regular coefficient source; Stacks Lemma 10.104.2, tag [02JN](https://stacks.math.columbia.edu/tag/02JN), for parameter regularity. The independent-level interface and extraction follow the patching argument of [the Imperial College London FLT project](https://github.com/ImperialCollegeLondon/FLT), `FLT/Patching/Algebra.lean`, `FLT/Patching/Module.lean` and `FLT/Patching/REqualsT.lean`. Needs: §§3.1–3.5, 4.1, 5.2–5.5 and SchemeAndStackFoundations §0.17. This is the free-module criterion with equal numbers of scalar and presentation variables; §5.5's balanced criterion has a different dimension count.

**Checks.**

- For `r=0`, take `R=T=O`, `N_n=M=O^s` and all coefficient maps the identity. The conclusion has the empty regular sequence and no auxiliary variables.
- For `r=1`, take `R=T=O`, `M=O`, `ψ_n(x)=0`, `ι_n(z)=x` and `N_n=A/((1+x)^(p^(n+1))−1)`. The scalar quotient is free of rank one over `S/J_n`, and augmentation gives `O`. This tests `p=2` and also `O=𝔽_p[[π]]`; in equal characteristic the relation is `x^(p^(n+1))`.
- The surjection `O[[x]]→O` with `M=O` is faithful on the target but has nonzero kernel on the source. It cannot have the displayed finite-level data: a surjection and target faithfulness alone do not imply `R≃T`. A rank-zero datum similarly loses faithfulness and is excluded by `s>0` and `M≠0`.

### 5.7 Characteristic-zero projectivity criterion

Let `O` be the integers of a finite extension of `ℚ_p`, with fraction field `E`. Assume `B` is complete Noetherian local, `O`-flat, a domain of dimension `d+1`, and satisfies `GenericFormallySmooth E B π` from §4.4. The named `genericSeriesRegular` target then supplies regularity of `C[1/π]`. Let `R` be a `B`-algebra and `M≠0` an `R`-module. For each `n`, assume compatible maps `S→R_n↠R`, `R_n` a `B`-algebra quotient of `C`, and `M_n↠M` such that

`ker(R_n→R)=aR_n`, `ker(M_n→M)=aM_n`,

`b_n=ann_S M_n ⊆ ((1+y_i)^(p^n)-1)_(i≤h)`,

and `M_n` is finite free over `S/b_n`. The specialized `S₀`-action is fixed independently of `n`. Then `R` is finite over `S₀` and `M[1/π]` is finite projective and faithful over `R[1/π]`. Source: Kisin, Proposition 3.3.1 and Lemma 3.3.4, pp. 1157–1159. Needs: §§3.3, 4.1, 5.6. Integral faithfulness/projectivity requires extra hypotheses: for `A=O[ε]/(πε,ε²)` and `M=A/(ε)`, the generic module is free faithful but its integral annihilator is nonzero.

### 5.8 Characteristic-zero patching and a uniform cotangent bound

Put `Λ=O[[w₁,…,w_s]]`, `T=Λ[[z₁,…,z_t]]`, `S_N=T[Δ_N]` and `S_∞=T[[Z_p^q]]`, where the kernels defining `Δ_N` are contained in `p^N Z_p^q`. Supply complete local `S_N`-algebras `R_N`, compatible **maps** from one complete Noetherian local `Λ`-algebra `R_∞`, and modules `F_N` free of one rank `r` over `S_N`. The `R_N`-action restricts to the given scalar action. Supply `F_N/(z,augmentation)≃M`, with `M` free of rank `r` over `Λ`, compatible quotient maps to a fixed ring `R` acting on `M`, and all marked integral points. Stabilizing matrices, ring jets, coefficient maps, actions and augmentation at cofinal open cutoffs gives `M_∞≃S_∞^r`, a patched ring `R_patch` acting on it, maps `S_∞→R_patch`, `R_∞→R_patch→R`, and `M_∞/(z,augmentation)≃M`. In the stronger case that all ring jets are quotients of a fixed finite jet of `R_∞`, the limit is a quotient of `R_∞`. Without that extra condition the map need not be surjective. This distinction matters in the source's pointwise argument.

**Point-completion surjectivity.** For a local map `A→B` with `A` Noetherian local, identical residue fields and `m_B=m_A B+m_B²`, prove `pointCompletion_surjective`: `Â→B̂` is surjective, without a Noetherian hypothesis on `B` or `B̂`. Induct on `n≥1` to prove surjectivity of `A/m_A^n→B/m_B^n`: the residue isomorphism starts the induction, and the finite generators from `m_A` generate every successive graded piece. For fixed `n`, images of the higher-level kernels form a descending chain of submodules of the Artinian module `A/m_A^n`, so the kernel tower is Mittag–Leffler. Inverse limits preserve the surjection. Only then deduce that `B̂` is Noetherian and complete as a quotient of `Â`. Source: Newton–Thorne, Proposition 4.18(2) and Remark 4.20, arXiv v3 pp. 35–36, and the quotient/limit argument just specified. Needs: native adic inverse limits, Noetherian completion and Artinian descending-chain stabilization.

**Checks.**

- `E[x]_(x)→E[[x]]` induces the identity on the completed series ring.
- For `A=E` and `B=E[t^r : r∈Q_{≥0}]_(t^{Q_{>0}})`, the nonzero maximal ideal satisfies `m_B=m_B²`. The ring is not Noetherian, every positive maximal-ideal quotient is `E`, and its completion is `E`.
- The map `E→E[[x]]` fails the cotangent hypothesis and its completion map is not surjective.

Let the point kernels be `q_N,q_∞,q_patch`. Assume one fixed `c` kills `q_N/(q_N²+q_∞R_N)`, and supply the uniform finite generation and image-of-squares comparisons that identify the patched cotangent with the limit of these images. Then `π^c` kills `q_patch/(q_patch²+q_∞R_patch)`. Prove the following image comparisons for the marked-point construction. `patchedPointIdeal_image` requires the uniform bound `v_π(f_N(q_N))≤c₀` for the elements inverted at the finite levels. A tuple whose point values tend to zero along the chosen cofinal filter can then be lifted into the completion kernel by choosing depth m whenever its valuation is at least `m(c₀+1)`; this identifies the image of `∏q_N` with `q_patch`. `pointIdealPower_product` uses a uniform bound g on generators of every `q_N`, supplied by presentations `O[[x₁,…,x_g]]↠R_N` with variables mapping into `q_N`; the finitely many degree-m monomials give `∏q_N^m=(∏q_N)^m`, hence the image is `q_patch^m`. Finally `finiteModule_diagonal_product` states that for finite O-module L and an O-algebra map `λ:∏O→O`, with `λ∘Δ=id_O`, the composite `L→∏L→O⊗_(∏O)∏L` is surjective: check a finite free cover and right exactness. Apply it to `L=q_∞/q_∞²` to identify the diagonal image. The patched coefficient evaluation is an O-algebra map because each marked point restricts to `id_O`; the evaluation therefore fixes every diagonal coefficient. The cotangent-annihilator conclusion uses all three leaves, not the generator bound alone. After inverting `π`, the relative cotangent vanishes. Apply `pointCompletion_surjective` to the point-localized rings after inverting `π`; their marked-point maps retain the common residue field `E` and its coefficient section. This gives **surjectivity** of the completed map without assuming that the target completion is Noetherian. If its source is regular of the appropriate localized `S_∞`-dimension and the finite patched module has that depth, Auslander–Buchsbaum gives freeness over the source completion; the supplied augmentation then gives the characteristic-zero freeness statement for `M`.

**Checks.**

- A varying annihilator `π^N` gives no uniform conclusion.
- For the 3-adic completion of `Z₃[s]_(3)`, the coefficient endomorphism `σ(s)=s²` has residue image `F₃(s²)`. With `L=O` and `λ=σ∘pr₁`, the diagonal composite misses `s`; this map fails `λ∘Δ=id_O`.
- The surjection `E[[x]]→E[[x]]/(x²)` has zero relative cotangent and is not an isomorphism.
- At rank zero the patched module is zero and cannot prove faithfulness of a ring map.
- At `q=t=0`, the construction retains the fixed coefficient module and its actual ring actions.

Source: Boxer–Calegari–Gee–Pilloni (2025), Hypothesis 7.2.1, Lemma 7.2.2 and Proposition 7.2.3, pp. 161–163; Newton–Thorne, Lemmas 4.16–4.17, Proposition 4.18 and Lemma 4.19, published pp. 1955–1957, prove the three image comparisons just specified. Their valuation and generator bounds remain explicit hypotheses; formal smoothness does not replace them. Needs: §§1.9, 3.1, 5.2–5.4 and the marked-point diagrams. Arithmetic hypotheses proving the source's regularity and dimension are downstream inputs.

### 5.9 Sylow projectivity and norm comparisons

For a Noetherian local `A` of residue characteristic `p`, finite `G`, a Sylow `p`-subgroup `P` and finite `A[G]`-module `M`, prove equivalence of: projectivity over `A[G]`; freeness over `A[P]`; `A⊗ᴸ_(A[P])M` being finite free in degree zero; and `k⊗ᴸ_(A[P])M` being concentrated in degree zero. Restriction and induction, averaging over the prime-to-`p` coset index, and a minimal resolution over the local group algebra prove the comparisons. A finite coefficient module is automatic from the stated group-algebra finiteness.

For any commutative `A`, subgroup `H≤G` and finite projective `A[G]`-module, invariants are exactly the image of the unnormalized norm `Σ_(h∈H)h`. Coset trace maps `M^H` onto `M^G`, independently of representatives. Invariants commute with **arbitrary** coefficient change. Invariants and coinvariants are finite projective over `A` and the norm between them is an isomorphism. For every representation, precomposition gives `(M_H)*≃(M*)^H`; for finite projective group modules restriction also gives `(M*)_H≃(M^H)*`. The latter source is coinvariants of the dual. The dual has the contragredient action. All maps and their naturality in subgroup, module and coefficient maps belong to the API; none divides by `|H|`.

**Checks.**

- For the trivial group norm is the identity.
- For the regular `A[C_p]`-module it identifies the coefficient of a coinvariant basis vector with the invariant sum, including in characteristic `p`.
- On the trivial `F_p[C_p]`-module the norm is zero while invariants are nonzero, so projectivity is essential.
- For `M=A[G]`, coefficient-of-identity evaluation on the invariant sum is `1`, fixing the normalization in the dual comparison.

Source: Boxer–Calegari–Gee–Pilloni (2025), Lemma 7.3.2, p. 165, and Lemma 7.4.11 and proof, p. 172. Needs: native group-algebra restriction/induction, the supplied coefficient pairing and §§3.1, 7.1–7.3. The module projectivity criterion uses a minimal module resolution and is independent of complex patching.

### Examples

Balance permits a square presentation before injectivity is known. The dimension deficit in balanced patching makes it a length-one resolution and supplies the missing depth. Free-module patching retains action and specialization maps; ring-module patching retains the ring quotient as well. Generic projectivity and integral faithfulness have different diagnostic examples.

### Dependencies

Layers 1, 3 and 4; PadicMeasuresIwasawaAlgebras L1 for finite group-ring quotients; native finite choice and compactness; finite-module completion. Module patching does not depend on the complex patching theorem. Arithmetic patching applications consume these algebraic results.

## Layer 6: Components, specialization cycles and quotient identification

### 6.1 Near faithfulness on native support

For any commutative ring and module define `NearlyFaithful A M`, or **near faithfulness**, by `ann_A M⊆√0`. If the annihilator is finitely generated, this is equivalent to nilpotence of that ideal; Noetherianity suffices. For finite `M` over any commutative ring, native `Module.support_eq_zeroLocus` identifies near faithfulness with full support and with membership of every minimal prime in the support. Without finiteness, containing every minimal prime still implies near faithfulness, but the reverse implication to full support is not asserted. The API compares faithful and nearly faithful modules, gives equivalence over a reduced ring, and transports by ring/module equivalence.

**Checks.**

- A nonzero free module is faithful; the zero module is not nearly faithful over a nonzero ring.
- `k` over `k[ε]/ε²` is nearly faithful but not faithful.
- The module `E/O` over a DVR is faithful because no fixed power of `π` kills it, but its generic localization is zero. Thus its support omits the generic point; this prevents dropping finiteness from the support equivalence. A fraction field itself has full localization support, even though its closed fibre is zero.
- Over a non-Noetherian ring with nilradical not nilpotent, the residue of that nilradical can be nearly faithful without a uniform nilpotence exponent.

Define **support on components** by requiring primes minimal over the annihilator to be minimal in `A`; for finite modules this says the support is a union of irreducible components. Its API specifies that union, allows the empty support of zero, and distinguishes the top-dimensional-component condition from full support.

**Checks.**

- Over `k[[x,y]]/(xy)`, `A/(x)` is supported on one component and is not nearly faithful.
- A nonzero finite-length module over a positive-dimensional domain is not supported on components.
- `A` is supported on all its components, including when their dimensions differ.

**Targets.** Finite MCM modules over Noetherian local rings have only top-dimensional minimal associated primes and support a union of top components. Irreducibility gives near faithfulness; near faithfulness plus maximal depth forces equidimensionality. A semilinear group action stabilizes annihilator and support. If it is transitive on minimal primes and one minimal prime is supported, near faithfulness follows without finiteness of the group; reducedness then gives faithfulness. Source: Taylor, Definition 2.1 and proof of Theorem 4.1, pp. 187, 218–221; Thorne, Lemma 1.10, pp. 8–9; Khare–Wintenberger II, Lemma 9.4 and §9.1. Needs: native support/annihilator and the supplier's associated-prime depth bound.

### 6.2 Quotients, coefficient change and framing

For finite nearly faithful `M`, prove the quotient annihilator formula `√ann_A(M/IM)=√I`, hence near faithfulness over `A/I`. Under a surjection `A→B`, annihilators pull back and support maps by the closed immersion; a nilpotent kernel transfers near faithfulness back to `A`. If a second compatible action on `M/IM` factors through any `A→B`, its kernel is contained in `√I`. To infer near faithfulness over `B`, also require surjectivity and `I⊆√ker(A→B)`.

For every scalar extension there is support inclusion into the inverse image; it is equality for finite `M`, or for arbitrary `M` when the extension is flat. Thus near faithfulness of finite modules ascends under any base change and descends when each minimal prime lifts, in particular under faithfully flat change. Formal-variable extensions have a coefficient retraction and give this equivalence even before using flatness. For finitely many variables the augmentation kernel is the variable ideal, and removing those variables from a finite nearly faithful module preserves near faithfulness. Infinite-variable series do not acquire a finitely generated augmentation ideal by this argument.

If `f` is a nonzerodivisor of `A`, minimal primes correspond under `A→A[1/f]`; finite-module near faithfulness can be tested there. For a finite module, faithfulness also compares when the localized ring is reduced. Completion is faithfully flat in the Noetherian local setting. Source: Stacks, Algebra, support tag 00L2 and base-change tag 0BUR; Taylor, proof of Theorem 4.1, p. 221; Calegari–Geraghty, Theorem 6.4(2)–(3), PDF pp. 93–94. Needs: §6.1 and native localization/tensor. The unit ideal gives the zero quotient; identities involving a nonzero coefficient object treat it separately.

**Checks.**

- For `M=A` the quotient annihilator is exactly `I`.
- For `A=k[ε]/ε²`, `M=k` and `I=0`, the annihilator is `(ε)`, so only the radical equality holds.
- For `I=A`, both annihilator radicals are the unit ideal, including the zero quotient module.

### 6.3 The maximal coefficient-flat quotient

For an `O`-algebra define `T_π(A)={a | ∃n, π^n a=0}` using the native torsion ideal, and its **maximal coefficient-flat quotient** `A^fl=A/T_π(A)`. The API identifies it with the image in `A[1/π]`, proves the induced quotient is `O`-flat and universal for maps to `O`-flat algebras, and commutes with the corresponding finite-module torsion quotient. For complete Noetherian local `A` the quotient is complete Noetherian, unless it is zero, which is kept outside the coefficient category.

**Checks.**

- For `A=O`, the quotient is unchanged.
- For `A=O/π^n`, it is zero for every `n≥1`.
- For `A=O[ε]/(πε,ε²)`, it is `O`, even though the original ring has dimension one.
- For an `O`-flat nonreduced ring, such as `O[ε]/ε²`, flat quotienting does not remove `ε`.

Source: Boxer–Calegari–Gee–Pilloni, §7.11 before (7.11.1), pp. 425–426. Needs: native torsion/localization and the flatness criterion over a DVR. Reduced quotienting is a separate operation.

### 6.4 Descent from a patched module

Let `ι:S→A`, `φ:A↠R`, `I=ι(a)A`, `M` finite nearly faithful over `A`, and an `A`-linear identification `M/IM≃H`, where the `A`-action on `H` factors through `R`. Assume `I⊆ker φ+ann_A M`. Then `√I=√ker φ`, `H` is nearly faithful over `R`, and `(A/I)_red≃R_red`, compatibly with `A`. If `M` is faithfully flat, the containment and specialization force `ker φ=I`, because `M/IM` is faithfully flat over `A/I`. Faithfulness alone does not identify that quotient annihilator. Over regular local `A`, a finite module carrying a regular sequence in `m_A` of length `dim A` is nonzero free; thus `H` is free over nonzero `R`. The zero target is handled separately for the ring-isomorphism conclusion.

**Checks.**

- For a nonzero finite free `M`, quotient faithfulness gives the integral equality `ker φ=I`.
- For `A=k[[t²,t³]]`, `M=(t²,t³)` and `I=(t²)`, the faithful module has `ann_A(M/IM)=(t²,t³)`, strictly larger than `I`. The stronger flat hypothesis is necessary.
- A rank-zero free module is excluded from faithful flatness and cannot identify the quotient.

These conclusions apply when near faithfulness of `M` comes from maximal depth on an irreducible patched ring, from support on all generic components after inverting an `A`-nonzerodivisor, or from a transitive component action. The support hypotheses tie the conclusion to the actual patched module. A nonzero MCM module on a reducible ring alone supplies none of these alternatives. Source: Calegari–Geraghty, Theorem 6.4, PDF pp. 93–94; Kisin, Lemma 3.3.4, p. 1159; Taylor, proof of Theorem 4.1, p. 221. Needs: §§3.1, 6.1–6.2.

### 6.5 Reduced and torsion-free ring identification

Let `A↠T` act on `H` compatibly. Near faithfulness over `A` puts the kernel in `√0`, hence `A_red≃T_red`; if `T` is reduced, the induced map `A_red→T` is an isomorphism. If `A` is reduced, the original surjection is an isomorphism. For Noetherian `A` its kernel is nilpotent. Faithfulness of `H` over `A` gives injectivity for any compatible action map, and an isomorphism for a surjection.

When `T` is the faithful action image and `π` is injective on `H`, `T_π(A)⊆ker(A→T)`, and `T` is reduced exactly when `T[1/π]` is. The equality `A^fl≃T` is equivalent to generic faithfulness of `H[1/π]` over `A[1/π]`. If `H` is nearly faithful, the coefficient torsion of `A` is nil. No integral equality follows just from a generic free module before removing torsion. Source: Kisin, Proposition 3.3.1, pp. 1157–1159; Khare–Wintenberger II, Propositions 9.2(III), 9.3(III), pp. 81–83, 89; Taylor, end of Theorem 4.1, p. 221. Needs: §§6.1–6.4. A free module of rank zero does not prove faithfulness.

### 6.6 Connectedness dimension and arithmetic rank

For nonzero Noetherian local `A`, define **connectedness dimension** `c(A)` as the minimum of `dim A` and the dimensions of intersections of the two closed component unions over every nonempty partition of its irreducible components. Use `dim ∅=-1`. Define **arithmetic rank** `ara(I)` as the least length of a tuple whose generated ideal has radical `√I`. Their API includes invariance under radical/equivalence, the irreducible value `c(A)=dim A`, computation by component partitions, `ara(0)=0`, and the bound by the size of any radical generating tuple.

**Checks.**

- A field has connectedness dimension zero, not infinity.
- The local node `k[[x,y]]/(xy)` has connectedness dimension zero: its two components meet only at the closed point.
- A `d`-dimensional domain has the capped value `d`; an empty component partition contributes no extra candidate.
- `(x²,y³)` and `(x,y)` have the same arithmetic rank two in `k[[x,y]]`, while `(x^n)` has arithmetic rank one for `n≥1`.

**Target.** For complete Noetherian local `A` and proper `I`, prove `connectedness_arithmeticRank_bound`: `c(A/I)≥c(A)-ara(I)-1`. Use Stacks, Algebraic and Formal Geometry, Lemma 52.14.1, tag [0ECR](https://stacks.math.columbia.edu/tag/0ECR), with its convention that connected spaces are nonempty. Its minimum closed-disconnector dimension therefore equals the finite component-partition definition above, including the candidate obtained by deleting all of `Spec A`. Write d for the smallest component dimension. If there is more than one component, intersect a d-dimensional component with the union of the others: this gives `c(A)≤d-1`. In the irreducible case `c(A)=d`. Thus `min(c(A),d-1)≥c(A)-1`; the source's bound and `cd(A,I)≤ara(I)` give the target. This also treats an irreducible quotient via the empty-complement candidate. The field case is immediate. Needs: component dimension theory, the supplied Čech bound on cohomological dimension and the cited complete-local connectedness theorem. For the domain `k[[x,y]]` and `I=(xy)`, the result reads `0≥2-1-1=0`; using an infinite value for the domain would fail this check.

### 6.7 Generic and special components

Let `A` be excellent local over `O`, equidimensional of dimension `d+1`, with every reduced component `O`-flat. Assume `A/π` is generically reduced and every special minimal prime contains exactly one generic minimal prime. Prove preservation of these conditions under completion and coefficient-one specialization at special generic points. For a finite `π`-torsion-free module, special minimal support primes are not minimal support primes of the original module. Under catenarity, equidimensionality, avoidance of `π` by all generic primes and the unique-component condition, near faithfulness of `M/πM` lifts to near faithfulness of `M`.

**Affine module cycles.** For Noetherian `A`, finite `M` with `dim Supp M≤D` and a natural bound `D`, the module cycle `moduleCycle D M`, also written `Z_D(M)`, is a definitional abbreviation of PadicLocalLanglandsForGL2Qp §0.5's module cycle, on Mathlib's cycle carrier of `Spec A`: at a prime with `dim A/p=D` its coefficient is `length_(A_p)(M_p)`, and all other coefficients vanish. Such support primes are minimal in `Supp M`, so their localizations have finite length. Exact additivity under the common bound D, vanishing below D and the closed-immersion quotient comparison are §0.5's. On localization retain the coefficients at surviving primes, with their closure dimensions measured in `Spec A`; localization can change the intrinsic dimension grading. Source: Emerton–Gee, Definition 2.2.5 and Lemma 2.2.7, arXiv v3 p. 7. Needs: PadicLocalLanglandsForGL2Qp §0.5's module cycles with the hypothesis `dim Supp M≤D` retained; the finite-type-over-a-field Chow grading is not used.

**Checks.**

- Over a DVR, `Z_1(O)=[(0)]` and `Z_1(O/π)=0`, whereas `Z_0(O/π)=length_O(O/π)[m]=[m]`.
- Over a field, `Z_0(k^r)=r[(0)]`, including the zero module at `r=0`.
- For `A=k[ε]/ε²`, `Z_0(A)=2[(ε)]` and `Z_0(k)=[(ε)]`; the exact sequence `0→k→A→k→0` gives `2=1+1`.

**Uniformizer specialization.** For complete equidimensional Noetherian local `O`-flat `A` of dimension `d+1`, `moduleCycle_specialization` is a definitional abbreviation of §0.5's specialization on top-dimensional cycles, sending `[p]` to `Z_d((A/p)/π)`, with its `O`-flatness hypotheses retained. For finite `O`-flat `M`, §0.5's agreement of the specialization of `Z_(d+1)(M)` with `Z_d(M/πM)` reads, component by component,

`Z_d(M/πM)=Σ_(p∈Min A) length_(A_p)(M_p) Z_d((A/p)/π)`.

The statement `moduleCycle_specialization_coeff` in `Suggested.lean` is the coefficientwise form of that agreement theorem at each dimension-d special prime, using native localized lengths; it is a check of §0.5's theorem, not a second construction. The coefficient is a generic length; it becomes a rank only when `A` is generically reduced. The application targets here are the following. Disjoint special-cycle supports and coefficient-one specializations make equality to a full-support special cycle detect positive generic coefficients. Smaller-dimensional terms contribute zero to ambient multiplicity. Source: Thorne, Proposition 1.6 and Lemma 1.10, pp. 7–9; Boxer–Calegari–Gee–Pilloni, (7.12.1), Lemmas 7.12.2–7.12.3 and Remarks 7.12.6–7.12.7, pp. 427–430; Emerton–Gee, Lemma 2.2.10 and Proposition 2.2.13, pp. 8–9. Needs: §§3.12, 6.1 and PadicLocalLanglandsForGL2Qp §0.5's module cycles, `moduleCycle_specialization` and its agreement theorem. A special fibre with repeated components has coefficients greater than one.

**Checks.**

- For `A=O`, `M=O^r` and `d=0`, specialization sends `r[(0)]` to `r[m]`.
- For `A=O[ε]/ε²` and `M=A`, the generic localized length is two and the special-fibre cycle is `2[(ε)]`; generic field rank would lose that coefficient. For `M=A/(ε)` both coefficients are one.
- For `A=O[[x]]/(x²-π)` and `M=A`, the generic coefficient is one but the special cycle is `2[(x)]`. Flatness alone does not make specialization coefficients one.

### 6.8 Completed products and monomial cycles

For complete Noetherian local `k`-algebras with residue `k`, finite modules have `e(M⊗̂_k N)=e(M)e(N)`, with nonzero support dimensions adding. Ambient multiplicities multiply at ambient dimension sum as well. If either module is zero both sides vanish; no natural-number dimension is assigned to that tensor. For `O`-flat modules obtain the product formula on their special fibres. Component products require the geometric conditions of §4.6.

For a square-free monomial ideal in a finite-variable formal series ring, the minimal vertex covers give its coordinate minimal primes. The **monomial component comparison** API constructs the quotient-to-component maps, proves radicality, computes dimension from cover sizes, computes generic length one, and identifies multiplicity with the number of components when all covers have the same size.

**Checks.**

- The ideal `(xy)` gives two coordinate components of dimension one and multiplicity two.
- The ideal `(x²)` is not square-free and has a generic length-two component, so the component count alone would fail.
- In `k[[a,b,c,d,e,f]]`, `I=(ab,ac,ae,bc,bd,cf)` has precisely the minimal primes `(a,b,c)`, `(a,b,f)`, `(a,c,d)`, `(b,c,e)`. Each quotient has dimension three and generic length one, so the reduced quotient has multiplicity four.

The last calculation applies after the invertible coordinate change `a=c12-c13c32`, `b=κc31-c21c32`, `c=c23`, `d=c13`, `e=c21`, `f=c32`, requiring `κ≠0`. Radicality or equidimensionality of a square-free monomial quotient does not imply CM. Source: Le–Le Hung–Levin–Morra, Lemma 3.6.13, pp. 70–71, and Corollary 3.5.5, p. 39; Emerton–Gee, Lemma 2.2.14, arXiv v3 p. 9. Needs: §§3.11–3.12, 4.6 and native monomial ideals.

### 6.9 Extending maps from a regular locus

Let `U=Spec A\Z`, `M,N` finite, with depth at least two along `Z`. The local-cohomology comparison gives `M≃Γ(U,M~)` and similarly for `N`. If the restrictions are line bundles and an injection has image a specified Cartier ideal times `N~` on `U`, its global image is that extension provided the image also has depth at least two along `Z`. This last depth hypothesis cannot be inferred solely from depth of source and target. If `N` is rank-one free, the map has a global ideal image. At an integral point, the actual generated ideal acts on the torsion-free rank-one specialization; a nonzero image is `π'^vO'`. Injectivity after specialization requires a Tor or saturation hypothesis.

For `A[[t₁,…,t_r]]`, compare crossing complements when components extend from `A`. A finite depth-two extension of an ideal commutes with this formal-variable extension. Radicality in a completed tensor requires geometric reducedness; an imperfect field is not silently treated as perfect. Apply `PadicMeasuresIwasawaAlgebras` §5.1's `detLine_shortExact`, `detLine_quasiIso` and `detLine_acyclic`, then AlgebraicVectorBundles' associated-sheaf comparison, to trivialize the determinant of any locally free module admitting a finite free resolution. On a punctured regular local spectrum, a line bundle admitting a finite coherent extension thus has trivial restriction, using the finite resolution of that extension.

The additional target `localCI_parafactorial` states: for a Noetherian local complete intersection `A` of dimension at least four, every line bundle on `Spec A\{m}` is trivial. Use the supplied Picard and restriction carriers, but prove the CI theorem here by the local Lefschetz/parafactorial argument (SGA 2, Exposé XI, Theorem 3.13(ii), new-edition p. 105, old p. 132, proof pp. 107–108). Its API gives Picard-group vanishing and uniqueness of a line-bundle extension up to the specified restriction isomorphism; it does not assert a canonical trivializing section.

**Checks.**

- A regular local ring of dimension four has zero punctured Picard group.
- The four-dimensional complete hypersurface `k[[x,y,z,w,t]]/(xy-zw)` is CI and has zero punctured Picard group, although it is singular.
- The three-dimensional node `k[[x,y,z,w]]/(xy-zw)` is excluded: the rank-one ideal `(x,z)` is a nontrivial line bundle off the closed point. It is locally principal there, while its two minimal generators prevent a free rank-one extension; the depth-two extension comparison recovers the ideal. Thus lowering the dimension bound is false.

Finally, a strict surjection of finite good filtered modules, or of finite graded modules, with equal Hilbert series is an isomorphism. A surjection of nonzero finite local modules `M↠N` with `M` CM, common support dimension and equal intrinsic multiplicity is likewise an isomorphism: every nonzero kernel submodule would have the same dimension and positive ambient multiplicity. Dropping CM permits an invisible lower-dimensional kernel, for example `O⊕k↠O`. Source: Le–Le Hung–Levin–Morra, Lemmas 5.2.1–5.2.2, Theorem 5.2.3, Remark 5.2.4, pp. 119–120, Theorem 5.3.5, p. 126, and Lemma 3.6.11, p. 69; SGA 2, Exposé XI, Lemma 3.15, new-edition p. 106, old p. 133. Needs: §§3.7, 3.12–3.13, 4.7, AlgebraicVectorBundles 0B–0C and `PadicMeasuresIwasawaAlgebras` §5.1.

### Examples

`A/(x)` on a node isolates one component despite maximal depth. A semilinear action interchanging the components can instead force both to occur. The six-variable monomial computation supplies a concrete multiplicity-four reduced example. A torsion-free rank-one specialization with image `π'^vO'` records the vanishing order of an ideal-shaped map.

### Dependencies

Layers 1, 3–5; native module support, annihilators, ideal radicals and localization; PadicLocalLanglandsForGL2Qp §0.5's module cycles, specialization and multiplicity; SchemeAndStackFoundations SF.5 cycles; AlgebraicVectorBundles determinants. The general topology of connectedness is consumed, while the connectedness-dimension theorem is the explicit new ring input. No blowup or Macaulayfication target is duplicated from Part II.

## Layer 7: Finite complexes, signed duality and coefficient towers

### 7.1 Comparing native homological and cohomological Tor

Construct `nativeTorCohomologyComparison`: for native modules `M,N` and `n≥0`, identify both Mathlib `Tor_n(M,N)` and `Tor'_n(M,N)` with `H^(-n)(M⊗ᴸN)` in the supplied native module-derived category. The extra content is the comparison between the two existing homological conventions and cohomological indexing, with their actual scalar structures. Compare native Ext with `H^n RHom(M,N)`. The API gives module-map naturality, agreement with the projective-resolution models, symmetry between the two Tor conventions through the supplied Koszul braid, and compatibility with coefficient restriction and the ideal-sequence boundary `Tor₁(M,A/I)→M⊗I→M`. The tensor, Hom, K-flat and linear Hom-complex constructions themselves are inputs listed in the boundaries.

**Checks.**

- For a free stalk, Tor is zero in positive homological degree, and degree zero is the ordinary tensor product.
- For `M=N=Z/2` over `Z`, self-tensor has `Z/2` in degrees `-1,0`, whereas derived Hom from `Z/2` to `Z` has `Z/2` in degree `1`.
- Zero gives zero groups in all degrees. Ordinary tensor of the `Z/2` stalk would miss degree `-1`, so it cannot be substituted for derived tensor.
- On two shifted free stalks of odd degree the symmetry is multiplication by `-1`; characteristic two alone would not distinguish it.

Source: Stacks More on Algebra §15.60, tags [06XY](https://stacks.math.columbia.edu/tag/06XY), [064J](https://stacks.math.columbia.edu/tag/064J), and §15.63, Examples 15.63.1–4, tag [061Y](https://stacks.math.columbia.edu/tag/061Y). Needs: native projective resolutions, the supplied module-derived tensor/Hom and signed enrichment, and the two native Tor bifunctors.

### 7.2 Finite-order approximations

For `m∈Z`, define `IsMPseudoCoherent m X` to mean an actual derived map from a bounded finite free complex to `X` inducing isomorphisms on `H^i` for `i>m` and a surjection on `H^m`. Unlike the supplied pseudo-coherent predicate this records one finite approximation order. Its API includes transport by isomorphism, weakening from order `n` to `m` when `n≤m`, shift of order to `m-t` under `[t]`, and recovery of the actual approximation map. Prove equivalence of pseudo-coherence with all finite orders by descending attachment of finite generators to the cone, retaining compatible truncations. Finite-order approximations are stable under retracts and extensions; the cone of an `(m+1)`-approximate source and an `m`-approximate target has order `m`.

**Checks.**

- Zero satisfies every order.
- A stalk `M[0]` is `0`-pseudo-coherent exactly when `M` is finitely generated, and `(-1)`-pseudo-coherent exactly when it is finitely presented. Over a noncoherent ring a cyclic quotient by a non-finitely-generated ideal distinguishes these orders.
- An infinite-dimensional vector-space stalk over a field fails order zero; a finite-dimensional one satisfies all orders.
- Shifting a finitely generated but non-finitely-presented stalk by `[1]` gives order `-1`, but not `-2`, fixing the sign of the order shift.

Source: Stacks §15.66, tags [064Q](https://stacks.math.columbia.edu/tag/064Q), [064N](https://stacks.math.columbia.edu/tag/064N), [064V](https://stacks.math.columbia.edu/tag/064V), [064X](https://stacks.math.columbia.edu/tag/064X); §15.68, tag [0651](https://stacks.math.columbia.edu/tag/0651), and §15.76, tags [0658](https://stacks.math.columbia.edu/tag/0658), [0656](https://stacks.math.columbia.edu/tag/0656). Needs: §7.1, the exact supplied perfect/pseudo-coherent/amplitude API, native finite presentation and flat/projective comparison.

### 7.3 Minimal finite free representatives and residual detection

For a native complex over `(A,m,k)`, define `IsMinimal C` by `range d^i⊆m C^(i+1)` for all `i`. This predicate includes no finiteness, freeness or bound. Its API identifies it with zero residue differentials, with all differential entries in `m` in chosen bases, and gives isomorphism/shift transport. A unit entry in a based finite free differential splits off the identity disk in those two degrees by explicit row and column changes. The chain relation clears the adjacent components. Both ranks fall by one over a nonzero ring. The target `minimal_finiteFree_representative` iterates from the upper bound to give a minimal representative of any bounded-above finite free complex and a homotopy equivalence. The removed disks form a degreewise finite coproduct; only disks starting in degrees `i-1,i` meet degree `i`. A bounded complex retains its original term interval.

For minimal complexes, homotopic maps agree after residue reduction. Degreewise Nakayama makes a homotopy equivalence of termwise finite free minimal complexes a strict chain isomorphism; no bound is needed for this implication. To pass from a derived isomorphism to such a homotopy equivalence, use bounded-above projectivity. Uniqueness means existence of a chain isomorphism, not a unique comparison or a canonical model. Minimal ranks are

`rank_A C^i=dim_k H^i(C⊗ᴸk)`.

The cancellation comparison realizes the supplied residue-amplitude criterion by an actual minimal chain representative, with exactly these ranks. In particular a residue quasi-isomorphism between bounded finite projective models is realized by a homotopy equivalence, and residual acyclicity by an actual contraction. The extra output is the chain maps and contraction, not another derived Nakayama criterion.

**Checks.**

- The identity disk over a field is nonzero as a chain complex, is not `IsMinimal`, and contracts to zero.
- `O --π→ O` in degrees `-1,0` is already minimal and retains both terms.
- Over `k[ε]/ε²`, the residue-field stalk has an infinite minimal free resolution and is pseudo-coherent but not perfect.
- A nonzero fraction-field stalk over a DVR has zero derived residue but is not pseudo-coherent; it defeats the unrestricted Nakayama claim.

For finite free `F⁰→F¹→F²` over **any** local ring, with composition zero before reduction, residual exactness at `F¹` implies exactness there and splitting of `ker d⁰`, `im d⁰` and `im d¹` in their respective terms. Cancel unit pivots until the residual middle term is zero. This asserts neither injectivity at the first term nor surjectivity at the last. Test the zero middle term, an identity disk with an unused endpoint summand, and `A --π→ A --0→ A`, which is not residually middle-exact. Source: Stacks tag [00MT](https://stacks.math.columbia.edu/tag/00MT), finite-complex splitting, and Lemma 15.77.6, tag [0BCC](https://stacks.math.columbia.edu/tag/0BCC); Boxer–Pilloni (2025), §2.6.5, Lemmas 2.6.6–2.6.7, pp. 21–22. Needs: §§3.1, 7.1–7.2, finite local freeness and native homotopy comparison.

### 7.4 Finite approximation and filtered Hom

For a bounded-above finite free `F` and a target strictly zero below `a`, the inclusion of the brutal truncation `σ_(≥a-1)F→F` induces a bijection on derived Hom into that target. Its quotient is strictly zero above `a-2`; t-structure orthogonality, including the shifted quotient, proves the two directions. The smart truncation is used on **targets**, where it gives quasi-isomorphic functorial models under a common lower cohomological bound; it is not substituted for this finite free source truncation.

For perfect `P`, Hom from `P` commutes with degreewise filtered colimits of arbitrary complexes. For pseudo-coherent `P`, require one common lower cohomological bound on all targets. The canonical Hom map is bijective, natural in both variables, and gives both factorization through a stage and equality at a common later stage. Exact filtered colimits preserve the target replacements. This is the affine native-complex comparison for SchemeAndStackFoundations SF.2's existing filtered-colimit theorem.

**Checks.**

- Finite projective stalks recover the finitely presented module Hom comparison.
- An infinite-dimensional source over a field fails compactness against the directed union of its finite-dimensional subspaces.
- A pseudo-coherent resolution over `k[ε]/ε²` is allowed under one common target lower bound; a sequence of targets whose bounds tend to `-∞` is outside that theorem.
- The zero diagram gives zero Hom.

Source: Stacks Lemma 15.67.1 and proof, tag [0G8W](https://stacks.math.columbia.edu/tag/0G8W); Boxer–Pilloni (2025), proof of Proposition 2.3.13, p. 17. Needs: §§7.1–7.3, native truncations and exact filtered module colimits.

### 7.5 Infinite rank local freeness and complete flat models

Consume native finite local projective freeness. The extension needed for complete flat models is **Kaplansky freeness without a finite-generation assumption**. Decompose a projective module into countably generated projective summands; over a local ring prove that an element lies in a finite free summand and construct bases for the countable summands. An arbitrary projective module over a local ring is then free. Across a nilpotent ideal, arbitrary lifted residue generators span by iterating `M=N+IM`; no finite Nakayama hypothesis is needed. Over a local ring with nilpotent maximal ideal, flatness makes arbitrary lifted residue bases independent as well. Over a DVR, if `P` is `π`-torsion-free, any lifts of a basis of `P/πP` give a basis of `P/π^nP` over `O/π^n`, for `n≥1`, by induction on `n`. For a finite free `O`-algebra `B` and a `B`-module killed by `π^n` and free over `O/π^n`, lifts of a `B/π`-basis form a `B/π^n`-basis. The application to `O[Δ]` permits arbitrary finite abelian `Δ` and arbitrary module rank.

**Checks.**

- An infinite direct sum of copies of a local ring is free and projective.
- `O/π` is free modulo `π` but its quotient modulo `π²` is not free over `O/π²`; torsion-freeness cannot be omitted.
- The ideal `(x,y)⊂k[[x,y]]` is finite and nonfree, hence is neither projective nor flat over this Noetherian local ring. No assertion that every flat ideal of an arbitrary non-Noetherian local ring is free is used.
- Rank zero and `n=1` give the exact base cases.
- These arguments concern quotients; residue lifts need not be an algebraic basis of a complete infinite-rank module itself.

Let `(A,m)` now be a complete Noetherian local ring. For a set `J`, compare the native completion of `A^(J)`, the **free direct sum**, with restricted coefficient families `(a_j)` such that for every `n` only finitely many coefficients are outside `m^n`. For a flat separated complete `A`-module `M`, any chosen basis of `M/mM` and any lifts give `completeFlatBasis:completion(A^(J))≃M`. The map sends a restricted family to its convergent sum. Prove its reduction is an isomorphism modulo every `m^n`, using flatness to identify successive graded pieces; pass to the complete limit. No finite residue field is needed. Finite `J` gives the ordinary finite-free equivalence.

The API `completeFlatMatrix` identifies continuous linear maps with matrices whose **individual columns** are restricted coefficient families: modulo every `m^n`, each column has finite support. There is no finite row-support condition. Composition is the convergent matrix product, and identity is the Kronecker matrix. A map inducing an isomorphism modulo `m` is an isomorphism: lift the inverse, and invert the remaining `1+u` by its convergent geometric series, where `u(M)⊆mM`. These comparisons justify the convergent basis changes used to split the invertible residue block. Source: Stacks More on Algebra §15.28, Lemmas 15.28.1–2, tag [06LD](https://stacks.math.columbia.edu/tag/06LD), for the restricted completion and flatness; the residue-basis comparison follows from the graded-piece induction just specified; CG Lemmas 7.5–7.7 and Pilloni §2.2 for the cancellation application.

**Checks.**

- For `m=0`, completion of an infinite free direct sum is that direct sum, whereas the full product is strictly larger.
- Over a complete DVR the coefficient family `(π^j)_(j≥0)` belongs to the completion, while the constant family `(1)_(j≥0)` does not.
- The matrix with every column the first basis vector defines the convergent sum of coefficients; its first row has infinite support. Requiring finite row support would exclude this continuous map.
- Empty `J` gives zero; one generator gives `A`. The nonflat residue module over a DVR is excluded from `completeFlatBasis`.

Over a complete Noetherian local `A`, the predicate `CompleteFlatComplex C` on a native cochain complex means that it is bounded in terms, termwise flat and termwise separated complete for `m`. This is the **complete flat complex** carrier; terms may have infinite rank, and minimality is the same `IsMinimal` as in §7.3. Its API gives chain-isomorphism transport, finite sums, shifts, cones and K-flatness. Using lifted topological residue bases, split a map between complete flat modules into an invertible block and a block reducing to zero. Cancel these disks in a bounded complex. The target `completeFlat_minimal_retract` gives a chosen minimal complete flat `N`, chain maps `i:N→C`, `s:C→N`, `s i=id_N` and `i s∼id_C`, in the same term interval. Its residue terms identify with `H^j(C⊗k)`. If these spaces are finite-dimensional, `N` is finite free. Residue acyclicity gives a contraction; a residue quasi-isomorphism between complete flat complexes gives a quasi-isomorphism. Transfer of an endomorphism is `s t i`: it respects multiplication **up to homotopy**, and hence in the homotopy/derived category. It need not give a strict chain action.

**Checks.**

- Zero and bounded finite free complexes are complete flat.
- Adic separatedness excludes a fraction-field stalk over a DVR: it is flat but not separated for the adic topology, even when the DVR is complete.
- An identity disk contracts to zero; the `π`-disk retains two minimal terms.
- Two transfers whose products differ by the retract homotopy test that strict multiplication is not silently claimed.

Source: Stacks §§10.84–10.85, tags [058T](https://stacks.math.columbia.edu/tag/058T), [058Z](https://stacks.math.columbia.edu/tag/058Z), and Lemma 10.101.2, tag [051G](https://stacks.math.columbia.edu/tag/051G); Calegari–Geraghty (2018), Lemmas 7.5–7.7, pp. 396–398; Pilloni (2020), §2.2, Propositions 2.2.1–2.2.2, and §2.3, Lemma 2.3.1 and the proof of Proposition 2.3.1, author PDF pp. 8–11. Needs: §1.15, §§7.1–7.3 and the completed-direct-sum/restricted-coefficient comparison constructed in this section and the stated splitting argument.

### 7.6 Signed perfect duality and discrete fraction-quotient duals

Use the supplied `RHom(X,A)` on perfect objects and construct its native representative comparison. For bounded finite projective `P` the degree-`n` term is `(P^(-n))*` and differential `(-1)^(n+1)(d^(-n-1))*`. Evaluation `x↦(λ↦(-1)^nλ(x))` gives a chain isomorphism to the double dual. Express this isomorphism using the native linear Hom complex into the degree-zero ring; termwise finite projectivity suffices for this comparison, without a boundedness hypothesis. The API gives contravariant maps and reversed composition, perfectness of the dual, amplitude `[-b,-a]` from `[a,b]`, and natural biduality. There is a chain isomorphism `E⊗P*≃Hom•(P,E)` for arbitrary `E`: on `E^q⊗(P^p)*` the map is `e⊗λ↦(x↦λ(x)e)` with **no extra sign in this ordering**. Reversing factors invokes the Koszul braid. Perfect-source derived Hom and perfect duals commute with arbitrary coefficient extension. All these comparisons respect composition, units and the signed shift maps.

The tensor-cone comparison `E⊗Cone(f)≃Cone(id_E⊗f)` is the identity on the unshifted target summand and multiplication by `(-1)^q` on the shifted source summand coming from `E^q`. This sign is required by the cross differential `f`, even when the original differentials vanish.

**Checks.**

- Take `P=[Q --2→ Q]` in degrees `0,1`. Its dual has degrees `-1,0` with differential `+2`. Its double dual has degrees `0,1` with differential `-2`. Signed evaluation is `+1` in degree zero and `-1` in degree one, and the chain equation is `(-2)·1=(-1)·2=-2`. Unsigned evaluation gives `-2≠2`.
- If `E=Q` in degree one and `f=id` on the degree-zero stalk, the source tensor-cone cross differential is `-1`; the cone on the tensored map has cross differential `+1`, so the shifted-summand comparison is `-1`. These two-term witnesses distinguish the signed comparison from the unsigned one.
- In characteristic two the signs coincide, so that field alone is an inadequate test. A finite projective stalk in degree `j` dualizes to degree `-j`; the perfect torsion stalk `Z/2` dualizes to nonzero degree one rather than its zero ordinary dual.

For a DVR with fraction field `E`, put `D_O(M)=Hom_O(M,E/O)` on the native opposite module category by precomposition. The quotient is an injective module. If `O` is complete, scalar multiplication identifies `End_O(E/O)` with `O`; in general it is the completion. The API gives exact contravariance, identity/composition, evaluation `D_O(O)=E/O`, and for finite free `L` the natural equivalence `D_O(L⊗E/O)≃L*`, carrying dual maps to their adjoints.

**Checks.**

- `D_O(0)=0`.
- `D_O(k)≃k` while `Hom_O(k,O)=0`, so ordinary O-dual is the wrong functor.
- `D_O(E/O)≃O` when O is complete; over an incomplete DVR it gives the completion.
- No assertion of Pontryagin duality for an arbitrary DVR is included; comparing with the `Z_p` dual requires a trace/inverse-different normalization.

For a finite projective model supported in `[0,l]`, `H⁰(P*)=coker((d⁰)*: (P¹)*→(P⁰)*)`. Its ordinary coefficient extension is the corresponding adjoint cokernel over **any** algebra. At a field point it is the dual of `H⁰(P⊗F)`. At an `O`-point it is `D_O(H⁰(P⊗E/O))`. The latter follows from exact `E/O`-duality of the finite free kernel sequence. The nonnegative term bound is essential: shifting a complex changes which cokernel computes `H⁰`.

Source: Stacks Lemma 15.76.15 and Remark 15.76.16, tags [07VI](https://stacks.math.columbia.edu/tag/07VI), [0H81](https://stacks.math.columbia.edu/tag/0H81); Lemma 15.100.3, tag [0ATK](https://stacks.math.columbia.edu/tag/0ATK); Boxer–Calegari–Gee–Pilloni (2021), Lemmas 7.8.5–7.8.6 and Remark 7.8.7, author PDF pp. 213–214. Needs: §§3.7–3.9, 7.1–7.3, the native signed enrichment and the supplier's tensor-Hom coherence.

### 7.7 Compatible actions on strict coefficient towers

For a strict countable complex tower in the supplied native linear diagram category, define `StrictTowerAction T C` to be ring maps `T→End_chain(C_n)` commuting with every transition. The ring `T` may be noncommutative; there is no implicit topology. Unlike an action on each individual derived object, this retains the actual commuting chain maps. Its API gives extensionality, restriction along ring maps, the unique action on the chain limit, and equivariance of the supplied linear Milnor sequence. A compatible family of actual chain homotopies induces a homotopy on the limit; unrelated levelwise homotopies do not.

For an ideal `I`, a chain action on `C` induces `quotientTowerAction` on the supplied ordinary tower `C/I^(n+1)C`, with the representative formula `[x]↦[t x]`. It preserves identities and products, and homotopies descend. With K-flatness, identify this action with the derived coefficient action at every stage and transition. For a bounded finite-module complex over an I-adically complete Noetherian ring the action on its ordinary limit agrees under the supplied chain comparison with the original action.

**Checks.**

- Scalar actions on `A/I^(n+1)` commute with all transitions and give scalar multiplication on the complete limit.
- Zero has its unique action, with zero limit action.
- On an identity tower of nonzero `Q`-stalks, alternating `Q[x]` actions `x=0` and `x=1` fail transition compatibility, even though each level separately has an action.
- For the `Z/2` stalk, ordinary reduction modulo two misses the derived negative Tor group, so the action comparison requires a K-flat representative.
- For `I=A` the entire quotient tower is zero; a nonzero original complex is not recovered, since the ring is not complete for that ideal.

Source: Stacks §15.96, Proposition 15.96.2, tag [0922](https://stacks.math.columbia.edu/tag/0922), and §20.37, Lemma 20.37.1, tag [0BKN](https://stacks.math.columbia.edu/tag/0BKN), for the underlying supplied comparison; BCGP (2025), §7.2, pp. 161–163, for the retained action diagrams. The equivariant extension is proved by componentwise equality and the universal property of the supplied limit. Needs: §§1.15, 7.1–7.3 and the exact native strict-tower contract.

### 7.8 Completion of finite derived Hom

Let `(A,m)` be complete Noetherian local and `P,Q` bounded finite free native complexes. Construct `finiteDerivedHomCompletion`, the natural A-linear equivalence

`Hom_D(A)(P,Q) ≃ lim_n Hom_D(A/m^(n+1))(P_n,Q_n)`.

Its API preserves identities, composition and coefficient projections, so the endomorphism case is a ring isomorphism. Unlike the supplied effectivity of perfect systems, this asserts completeness of the **derived Hom module**, rather than effectivity of its objects. This gives adic completeness of the native derived morphism module. Use the finite Hom complex and the supplied Milnor comparison on its cohomology; finite-length images stabilize and kill `lim¹`. Chain maps need not lift uniquely, and the limit is not a limit of sets of chosen chain representatives.

Also prove `finiteModule_inverseLimit_exact` for arbitrary small cofiltered systems of finite modules over a complete Noetherian local ring. This extends the supplied countable Mittag–Leffler result. Apply the exact contravariant Matlis functor to an objectwise short exact diagram, take the exact filtered colimit, and apply the Matlis functor again. Since Hom into the injective hull converts colimits into limits and finite modules identify naturally with their Matlis biduals, the result is the original inverse-limit sequence. This proof uses the supplied Matlis equivalence and exactness on all modules; no new linearly compact carrier or finite residue field is required.

**Checks.**

- For the pair `A[0],A[0]`, the Hom comparison is the ring completeness isomorphism `A≃lim A/m^(n+1)`.
- For `P=[O --π→ O]` in degrees `-1,0` and `Q=O[0]`, derived Hom in degree zero is zero; one cannot replace it by the free Hom between degree-zero terms.
- Zero in either slot gives zero Hom. Two distinct homotopic chain maps have the same image, so the comparison cannot assert uniqueness of chain lifts.
- A constant cofiltered exact sequence stays exact on inverse limits. Infinite residue fields are allowed; this is not finite-code selection for Layer 8.

Source: Khare–Thorne, Lemma 2.13(1),(3) and Lemma 2.14, pp. 11–12; Allen et al., Definition 6.4.11, Proposition 6.4.12 and Remark 6.4.13, pp. 1057–1059; Stacks tag 0922, together with the finite Hom-complex argument. Needs: §§7.3, 7.7, finite-module completeness, exact filtered module colimits and the supplied Matlis biduality.

### 7.9 Finite actions, isolated blocks and cohomologically trivial maps

Define a **derived algebra action** as an `A`-algebra map to the native derived endomorphism ring; a strict action is the stronger chain-level datum. Its new API gives restriction of algebras, induced cohomology actions, conjugation by a specified derived isomorphism and transport under the supplied scalar-extension functor. Conjugation retains the chosen comparison. The supplier's finite-Hom and ghost-power results apply to every bounded finite-cohomology object here, so the action-image algebra is finite and its cohomological kernel has the supplied exponent. The following targets concern transport and isolated-factor comparisons.

**Checks.**

- The scalar action on `A[0]` induces ordinary multiplication on `H⁰`.
- Zero has the unique action to its zero endomorphism ring.
- Restricting `A[x]` along `x↦0` and `x↦1` gives different actions on a nonzero stalk.
- Two chosen comparison isomorphisms give conjugate transported actions; equality requires their specified commutation diagram.

For finite `T/A` and a minimal prime `p` of `T`, localize the base at its contraction `q`. The prime `pT_q` is both minimal and maximal in `T_q`; its isolated product factor is the Artinian local ring `T_p`. The other factor, and hence `T_q` itself, need not be Artinian. Use the supplied native splitting of its idempotent. The additional comparison identifies the resulting factor and its localized cohomology with the abstract idempotent-completion factor; an idempotent of cohomology alone is not an idempotent chain map. Over a local coefficient quotient of dimension zero, every prime in the finite algebra is maximal, giving the usual finite product of blocks. For a general prime that is not isolated, localization is **not** a direct summand. Test a field product, the single block of an Artinian local algebra, and the generic localization of `A` over a positive-dimensional domain, which need not split integrally.

For perfect `C` of Tor-amplitude `[-1,0]` and endomorphism `φ`, suppose `pd H⁰(C)≤1`, `H⁰(φ)=0`, and `H⁰(φ†)=0`, where `C†=RHom(C,A)[1]` and `φ†` is its dual. Then `φ=0`. The two-term resolution argument uses both cokernels; replacing the shifted dual by the unshifted ordinary module dual loses an endpoint. Source: Iyengar–Khare–Manning, Lemma 10.8 and proof, pp. 48–49; Allen et al., Lemma 6.3.3, p. 1049 for isolated blocks; IntegralHeckeAndGaloisDeterminants Layer 2 for its existing finite-image specializations; Stacks perfect-idempotent and native t-structure comparisons. Needs: §§3.1, 7.2, 7.6, 7.8 and DGAInfinity Layer 5's idempotent completion, plus the isolated-factor comparison just specified.

### 7.10 The coefficient spectral sequence and its actual abutment

For `C` strictly zero above `b` and an `A`-module `B`, take a projective cochain resolution `P→B` zero above degree zero. Use the signed double complex `C^q⊗P^p`. On total degree `n`, only `n-b≤p≤0`, `n≤q≤b` occur; hence direct-sum totalization has finite diagonals and represents `C⊗ᴸB`. Extend `ArithmeticGaloisDuality` §D7.1's bounded-perfect/algebra-coefficient spectral sequence to bounded-above complexes and arbitrary coefficient modules, with

`E₂^(p,q)=Tor_(-p)^A(H^q(C),B)`, `p≤0`, `q≤b`,

and `d_r:(p,q)→(p+r,q-r+1)`. Its API identifies page two with the native Tor carrier, gives page-homology comparisons, and is additive and functorial in chain and coefficient maps, preserving identity and composition. Resolution changes are compared through chain maps and homotopies, not by asserting an arbitrary page family has an abutment. Strict chain actions act on every page and commute with all differentials and coefficient-tower comparisons. At the common perfect/algebra-coefficient hypotheses prove agreement with the supplied spectral sequence, its edge maps and coefficient-change comparisons through the native resolution comparison.

On the **actual** `H^n(C⊗ᴸB)`, construct a decreasing finite filtration with `F^p=H^n` for `p≤n-b` and `F^p=0` for `p>0`. Its associated graded is `E_∞^(p,n-p)`. Every entry on this diagonal stabilizes by `r≥max(2,b-n+2)`, since possible incoming and outgoing terms then lie outside the indicated region. This proves finite, separated, exhaustive strong convergence; it does not give a canonical direct-sum decomposition. Flat `B` leaves only the `p=0` column and gives ordinary cohomology base change. In general the highest nonzero cohomological degree gives the natural right-edge isomorphism `H^b(C)⊗B≃H^b(C⊗ᴸB)` when `H^i(C)=0` for `i>b`; lower degrees need not commute.

For `X∈D(A)` with `H^i(X)=0` above `b`, construct `derivedRightEdge` as the natural isomorphism `H^b(X)⊗B≃H^b(X⊗ᴸB)`. Define its map from the canonical smart-truncation triangle `τ_(≤b-1)X→X→H^b(X)[-b]`. Derived tensor is right t-exact, so the first term has cohomology at most `b-1`; its two adjacent groups give the displayed isomorphism. This construction is natural for **all derived morphisms** and therefore equivariant for any derived ring action, without choosing a strict chain lift. Its API includes identity/composition, coefficient-map naturality and compatibility with isolated derived idempotent blocks. This is the additional right-edge action comparison; full-page equivariance above still requires strict actions.

**Checks.**

- `A[0]` gives only `E₂^(0,0)=B`.
- For `(Z/2)[0]` and `B=Z/2`, the terms `(-1,0),(0,0)` survive and give degrees `-1,0`.
- The free complex `[Z --2→ Z]` in degrees `-1,0` has the same two residue cohomology groups, checking the model and the direction of the Tor index.
- Zero gives zero pages and filtration.
- For the `π`-disk in degrees `0,1`, `b=1` and `B=k`, the right edge is `k⊗k≃k` in degree one, while the additional degree-zero group is Tor. A derived idempotent acting on a direct sum preserves the right edge on its chosen block. Zero gives the zero isomorphism.
- A strict scalar action preserves every filtration step; an arbitrary derived action preserves the canonical right edge by the smart-truncation construction.

Source: Stacks §15.63, Examples 15.63.1 and 15.63.4, tag 061Y; Homology Lemmas 12.24.11 and 12.25.3, tags [012W](https://stacks.math.columbia.edu/tag/012W), [0132](https://stacks.math.columbia.edu/tag/0132). Needs: §§7.1–7.3, `ArithmeticGaloisDuality` §D7.1 (Derived tensor, perfect amplitude and Tor), native filtered double complexes and their finite-diagonal spectral sequences. Construction of the native page/filtration comparison is a prerequisite proof task, not an axiom asserting convergence.

### Examples

The `π`-disk distinguishes term bounds, cohomology bounds and Tor amplitude. The identity disk distinguishes native chain objects from derived objects. The rational `2`-disk detects the dual and cone signs. Torsion self-tensor detects negative Tor degrees. Together these examples also test finite-model reduction, completion, duality and actions; none relies only on a zero-object compatibility.

### Dependencies

Layer 1 for adic limits, Layer 3 for finite modules and duality; native complex localization, homotopies, Ext/Tor, spectral sequences and completion; the precise DerivedModuleAlgebra, SchemeAndStackFoundations, IntegralHeckeAndGaloisDeterminants and DGAInfinity contracts in the boundaries. No higher-tier completed-cohomology or six-functor roadmap is used to supply module-complex algebra. Those applications import these comparisons.

## Layer 8: Simultaneous patching of complexes, rings and actions

### 8.1 Based models and finite coefficient selection

A **based presentation** over `B`, with rank profile `r:Z→N`, records matrices `d_i:B^(r_i)→B^(r_(i+1))` with `d_(i+1)d_i=0`. Interpret it on the native cochain carrier, with these column-vector successor maps and zero nonsuccessor maps. Its API identifies every native term and differential, gives extensionality by entries, and changes coefficients entrywise, preserving identity and composition. Finite support of `r` is a separate hypothesis. For bounded `r` it computes derived coefficient extension by §7.1; changing cohomology alone does not.

**Checks.**

- The zero profile gives zero terms.
- A single rank-one term has zero differentials.
- The two-term matrix `[1]` over `F₂` is a nonzero contractible chain object.
- The matrix `[2]` over `Z` reduces to zero modulo two and creates the extra Tor cohomology.

Fix an ultrafilter `F` on positive integers. For finite `B`, **finite germ evaluation** identifies `Germ(F,B)` with `B` by its unique `F`-large fibre; the API gives constants, the selected-fibre equation and naturality for finite-ring maps. Nonprincipality is used only when deleting finitely many levels. For finite local `B`, the inverse image of its maximal ideal under evaluation defines a prime `x_F` in `∏B`, and localization at that prime is `B`. For every finite `d`, the corresponding module-germ comparison gives `B^d`, coordinate by coordinate. With one bounded profile, evaluate every differential entry to obtain the patched presentation. The API retains matrices, constant systems, equality on a large set, coefficient change and supplied comparisons. For uniformly bounded profiles, one profile is selected on a large set. There are only finitely many based models and chain maps at fixed finite `B` and profile. Selected compatible chain isomorphisms compare a family with a fixed model; no comparison between unrelated ultrafilters is claimed.

**Checks.**

- A constant germ of `3` in `Z/4` evaluates to `3`; a principal filter evaluates at its index.
- A nonprincipal filter ignores finite changes.
- If two filters select respectively the zero and unit differentials in an alternating `F₂` two-term family, one patch has two nonzero cohomology groups and the other is contractible.
- Infinite coefficient fields do not give a finite set of matrix codes.

Source: Gee–Newton, Definition 2.2.5, Lemmas 2.2.2 and 2.2.6, Corollary 2.2.7 and Remark 2.2.8, pp. 12–13; Allen et al., Definition 6.4.7 and Proposition 6.4.10, pp. 1056–1057. Needs: §7.3, native germs/localization and finite choice. The construction selects actual finite matrix data, not an algebra structure on a product of varying types.

### 8.2 The finite-level input and all its diagrams

Fix finite residue `k`, a complete DVR `O`, `Λ=O[[w₁,…,w_s]]`, framing ring `T=Λ[[x₁,…,x_j]]`, `S_∞=T[[Z_p^h]]`, and augmentation `a_∞` killing **both** group and framing variables. Fix `δ≥1`, complete local `Λ`-algebras `R_loc`, `R_∞=R_loc[[y₁,…,y_g]]`, and a perfect `C₀` over `Λ`. A **finite complex patch datum** supplies, for every `N≥1`:

- a finite quotient `Δ_N` with kernel contained in `p^N Z_p^h`, and perfect `C_N` over `Λ[Δ_N]`;
- its actual derived augmentation `C_N⊗ᴸΛ≃C₀`, hence a common finite residual complex;
- a commutative finite derived image `T_N⊆End_D(C_N)`, an ideal `I_N` with `I_N^δ=0`, complete local `R_N`, and continuous surjections `R_N↠T_N/I_N`, `R_∞↠T⊗̂_Λ R_N` compatible with coefficients;
- maps on augmentation from `T_N` into `T₀` surjective **after** projection to `T₀/I₀`, and specified isomorphisms `R_N⊗_(Λ[Δ_N])Λ≃R₀`, compatible with the maps from `R_∞` and into `(T₀/I₀)/I_(N,0)`, where `I_(N,0)` is the image of `I_N`.

The maps and isomorphisms, not merely their existence, belong to the data. There are no transition maps between different `N`. The API gives framed scalar actions, finite coefficient reduction, the augmentation diagrams and uniform ranks `r_i=dim_k H^i(C₀⊗ᴸk)`. For a broader bounded-complexity variant supply a finite support interval and rank bound explicitly. For paired data also supply `R_loc/π≃R'_loc/π`, the induced same-`g` identification of `R_∞/π`, every finite `R_N/π` identification, derived complex isomorphisms over `(Λ/π)[Δ_N]`, equality of their residual **derived** Hecke images, and agreement of deformation maps after quotient by the sum of the two residual error images. The augmentation comparisons must commute with these residual diagrams.

**Checks.**

- At `δ=1` the error ideals vanish.
- With residual rank one in only one degree all minimal differentials vanish.
- A profile nonzero in every integer degree cannot supply a bounded perfect patch.
- Equal residual dimensions without an isomorphism of complexes and action diagrams are insufficient.
- Retaining group augmentation but omitting frame augmentation recovers the framed original, not `C₀`.

Source: Allen et al., §6.4.1, pp. 1053–1054. Needs: Layers 1 and 7, the group-algebra supplier and §8.1. Arithmetic construction of any of these data is downstream.

### 8.3 Finite quotients and simultaneous decorations

For an open ideal `J⊂S_∞`, the levels for which `ker(S_∞→T[Δ_N])⊆J` form a cofinite set. This follows from the completed group-algebra presentation and actual cofinality estimate, not from a notation for increasing levels. Form `C(J,N)=C_N⊗ᴸ_(Λ[Δ_N])S_∞/J`, with the frame variables included in this coefficient map, and choose its minimal based representative. Frame and group cofinality are independent of the choice of matrices.

At fixed `B=S_∞/J` and profile, the number of chain endomorphisms is at most `|B|^(Σ r_i²)`. The derived endomorphism ring is a quotient of the chain-map set by homotopy, so has the same upper bound; it does not inject canonically into that set. Encode the Hecke image, error ideal and deformation map together as subsets and functions on this finite carrier. A finite local action image has a uniformly nilpotent maximal ideal by the cardinal bound and Nakayama. Consequently for some `d₀(J)` independent of `N`, the map to `T(J,N)/I(J,N)` factors through the ring jet

`R(d,J,N)=(R_N/m_(R_N)^d)⊗_(Λ[Δ_N])S_∞/J`, `d≥d₀(J)`.

Use a power of the **entire maximal ideal**. These rings are quotients of a common finite `R_∞/m_∞^(e(d,J))`. The fixed filter selects one kernel, one based complex, the full derived action image, ideal and map on a large set. This gives `C(J,∞)`, `T(J,∞)`, `I(J,∞)` and `R(d,J,∞)` with the same quotient maps and exponent. Reducing `J₁⊂J₂` commutes with patching derivedly; the Hecke-image maps are surjective and carry the error ideal onto the smaller one. All these choices are simultaneous. Cofiltered nonempty finite decorated types also give the diagonal-compactness variant, after restriction functoriality and unbounded original-level indices are verified.

**Checks.**

- An untruncated `R_N=Λ[Δ_N][[u]]` is not a finite coefficient object.
- Stabilizing only kernels but changing the action maps loses the required diagrams.
- A constant matrix patches to itself.
- At zero rank the endomorphism ring is zero, but ring and augmentation maps still require their stated definitions.
- Replacing uniform `δ` by increasing exponents does not give a nilpotent limit ideal.

Source: Allen et al., Definition 6.4.3, Remarks 6.4.4–6.4.8, Lemma 6.4.9 and Proposition 6.4.10, pp. 1054–1057; Calegari–Geraghty, Theorem 6.3 construction. Needs: §§5.2–5.3, 7.3, 7.8–7.9, 8.1–8.2. The finite-ring cardinality bound supplies the uniform jet; it cannot be replaced by powers of individual elements without a further ideal bound.

### 8.4 The complete patch and the two kinds of action

Strictify the minimal models for `J=m_∞^(n+1)` with compatible bases as in §7.8. Their limit `C_∞` has finite free terms of ranks `r_i`, is strictly supported in the common finite interval, and has finite cohomology over `S_∞`. Prove `C_∞⊗ᴸS_∞/J≃C(J,∞)` for **every** open `J` by cofinality. Form `T_∞=lim_J T(J,∞)` and its ideal `I_∞=lim_J I(J,∞)`. Coordinate injectivity gives `I_∞^δ=0`. The Hom completion comparison gives

`T_∞ ↪ End_D(S_∞)(C_∞)`.

This is a continuous derived action for the finite-quotient topology, not a strict chain action. The finite deformation maps give a continuous surjection

`R_∞ ↠ T_∞/I_∞`,

factoring through `α:R_∞↠Q=lim_(d,J)R(d,J,∞)`. Prove the quotient-limit comparison using the Mittag–Leffler error-ideal system. Lift the scalar map `S_∞→Q` to a chosen continuous local `Λ`-map `ι:S_∞→R_∞` by lifting the finitely many variable images through `α`; completeness and topological Nakayama justify evaluation. For paired systems choose these lifts compatibly modulo `π` by the fibre-product surjectivity diagram. A single choice is retained for all objects and maps of one system category.

A **genuine derived deformation action** additionally requires a supplied continuous `S_∞`-algebra lift `l:R_∞→T_∞` for the retained `ι`. With `q_T:T_∞→T_∞/I_∞` and the displayed quotient map `q:R_∞→T_∞/I_∞`, its two equations are `q_T∘l=q` and `l∘ι=scalar:S_∞→T_∞`. Composition with the displayed embedding gives the scalar-compatible derived action. Alternatively, supply compatible genuine derived actions at finite levels: on each retained `C(J,∞)` the action `ρ_J` must lift the quotient data and satisfy `ρ_J∘ι=scalar_J` exactly in its derived endomorphism ring. These equations must commute with coefficient reduction and augmentation. Agreement only modulo the error ideal is insufficient. The map `ι` does not supply `l`. ACC's error-quotient output alone therefore supplies the spectral support in Layer 9, not an `R_∞`-module structure on cohomology. This conditional boundary is a required output of the roadmap.

The API compares all reductions, actions, ideals and ring maps. In the genuine-action variant, system morphisms retain the chosen scalar lifts and intertwine the genuine actions, including their exact scalar equations at every finite quotient. Coherent system morphisms give additive derived morphisms preserving identity, composition and homotopy. For fixed filter and specified compatible finite identifications, §7.8 gives the unique derived comparison reducing to them. Choices of chain lifts then give canonically isomorphic outputs. No comparison of arbitrary filters or unrelated decorations is asserted.

**Checks.**

- A constant rank-`r` free system patches to `S_∞^r`.
- A compatible two-term matrix patches to its coefficient limit.
- A zero error ideal and scalar-compatible genuine finite actions retain the action; a nonzero error ideal supplies only the quotient unless a scalar-compatible lift is given.
- Take `O=ℤ₃`, `S_∞=O[[x]]`, `R_∞=O[[y]]`, `Q=S_∞` with `α(y)=x`, and `T_∞=S_∞[ε]/ε²`, `I_∞=(ε)`, acting regularly on `C_∞=T_∞[0]`. The unique scalar lift is `ι(x)=y`, but the continuous quotient lift `l(y)=x+ε` has `l(ι(x))≠x`. Its matrix on `(1,ε)` is `[[x,0],[1,x]]≠x·Id`, also in the derived category. These are the constant finite data with `s=h=0`, `j=g=1`, `R_loc=R_N=O`, `Δ_N=1`, `C_N=C₀=O²[0]`, `T_N=T₀=O[ε]/ε²`, `I_N=I₀=(ε)`, `δ=2`, identity augmentation comparisons and `y↦x` on framed rings.
- Finiteness of the Hecke image over `S_∞` does not imply finiteness of the entire deformation ring over it.

Source: Allen et al., Definition 6.4.11, Proposition 6.4.12, Remarks 6.4.13–6.4.14, pp. 1057–1059; Khare–Thorne, Lemma 2.13(3), pp. 11–12; Iyengar–Khare–Manning, Theorem 10.6 proof, pp. 44–47. Needs: §§1.9, 7.7–7.9, 8.1–8.3. No unproved strictification of a derived ring action is used.

### 8.5 Augmentation and paired residual comparisons

The supplied augmentation diagrams give `C_∞⊗ᴸ_(S_∞)Λ≃C₀`. Prove this first at open `J⊃a_∞`, then use the compatible Hom/completion comparison. Group-only augmentation gives `C₀` with frame variables still present. Independently the ring diagrams yield `R_∞/a_∞R_∞↠R₀`; an isomorphism is not asserted. The induced `T_∞→T₀` is surjective after projection to `T₀/I₀`. Retain the nilpotent image `I_(∞,0)` in `T₀/I₀`: the resulting map to `(T₀/I₀)/I_(∞,0)` agrees with the route through `R₀`. Whole-complex augmentation is stronger than an equality of the top cohomology modules.

With paired input and the same filter, obtain `C_∞⊗ᴸS_∞/π≃C'_∞⊗ᴸS_∞/π`. The Hecke rings have the same image `Tbar` in the residual derived endomorphisms under this comparison. The identified deformation rings modulo `π` give the same maps to `Tbar/(Ibar+I'bar)` and hence the same actions on residual cohomology modulo that sum. The separate error images need not be zero or equal. Prove these results using simultaneous finite residual isomorphisms and compact lifts of the finite action images; matching cohomology actions alone does not imply equality of derived images.

**Checks.**

- A single free stalk recovers its ordinary augmentation.
- The `x`-disk over `O[[x]]` augments to two copies of `O` in adjacent degrees, so augmenting just its top module is insufficient.
- At `I=I'=0` the residual quotient is the full common image.
- Independently chosen filters do not provide the paired comparison.
- A nonzero specialization error ideal survives as an explicitly retained ideal.

Source: Allen et al., Lemma 6.4.15 and Propositions 6.4.16–6.4.17, pp. 1059–1061. Needs: §§7.6–7.8, 8.2–8.4 and the compatible paired coefficient lifts.

### 8.6 The cohomology-action variant

Retain separately the Calegari–Geraghty construction, whose input actions are on cohomology. Let O be a complete DVR with **finite residue field** of characteristic p, `q,j,l≥0`, `q+j≥l`, `S_∞=O[[Z_p^q]]`, `S_N=O[(Z/p^N)^q]`, `O□=O[[z₁,…,z_j]]`, and `dim R_∞=1+j+q-l` for a complete Noetherian local O-algebra R∞ with labelled residue k. Write `S_N□=S_N[[z₁,…,z_j]]` and likewise at infinity. Supply H finite over a complete Noetherian local O-algebra R with labelled residue k, a finite zero-differential residual complex V supported in `[0,l]` with `H^l(V)≃H/π`, and perfect D_M over `S_M/π^M` with `D_M⊗ᴸ_(S_M/π^M)k≃V`, for M≥1. Choose minimal bounded finite free representatives C_M in degrees `[0,l]` by §7.3. The **finite-cutoff cohomology patch datum** consists of these objects and the following decorations, for every original level M:

- A local surjection `φ_M:R_∞↠R`.
- For each `1≤L≤M`, `0≤N≤L`, `1≤n≤L`, and framing ideal `(z₁^L,…,z_j^L)⊆I⊆(z₁,…,z_j)` in O□, commuting R∞ and scalar actions on every cohomology group of
  `C_M□ ⊗_(S_M□/π^M) S_N□/(π^n,I)`.
  This is termwise tensor of the bounded free representative, hence derived tensor **over the displayed quotient base**. It is not derived tensor over S_M□ without that quotient. Include the unframed reduction I=(z) and all diagrams induced by decreasing N or n, enlarging I, or restricting L; overlapping cutoffs use the same action. An action on the original cohomology is not sufficient to construct these decorations.
- Scalar-image containment in the R∞ image on the finite graded direct sum of these groups; the augmentation ideal of S_N□ has image contained in the image of `ker φ_M`. The kernel is indexed by the **original level M**, including when the quotient level is N<M.
- For `1≤n≤M`, compatible R∞-linear top augmentation identifications at N=0, I=(z): `H^l(C_M□⊗O/π^n)≃H/π^n`, using φ_M. Include every reduction diagram between these identifications.

`cohomologyActionPatch` constructs a bounded free P∞ over S∞ in `[0,l]`, its framed extension, a continuous surjection `φ_∞:R_∞↠R`, and compatible commuting R∞ actions on framed cohomology with scalar-image and augmentation-kernel containment. Its API retains all finite-cutoff projections and `H^l(P_∞□)/a_∞≃H`, where a∞ kills both group and framing variables. Scalar-image containment makes these cohomology modules finite over R∞: their finite set of scalar generators also generates over R∞. The top equality is an ordinary quotient because there is no term above l; it is not a whole derived augmentation. Nonzero top modules are required before the finite depth equalities in Layer 9.

For the construction first note that H is finite over O. Indeed H/πH is finite-dimensional over k; as H is finite over R, some `m_R^c H⊆πH`. Thus `m_R^(cn)H⊆π^nH`, the m_R- and π-adic topologies on H coincide, and complete Nakayama gives O-finiteness. Fix c≥1 with this property (c=1 works when H=0). At patch level L retain the surjection `R∞→R/m_R^(cL)` along with all N≤L, n≤L and framing quotients in the displayed range. This finite quotient both determines the action on H/π^L and is cofinal in R; retaining only the action on H would not recover a surjection to R. Retain the based-complex matrices at `S_L/π^L`, every cohomology action, and every comparison and top-augmentation map. There are finitely many ideals and matrix/action decorations after reducing coefficients and framing powers. The groups are finite, and §5.2 bounds a common finite R∞ quotient through which their actions factor.

Along original levels M≥L select compatible finite types by §8.1, simultaneously with these reductions of φ_M. Restrictions from L+1 to L are among the retained diagrams. The selected based complexes give P∞; finite-module inverse-limit exactness and completeness pass the cohomology actions and identities to the limit. Scalar-image and augmentation-kernel containments pass by compactness of R∞: the finite-level sets of possible preimages are nonempty closed sets, and the retained diagrams give the finite intersection property. Top cohomology commutes with the coefficient quotients since the models end in degree l, giving H. The limiting map is surjective: its image is closed, and its projections onto every retained R/m_R^(cL) are surjective. There is no strict or derived R∞ action in this conclusion.

**Comparison with the corrected source.** The published correction changes single brackets to double brackets at 47 specified occurrences. Item (1), p. 855, makes S∞ a **completed group algebra** in Theorem 6.3 and the other listed locations; item (10), p. 856, makes O□ a **formal power-series ring** there. Neither item adds quotient-action hypotheses or changes the coefficient ranges. The original Theorem 6.3(b) asks for actions for all M≥N≥0, M≥1 and **all n≥1**; (c) likewise asks for all n≥1. Here the bounded free S_M/π^M model only uses n≤M, and at cutoff L only n≤L≤M. The finite-cutoff datum is deliberately a separate sufficient theorem, with H finite explicitly and all nonflat framing-quotient actions supplied. It is not a verbatim restatement of the corrected source.

The literal kernel in Theorem 6.3(d) is ker φ_N, whereas its level-L construction selects φ=φ_M from the original level M. At N=0 the former notation has no supplied φ₀. The datum here specifies ker φ_M at every quotient level. In the original proof, a level-L patch datum retains every framing ideal between `(z_i^L)` and `(z_i)`, and is selected from an original level M≥L, with `φ=φ_M`. Its inference that cohomology commutes with those framing quotients needs an additional argument or stronger input; completion-bracket corrections do not supply it. The datum above supplies the needed actions and their diagrams directly and uses ker φ_M throughout. The published unbounded n-conditions alone are not advertised as sufficient to manufacture those quotient actions.

**Checks.**

- At l=0 this reduces to one-degree patching with the actual actions; q=0 has S_N=O, and j=0 has only the trivial framing ideal. The inequality q+j≥l then excludes positive l if q=j=0.
- At H=0, top augmentation alone does not prove the complex zero. Infinite residue fields do not give the finite decorated choice used here; completeness alone does not replace finiteness.
- Original level M=2, cutoff L=1, quotient N=0 and n=1 still uses ker φ₂, not ker φ₀. Index n=0 would be a zero coefficient ring and supplies no residual information; it is excluded.
- The π-disk `O --π→ O` in degrees 0,1 has H⁰=0 and H¹=k; reduction to k has H⁰=H¹=k. Similarly `O[[z]] --z→ O[[z]]` has H⁰=0, but its quotient by z has nonzero H⁰. Thus tensoring an action on ordinary cohomology through a nonflat quotient does not construct an action on the new cohomology.
- For M=1, the base ring is S₁/π. Derived tensor over S₁ instead introduces extra coefficient Tor, even for its rank-one stalk. Using the indicated quotient base avoids this different complex.

Source: Calegari–Geraghty, Theorem 6.3(b)–(d) and the level-L construction, author journal-layout PDF pp. 90–93; *Correction to: Modularity lifting beyond the Taylor–Wiles method*, Invent. Math. 227 (2022), 855–856, DOI [10.1007/s00222-021-01095-5](https://doi.org/10.1007/s00222-021-01095-5), complete correction, especially items (1),(10). The finite-cutoff theorem uses the explicit strengthened input and compactness proof above. Needs: §§5.2–5.4, 7.3, 7.8, 8.1. It remains separate from §8.4's derived-action statement.

### Examples

The free stalk, the compatible scalar disk, and paired systems with a nonzero residual error sum test the three outputs independently: the perfect object, its derived Hecke action, and the deformation quotient map. The common filter and common scalar lift are retained across all three. The identity disk is a useful zero derived object whose matrix presentation still carries a nonzero differential.

### Dependencies

Layers 1, 5 and 7; completed group algebras and formal coefficient evaluation; native finite germs, localized products and finite-choice compactness. No dimension or Cohen–Macaulay conclusion is used to construct the patch. Those conclusions are obtained next from explicit dimension and support hypotheses.

## Layer 9: Codimension, canonical duality and support transport

### 9.1 Complex support and dimension

Define `derivedSupport C`, the **complex support**, as `⋃_i Supp_A H^i(C)` on the native prime spectrum, and `cohomologyAnnihilator C` as `⋂_i ann_A H^i(C)`. Neither definition needs finiteness. The APIs give membership by nonzero localized cohomology, invariance under derived isomorphism and shift, stalk formulas, direct-sum union/intersection, and triangle support containments with their rotations. Empty support is equivalent to being the zero derived object. For bounded finite cohomology, support equals the zero locus of the cohomology annihilator; for Noetherian `A`, full support is equivalent to nilpotence of that ideal. The ideal need not equal the kernel of the scalar derived action, although §7.9 compares their radicals.

**Checks.**

- Zero has empty support and unit annihilator.
- `(A/I)[0]` has support `V(I)` and annihilator `I`.
- The sum `(A/I)[0]⊕(A/J)[-1]` has union support and annihilator `I∩J`, not `I+J`.
- A nonzero two-degree complex can have zero Euler characteristic without empty support.

For perfect `C`, local minimality gives `p∈Supp C` iff `C⊗ᴸκ(p)≠0`. Therefore arbitrary derived coefficient change pulls back support exactly. In particular removing formal variables by derived augmentation intersects support with their zero locus. Over a Noetherian ring, for bounded finite cohomology and an element regular on the ring, full support is equivalent to full support after inversion: regularity excludes every minimal prime and closed support then contains all their specializations. This is a support theorem, not integral cohomology concentration. Test the free stalk, the `x`-disk over `O[[x]]`, and the `π`-disk: the latter is rationally zero and integrally nonzero. Without ring regularity of the inverted element, a whole component can disappear.

For bounded finite cohomology over Noetherian `A`, define **complex dimension** by `sup_i(dim Supp H^i(C)+i)` in integers with bottom. Its API gives zero as `-∞`, stalk dimension, shift subtraction `dim C[n]=dim C-n`, derived invariance, and the localized expression `sup_p(dim A/p+sup H*(C_p))`. For perfect complexes compare it with the dimension extracted from the native Fitting ideals of the differential matrices. This is a theorem about those actual matrices, not a second definition by arbitrary numerical rank data.

**Checks.**

- `A` in degree `r` has dimension `dim A+r`; a residue field in degree two has dimension two, not minus two.
- `A[0]⊕k[-r]` has dimension `max(dim A,r)` for `r≥0`.
- The zero complex has bottom dimension even though the zero polynomial's natural degree is zero.

Source: native module support and derived cohomology APIs; Stacks tag 0656, perfect scalar extension and local minimality; Christensen–Iyengar (2021), equations (1)–(4), Theorem 1 and Corollary 2, pp. 2–3. Needs: §§6.1, 7.2–7.3, native support and finite zero-locus operations. The dimension/Fitting comparison is the new module-complex target.

### 9.2 Codimension and concentration

Let `S` be regular local of dimension `d`, and `C≠0` perfect of Tor-amplitude `[a,b]`, with `l=b-a≥0`. Choose the finite free representative in those **term** degrees. If `m` is its first nonzero cohomology degree, put `K=coker(P^(m-1)→P^m)`. The initial exact segment is a finite free resolution of `K` of length at most `m-a`, and `H^m(C)` injects into `K`. Auslander–Buchsbaum and the associated-prime dimension bound give

`dim Supp H^m(C) ≥ d-(m-a)`.

The target `codimension_amplitude_inequality` gives `dim Supp C≥d-l`. The target `balanced_dimension_concentration` states that if `dim Supp C≤d-l`, the inequalities force `m=b`: only `H^b(C)=M≠0` remains. Its projective dimension is exactly `l` and `depth_S M=dim Supp_S M=d-l`. The signature also states CM concentration directly on the native local-cohomology functors: all degrees except `d-l` vanish and degree `d-l` is nonzero. In particular a finite algebra action whose cohomological support has dimension at most `d-l` gives this conclusion by finite integral dimension comparison. If `l=0`, `M` is finite free over `S`. A support bound and an ordinary cohomology interval do not replace the Tor-amplitude hypothesis.

The CM-base extension is stated by `cohenMacaulay_action_concentration` in `Suggested.lean`. For nonzero perfect `C` over a CM local `S`, prove

`dim_S RHom_S(C,S)=dim S-inf H*(C)`.

Use the dimension/Fitting comparison or the finite-projective dual-dimension argument, not regularity of `S`. If a Noetherian local `S`-algebra `R` acts **genuinely in the derived category** by an `S`-algebra map `R→End_D(S)(C)`, every dual cohomology module is finite over `S`, has the compatible `R`-action, and has dimension at most `dim R`. For amplitude `[a,b]` and `dim R≤dim S-(b-a)`, dual amplitude `[-b,-a]` bounds dual dimension above by `dim R-a`. This forces `inf H*(C)=b`, hence `C≃M[-b]`. The finite free resolution and Auslander–Buchsbaum then force `pd_S M=l`, `depth_R M=depth_S M=dim R=d-l`. Thus `M` is finite MCM over `R`. The nonzero module and local finite-action depth comparison are essential; no whole-ring finiteness of `R/S` is assumed.

**Checks.**

- `[O --π→ O]` in degrees `0,1` has one-dimensional base, width one, and `M=k` of projective dimension one and depth zero.
- `[O[[x]] --x→ O[[x]]]` has codimension one, `pd=1`, depth one and top module `O`; augmentation creates `O` in both degrees.
- Over `S=k[[x,y]]`, the perfect stalk `S/(x)⊕k` has amplitude `[-2,0]`, support dimension one and depth zero: codimension one is smaller than width two, so no CM conclusion applies.
- Zero is excluded from numerical equalities.
- A free stalk placed at a strict interior point of an artificially enlarged interval cannot satisfy the displayed dimension bound.

Source: Calegari–Geraghty (2018), Lemmas 6.1–6.2 and proof, pp. 385–386; Christensen–Iyengar (2021), Proposition 6 and proof, p. 5; Iyengar–Khare–Manning, Lemma 10.7, p. 48. Needs: §§3.1–3.3, 7.2, 7.6 and 9.1. In a Hecke error-quotient system use finite `T`-support for the regular-base statement; an `R`-module conclusion requires the exact scalar-compatible genuine action of §8.4.

### 9.3 A patched CM functor and its duality

In the genuine-action variant of Layer 8, fix the common filter, scalar lift `ι` and genuine actions satisfying §8.4's exact scalar equations. Assume `S_∞` regular of dimension `d`, `dim R_∞=d-l`, and the nonzero residual complex has cohomology supported in `[a,b]`, `b-a=l`. Minimal residual ranks put `C_∞` in that Tor interval. Section 9.2 gives `C_∞≃M_∞[-b]`, with `M_∞` finite MCM over `R_∞`. Coherent system morphisms give an additive `R_∞`-linear functor to these modules; identity, composition, addition and the augmentation comparisons are retained. The augmentation is the **derived** isomorphism `M_∞[-b]⊗ᴸΛ≃C₀`. Its top part is `M_∞/a_∞M_∞≃H^b(C₀)`; lower degrees are the corresponding higher Tor, not discarded modules. MCM alone gives support on top components, not full support or a nilpotent deformation kernel.

Put `Λ_N=Λ[Δ_N]`. For the dual system use `C_N†=RHom(C_N,Λ_N)[-(a+b)]` with compatible framed coefficient duals, maps and actions. Supply its perfectness and its augmentation diagrams, as in the finite complete-intersection/Gorenstein coefficient setting of the source. Signed perfect duality and the same filter give

`C_∞† ≃ RHom_(S_∞)(C_∞,S_∞)[-(a+b)]`.

Identify its top cohomology with the canonical CM dual `M_∞^∨=H^(-dim R_∞)RHom_(R_∞)(M_∞,ω_(R_∞))`, using §3.8's normalized dualizing **complex**. Thus patching commutes contravariantly with CM duality, naturally for system maps. The comparison uses the finite faithful action quotient and normalized local duality; it does not assume `R_∞` finite over `S_∞` or replace the canonical complex of a possibly non-CM ring by a module without justification. The API includes the involution, bidual evaluation and the compatibility of specialization and adjoints.

**Checks.**

- At `a=b=0` the shift is zero and a free rank-`r` system gives its ordinary coefficient dual.
- For the width-one `x`-disk in degrees `0,1`, dualizing and shifting by `-1` returns the same degree interval; omitting that shift moves the top module to the wrong degree.
- Zero dualizes to zero but is excluded from the dimension argument.
- The integral `π`-disk retains residue Tor under augmentation.
- A perfect system lacking compatible dual augmentation is not an input to this theorem.

Source: Iyengar–Khare–Manning, Theorem 10.6 and Lemma 10.7, pp. 43–48; §§11.1–11.2 and Theorem 11.3, pp. 49–51. Needs: §§3.8–3.9, 7.6, 8.4–8.5, 9.2. The canonical-duality comparison through the finite action quotient is the named target below; arithmetic self-duality is supplied downstream.

The native representative target `patched_dual_concentration` states the signed-dual conclusion over the regular coefficient ring: for a finite projective model in `[a,a+l]` satisfying §9.2's support bound, its linear Hom complex into the degree-zero ring has cohomology only in degree `-a`, where it is `Ext_S^l(H^(a+l)(C),S)`. Shifting by `-(2a+l)` puts that module in degree `a+l`. This is the regular-base expression of the canonical CM dual; the system-level comparison above retains its genuine actions and normalization.

The target `finiteActionCanonicalDuality_ext` compares two complete regular coefficient sources `S,Q` acting through the same complete Noetherian local `R` on `M`, finite over all three. If their dimensions are `d,e` and `0≤r≤min(d,e)`, it gives an additive equivalence `Ext_S^(d-r)(M,S)≃Ext_Q^(e-r)(M,Q)`. Both calculations use the finite faithful quotient `R/ann_R M`. The normalized-complex comparison below supplies the stronger natural `R`-linear identification; the native Ext statement does not select a normalization. Source: Stacks Lemma 47.16.1, tag [0AX1](https://stacks.math.columbia.edu/tag/0AX1), finite-local normalization and adjunction in SchemeAndStackFoundations §§2.18–2.21, and Iyengar–Khare–Manning, Lemma 10.7 and Theorem 11.3, pp. 47–48, 50–51.

**Checks.**

- For `S=Q=R=k`, `r=0`, both Ext groups are the ordinary vector-space dual.
- For `S=O`, `Q=R=M=k`, `r=0`, the comparison is `Ext_O^1(k,O)≃Hom_k(k,k)`; ordinary `Hom_O(k,O)` is zero.
- For `R=S[[t]]`, `Q=S`, `M=S` with `t=0`, both sources act through the finite quotient `R/(t)=S`, despite `R/S` not being finite.

The prerequisite `finiteActionCanonicalDuality` has the following exact contract. Let `S` be complete regular local of dimension `d`, `R` complete Noetherian local with normalized `ω_R`, and `M≠0` finite over both, with compatible local actions and `dim_R M=dim R=r`. Put `B=R/ann_R M`. Assume the `S`-action factors through `B`; the finite-action theorem makes `B` finite over `S`. The two finite local maps `S→B` and `R→B` identify the same normalized `ω_B`. The supplied finite-map adjunctions then give the natural comparison

`RHom_R(M,ω_R) ≃ RHom_S(M,S[d])`.

It respects bidual evaluation and contravariant composition. Taking degree `-r` gives `M^∨≃Ext_S^(d-r)(M,S)`, and the calculation `d-r=l=b-a` identifies that Ext group with `H^b(C_∞†)`. The finite map is to `B`, not an assumed finite map to `R`. **Checks:** `S=R=k` gives ordinary dual; `S=O`, `R=M=k` gives `Ext_O^1(k,O)=k`, whereas ordinary Hom is zero; `R=S[[t]]` acting on `M=S` by `t=0` has `B=S`, so the comparison uses a finite quotient although `R/S` is not finite (this example checks the comparison without the additional full-dimension hypothesis). Source: the supplied finite-local normalization/adjunction together with IKM Lemma 10.7 and Theorem 11.3, pp. 47–48, 50–51. Needs: §§3.3, 3.8–3.9 and the exact normalized-duality supplier contract.

### 9.4 Spectral support and equivariant local blocks

For perfect `C` over Noetherian `S` and a commutative subalgebra `T⊆End_D(S)(C)`, §7.9 gives finite `T/S` and nilpotent cohomological kernel. Hence total cohomology has full `T`-support. Given `R↠T/I` with nilpotent `I`, define its **spectral R-support** through `Spec T≃Spec(T/I)↪Spec R`: it is `V(ker(R→T/I))`. Its API gives this formula, base-map compatibility, isomorphism transport and comparison with genuine module support when a compatible action lift exists. It supplies no fictitious `R`-module structure.

**Checks.**

- Zero `C` has zero action ring and empty spectral support.
- A scalar `S`-stalk has full spectral `S`-support.
- The quotient `S[ε]/ε²→S` changes the ring but preserves its spectrum; its nilpotent kernel cannot be detected by points.



For finite `T/S`, minimal `p∈Spec T` and `q=p∩S`, the isolated idempotent of `T_q≃T_p×B` gives the **generic derived block** `C_p`. The API supplies inclusion/projection with composites `id` and the specified idempotent, the corner `T_p`-action, cohomology `H^i(C)_p`, equivariance, and maps obtained by inclusion–map–projection. Identity and composition hold for equivariant maps; two splittings have a unique isomorphism respecting both structure maps. Generic cohomology has finite length over the Artinian local `T_p`.

**Checks.**

- For `S=T=k[ε]/ε²` and `C=S[0]`, the unique generic block is `C` itself, of cohomology length two over `T`; it is not the residue-field stalk. The Artinian local block ring need not be reduced.
- For a scalar domain, first extending to its fraction field gives the usual generic stalk.
- With `k×k` acting on `M₁⊕M₂`, the first block is `M₁`, and its projection kills `M₂`.

A general nonisolated prime does not give a direct summand before base localization.

For `f∈S`, scalar extension to `S/(f)` transports a derived `T`-action to one factoring through `T/fT`, even if `f` is a zerodivisor. If `f` is regular on `S`, it is represented by the scalar cone triangle `C --f→ C→C⊗ᴸS/(f)`. If `m∈Spec T` lies over `q∈Spec S` and `dim T_m/fT_m=0`, then `m` gives an isolated minimal/maximal factor in `T_q/fT_q`. Split that factor on the **derived coefficient reduction** over `S_q/(f)` to define its special block. Its cohomology is the localization at `m` of the reduced cohomology. Do not localize an unprovided strict `T`-module complex.

**Checks.**

- For `S=T=O`, `f=π` and `m=(π)`, the special block is `C⊗ᴸk` itself.
- For `S=O`, `T=O×O` acting on `C=C₁⊕C₂` and `f=π`, the block at `m=(π)×O` is `C₁⊗ᴸk`; its projection kills `C₂⊗ᴸk`.
- For `S=T=O[[x]]`, `f=π` and `m=(π,x)`, the quotient `T_m/(f)=k[[x]]` has dimension one, so the dimension-zero special-block construction does not apply.

Source: Allen et al., Lemma 6.3.3 and the following construction, pp. 1049–1050. Needs: §§7.7–7.9, native idempotent splitting comparison and derived action naturality.

### 9.5 Derived length across a divisor

Use GrothendieckEulerForms Layer 5's Euler characteristic with the finite `T`-lengths of cohomology. Its signed stalk and shift formulas, finite sums and compatible-triangle additivity are supplier contracts. The new comparison is with the generic and special action blocks just constructed. Only under finite-length hypotheses convert native extended length to integers. Nonzero Euler length implies nonempty support; the converse needs absence of cancellation. Test a field in degree one (Euler length `-1`), the zero complex, and the nonzero zero-differential field pair in degrees `0,1` (Euler length zero).

For an excellent local irreducible ring `B`, `f∈m_B` and `dim B/(f)=0`, prove `dim B≤1`. For finite `M`, both `M/fM` and `M[f]` have finite length. The **length defect** `δ_f(M)=length(M/fM)-length(M[f])` is additive in short exact sequences by the snake sequence and vanishes on finite-length modules. In dimension zero it is always zero. In dimension one, with unique generic `p`, normalize the domain `B/p` to a finite semilocal Dedekind ring `N`. The integer `c=length_B(N/fN)>0` is independent of `M`. Normalization changes a finite `B/p`-module by finite-length kernel and cokernel, and its finite torsion-free part is free over the semilocal normalization. Filter a general module by powers of `p` to obtain

`δ_f(M)=c·length_(B_p)(M_p)`.

**Checks.**

- For `B=O`, `f=π^s`, the coefficient is `s`, and finite-length modules contribute zero defect.
- For `B=O[ε]/ε²`, `f=π`, `c=1` but the generic length of `B_p` is two, so `δ_f(B)=2`.
- In dimension zero the kernel and cokernel lengths cancel even if `f=0`.
- The ring and module may be nonreduced; generic **length**, not rank over a falsely assumed field, is required.

Now let `S` be excellent local, `f∈m_S` regular on `S`, `T/S` finite, `m` maximal in `T`, `Spec T_m` irreducible and `dim T_m/(f)=0`. For bounded finite `S`-cohomology with a derived `T`-action, all reduced special-block cohomology lengths are finite. If `dim T_m=0`, its reduced Euler length is zero. If `dim T_m=1` with generic `p`, the same positive normalization coefficient gives

`χ_(T_m)((C⊗ᴸ_S S/(f))_m)=c·χ_(T_p)(C_p)`.

Use the regular scalar cone, equivariant smart truncation triangles and the module defect formula. Derived naturality makes every truncation action-compatible; a strict `T`-linear representative is unnecessary. Source: Allen et al., Lemmas 6.3.2 and 6.3.4 and proofs, pp. 1047–1050. Needs: §§7.9, 9.4, excellent finite normalization, finite-length additivity and the supplied Euler construction. Neither a multicomponent local spectrum nor an arbitrary nonregular divisor satisfies this statement's hypotheses.

### 9.6 Paired support transport

Set `S=Λ[[X₁,…,X_r]]` over a complete DVR, with augmentation `a`. Let `C,C'` be perfect `S`-complexes with a fixed isomorphism of derived reductions modulo `π`, and finite commutative derived action subalgebras `T,T'` having the same image there. Supply complete Noetherian local `S`-algebras `R,R'`, surjections onto `T/I,T'/I'` for nilpotent ideals, and an `S`-algebra isomorphism `R/π≃R'/π` agreeing on residual cohomology after quotient by `Ibar+I'bar`. Fix `q₀∈Z`, `l≥0`, and put `D=dim S-l≥1`. Require all of the following component and dimension inputs:

- `dim R=dim R'=D`, `dim R/π=dim R'/π=D-1`;
- every dimension-`D-1` generic of `R/π` lies on exactly one dimension-`D` component of `R`;
- `R'` has a unique dimension-`D` generic;
- every other generic component of `R,R',R/π` has dimension strictly less than `D-1`;
- for some characteristic-zero prime `p⊃a` with `dim S/p=1`, the derived fibre `C⊗ᴸκ(p)` is nonzero and has cohomology only in `[q₀,q₀+l]`.

Global Tor-amplitude in this interval is sufficient but is **not required** by the source: the seed is local. Over regular `S_p`, minimality gives that interval in terms. The support dimension bound through the finite action algebra and §9.2 force local concentration at its upper endpoint, producing one top generic with nonzero Euler length. Each top generic specializes to a dimension-`D-1` generic on the divisor. At that residual point the component hypotheses make the relevant local spectrum irreducible of dimension one. Apply §9.5 to carry nonzero Euler length to the divisor, across the common residual action image, up to the unique top component of `R'`, and back down and up to any other top component of `R`. Residual length comparison uses nilpotent filtrations for both error images; agreement after their sum is the required input, not equality of full residual deformation actions.

The coefficient-divisor comparison states that bounded finite projective complexes over a Noetherian ring with isomorphic derived reductions modulo `π` have equal cohomological supports intersected with `V(π)`. The termwise scalar extension of these projective representatives computes derived reduction, so this assertion requires neither a strict action nor regularity of `π`. It is the coefficient-support part of the paired comparison; transporting spectral deformation support still uses the action-image and component inputs above.

Conclude that the spectral `R`-support of `H*(C)` contains **every dimension-D component**. If `R` is equidimensional this is full support and `ker(R→T/I)⊆√0`; hence the reduced quotient map is an isomorphism. Lower-dimensional components are not included without another argument. The API retains the chosen generic/special primes, the divisor length comparisons and the nilpotent spectral homeomorphisms used on each leg.

**Checks.**

- A free stalk with scalar action gives the one-degree full-support case.
- A perfect object on one factor of `k[ε]/ε²×k` is supported on that factor only; over the local ring `k[[x,y]]/(xy)`, the perfect `x`-disk has both cohomology modules supported on `V(x)` only.
- These defeat a conclusion from perfectness or MCM alone.
- If the auxiliary ring has two unrelated top components, the stated bridge is absent.
- Equal residue dimensions without the action-image comparison do not identify localized Euler lengths.
- The nonzero seed excludes the zero paired system.
- For the coefficient-divisor comparison, an identity pair gives equality on the whole divisor, and `π=0` gives equality of the original supports. If `π` is a unit, both intersections are empty; no generic-support equality follows from that comparison.
- Strict lower-component bounds cannot be weakened to equality at `D-1` in this proof.

Source: Allen et al., §6.3.5, Assumption 6.3.6, Lemma 6.3.7 and Proposition 6.3.8, pp. 1050–1052. Needs: §§6.4–6.7, 8.5, 9.1–9.2, 9.4–9.5. These hypotheses are checked in arithmetic applications; the roadmap supplies no Taylor–Wiles-prime construction or Ihara-avoidance assertion by itself.

### 9.7 Survival at a local-condition point

In §9.6, let `x` lie on a top-dimensional component and `y=x∩S`. Then `x` remains in the spectral support of the localized derived specialization `(C⊗ᴸ_S S/y)_y`. For coheight-one `y` with `π∉y`, this is equivalent to the corresponding statement after inverting `π`: the one-dimensional local domain `S/y` becomes its fraction field after this inversion. The condition `π∉y` says that `y` belongs to the `π`-generic fibre. Characteristic zero of `κ(y)` implies it in mixed characteristic `(0,p)` with `p>0`, but not in equal characteristic zero. Localize the finite action algebra at `y`, then use the largest degree surviving at `x`. The right-edge coefficient comparison gives its quotient by `y`, nonzero by Nakayama. Higher degrees vanish **after the action localization**; lower degrees can retain Tor. Prove naturality of this edge for arbitrary derived endomorphisms through the t-structure and derived coefficient functor, so it is equivariant for the finite derived action. A strict chain lift of the entire action is unnecessary. The induced quotient action and spectral comparison identify the resulting point with `x`.

**Checks.**

- A free rank-positive stalk survives every coefficient point.
- Take `O=Λ=ℚ[[π]]`, `S=R=R'=O[[X]]`, `T=T'=S`, `C=C'=S[0]`, `I=I'=0`, `a=(X)` and `q₀=l=0`, so `D=2`, with identity residual comparisons. The domains `S` and `S/π=ℚ[[X]]` satisfy §9.6's component bounds, and `p=(X)` is a nonzero degree-zero seed with residue `ℚ((π))`. At `x=y=(π)`, the localized specialization is `ℚ((X))[0]≠0`, with characteristic-zero residue field; inverting `π` kills it. This point lies on the special fibre.
- The `x`-disk over `O[[x]]` survives its derived augmentation with two nonzero degrees, so survival does not mean concentration.
- A rationally acyclic `π`-disk cannot supply the characteristic-zero seed.
- If two balanced systems have already concentrated at degree `b`, their residual comparison gives `M/π≃M'/π` at the top; degree `b-1` can be `M[π]`.
- Module near-faithfulness transfer therefore still requires the regularity and component hypotheses of Layer 6.

Source: Allen et al., Corollary 6.3.9 and proof, pp. 1052–1053; Calegari–Geraghty, Proposition 6.6 for the one-module comparison. Needs: §§7.10, 9.4–9.6 and derived naturality of the localized right edge. This completes the support conclusion without discarding integral torsion or inventing an action on a single specialized module.

### Examples

A free rank-positive stalk tests ordinary Taylor–Wiles patching. The `x`-disk tests the balanced width-one case, canonical dual shift and derived augmentation. The `π`-disk tests integral torsion invisible rationally. The reducible local `x`-disk tests component support, and `S/(x)⊕k` tests the strict codimension inequality. The nonreduced normalization example tests length rather than generic field rank. Together they distinguish all major conclusion boundaries.

### Dependencies

Layers 3, 6, 7 and 8; native module support, local cohomology, finite integral dimension and homotopies; SchemeAndStackFoundations' depth and excellence and PadicLocalLanglandsForGL2Qp §0.5's affine module cycles as used in §6.7; GrothendieckEulerForms' Euler characteristic; the enhanced-derived and idempotent-completion suppliers. Completed cohomology, deformation conditions and arithmetic comparison theorems import these results and provide the stated data, rather than supplying hidden prerequisites here.

## Downstream consumers

The arithmetic interface for `LocalGaloisDeformationRings` §F.0.1 specializes §§1.12 and 4.6; §F.0.2 specializes §§1.9 and 2.1–2.5; §§F.2.3–F.2.4 import PadicLocalLanglandsForGL2Qp §0.4's representing pair and use §2.7 only for its identification with the matrix presentation wherever both finiteness hypotheses hold; §0.1's ungraded canonical-module/type interface specializes §3.9. Completed products retain the joint-completion carrier and inclusions; presentations retain their chosen evaluation maps and relation spaces; framed rings are PadicLocalLanglandsForGL2Qp §0.4's representing pair; canonical modules use the Ext comparison. Arithmetic tangent/obstruction assignments, local conditions and graded canonical-module comparisons are separate targets there. `GlobalGaloisDeformations` uses the generic coefficient/presentation interface with its arithmetic finite-level data. These application interfaces supply no prerequisites to this roadmap.

`LocalGaloisDeformationRings` and `GlobalGaloisDeformations` use §1.8's local nonzero truncations, coefficient morphisms and `mem_iff_forall_truncate`, with the inverse-limit closure of their own deformation problems. `GlobalGaloisDeformations`, `OrdinaryAutomorphicFormsAndModularityLifting` and `GL2ModularityLifting` can apply §5.6's `patching_surjection_iso` when their arithmetic inputs provide its independent finite-level free modules and equal variable counts. They supply the map `R↠T`, its action on `M` and the finite-level data; the abstract criterion supplies the isomorphism, freeness and complete-intersection conclusion.

The common interface for `PadicFamilies` §0a.0 uses §7.3's `IsMinimal` on native complexes and its chosen finite-free retracts; §7.5's `CompleteFlatComplex`, completed direct sum, `completeFlatBasis`, `completeFlatMatrix` and minimal retracts; and §7.8's `finiteDerivedHomCompletion` preserving identity and composition. Application names for these predicates and comparisons are aliases or specializations of this package. A decreasing open-ideal tower cofinal with maximal-ideal powers uses the supplied cofinal-limit comparison to transport §7.8's equivalence, retaining the coefficient projections. Compatible perfect-system effectivity and based models use `DerivedModuleAlgebra` §§1.E.0–1.E.1; applying §7.3 to choose minimal representatives and retaining their given reduction identifications is the extra minimal-model comparison. Ordinary projectors, operator-equivariant comparisons and their coherent coefficient-tower diagrams are application targets.

Arithmetic patching applications supply the complexes, dimension bounds, component calculations, residual comparisons and characteristic-zero seed. Freeness and support results here apply with those data; they do not assert an automorphy lifting theorem by themselves.

## References

Page numbers below refer to the versions specified here. Stacks tags are the stable locators; its PDF chapter page numbers can change. An elementary adapter proved from native operations is identified as such beside its statement. The proof prerequisites isolated in the layers are not attributed to a stronger result than the cited text supplies.

- Sylvy Anscombe and Franziska Jahnke, [*The model theory of Cohen rings*](https://www.numdam.org/item/10.5802/cml.84.pdf), *Confluentes Mathematici* 14 (2022), no. 2, pp. 1–28, Theorem 4.1 and Corollary 6.5.

- G. Böckle and A.-K. Juschka, [*Equidimensionality of universal pseudodeformation rings in characteristic p for absolute Galois groups of p-adic fields*](https://doi.org/10.1017/fms.2023.82), Forum Math. Sigma 11 (2023), e102, Corollary 3.3.4 and Lemma 3.3.5, pp. 17–19.
- The Stacks Project, [Formal deformation theory](https://stacks.math.columbia.edu/download/formal-defos.pdf), [Commutative algebra](https://stacks.math.columbia.edu/download/algebra.pdf), [More on Algebra](https://stacks.math.columbia.edu/download/more-algebra.pdf), [Dualizing Complexes](https://stacks.math.columbia.edu/download/dualizing.pdf), [Local Cohomology](https://stacks.math.columbia.edu/download/local-cohomology.pdf), [Divided Power Algebra](https://stacks.math.columbia.edu/download/dpa.pdf) and [Homology](https://stacks.math.columbia.edu/download/homology.pdf). Individual sections, lemmas and tags are given in the layers.
- M. Schlessinger, *Functors of Artin rings*, Trans. Amer. Math. Soc. 130 (1968), 208–222, especially §§1–2 and Theorem 2.11.
- T. Gee, [*Modularity lifting theorems*](https://arxiv.org/pdf/2202.05818v2), 2022 author version, §3; PDF pagination.
- C. Khare and J.-P. Wintenberger, [*Serre's modularity conjecture (II)*](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), author copy dated 30 May 2009, 98 pages. All citations use this copy's pages and numbering: §§2.1–2.3, Lemmas 4.4 and 4.6, Corollary 4.7, and §9.
- M. Kisin, [*Lectures on deformations of Galois representations*, Lecture 1](https://people.math.harvard.edu/~kisin/notes/notes.pdf), pp. 1–4; and [*Moduli of finite flat group schemes, and modularity*](https://annals.math.princeton.edu/wp-content/uploads/annals-v170-n3-p03-p.pdf), Ann. of Math. 170 (2009), 1085–1180, especially Proposition 3.3.1 and Lemma 3.3.4.
- F. Calegari and D. Geraghty, [*Modularity lifting beyond the Taylor–Wiles method*](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), Invent. Math. 211 (2018), 297–433. Citations marked PDF use the 137-page author journal-layout copy; the first printed page is 297. See also their [correction](https://doi.org/10.1007/s00222-021-01095-5), Invent. Math. 227 (2022), 855–856, whose completed-group-algebra and power-series corrections are incorporated in §8.6. The initial-form condition in §3.13 is stated explicitly.
- R. Taylor, [*Automorphy for some l-adic lifts of automorphic mod l Galois representations. II*](https://www.numdam.org/article/PMIHES_2008__108__183_0.pdf), Publ. Math. IHÉS 108 (2008), 183–239, Definition 2.1 and Theorem 4.1.
- J. Newton and J. Thorne, [*Adjoint Selmer groups of automorphic Galois representations of unitary type*](https://arxiv.org/abs/1912.11265), arXiv:1912.11265v3 (2023), Lemmas 4.16–4.17, Proposition 4.18, Lemma 4.19 and Remark 4.20, author pp. 34–36.
- J. Thorne, [*Automorphy lifting for residually reducible l-adic Galois representations*](https://www.dpmms.cam.ac.uk/~jat58/reducible_lifting.pdf), author copy, §1, pp. 5–9. For the finite connectedness convention, §6.6 instead uses Stacks Lemma 52.14.1, tag 0ECR.
- G. Boxer, F. Calegari, T. Gee and V. Pilloni, [*Abelian surfaces over totally real fields are potentially modular*](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Publ. Math. IHÉS 134 (2021), 153–501, §§7.8, 7.11–7.12. The duality locators marked author PDF use [arXiv:1812.09269v3](https://arxiv.org/pdf/1812.09269v3), pp. 213–214; published component locators use pp. 425–430.
- G. Boxer, F. Calegari, T. Gee and V. Pilloni, [*Modularity theorems for abelian surfaces*](https://arxiv.org/pdf/2502.20645v1), arXiv:2502.20645v1 (2025), §7, especially pp. 160–165 and 172.
- G. Boxer and V. Pilloni, [*Higher Hida theory for Siegel modular forms*](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), author version dated 5 November 2025, §§2.3 and 2.6, pp. 17, 21–22. The date and pages here specify the author version, independently of its later publication.
- V. Pilloni, [*Higher coherent cohomology and p-adic modular forms of singular weight*](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), author copy dated 17 June 2019, published Duke Math. J. 169 (2020). Citations use author pages, especially §§2.2–2.3, pp. 8–11, and §10, pp. 57–60.
- S. Iyengar, C. Khare and J. Manning, [*Congruence modules and the Wiles–Lenstra–Diamond numerical criterion in higher codimensions*](https://arxiv.org/pdf/2206.08212v3), arXiv:2206.08212v3 (2024), §§2–4, 7, 9–11; Theorem 10.6, Lemmas 10.7–10.8 and Theorem 11.3 use PDF pp. 43–51.
- C. Khare and J. Thorne, [*Potential automorphy and the Leopoldt conjecture*](https://www.dpmms.cam.ac.uk/~jat58/taylor-wiles-hida-leopoldt.pdf), author copy, §2, especially Lemmas 2.13–2.14, pp. 11–12.
- T. Gee and J. Newton, [*Patching and the completed homology of locally symmetric spaces*](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf), author copy, §2.2, pp. 12–13.
- P. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R. Taylor and J. Thorne, [*Potential automorphy over CM fields*](https://annals.math.princeton.edu/2023/197-3/p02), Ann. of Math. 197 (2023), 897–1113. Citations use published pagination, especially §§6.3–6.4, pp. 1047–1061.
- G. Böckle, S. Iyengar and V. Paškūnas, [*On local Galois deformation rings*](https://arxiv.org/pdf/2110.01638v2), arXiv:2110.01638v2, especially Lemmas 3.35–3.37 and 6.3. PDF and published page locators are distinguished in Layer 4.
- V. Paškūnas and J. Quast, [*On local Galois deformation rings: generalised reductive groups*](https://doi.org/10.1017/fmp.2026.10030), Forum Math. Pi (2026); numbered lemmas and article pages as cited in Layers 1, 3 and 4.
- D. Le, B. V. Le Hung, B. Levin and S. Morra, [*Serre weights and Breuil's lattice conjecture in dimension three*](https://math.rice.edu/~bl70/LLHLMlattices.pdf), author copy, §§3.5–3.6 and 5, pp. 39, 69–71, 119–126.
- M. Emerton and T. Gee, [*A geometric perspective on the Breuil–Mézard conjecture*](https://arxiv.org/pdf/1109.4226v3), arXiv:1109.4226v3, §2.2, pp. 6–9.
- A. Grothendieck and J. Dieudonné, [*Éléments de géométrie algébrique IV*, deuxième partie](https://www.numdam.org/item/PMIHES_1965__24__5_0/), Publ. Math. IHÉS 24 (1965), §§5.7; and [troisième partie](https://www.numdam.org/item/PMIHES_1966__28__5_0/), Publ. Math. IHÉS 28 (1966), §11.3.
- A. Grothendieck, *Cohomologie locale des faisceaux cohérents et théorèmes de Lefschetz locaux et globaux*, SGA 2, new edition by Y. Laszlo, Exposé XI, Theorem 3.13(ii), new-edition p. 105, old p. 132, and Lemma 3.15, new-edition p. 106, old p. 133.
- M. Hochster, [*Local cohomology*](https://sites.lsa.umich.edu/hochster/wp-content/uploads/sites/1337/2024/10/615W2011.LocCoh.pdf), 2011 lecture notes, pp. 7–8, 19, 40–41; and [*Commutative algebra*](https://sites.lsa.umich.edu/hochster/wp-content/uploads/sites/1337/2024/10/615W12.pdf), 2012 lecture notes, April 17–18, pp. 165–169.
- C. Huneke, notes by A. Banerjee, A. De Stefani and B. Stone, [*Commutative algebra III*](https://home.adelphi.edu/~bstone/commalg-notes/commalg-3/algebra-notes-iii.pdf), §§1.2–2 and the numbered multiplicity results cited in §§3.11–3.13. Theorem 16's displayed proof is the equal-characteristic proof used here.
- L. Avramov and S. Iyengar, [*Bass numbers over local rings via stable cohomology*](https://arxiv.org/pdf/1208.4458v1), arXiv:1208.4458v1, Theorems 2.1 and 2.4, pp. 2–4.
- L. Avramov and O. Veliche, [*Stable cohomology over local rings*](https://arxiv.org/pdf/math/0508021v3), arXiv:math/0508021v3, §§1.3–2.1, pp. 4–7, and §5.1, pp. 15–16, especially Lemma 5.1.7 and Theorem 5.1.8 with its proof.
- L. Avramov, *Infinite free resolutions*, printed pp. 56–63 and 95–99; Construction 6.3.1, Lemma 6.3.3, Theorems 6.3.5, 7.1.3 and 10.2.1. The odd-square addition rule in Remark 10.1.2(3) uses plus signs.
- M. Nagata, *The theory of multiplicity in general local rings*, *Proceedings of the International Symposium on Algebraic Number Theory, Tokyo & Nikko, 1955* (1956), pp. 191–226, especially Lemmas 5.3–5.4, Theorem 1 and Proposition 5, pp. 204–205; Lemmas 8.1–8.2 and Theorem 6 with proof, pp. 214–216; Theorem 9 and Corollary 1, pp. 219–220.
- Y. André, [*La conjecture du facteur direct*](https://www.numdam.org/item/10.1007/s10240-017-0097-9.pdf), Publ. Math. IHÉS 127 (2018), 71–93, §0.1 and §3.4, pp. 72, 84.
- B. Bhatt, [*On the direct summand conjecture and its derived variant*](https://arxiv.org/pdf/1608.08882v2), arXiv:1608.08882v2, Lemma 5.3, pp. 9–10.
- B. Bhatt, L. Ma, Z. Patakfalvi, K. Schwede, K. Tucker, J. Waldron and J. Witaszek, [*Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic*](https://arxiv.org/pdf/2012.15801v3), arXiv:2012.15801v3, §2.1, pp. 10–11.
- D. Clausen, A. Mathew and M. Morrow, [*K-theory and topological cyclic homology of henselian pairs*](https://arxiv.org/pdf/1803.10897v2), arXiv:1803.10897v2, Definition 5.1 and Example 6.7, pp. 38, 53; B. Bhatt and A. Mathew, [*Syntomic complexes and p-adic étale Tate twists*](https://arxiv.org/pdf/2202.04818v2), arXiv:2202.04818v2, §4.4, pp. 20–21.
- *Frobenius Singularities*, Chapter 1, §1, Proposition 1.21(b), for complete Noetherian local rings with F-finite residue.
- L. W. Christensen and S. B. Iyengar, [*Dimension of finite free complexes over commutative Noetherian rings*](https://www.math.ttu.edu/~lchriste/download/codim.pdf), author copy dated 9 September 2020, published Contemp. Math. 773 (2021), 11–17; citations use author pp. 2–5.
