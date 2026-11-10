# Roadmap: foundations of adic spaces, part V — rigid-analytic Zariski geometry, classical points and resolution

**Summary.** Extend AdicSpacesPartII from affinoid spaces, analytification and morphisms to the Zariski geometry of rigid spaces over a complete rank-one nonarchimedean field. Construct finite normalization and global irreducible components, compare nowhere density with dimension drop, develop regular and smooth loci and finite smooth stratifications, and characterize weakly Shilov points by their secondary residue fields. The end theorems are Gauss-point closure of rational polydisc points over infinite residue fields, functorial rigid resolution in characteristic zero, connectedness of the resolution of an irreducible space, analytic manifolds of rational points, the analytic constant-rank normal form and detection of analytic identities on a subfield, both in coordinates and on G(C). These results supply general geometric inputs to bi-analytic Ax–Lindemann arguments (HK2, §§9.2–9.3, pp. 56–60); the Hodge-theoretic theorem is a consumer. [Suggested.lean](Suggested.lean) states the headline theorems expressible on the pinned native carriers (`gaussPoint_mem_closure_rationalPoints` with its predicate `IsUnitGaussPoint`, `analytic_constantRank` and `analytic_germ_eq_zero_of_subfield`); it is not the roadmap.

## Scope and ownership

This is part V of the adic-spaces series. [AdicSpacesPartII](../AdicSpacesPartII/README.md) stops with its R0–R1: affinoid geometry, morphisms, analytification, local-ring comparisons and the normal connected identity principle. This part continues from there. It owns coherent Zariski subsets and their reduced structures, local dimension at adic points, proper images, regularity of restriction, global normalization and components, bounded Riemann extension, regular/smooth loci and strata, finite-extension point classes, rational-point topology, Gauss-point closure, canonical-reduction specialization, Shilov and weakly Shilov geometry, rigid blow-ups and resolution, and the rational-point analytic atlas and constant-rank applications.

The following objects retain their existing owners. Their interfaces are consumed with the exact generality in the supplier contracts.

- Mathlib owns topological connected components, analytic functions and power series, the strict inverse-function theorem and analytic inversion of open partial homeomorphisms, the analytic Lie-group structure on the units of a complete normed algebra, matrix rank and minors, Baire spaces, algebraic spectra and Krull dimension. Layer 1 proves that native connected components of a rigid space are open and coherently Zariski closed; it does not define another topological connected-component quotient. Layer 6 consumes the inverse theorem and proves the constant-rank normal form.
- Tau Ceti owns power-bounded and topologically nilpotent elements, restricted series, adic spectra, evaluation points of polydiscs and the one-variable centred Gauss valuation. Layer 3 extends their geometry to rational-point topology and several-variable Gauss closure, and does not reconstruct the supplied one-variable valuation. Tau Ceti also owns regular ring maps, geometric regularity, the regular locus and G-rings (namespace `TauCeti.Excellence`), descent of regularity along flat local maps and its ascent when the closed fibre is a field, and the evaluation topology on points of affine and general schemes. Layers 0, 2 and 6 use these without restating them.
- AdicEtaleGeometry A2.6 owns global adic dimension as topological Krull dimension and its classical-point local-ring criterion for pure dimension. Layer 0 defines local dimension at adic points and compares its supremum with that global dimension on rigid spaces.
- RigidAnalyticGeometry §§1.1–1.3, 2.1–2.2 and Layers 3–4 own affinoid algebras, maximal residue fields, all-characteristic excellence, canonical reduction (§2.3), affinoid domains and their algebra. Its §§6.2, 8.1–8.3 own the rigid carrier, classical-point construction and density, analytification and component comparisons, and the Tate–Huber equivalence. Classical points and their density, canonical reduction and the component comparison are supplier results, not separate construction targets here. The normalization in Layer 1 is the global finite normalization of a rigid space, beyond algebraic affinoid normalization.
- The coherent and formal interfaces of AdicSpacesPartIII R3.1–R3.3, R3.6 and R2.2–R2.5 are supplied through the classical coherent and proper-cohomology contracts of RigidAnalyticGeometry §§7.3–7.4 and the formal-model contract below. No second coherent-sheaf, Kiehl-cohomology, formal-scheme or Raynaud library is specified here. AdicSpacesPartIII R3.9 owns the Banach-ring Gel'fand spectrum, its pointwise topology and spectral maximum formula. Layer 4 adds the comparison from rank-one adic points and the affinoid Shilov boundary characterization.
- SchemeAndStackFoundations §0.21 owns J-2, quasi-excellent and excellent rings and the permanence theorems for Tau Ceti's regular ring maps. Its §0.8 owns étale local coordinates for smooth schemes; its §§0.3, 4.11 own relative Proj and modifications; StableReduction Layer 4 owns scheme blow-ups. ResolutionOfSingularitiesCharacteristicZero §§7.1, 7.5–7.8 owns the scheme-level functorial desingularization inputs. Layer 5 owns global functorial rigid resolution over every characteristic-zero K, including rigid analytification, gluing and marked rigid hypersequences; it does not redevelop the scheme resolution invariant or its algebraization proof. DiamondsAndVStacks D6.9 proves, for a reduced K-affinoid algebra over a complete field K ⊇ ℚ_p, that the relative analytification of the algebraic resolution is a proper surjection from a smooth space which is an isomorphism over the smooth locus. Layer 5 is the global, functorial version, and differs in allowing every complete characteristic-zero K, including equal characteristic zero such as ℂ((t)); its affinoid step agrees with D6.9's over K ⊇ ℚ_p.
- ReductiveGroups Layer 3 owns represented fppf homogeneous quotients. The smooth-quotient input is made exact below. ReductiveGroupsPartII RG2.0 *smooth-group-analytic-charts* owns the analytic manifold structure on G(K) for a smooth affine group G over a nondiscrete locally compact field K of characteristic zero. §6.4 differs in allowing every complete nontrivially normed field of characteristic zero (such as ℂ_p, which is not locally compact) and every smooth finite-type group, and in comparing the charts across complete isometric field extensions; on locally compact fields its atlas is compatible with RG2.0's. The rigid rational-point atlas, submersion and open-orbit applications are Layer 6's.
- LieGroupoidsPoisson G0.1 owns the real smooth constant-rank theorem on possibly non-Hausdorff manifolds, and AbelianSchemesAndArithmeticModuliPartII B2.10 its finite-Cᵏ and real-analytic extensions. §6.1 differs in being the analytic normal form over every complete nontrivially normed field of characteristic zero; for F = ℝ it is B2.10's real-analytic case. The subfield coefficient-recovery theorem of §6.6 belongs to this roadmap.
- AdicSpacesPartII R1.9 supplies the identity principle and irreducibility of connected normal rigid spaces. §1.4 defines global irreducible components through normalization and checks that a connected normal space is irreducible in that sense.

Finite-extension point classes are defined here on rigid spaces, and on arbitrary field-valued functors on finite extensions. Their interpretation as rigid analytic points of a diamond, invariance of diamondification under reduction and the v-cover consequence of a resolution are downstream comparisons. No diamond or perfectoid foundation is a prerequisite of these rigid constructions. Downstream consumers identifies the diamond comparisons that can use these results.

The scope excludes positive-characteristic resolution, embedded rigid resolution, base change of global irreducible components, generic flatness or generic smoothness for arbitrary maps, and the six-functor formalism. These are separate theories. Perfectness, characteristic zero, quasi-separatedness, finite dimension and separation are imposed only at the statements that use them.

## Conventions

K is a field complete for a nontrivial rank-one nonarchimedean absolute value. Write K°, K°° and K̃ for its valuation ring, maximal ideal and residue field. A complete extension is equipped with an isometric embedding. A rigid K-space is an adic space locally of finite type over Spa(K, K°): an object of Tau Ceti's `TauCeti.AdicSpace` whose structure morphism to Spa(K, K°) satisfies `TauCeti.PreAdicSpace.LocallyOfFiniteType`. Global Tate comparisons use quasi-separated objects; chartwise constructions glue on general rigid spaces. Universes are fixed for fields, spaces and their sheaves, and may be enlarged for finite extensions and indexing sets. No countability or second-countability condition on a space is implicit.

A point's analytic residue field is k(x); its completed valued residue field is H(x). At classical points k(x)/K is finite and complete, so k(x) = H(x). The secondary residue field H(x)̃ is the residue field of the rank-one valuation ring in H(x), not k(x) itself. On a Gauss point it is K̃(T₁,…,Tₙ), whereas H(x) is the completed fraction field of the Tate algebra. Rank one is retained wherever secondary-residue transcendence or Shilov points are used.

Local dimensions at points are natural numbers, with the convention in §0.2. Write dim X = topologicalKrullDim |X|, as in AdicEtaleGeometry A2.6; it lies in the ordered set {−∞} ∪ ℕ ∪ {∞}, with dim ∅ = ⊥ = −∞. Section 0.2 proves that on a nonempty rigid affinoid this equals the finite Krull dimension of its coordinate ring, and that unbounded-dimensional disjoint unions have dimension ∞. An irreducible space has a single finite dimension. Connected and irreducible include nonemptiness. A Zariski subset is always given its reduced structure when its dimension is taken; nilpotents remain in the ambient ring and its sheaves. Normality is local integrally closed domain normality; it is not geometric normality.

Rational domains use |fᵢ| ≤ |g| with |g| ≠ 0. Spectra reverse ring maps. For φ : A → B the specialization square is sp_A ∘ Spa(φ) = Spec(φ̃) ∘ sp_B. At T = a on the disc the reduction is (T − ā); at the Gauss point it is (0). The Gauss normalization is |Σ a_αT^α| = max |a_α|, so |π + T| = 1 at the unit Gauss point and |π + T| = |π| at T = 0 for 0 < |π| < 1. No division by a zero Gauss norm is permitted: the denominator of a rational neighbourhood is nonzero at its point.

The tangent map goes from source tangent space to the scalar-extended target tangent space. For T ↦ T² it is multiplication by 2a at a. The constant-rank normal form keeps the first k coordinates and makes the other target coordinates zero; at rank 1, (x,y) ↦ (x,0) fixes the convention. An empty blow-up stage means empty centre, hence unit ideal and identity map; blowing up the zero ideal has empty total space. A nonempty Cartier centre is not an empty stage. These conventions recur in the Checks of the layers that use them.

## Exact supplier contracts

### From Mathlib

Use the native declarations below at the pins. These are mathematical interfaces rather than imported roadmap prototypes.

- `Ideal.radical`, `minimalPrimes`, `PrimeSpectrum`, `MaximalSpectrum`, `ringKrullDim`, `IsLocalRing`, `IsRegularLocalRing`, `IsIntegrallyClosed`, `Module.Flat` and `Algebra.trdeg`: ideal, spectrum, local-algebra and cardinal-valued transcendence-degree vocabulary. The finite dimensions in the comparisons are explicitly coerced into cardinals. Module finite rank is used only on finite-dimensional fibres.
- `ConnectedComponents`, `IsPreconnected` and `IsConnected`: native topological components and nonempty connectedness. The empty set is preconnected and is not connected.
- `AnalyticAt`, `AnalyticOnNhd`, `HasFPowerSeriesOnBall`, `OpenPartialHomeomorph`, `ChartedSpace`, `IsManifold`, `fderiv`, `mfderiv`, `ContMDiffAt`, `ContMDiffOn` and `Module.finrank`: analytic and differential carriers. `IsManifold` imposes analytic chart compatibility; Hausdorffness and second countability are separate properties. `Matrix.rank` and `Matrix.det` supply field-valued minor calculations.
- The instances `IsManifold 𝓘(𝕜, R) n Rˣ` and `LieGroup 𝓘(𝕜, R) n Rˣ` in namespace `Units`, Mathlib/Geometry/Manifold/Instances/UnitsOfNormedAlgebra.lean, for a complete normed ring `R` that is a normed algebra over a nontrivially normed field `𝕜` and every smoothness exponent `n`, including `ω`: the chart at every point is the inclusion `Rˣ → R`. For `R` the `n × n` matrices over a complete F, with the operator norm `Matrix.linftyOpNormedRing` and `Matrix.linftyOpNormedAlgebra` (Mathlib/Analysis/Matrix/Normed.lean), this is an analytic Lie-group atlas on `GL_n(F)`; all norms on this finite-dimensional space give the same atlas, and §6.4's atlas on `GL_n(F)` is compatible with it.
- `AnalyticAt.hasStrictFDerivAt` in Mathlib/Analysis/Calculus/FDeriv/Analytic.lean, `HasStrictFDerivAt.toOpenPartialHomeomorph` in Mathlib/Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean, and `OpenPartialHomeomorph.hasFPowerSeriesAt_symm` in Mathlib/Analysis/Analytic/Inverse.lean supply analytic local inversion. Over a complete nontrivially normed field, an analytic map between finite-dimensional normed spaces with invertible derivative at a has inverse analytic on smaller open neighbourhoods. Apply the same assertion in manifold charts. The coefficient-radius statement is Schneider, Proposition 5.9, p. 33 (uncertified); local existence and analytic inversion use the native theorems.
- `Manifold.IsSubmersionAt` in Mathlib/Geometry/Manifold/Submersion.lean and `Manifold.IsImmersionAt` in Mathlib/Geometry/Manifold/Immersion.lean provide the chart projection and chart inclusion predicates. §6.1 deduces them from constant rank: rank n near a gives `Manifold.IsSubmersionAt` at a, and rank m near a gives `Manifold.IsImmersionAt` at a.
- `MvPowerSeries.gaussNorm`, `MvPolynomial.funext`, and the complete-metric `BaireSpace` instance supply coefficient suprema, polynomial uniqueness over an infinite field and Baire's theorem. The supremum is used on restricted series, whose weighted coefficients are bounded.

**Checks for the imported analytic inversion contract.**

- Over ℚ_p, T + T² has derivative 1 at 0. Its formal inverse starts T − T² + 2T³ and converges for |T| < 1; this pins the inverse branch at 0.
- Tᵖ on ℚ_p has derivative 0 at 0, so the inverse theorem gives no analytic inverse there; its inverse cannot have a nonzero linear term.
- On dimension-zero model spaces the unique map has the unique invertible linear map and inverse. This separates invertibility from a demand for positive dimension.

### From Tau Ceti

Use `TauCeti.Huber.powerBoundedSubring`, `TauCeti.Huber.topologicallyNilpotentIdeal` and `TauCeti.Huber.IsPowerBounded` from TauCeti/RingTheory/Huber/PowerBounded.lean. Power boundedness means boundedness of the powers, and the nilpotent ideal is an ideal in the power-bounded subring. It does not impose reducedness. Use the native weighted restricted-series carrier and its coefficient coercion from TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Basic.lean.

`TauCeti.ValuationSpectrum.spa`, `TauCeti.ValuationSpectrum.closedPolydisc`, `TauCeti.ValuationSpectrum.classicalPoint` and `TauCeti.ValuationSpectrum.classicalPoint_vle` are in the spectrum and polydisc modules, in particular TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Basic.lean. The polydisc is a subset of the valuation spectrum on the actual restricted-series ring; it does not supply a global rigid-space category. Evaluation requires complete Hausdorff coefficients and power-bounded coordinate values. Its normed-field specialization is the ordinary unit polydisc.

`TauCeti.ValuationSpectrum.classicalPoint_injective_of_isField` in TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Basic.lean supplies injectivity of evaluation points over a field. `MvPowerSeries.IsRestricted.gaussNorm_mul` in TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean supplies multiplicativity at positive polyradii. `TauCeti.Huber.restrictedMvPowerSeriesGaussEquiv` in TauCeti/RingTheory/Huber/Restricted/GaussNorm.lean identifies the unit-weight Huber series ring with the Gauss-normed restricted-series ring; it preserves the underlying series. Layer 3 consumes these when specifying the several-variable Gauss point.

`TauCeti.ValuationSpectrum.gaussPoint` in TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/GaussPoint.lean supplies the centred one-variable point at each 0 < r ≤ 1, its Gauss comparison, support and distinction from evaluation points. The several-variable closure theorem below uses the native finite-variable carrier and its coefficient Gauss norm. No one-variable replacement for the all-dimensional closure assertion is used.

Tau Ceti implements part of the affinoid and adic floor that RigidAnalyticGeometry and AdicSpacesPartII specify: `TauCeti.IsAffinoidAlgebra` (TauCeti/RingTheory/Affinoid/Basic.lean, a quotient of a finite-variable Tate algebra, with no norm chosen; it includes the zero algebra) with its Krull dimension, Noether normalization, supremum seminorm and canonical reduction under TauCeti/RingTheory/Affinoid/, and Wedhorn's category `TauCeti.AdicSpace` of sheafy locally affinoid pre-adic spaces (TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean) with morphisms locally of finite type, `TauCeti.PreAdicSpace.LocallyOfFiniteType` (TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/LocallyOfFiniteType/Basic.lean). These are the carriers behind the supplier contracts below.

Regularity is Tau Ceti's, in namespace `TauCeti.Excellence` under TauCeti/RingTheory/RegularLocalRing/: `TauCeti.Excellence.RegularAlgebraMap` (flat with geometrically regular fibres, RegularAlgebraMap.lean), `TauCeti.Excellence.GeometricallyRegular` (GeometricallyRegular.lean), `TauCeti.Excellence.regularLocus` (the primes with regular localization, Locus.lean; it need not be open) and `TauCeti.Excellence.IsGRing` (GRing.lean). Every "regular ring map" below is a `RegularAlgebraMap`. Two transfer theorems along flat local maps are supplied there as well. `TauCeti.IsRegularLocalRing.of_flat_of_isLocalHom` (Descent.lean): if `R → S` is a flat local homomorphism of local rings and `S` is regular, then `R` is regular, with no noetherian hypothesis on `R`. `TauCeti.isRegularLocalRing_iff_of_flat_of_map_maximalIdeal_eq` (Flat.lean): if `R → S` is a flat homomorphism of noetherian local rings with `m_R S = m_S`, so that the closed fibre is a field, then `S` is regular iff `R` is. Completion of a noetherian local ring and the local maps between corresponding classical points of an affinoid and an affinoid subdomain have this property.

The evaluation topology on points is Tau Ceti's: `TauCeti.PointTopology.topology` (TauCeti/Topology/Algebra/PointTopology/Basic.lean) on the points `A →ₐ[k] R` of an affine scheme, the coarsest topology making every coordinate evaluation continuous, and `TauCeti.SchemePointTopology.topology` (TauCeti/Topology/Algebra/PointTopology/Scheme.lean) on the `R`-points of a scheme over `Spec k`, the final topology for the affine charts, which agrees with the former on affine schemes. Neither asserts that the charts are open embeddings; for a complete nontrivially normed field `R`, whose units are open with continuous inversion, §6.4 proves this.

### From TauCetiRoadmap.RigidAnalyticGeometry

Consume [RigidAnalyticGeometry §§1.1–1.3](../RigidAnalyticGeometry/README.md#layer-1-affinoid-algebras-and-their-topology) for affinoid quotients, finiteness of maximal residue fields, Noether normalization, the Jacobson and dimension theorems, all-characteristic excellence, and completed field extension. In §1.2 excellence includes imperfect characteristic p without a finite-imperfection-degree hypothesis; no characteristic-zero dagger theorem substitutes for it. Its [§§2.1–2.3](../RigidAnalyticGeometry/README.md) supply power-bounded elements, spectral suprema and finite canonical reduction. Its [Layers 3–4](../RigidAnalyticGeometry/README.md) supply affinoid domains, flat restriction, reduced restriction and their classical traces.

Consume [§6.2 and §§8.1–8.3](../RigidAnalyticGeometry/README.md#layer-8-analytification-and-rigidadic-comparison) for the shared rigid space and classical point carriers and the following exact comparisons. On Spa A, classical points are Max A; every nonempty open contains one. Morphisms preserve classical points. Classical points are closed and rank one, and have no proper generizations in the rank-one locus. Under algebraic analytification, closed points and irreducible components agree with their analytic counterparts, and reducedness and normality are preserved and reflected. The component comparison is used after constructing global rigid components, never as a prerequisite of their construction. The comparison of completed local rings is at corresponding classical points.

**Checks for the supplied classical-point interface.**

- In the ℚ_p disc, (T² − p) has residue degree 2 and |T| = p^(−1/2), for p = 2 and 3 as well. A definition confined to K-rational points misses it.
- Spa L for finite L/K has one classical point, and the empty space has none. The Gauss point of a positive-dimensional disc is not classical, although every one of its open neighbourhoods contains classical points.
- The point T = t, for t ∈ ℂ_p transcendental over ℚ_p with |t| ≤ 1, is not classical over ℚ_p. Finite residue degree, rather than rank one alone, is decisive.
- For A = K⟨T⟩ and I = (T), the classical trace is the maximal spectrum of A/I = K. For A = K × K there are two such points. These compare the supplied maximal-spectrum construction with closed subsets.

### From TauCetiRoadmap.AdicSpacesPartII

Consume [AdicSpacesPartII R0.6–R0.17 and R1.1–R1.9](../AdicSpacesPartII/README.md) for locally finite-type adic spaces and morphisms, closed subspaces, fibre products, finite and proper maps, continuous differentials and smooth/étale local structure, relative analytification and properness of analytic projective space, the Tate–Huber comparison, and the normal connected identity principle. Specifically R1.2 supplies relative analytification over Spec A for a K-affinoid A; it is not restricted to schemes of finite type over K. R0.15–R0.17 supply continuous cotangent modules, their local freeness for smooth maps, the Jacobian criterion, smooth base change and the split cotangent injection for a smooth map. R1.9 supplies the identity principle on connected normal rigid spaces.

The coherent-sheaf contract consumed through RigidAnalyticGeometry §§7.3–7.4 is the equivalence between finite modules and coherent sheaves on an affinoid, exact and compatible with restriction, tensor products, ideals and finite algebras, and coherence of f_*F for coherent F when f is adic-proper and Kiehl-proper over every affinoid open of the target. Its existing owner is AdicSpacesPartIII R3.1–R3.3 and R3.6; the proper theorem has no reducedness or smoothness hypothesis. The sheaf of continuous differentials is the coherent sheaf attached to R0.15's module and is compatible with the rigid–adic comparison. These contracts suffice for supports, radical ideals, finite normalizations and proper-image closedness.

### From TauCetiRoadmap.AdicEtaleGeometry

Consume [AdicEtaleGeometry A2.6, dimension-of-adic-spaces](../AdicEtaleGeometry/README.md#a26-dimension-and-dimension-estimates): dim X is Mathlib's topologicalKrullDim |X|, with dim ∅ = ⊥. For X locally of finite type over Spa(K, K°), X has pure dimension d iff every classical local ring has Krull dimension d; pure dimension means that every nonempty open has dimension d. Use its open-cover formula for topological dimension. Section 0.2 compares this global dimension with local dimension at all adic points; it does not identify coherent irreducible components with topological irreducible components.

### From TauCetiRoadmap.AdicSpacesPartIII

Consume AdicSpacesPartIII R3.6 for coherent direct image under its Kiehl-proper hypothesis over each affinoid base, in addition to adic properness. The general implication needed to apply it is the following contract.

What AdicSpacesPartIII must provide (gap:adic-proper-kiehl-proper): For every complete nontrivially valued rank-one nonarchimedean field K, every K-affinoid algebra A and every adic-proper morphism f : X → Spa(A,A°) of rigid K-spaces, f is Kiehl-proper: X has finite affinoid open covers (Vᵢ) and (Uᵢ) with Vᵢ relatively compact in Uᵢ over A for each i.

Here relative compactness and the finite-cover criterion are those of AdicSpacesPartIII R3.6, proper-relatively-compact-covers. Applying the contract after restriction to each affinoid open of the target supplies the hypothesis used in §0.4.

Consume AdicSpacesPartIII R3.9, gelfand-spectrum-banach-ring, for `Huber.GelfandSpectrum`, `GelfandSpectrum.compactSpace_nonempty` and `GelfandSpectrum.smoothingFun_eq_sSup`: bounded multiplicative seminorms with their pointwise topology, compact Hausdorffness and the spectral-supremum formula for a complete normed commutative ring. For a K-affinoid Banach algebra the seminorms restrict to the fixed absolute value on K. The zero algebra has empty spectrum and spectral supremum zero. The ambient Banach norm need not be multiplicative and need not equal the spectral seminorm.

The formal-model contract uses the admissible formal schemes and generic fibres of AdicSpacesPartIII R2.2–R2.5: complete arbitrary rank-one K°, topologically finite presentation, K°-flatness, the generic-fibre comparison, specialization, admissible blow-ups and Raynaud localization. AdicSpacesPartIII R2.4 (v) supplies the Zariski–Riemann description: for quasi-compact admissible X, the specialization maps give a homeomorphism d(X) ≅ lim |X′| over the admissible blow-ups X′ → X and an isomorphism (d(X), O⁺) ≅ lim (X′, O_X′); R2.5 makes every admissible blow-up proper and surjective on special fibres. A prescribed finite affinoid covering has a formal-open realization after admissible blow-up. Quasi-separated quasi-paracompact objects use locally finite formal charts and compatible blow-ups, without assuming a discrete valuation.

What AdicSpacesPartIII must provide (gap:formal-affinoid-localization): For every quasi-separated quasi-paracompact rigid K-space X and every affinoid open W = Spa(R, R°) ⊆ X, there are an admissible formal model 𝔛 of X and a formal affine open Spf(R₀) ⊆ 𝔛 with generic fibre W, where R₀ ⊆ R° is open and bounded, such that Spec(R°/R°°) → Spec(R₀/ϖR₀) is a homeomorphism for a pseudo-uniformizer ϖ of K.

This is the precise localization extension needed in §4.6; a categorical Raynaud equivalence without that realization statement does not supply it (BH22 line 339, Proposition 2.9, p. 8). AdicSpacesPartIII R2.4–R2.5 supplies the formal specialization and Raynaud framework; the gap asks for the stated quasi-paracompact realization and reduction compatibility.

**Checks for the formal localization contract.**

- On the disc, take R₀ = K°⟨T⟩. The map Spec K̃[T] → Spec (K°/ϖ)[T] is a homeomorphism: the kernel K°°/ϖ is the nilradical, even when the valuation is nondiscrete. This compares the actual canonical reduction with the model special fibre.
- For R = K[ε]/(ε²), take R₀ = K°[ε]/(ε²). The canonical reduction is K̃ and the model special fibre is (K°/ϖ)[ε]/(ε²); both spectra have one point. The comparison is a homeomorphism, not a ring isomorphism.
- On a disjoint union of countably many discs, use the disjoint union of these formal discs and choose W to be one component. Its model is a formal affine open although the whole space is not quasi-compact; a finite-cover-only formulation would not apply.

### From TauCetiRoadmap.SchemeAndStackFoundations

Consume [SchemeAndStackFoundations §0.21](../SchemeAndStackFoundations/README.md#021-regular-maps-g-rings-j-2-rings-excellent-rings-and-schemes) on Tau Ceti's regularity carriers (From Tau Ceti above): a regular map is flat with geometrically regular fibres; a local G-ring has a regular completion map (its `regular_map_completion`); quasi-excellence includes noetherianity and J-2; excellence adds universal catenarity; regular maps between noetherian rings preserve reducedness and normality; quasi-excellent rings are Nagata (`Excellence.IsQuasiExcellentRing.isNagata`). Consume its §0.20 target *IsNagata.integralClosure_finite*: for a Nagata ring R and a reduced essentially finite-type R-algebra S, the integral closure of R in S is finite over R. Ascent of regularity along a flat local map whose closed fibre is regular but not a field, the composition and faithfully flat descent of regular maps, and the formal-smoothness criterion for complete local maps are neither stated in §0.21 nor supplied by Tau Ceti; they are the three contracts below. Descent of regularity along flat local maps and the case of a field closed fibre are Tau Ceti's. Use [§0.3 and §4.11](../SchemeAndStackFoundations/README.md) for relative Proj and modifications with strict transforms. These algebraic constructions have no affinoid finite-type-over-K hypothesis. Consume its §0.8, etale_coordinates, for an étale map U → 𝔸^d_F from a Zariski neighbourhood of a smooth point of relative dimension d; Layer 6 constructs the analytic charts on field-valued points.

What SchemeAndStackFoundations must provide (gap:regular-local-flat-transfer): For a flat local homomorphism R → S of noetherian local rings, if R is regular and the closed fibre S/m_R S is a regular ring then S is regular.

What SchemeAndStackFoundations must provide (gap:regular-map-composition-descent): For ring maps A → B → C with B and C noetherian, if A → B and B → C are regular then A → C is regular, if A → C is regular and B → C is faithfully flat then A → B is regular, and A → B is regular as soon as A → B_n is regular for every maximal ideal n of B.

What SchemeAndStackFoundations must provide (gap:complete-local-formal-smoothness-regular): For a local homomorphism A → B of complete noetherian local rings that is formally smooth for the m_B-adic topology, A → B is a regular ring map.

These are STACKS, Tag 031E (Algebra, Lemma 10.112.8; the descent half, Tag 00OF, Algebra, Lemma 10.110.9, is Tau Ceti's `TauCeti.IsRegularLocalRing.of_flat_of_isLocalHom`); Tags 07QI, 07NT and 07C0 (More on Algebra, Lemmas 15.42.4, 15.42.7 and 15.42.2); and Tag 07PM (More on Algebra, Proposition 15.50.2). The last needs no quasi-excellence hypothesis because both rings are complete. The first supplies the smooth-pullback clause of §2.1; the second and third supply §0.5 and, through it, the regularity comparisons of §§2.1 and 5.3.

**Checks for the regularity contracts.**

- For K[t]_(t) → K[[t]] the closed fibre is K and both rings are regular of dimension 1. For the flat local map K → K[ε]/(ε²) the source is regular and the target has dimension 0 but embedding dimension 1; its closed fibre K[ε]/(ε²) is not regular, so the ascent clause does not apply, and descent gives no conclusion because the target is not regular.
- Faithful flatness in the descent clause cannot be weakened to flatness: for the cusp B = K[x,y]/(y² − x³) and C = B[1/x] ≅ K[t, t⁻¹], the map K → C is smooth, hence regular, and B → C is flat, but K → B is not regular at the origin. The map B → C misses the origin of Spec B.
- K → K[[T]] is formally smooth for the (T)-adic topology and regular. K → K[ε]/(ε²) is not formally smooth: lifting ε ↦ t from K[t]/(t²) to K[t]/(t³) needs an element congruent to t modulo t² with square zero, but (t + ct²)² = t² ≠ 0.

### From TauCetiRoadmap.StableReduction

Consume [StableReduction Layer 4](../StableReduction/README.md#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces) for the Rees algebra and scheme blow-up of a finite-type quasi-coherent ideal, its universal property, properness and projectivity, its isomorphism away from the centre and its compatibility with flat base change. These inputs apply to Spec A for an affinoid A; finite type over K is not required.

### From TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero

Consume [ResolutionOfSingularitiesCharacteristicZero §§7.1, 7.5–7.8](../ResolutionOfSingularitiesCharacteristicZero/README.md). The field functor is compatible with all regular morphisms, including changes of characteristic-zero field and disjoint unions over different fields, after deleting empty-centre steps. The quasi-excellent functor assigns to every reduced noetherian quasi-excellent ℚ-scheme a finite sequence in regular centres disjoint from the inverse image of its entire regular locus; its final scheme is regular, the composite is projective and birational on every component, and all regular morphisms pull back the marked sequence with identity and composition coherence. The affine specialization applies to Spec A for a characteristic-zero K-affinoid A, which need not be finitely generated as a K-algebra. Countability for the reduced functor and extension to generically reduced schemes are the separate contracts below (TEMKIN12 line 99, Theorem 1.2.1, p. 3; lines 1570–1574, proof of Theorem 5.3.2, p. 34).

What ResolutionOfSingularitiesCharacteristicZero must provide (gap:generically-reduced-functorial-resolution): Extend its §§7.5–7.6 marked strong resolution functor from reduced to generically reduced noetherian quasi-excellent ℚ-schemes, preserving the entire regular locus and functoriality for all regular maps, with invariant values in a countable ordered set.

What ResolutionOfSingularitiesCharacteristicZero must provide (gap:countable-resolution-invariants): Provide a countable totally ordered set of invariant values labelling the steps of the §§7.5–7.6 reduced resolution functor, compatibly with pullback along regular morphisms after deleting empty steps.

For a general nonreduced scheme, Temkin's reduction-and-blow-up extension is also functorial but can delete generically nonreduced components; it gives no surjective birational resolution of those components. The rigid cover applications therefore resolve the reduction. This records the generality of TEMKIN12, Remark 1.2.2, p. 3 without confusing that extension with a cover.

**Checks for the imported scheme-resolution input.**

- The empty sequence resolves a regular scheme, including ∅ and Spec ℚ. An effective Cartier centre gives an isomorphism but remains a nonempty marked step.
- The cusp y² = x³ is made regular by one blow-up of the origin: in the x-chart y = xu, the strict transform is x = u², y = u³. Complete local cusps and every characteristic-zero ground field are included.
- Spec K[ε]/(ε²) is generically nonreduced, so a regular scheme cannot be isomorphic over any dense open of it. Applying the reduced theorem to this scheme without reduction would be false.
- The reduced disjoint union of the curves y² = x^(2n+1), n ≥ 0, needs gap:countable-resolution-invariants to synchronize the local finite towers; no generically reduced extension is needed. In the displayed origin-blow-up towers the exponents decrease by 2, so the n-th curve needs n steps, including 0 steps for n = 0 (§5.2).
- For characteristic-zero K and A = K⟨x,y⟩/(y², xy), A[1/x] has y = 0, while the origin has dimension 1 and cotangent dimension 2. Thus Spa A has nowhere dense nonreduced locus {0} and needs gap:generically-reduced-functorial-resolution. Its quasi-compact finite tower needs no countable synchronization of separate reduced towers. Blowing up (x,y) gives the x-chart K⟨x⟩ and an empty y-chart, illustrating preservation of the regular complement.

### From TauCetiRoadmap.ReductiveGroups

Consume [ReductiveGroups Layer 3](../ReductiveGroups/README.md#layer-3-subgroups-quotients-components) for the fppf quotient of a finite-type affine algebraic group by a closed subgroup and the represented quotient under its actual representability hypotheses. Smoothness of a represented quotient map is a separate input; no surjectivity on F-rational points is assumed.

What ReductiveGroups must provide (gap:represented-smooth-homogeneous-quotient): For a smooth finite-type affine group G over a field of characteristic zero and a closed subgroup scheme H whose fppf quotient G/H is represented by a scheme, the quotient morphism G → G/H is smooth and surjective.

### From TauCetiRoadmap.ReductiveGroupsPartII

Consume [ReductiveGroupsPartII RG2.0.2](../ReductiveGroupsPartII/README.md#rg202-local-fields-the-topological-group-of-points), *smooth-group-analytic-charts*, only for the comparison bullet of §6.4: for a nondiscrete locally compact field K of characteristic zero and a smooth affine finite-type K-group G of dimension d, G(K) with its point topology carries a d-dimensional analytic manifold structure whose charts come from smooth local parameters and the inverse function theorem, with analytic multiplication and inversion. Its Haar-measure and Jacobian normalizations are not used here.

## How to read the build

Layer 0 makes the coherent Zariski topology, local dimension, nowhere density and regular restriction available without global components. Layer 1 glues normalization, proves the component theorems and extends bounded functions to control connected complements. Layer 2 applies regular local algebra to singular sets, smooth strata, tangents and rank loci. Layer 3 develops finite-extension point classes and the topology and Gauss closure of rational polydisc points. Layer 4 compares canonical reduction, Shilov boundaries and residue transcendence, culminating in avoidance and density. Layer 5 analytifies the supplied scheme resolution using regular restriction and marked gluing. Layer 6 uses the supplied analytic inverse theorem to construct polydisc charts, rational-point manifolds, algebraic-point atlases over complete normed fields, constant rank, submersions and the subfield identity theorem. Every Needs line separates statement inputs from the additional inputs of the indicated proof route. Layer k carries the label RZ.k and each subsection a target name, printed in italics at its start; other roadmaps cite a target as AdicSpacesPartV RZ.k / name, for instance RZ.0 / local-dimension for §0.2.

## Layer 0 (RZ.0): Zariski closed subsets, local dimension and nowhere density

### 0.1 Zariski closed subsets of a rigid space

(*zariski-closed-subset*) Let K be a complete nonarchimedean field with a nontrivial rank-one absolute value and X a rigid space over K (an adic space locally of finite type over Spa(K, K°)). A subset Z ⊆ |X| is Zariski closed if Z = Supp(O_X/𝓘) = {x ∈ |X| : 𝓘_x ≠ `O_(X,x)`} for a coherent ideal 𝓘 ⊆ O_X (the coherent-sheaf contract above); equivalently Z is the underlying set of a closed adic subspace. On an affinoid open U = Spa(A, A°) ⊆ X with 𝓘|_U = Ĩ for an ideal I ⊆ A, Z ∩ U = V(I) = {x ∈ U : |f(x)| = 0 for all f ∈ I}. The reduced structure on Z is the closed adic subspace Z_red defined by the largest coherent ideal with support Z, which on U is √I; Zariski closed subsets correspond bijectively to radical coherent ideals. A Zariski open subset is the complement of a Zariski closed subset. The Zariski closed subsets of X are the closed sets of a topology on |X| coarser than its own topology. (HK2 line 220, §1.1, p. 5; CONRAD99 line 451, §2.1, p. 10.)

X is locally noetherian, so coherent ideals and their radicals are coherent and every affinoid open has a strongly noetherian Tate coordinate ring. On a quasi-separated X, Huber's functor (RigidAnalyticGeometry §§6.2, 8.3; AdicSpacesPartII R1.1, R1.7) carries Tate's analytic subsets (zero loci of coherent ideals on the classical rigid space) to Zariski closed subsets, and the classical points of V(I) are the maximal ideals of A containing I.

Its API has the following properties, with the hypotheses of this subsection.

- Z ⊆ |X| is Zariski closed iff Z = Supp(O_X/𝓘) for a coherent ideal 𝓘.
- For U = Spa(A, A°) affinoid open, Z ∩ U = V(I) for an ideal I of A, and every V(I) is Zariski closed in U.
- Finite unions of Zariski closed subsets are Zariski closed: V(𝓘) ∪ V(𝓙) = V(𝓘𝓙).
- Arbitrary intersections of Zariski closed subsets are Zariski closed: ∩ V(𝓘_α) = V(Σ 𝓘_α).
- For f : Y → X a morphism of rigid spaces, f⁻¹(V(𝓘)) = V(𝓘O_Y) is Zariski closed.
- A Zariski closed subset is closed in |X|.
- Zariski closed subsets of X correspond bijectively to radical coherent ideals; Z ↦ the ideal of Z_red.
- The reduced closed subspace Z_red ↪ X with |Z_red| = Z; every closed subspace with underlying set Z contains Z_red.
- The classical points of V(I) ∩ Spa(A, A°) are the maximal ideals of A containing I.
- Z is Zariski closed in X iff it is Zariski closed in X_red; V(𝓘) = V(√𝓘).

One proof route is as follows. The support of the coherent sheaf O_X/𝓘 is closed, and on U it is V(I) because (O_X/𝓘)_x = 0 iff some f ∈ I is a unit at x iff |f(x)| ≠ 0 for some f ∈ I. For I ⊆ A, radical formation commutes with affinoid restriction because the quotient by √I is reduced and remains reduced on rational domains (RigidAnalyticGeometry Layers 3–4 (reduced restriction)), and arbitrary affinoid restrictions are covered by rational domains. Flatness preserves the exact quotient sequence; reducedness, rather than flatness alone, identifies its nilradical. The resulting radical ideals glue coherently. Unions and intersections: V(𝓘) ∪ V(𝓙) = V(𝓘𝓙) and ∩_α V(𝓘_α) = V(Σ_α 𝓘_α), the sum being coherent locally because A is noetherian; hence a topology. Preimages: for f : Y → X, f⁻¹(V(𝓘)) = V(𝓘·O_Y).

*Needs:* the coherent-sheaf contract above; RigidAnalyticGeometry §§6.2, 8.3; AdicSpacesPartII R1.1, R1.7; `Ideal.radical`; `TauCeti.ValuationSpectrum.spa`; RigidAnalyticGeometry Layers 3–4 (reduced restriction).

**Checks.**

- On the closed unit disc over K, V(T) consists of the single classical point T = 0 and does not contain the Gauss point.
- V(O_X) = ∅ and V(0) = |X|; on X = Spa(K⟨T⟩/(T²)), V(T) = |X|.
- For A = K⟨T⟩ and I = (T(T − 1)), A/I ≅ K × K because T and T − 1 generate the unit ideal. V(I) consists of the two classical points T = 0 and T = 1 and excludes the Gauss point, where |T(T − 1)| = 1 ≠ 0.
- For 0 < |ϖ| < 1, the topological closure of {|T| ≤ |ϖ|} in the unit disc is proper and has nonempty interior. It is not Zariski closed: the identity principle forces a Zariski closed subset containing that subdisc to be the whole disc. No classification or count of boundary specializations is needed.

### 0.2 Local dimension of a rigid space at a point

(*local-dimension*) Use the following local-dimension convention: for X a rigid space over K and x ∈ |X|, set dim_x X = min{ringKrullDim O_X(U) : U ∋ x an affinoid open}. For a Zariski closed Z ⊆ X and z ∈ Z, dim_z Z means the local dimension of Z_red at z. This is the local dimension used in the weakly Shilov criterion (BH22 line 332, Proposition 2.9(2), p. 8); that passage uses the notion rather than defining this convention.

The minimum exists because the Krull dimension of a nonzero K-affinoid algebra is a natural number (Noether normalization, RigidAnalyticGeometry §§1.1–1.2). Prove the comparisons: at a classical point, dim_x X = ringKrullDim `O_(X,x)`; globally, the supplied dimension satisfies topologicalKrullDim |X| = sup_x dim_x X; and for affinoid X both sides equal ringKrullDim O(X). Suprema are taken in {−∞} ∪ ℕ ∪ {∞}; the empty supremum and the dimension of the zero ring are ⊥ = −∞. These are comparison targets, using affinoid minimal primes, equidimensionality and the pure-dimension criterion of AdicEtaleGeometry A2.6, without global coherent irreducible components.

Its API has the following properties, with the hypotheses of this subsection.

- dim_x X ∈ ℕ, the minimum of the Krull dimensions of the affinoid neighbourhoods of x.
- At a classical point x, dim_x X = ringKrullDim `O_(X,x)`.
- If x ∈ U ⊆ X with U affinoid open then dim_x X ≤ ringKrullDim O_X(U), with equality for U small enough.
- x ↦ dim_x X is upper semicontinuous on |X|.
- For a locally closed immersion i : Y ↪ X, dim_y Y ≤ `dim_(i(y))` X; for an open immersion equality holds.
- dim_x X = dim_x X_red.
- The supplied global dimension topologicalKrullDim |X| equals sup_x dim_x X; for X affinoid both equal ringKrullDim O(X).
- At a point where X → Spa K is smooth, dim_x X is the rank of `Omega_(X/K)` near x (Layer 2).

One proof route is as follows. If U′ ⊆ U are affinoid neighbourhoods of x then dim O(U′) ≤ dim O(U): an affinoid subdomain inclusion is flat with the same completed local rings at classical points (RigidAnalyticGeometry §8.1; AdicSpacesPartII R1.5), and the Krull dimension of an affinoid algebra is the maximum of the dimensions of its local rings at maximal ideals (Jacobson, RigidAnalyticGeometry §§1.1–1.2). Hence dim_x X is computed on arbitrarily small affinoid neighbourhoods, x ↦ dim_x X is upper semicontinuous, and dim_x Y ≤ dim_x X for a locally closed immersion Y ↪ X (a closed subspace of an affinoid has no larger Krull dimension; open immersions do not change local dimension). At a classical x in U = Spa(A), write the finitely many minimal primes as p_i. Remove V(p_i) for those not contained in m_x. Each remaining A/p_i is an affinoid domain, whose maximal localizations have dimension dim(A/p_i). On a sufficiently small affinoid neighbourhood the maximum of these dimensions is both dim_x X and dim A_m; completion identifies the latter with dim `O_(X,x)`. For global dimension, each Spa(A/p_i) has pure dimension dim(A/p_i) by AdicEtaleGeometry A2.6. For this finite closed cover, the largest member of any finite chain of irreducible closed subsets lies in one member of the cover, so the whole chain lies there. Together with dimension monotonicity for subspaces, this gives topologicalKrullDim |U| = max_i dim(A/p_i) = ringKrullDim A, also equal to sup_x dim_x U by the classical comparison. Finally use the open-cover formula on affinoid neighbourhoods attaining each local minimum to obtain topologicalKrullDim |X| = sup_x dim_x X.

*Needs:* RigidAnalyticGeometry §§1.1–1.2; RigidAnalyticGeometry §8.1; AdicSpacesPartII R1.5; AdicEtaleGeometry A2.6; `topologicalKrullDim`; `ringKrullDim`; `IsLocalRing`.

**Checks.**

- For D^n the closed unit polydisc over K, dim_x D^n = n for every x ∈ |D^n|, including the Gauss point.
- dim_x Spa(L) = 0 for a finite extension L/K. For X = ∅, topologicalKrullDim |X| = sup_x dim_x X = ringKrullDim 0 = ⊥ = −∞; there is no local dimension at a point of ∅.
- For X = Spa(K × K⟨T⟩), dim_x X is 0 at the isolated point and 1 on the disc component, while topologicalKrullDim |X| = sup_x dim_x X = ringKrullDim(K × K⟨T⟩) = 1. Global dimension does not replace local dimension.
- For X = Spa(A, A°) with A a K-affinoid domain of Krull dimension d, dim_x X = d at every point.
- At the cusp of Spa(K⟨X,Y⟩/(Y² − X³)) the local dimension is 1 while the Zariski tangent space has dimension 2: a definition through tangent spaces fails.
- For a complete rank-one field K and a rank-two valuation ring K⁺ ⊊ K°, AdicEtaleGeometry A2.6 gives topologicalKrullDim Spa(K, K⁺) = 1 while ringKrullDim K = 0. This space is outside the comparison's hypothesis of being locally of finite type over Spa(K, K°).

### 0.3 Criteria for a Zariski closed subset to be nowhere dense

(*nowhere-dense-criteria*) Prove: Let X be a rigid space over K and Z ⊆ X a Zariski closed subset. The following are equivalent: (a) Z contains no nonempty open subset of |X|; (b) Z contains no nonempty affinoid open subset of X; (c) for every affinoid open Spa(A, A°) ⊆ X with Z ∩ Spa(A, A°) = V(I), the ideal I lies in no minimal prime of A (equivalently Spec(A/I) is nowhere dense in Spec A); (d) dim `O_(Z,z)` < dim `O_(X,z)` for every classical point z ∈ Z; (e) dim_z Z < dim_z X for every z ∈ Z. Such Z is called nowhere dense. The condition is local on X and depends only on X_red and Z_red. (CONRAD99 line 451, §2.1, p. 10; BH22 line 346, Corollary 2.10, p. 8.)

X is a rigid space over K (locally noetherian); Z carries its reduced structure when local rings `O_(Z,z)` are formed. The equivalence with (d) is Conrad’s formulation for Tate's rigid spaces; on a quasi-separated X it is transported through Huber's functor.

One proof route is as follows. (a) ⇔ (b): affinoid opens (rational subsets) form a basis of |X| and are nonempty when their coordinate ring is nonzero. (b) ⇒ (c): if I ⊆ p for a minimal prime p of A, choose g lying in every other minimal prime but not in p (prime avoidance). g is not nilpotent, so its supremum norm is positive (RigidAnalyticGeometry §§2.1–2.2) and for c ∈ K× with |c| ≤ |g|_sup the Laurent domain {|g| ≥ |c|} is a nonempty affinoid open. At each of its points x, supp(x) does not contain g, so it contains the minimal prime p; hence the domain lies in V(p) ⊆ V(I) = Z. (c) ⇒ (b): if Z ⊇ U = Spa(B, B°) ≠ ∅ inside Spa(A, A°), then I·B is nilpotent; B has a minimal prime q and A → B is flat (RigidAnalyticGeometry Layers 3–4), so by going down q ∩ A is a minimal prime of A containing I. For both dimension criteria, use the completion comparison at classical points and work with the finite minimal primes p_i of an affinoid A. A closed subset containing V(p_i) has the same local dimension at a classical point of that component away from the other components. Conversely, if I is contained in none of the p_i, each closed subset V(I+p_i) has dimension strictly smaller than the equidimensional affinoid domain A/p_i; localizing and taking the maximum over the components through a point gives strict local dimension drop. This is the affinoid argument in Conrad §2.1, p. 10.

*Needs:* §0.1; §0.2; RigidAnalyticGeometry §§2.1–2.2; RigidAnalyticGeometry Layers 3–4; RigidAnalyticGeometry §8.1; AdicSpacesPartII R1.5; RigidAnalyticGeometry §§1.1–1.2; SchemeAndStackFoundations §0.21; `minimalPrimes`; `Ideal.height`.

**Checks.**

- On the disc, V(T) is nowhere dense; on Spa(K⟨X,Y⟩/(XY)), the axis V(Y) is not nowhere dense although it is a proper Zariski closed subset.
- On Spa(K × K), the Zariski closed point Spa(K × 0) is open, hence not nowhere dense.
- For X = ∅, all five nowhere-density conditions hold for Z = ∅. For nonempty X and Z = X they all fail; this excludes a definition that forgets the empty-open requirement.

### 0.4 Images of proper morphisms are Zariski closed

(*proper-image-zariski-closed*) Prove: Let f : Y → X be a proper morphism of rigid spaces over K. Then f(|Y|) is a Zariski closed subset of X, namely the support of the coherent O_X-module f_*O_Y; its reduced structure is the closed subspace defined by ker(O_X → f_*O_Y) up to radical. More generally, for a Zariski closed T ⊆ Y, f(T) is Zariski closed in X. (BH22 line 570, proof of Theorem 2.29, p. 13; HK2 lines 722–727, proof of Lemma 2.2.3, p. 16.)

f proper in the sense of AdicSpacesPartII R0.10–R0.12; no reducedness or smoothness is assumed.

One proof route is as follows. Restrict to an affinoid open of X and apply gap:adic-proper-kiehl-proper to the proper base change of f. Kiehl's proper mapping theorem (the coherent proper-direct-image contract above) then makes f_*O_Y coherent, so its support is Zariski closed (support of a coherent sheaf = V of its annihilator ideal, the coherent-sheaf contract above). Supp(f_*O_Y) ⊆ f(|Y|): if x ∉ f(|Y|) then, f being closed, a neighbourhood of x misses f(|Y|) and f_*O_Y vanishes there. f(|Y|) ⊆ Supp(f_*O_Y): if (f_*O_Y)_x = 0, the section 1 of f_*O_Y vanishes on an open V′ ∋ x, so 1 = 0 in O_Y(f⁻¹V′) and f⁻¹V′ = ∅; hence x ∉ f(|Y|). For T = V(𝓙) apply the result to the proper composite V(𝓙) ↪ Y → X.

*Needs:* §0.1; AdicSpacesPartIII R3.6 and gap:adic-proper-kiehl-proper; the coherent proper-direct-image contract above; the coherent-sheaf contract above; AdicSpacesPartII R0.10–R0.12.

**Checks.**

- The image of a closed immersion is its Zariski closed image; the image of the analytified projection P^1 × D → D is all of D.
- Over K = 𝔽_p((t)), the closed immersion of Spa K(t^(1/p)) into the disc sending T to t^(1/p) has image V(Tᵖ − t), the support of K⟨T⟩/(Tᵖ − t): one classical point of residue degree p. For the finite map T ↦ T² of the disc, K⟨T⟩ is free of rank 2 over K⟨T²⟩ and the image is the whole disc. Neither separability nor injectivity on points is needed.
- The image of ∅ → X is ∅, and its direct-image algebra is zero; for id_X the image and support are all X. This excludes an unwarranted surjectivity assumption.
- Over ℂ_p, cover P¹ by the unit discs in T and T⁻¹, and also by the discs of radius |p|⁻¹ in these coordinates. In the outer coordinates pT and p/T the inner discs have supremum |p| < 1, giving both relatively compact inclusions over the point despite the nondiscrete valuation. H⁰(P¹,O) = ℂ_p; image and support are both the one-point base.

### 0.5 Affinoid localizations are regular ring maps

(*affinoid-localization-regular*) Prove: Let K satisfy the standing field hypotheses. Every affinoid-domain inclusion Spa(B, B°) ⊆ Spa(A, A°) induces a regular ring map A → B in the sense of Tau Ceti's `TauCeti.Excellence.RegularAlgebraMap`: it is flat with geometrically regular fibres. A smooth morphism of K-affinoids also induces a regular ring map. There is no characteristic or perfectness restriction. (The domain case is proved here from excellence and completion comparison; CONRAD99 line 409, proof of Corollary 1.2.3, p. 9, supplies flatness. The criterion for complete local maps is STACKS, Tag 07PM, Proposition 15.50.2. TEMKIN12 line 1513 uses regularity of affinoid restriction.)

One proof route is as follows. For an affinoid-domain inclusion, use flatness and the identical completed local rings at corresponding classical points: for a maximal ideal n of B over m, Â_m ≅ B̂_n. Excellence makes A_m → Â_m regular (SchemeAndStackFoundations §0.21, `regular_map_completion`), so A_m → B̂_n is regular; since B_n → B̂_n is faithfully flat, A_m → B_n is regular by gap:regular-map-composition-descent. Every maximal ideal of B contracts to a maximal ideal of A, because classical points map to classical points, and the same contract reduces regularity of A → B to the maximal ideals of B. For a smooth affinoid map, prove formal smoothness of the local homomorphism Â_m → B̂_n of complete noetherian local rings in the maximal-ideal adic topologies by infinitesimal lifting in an étale-local relative polydisc presentation. gap:complete-local-formal-smoothness-regular makes Â_m → B̂_n regular. Compose with the regular A_m → Â_m and descend along the faithfully flat B_n → B̂_n by gap:regular-map-composition-descent. This argument imposes no separability on k(n)/k(m) and does not choose a residue-field coefficient section.

*Needs:* `TauCeti.Excellence.RegularAlgebraMap`; RigidAnalyticGeometry Layers 3–4; RigidAnalyticGeometry §8.1; AdicSpacesPartII R1.5; RigidAnalyticGeometry §1.2 (all-characteristic excellence); RigidAnalyticGeometry §§1.1–1.2; AdicSpacesPartII R0.15–R0.17; SchemeAndStackFoundations §0.21; gap:regular-map-composition-descent; gap:complete-local-formal-smoothness-regular.

**Checks.**

- K⟨T⟩ → K⟨T, T⁻¹⟩ (inclusion of the unit circle) is regular; K⟨T⟩ → K (evaluation at 0) is not flat, hence not regular.
- The identity A → A has field fibres and is regular. In characteristic p, K → K(a^(1/p)) is flat but has a nonreduced geometric fibre when a ∉ K^p; flatness alone fails.
- If char K = p and a ∈ K° − K^p, the smooth disc has the classical point (Tᵖ − a) with inseparable residue K(a^(1/p)). Nevertheless, after this finite extension its coordinate algebra is K(a^(1/p))⟨T⟩, which is regular. The residue extension at a smooth point need not be separable.

For characteristic-zero K and every complete isometric extension K′/K, also prove that the canonical completed scalar-extension map A → A ⊗̂_K K′ of a K-affinoid A is regular. This assertion is required to apply the regular-morphism scheme-resolution functor to the ground-field compatibility in Temkin’s theorem; flatness is only its first conclusion. The completion comparison at classical points and geometric regularity of the resulting fibres are the affine route (TEMKIN12 line 1504, Theorem 5.2.2, p. 33; CONRAD99 line 274, Lemma 1.1.5, pp. 6–7). *Needs:* `TauCeti.Excellence.RegularAlgebraMap`; RigidAnalyticGeometry §1.3; SchemeAndStackFoundations §0.21; gap:regular-map-composition-descent; the completion comparisons in this subsection and separability of characteristic-zero field extensions.

**Checks for scalar extension.**

- For A = K, the map is K → K′. Every characteristic-zero field extension is separable, so every geometric fibre is regular. This fixes the ground-field direction.
- For A = K⟨T⟩ and K′/K finite separable, the map to K′⟨T⟩ is finite étale. At T = 0 the completed local map is K[[T]] → K′[[T]], with the same parameter and separable residue extension.
- In characteristic p the extension K → K(a^(1/p)), a ∉ K^p, has a geometric fibre K(a^(1/p))[ε]/(ε^p). It is flat but not regular, so the characteristic-zero assertion cannot be used in imperfect characteristic p.

### Examples

In the disc, V(T) has dimension 0 and contains no Gauss point, while a closed subdisc of radius |π| has dimension 1 and nonempty interior. In the nodal bidisc curve XY = 0, a whole axis is proper but is not nowhere dense. On K⟨T⟩/(T²), V(T) is the entire one-point space. These three tests separate Zariski closedness, topological closedness and nowhere density.

### Dependencies

Native spectra and local algebra; RigidAnalyticGeometry §§1.1–2.2, 7.3–7.4, 8.1 and Layers 3–4; AdicSpacesPartII R0.10–R0.17, R1; AdicEtaleGeometry A2.6 for the global-dimension comparison; SchemeAndStackFoundations §0.21 with gap:regular-map-composition-descent and gap:complete-local-formal-smoothness-regular. No global coherent component theorem is an input.

## Layer 1 (RZ.1): Normalization, global components and connected complements

### 1.1 The normalization of a rigid space

(*rigid-normalization*) Construct as follows. Let X be a rigid space over K. For an affinoid open U = Spa(A, A°), let Ã^ν be the integral closure of A_red in its total ring of fractions; it is a finite A-algebra and a K-affinoid algebra. For affinoid opens V ⊆ U the natural map `O(V) tensor_[O(U)] O(U)^nu -> O(V)^nu` is an isomorphism (Conrad, Corollary 1.2.3), so the finite morphisms Spa(O(U)^ν) → U glue to a finite surjective morphism p : X^ν → X, the normalization of X. X^ν is normal (its local rings are normal domains), p factors through X_red, the factor X^ν → X_red is an isomorphism over the normal locus of X_red, and a morphism Y → X is called a normalization if it is isomorphic over X to p (the isomorphism is then unique). (CONRAD99 line 406, Corollary 1.2.3, p. 9, and line 435, Lemma 2.1.1, pp. 9–10.)

Finiteness uses all-characteristic affinoid excellence and the Nagata property. Construct on affinoid charts and glue; quasi-separatedness is needed only to invoke the global Tate–Huber comparison. Stalk assertions below are at classical points, as in Conrad’s theorem.

Its API has the following properties, with the hypotheses of this subsection.

- The rigid space X^ν with the finite surjective morphism p : X^ν → X.
- For X = Spa(A, A°), X^ν = Spa(A^ν, A^ν°) with A^ν the integral closure of A_red in its total ring of fractions.
- Every local ring of X^ν is a normal domain.
- p is finite and surjective.
- For U ⊆ X open, p⁻¹(U) → U is the normalization of U.
- At every classical x, (`p_*O_(X^nu)`)_x is the normalization of (`O_(X,x)`)_red and is the product of `O_(X^nu,y)` over the finite fibre p⁻¹(x).
- The factorization X^ν → X_red is an isomorphism over the normal locus of X_red. The map X^ν → X itself has this property over the normal locus of X, which excludes nonreduced stalks.
- Let g : Y → X be a morphism from a normal rigid space such that, for every open U ⊆ X, the preimage of each nowhere dense Zariski closed subset of U is nowhere dense in g⁻¹(U). Then g factors uniquely through p.
- For X a scheme locally of finite type over K with normalization X̃, (X̃)^an → X^an is the normalization of X^an (Conrad Theorem 2.1.3).

One proof route is as follows. Affinoid case: Ã^ν is a finite A-module, because A is quasi-excellent, hence Nagata (SchemeAndStackFoundations §0.21), and the total ring of fractions of A_red is a reduced localization of A_red, so *IsNagata.integralClosure_finite* (SchemeAndStackFoundations §0.20) applies; Ã^ν is a quotient of a Tate algebra, hence affinoid; Spa(Ã^ν) → Spa(A) is finite (AdicSpacesPartII R0.13). Compatibility with affinoid subdomains (Conrad Theorem 1.2.2 and Corollary 1.2.3): A → A′ = O(V) is flat with A_n → A′_m inducing isomorphisms of completions at classical points, A′ ⊗_A Ã^ν is normal because Spa of it is an open of the normal space Spa(Ã^ν), and A′/p is reduced for minimal primes p of A; Conrad’s Theorem 1.2.2 then says A′ → A′ ⊗_A Ã^ν is the normalization of A′. Glue the affinoid normalizations along these canonical isomorphisms (the coherent-sheaf contract above: finite morphisms are coherent O_X-algebras, so gluing is gluing of a coherent algebra). At classical points the finite pushforward stalk is the product over the fibre, and is the integral closure of the reduced analytic stalk (Conrad Lemma 2.1.1). Universal property: Y is reduced, so g factors through X_red. Cover Y by affinoids V = Spa(B, B°) mapping into affinoids U = Spa(A, A°); B is reduced and integrally closed in its total ring of fractions, since its local rings are normal domains. If s ∈ A is a nonzerodivisor modulo the nilradical, it lies in no minimal prime of A, so V(s) is nowhere dense in U by §0.3(c); by hypothesis V(g^*(s)) ∩ V is nowhere dense, so g^*(s) lies in no minimal prime of B by §0.3(c) and is a nonzerodivisor of the reduced noetherian ring B. Hence a/s ↦ g^*(a)/g^*(s) embeds the elements of Ã^ν into the total ring of fractions of B, where they are integral over B and so lie in B. This is the unique A-algebra map Ã^ν → B; uniqueness glues the local factorizations.

*Needs:* RigidAnalyticGeometry §§6.2, 8.3; AdicSpacesPartII R1.1, R1.7; AdicSpacesPartII R0.13; the coherent-sheaf contract above; RigidAnalyticGeometry Layers 3–4; RigidAnalyticGeometry §8.1; AdicSpacesPartII R1.5; RigidAnalyticGeometry §1.2 (all-characteristic excellence); SchemeAndStackFoundations §§0.20–0.21; `IsIntegrallyClosed`; `IsReduced`; §0.5; §0.3 for the universal property.

**Checks.**

- The normalization of the cuspidal disc Spa(K⟨X,Y⟩/(Y² − X³)) is Spa(K⟨t⟩) → it, t ↦ (t², t³): bijective on points but not an isomorphism.
- The normalization of Spa(K⟨X,Y⟩/(XY)) is Spa(K⟨X⟩) ⊔ Spa(K⟨Y⟩), with two points over the origin.
- For X normal (for instance a polydisc or Spa K), p is the identity; the normalization of the empty space is empty.
- The normalization of Spa(K⟨T⟩/(T²)) is Spa(K), not Spa(K⟨T⟩/(T²)): a definition taking the integral closure of A itself rather than of A_red fails.
- For the nodal cubic y² = x²(x + 1) over K (char K ≠ 2), the analytification of its scheme normalization is the normalization of its analytification.
- For the cusp, the normalization t ↦ (t², t³) satisfies the hypothesis of the universal property; the nonzerodivisor X pulls back to t², and Y/X goes to t³/t² = t. The inclusion of the origin Spa K into Spa(K⟨X,Y⟩/(XY)) fails it, since the nowhere dense origin has the whole point as preimage, and it has two different lifts to the two normalization discs: uniqueness fails without the hypothesis.

### 1.2 Conrad's characterization of normalizations

(*normalization-characterisation*) Prove: A morphism f : Y → X of reduced rigid spaces over K is a normalization if and only if f is finite, Y is normal, and there is a nowhere dense Zariski closed Z ⊆ X with f⁻¹(Z) nowhere dense in Y such that f is an isomorphism over X − Z. When f is a normalization, O_X → f_*O_Y is injective and Z may be taken to be the support of its coherent cokernel, which is the non-normal locus of X. (CONRAD99 line 459, Theorem 2.1.2, pp. 10–11.)

X and Y reduced; nowhere density in the sense of §0.3.

One proof route is as follows. If f is a normalization: O_X → f_*O_Y is a monomorphism of coherent sheaves because X is reduced; the support Z of the cokernel is the non-normal locus, which is Zariski closed and nowhere dense with nowhere dense preimage by the corresponding facts for the excellent reduced coordinate rings (Conrad, proof of Theorem 2.1.2). Conversely, on affinoids write A → B for the finite map. A function in its kernel vanishes outside Z; since this complement meets every component and A is reduced, the kernel is zero. The same nowhere-density condition on B excludes additional vertical components. The resulting inclusion is birational at all minimal primes, so the normal finite algebra B is the integral closure of A. Since no minimal prime of A contains I and none of B contains IB, A → B is an isomorphism at generic points; a finite injection into a normal ring that is birational is the normalization.

*Needs:* §1.1; §0.3; §0.1; RigidAnalyticGeometry §8.1; AdicSpacesPartII R1.5.

**Checks.**

- The map t ↦ (t², t³) from the disc to the cuspidal disc satisfies the criterion with Z the cusp.
- The inclusion of one axis into Spa(K⟨X,Y⟩/(XY)) is finite with normal source and an isomorphism off the origin on that axis, but fails the criterion: the other axis is not nowhere dense.
- The disjoint union X ⊔ Spa K → X that is the identity on X and maps the extra point into Z is finite and generically an isomorphism, but its inverse image of Z contains an open component. The source-side nowhere-density condition excludes it.

### 1.3 Connected components of a rigid space

(*connected-components*) Construct as follows. A rigid space X over K is connected if it is nonempty and admits no covering by two disjoint nonempty open subspaces; equivalently it is nonempty and O_X(X) has no idempotents other than 0 and 1. The connected component of x ∈ |X| is the union of all connected open subspaces containing x; it is an open and Zariski closed subspace (clopen), the connected components partition X, a quasi-compact open meets only finitely many of them, and every union of connected components is clopen. They are the connected components of the topological space |X|; on a quasi-separated X they correspond under Huber's functor to Conrad’s connected components defined by chains of connected affinoids. (CONRAD99 lines 528–548, §2.1, pp. 11–12.)

X locally noetherian, so every affinoid open is a finite disjoint union of connected affinoid opens (idempotents of a noetherian ring).

Its API has the following properties, with the hypotheses of this subsection.

- X is connected iff |X| is nonempty and preconnected (Mathlib connectedness); equivalently X is nonempty and O_X(X) has no nontrivial idempotents.
- The connected component of x, an open and Zariski closed subspace containing x.
- Each connected component is open and Zariski closed; a union of components is clopen.
- A quasi-compact open meets only finitely many connected components.
- The connected components of X are the connected components of the topological space |X| (the topological connected-component quotient).
- Spa(A, A°) is nonempty and connected iff Spec A is nonempty and connected; the zero ring yields the empty space on both sides.
- The image of a connected rigid space under a morphism lies in one connected component.

One proof route is as follows. An affinoid Spa(A, A°) is connected iff A ≠ 0 and A has no nontrivial idempotent (sheafiness, AdicSpacesPartII R0–R1), and A = ∏ A e_i splits it into finitely many connected affinoids; so connected affinoid opens form a basis and |X| is locally connected. Hence topological connected components of |X| are open; being closed, each is the support of the idempotent ideal it defines, hence Zariski closed. Local finiteness: a quasi-compact open is a finite union of affinoids, each meeting finitely many components. Comparison with Conrad (§2.1, p. 11): chains of connected affinoids linking two points give the same equivalence relation as topological connectedness, by local connectedness.

*Needs:* RigidAnalyticGeometry §§6.2, 8.3; AdicSpacesPartII R1.1, R1.7; AdicSpacesPartII R0–R1; `ConnectedComponents`; `IsPreconnected`.

**Checks.**

- The closed unit disc and the annulus {|ϖ| ≤ |T| ≤ 1} are connected.
- Spa(K × K) has exactly two connected components, each a point.
- The empty rigid space is preconnected but not connected and has no connected components; Spa(K) is connected with one component.
- For A = K⟨X,Y⟩/(XY), Spec A and Spa(A,A°) are both connected: the only idempotents of A are 0 and 1, because an idempotent restricts to 0 or 1 on each axis with equal values at the origin. Each side has two irreducible components (§1.4), so connectedness is not irreducibility.
- The classical points of the closed unit disc split into the disjoint canonical-open sets {|T| < 1} and {|T| = 1}, yet the disc is connected: a definition through the canonical topology on classical points fails.

### 1.4 Irreducible components of a rigid space

(*irreducible-components*) Let p : X^ν → X be the normalization of a rigid space X over K. The irreducible components of X are the Zariski closed subsets X_i = p(X^ν_i), with their reduced structure, for X^ν_i running through the connected components of X^ν. X is irreducible if it is nonempty and has exactly one irreducible component; a Zariski closed subset Z is irreducible if Z_red is. The components cover X, are locally finite, and X_i ≠ X_j for i ≠ j. (CONRAD99 line 599, Lemma 2.2.1 and Definition 2.2.2, pp. 13–14, line 673, Theorem 2.2.4, and line 734, Corollaries 2.2.8–2.2.9, pp. 15–16; CONRAD10 line 189, Lemma 2.1.3, pp. 4–5.)

Irreducibility includes nonemptiness. Local analytic branches are measured on sufficiently small admissible neighbourhoods; no assertion identifies them with global components through the point. Component comparison under algebraic analytification is the separate supplier theorem in Scope and ownership.

Its API has the following properties, with the hypotheses of this subsection.

- The set of irreducible components of X, each a reduced Zariski closed subspace.
- Irreducible components of X ↔ connected components of X^ν, X_i = p(X^ν_i).
- X is irreducible iff X ≠ ∅ and X^ν is connected.
- Every point of X lies on some irreducible component; a quasi-compact open meets only finitely many.
- Every irreducible Zariski closed subset is contained in an irreducible component (Conrad 2.2.4(2)).
- Each reduced component has a nonempty normal Zariski open, disjoint from the other components, that is open in X_red; when X is reduced it is normal as an open of X itself.
- A locally finite, irredundant cover of X by irreducible Zariski closed subsets is the set of irreducible components (Conrad 2.2.8).
- For U ⊆ X open, each component of U lies in a unique component of X, and X_i ∩ U is a union of components of U (Conrad 2.2.9).
- On an irreducible X, dim_x X = dim X = dim X^ν for all x, and dim `O_(X,x)` = dim X at classical points (CONRAD99 lines 653–655, §2.2, p. 14, together with §0.2).
- A connected normal (for instance smooth) rigid space is irreducible: its normalization is itself. This agrees with the irreducibility of connected normal spaces in AdicSpacesPartII R1.9.

One proof route is as follows. Images: p is finite, so p(X^ν_i) is Zariski closed (§0.4). Use Conrad Lemma 2.2.1 after passage to X_red: different clopens in the normalization have different images, and each component has a nonempty normal open disjoint from the other components. Normality of this open refers to its reduced structure. The restriction of the normalization component to its image is a normalization. Hence components of X correspond bijectively to connected components of X^ν (Conrad Theorem 2.2.4(1)), every irreducible Zariski closed subset lies in a component (2.2.4(2)), and any union of components is the image of the corresponding union of components of X^ν, which is its normalization (2.2.4(3)). Local finiteness: a quasi-compact open of X has quasi-compact preimage in X^ν (p finite), which meets finitely many connected components.

*Needs:* §1.1; §1.2; §1.3; §0.4; §0.1; RigidAnalyticGeometry §7.3; AdicSpacesPartII R1.9.

**Checks.**

- Spa(K⟨X,Y⟩/(XY)) has exactly two irreducible components, V(Y) and V(X); it is connected, so components differ from connected components.
- Over a complete field of characteristic zero, the analytification of the integral cubic y² = x²(x+1) is globally irreducible. At (0,0), the convergent square root of 1+x factors the equation into two analytic branches, so its analytic local ring has two minimal primes. The normalization has two points over that node (t = ±1 under x=t²−1, y=t(t²−1)).
- The annulus Spa(K⟨X,Y⟩/(XY − c)), 0 < |c| < 1, is irreducible.
- The empty space has no irreducible components and is not irreducible; Spa(L) for L/K finite is irreducible.
- For X = Spec K[x,y]/(xy), the components of X^an are the analytified axes.
- A disjoint union of two discs is not irreducible though every point has an irreducible neighbourhood; a definition through local irreducibility fails.

### 1.5 Irreducible spaces: proper Zariski closed subsets are nowhere dense

(*irreducibility-criterion*) Prove: Let X be a nonempty rigid space over K. The following are equivalent: (a) X is irreducible; (b) X is not the union of two proper Zariski closed subsets; (c) the only Zariski closed subset of X containing a nonempty open subset of |X| is X itself. Consequently, if X is irreducible then every Zariski closed Z ⊊ X is nowhere dense: dim `O_(Z,z)` < dim `O_(X,z)` at every classical z ∈ Z and dim_z Z < dim_z X at every z ∈ Z. For X connected and normal (in particular smooth and connected) this is the identity principle of RigidAnalyticGeometry §7.3; AdicSpacesPartII R1.9 (Conrad Lemma 2.1.4). (CONRAD99 line 658, Lemma 2.2.3, p. 14.)

X nonempty. No reducedness is needed: all three conditions depend only on X_red.

One proof route is as follows. (a) ⇒ (b), (c): X^ν is connected and normal and p is surjective; if X = Z_1 ∪ Z_2 then X^ν = p⁻¹Z_1 ∪ p⁻¹Z_2, so one of them is X^ν by the identity principle on X^ν (RigidAnalyticGeometry §7.3; AdicSpacesPartII R1.9); if Z ⊇ U ≠ ∅ open, p⁻¹Z ⊇ p⁻¹U ≠ ∅, so p⁻¹Z = X^ν. (b) ⇒ (a): a decomposition of X^ν into two disjoint nonempty clopens U_1, U_2 gives X = p(U_1) ∪ p(U_2); if p(U_1) = X then p⁻¹p(U_1) − U_1 = U_2 is nowhere dense by Conrad Lemma 2.2.1(1), absurd. (c) ⇒ (b): if X = Z_1 ∪ Z_2 with Z_1 ≠ X, the nonempty Zariski open X − Z_1 lies in Z_2, so Z_2 = X. Nowhere density of proper Zariski closed subsets is (c) combined with §0.3.

*Needs:* §1.4; §1.1; §0.3; RigidAnalyticGeometry §7.3; AdicSpacesPartII R1.9.

**Checks.**

- In the closed unit disc every proper Zariski closed subset is a finite set of classical points; in a non-quasi-compact open disc such a subset can be infinite and locally discrete.
- Spa(K⟨X,Y⟩/(XY)) is the union of its two axes, so it is not irreducible, and the axis V(Y) is a proper Zariski closed subset that is not nowhere dense.
- The empty space is excluded from irreducibility even though the empty-set version of the binary-union condition is vacuous. The nonempty hypothesis prevents this mismatch.

### 1.6 Zariski closed subsets of full dimension

(*full-dimensional-closed-subset*) Prove: Let X be an irreducible rigid space over K of dimension d. (i) An irreducible Zariski closed Z ⊆ X with dim Z = d equals X; (ii) a Zariski closed Z ⊆ X with dim_z Z = d at some point z equals X. In particular, if X is smooth and connected and Z ⊆ X is Zariski closed with dim_z Z = dim X at one point, then Z = X; and if M is smooth and Y ⊆ M is a connected Zariski closed subset with dim_y Y = dim_y M at some y, then Y is the connected component of M through y. (CONRAD99 line 725, Corollary 2.2.7, p. 15; HK2 line 2602, proof of Theorem 9.1.3, p. 58.)

dim_z Z is the local dimension of Z_red at z (§0.2).

One proof route is as follows. An irreducible X has constant finite local dimension d. A proper Zariski closed Z is nowhere dense by the irreducibility criterion; the local dimension criterion then gives dim_z Z < d at every z ∈ Z. Thus dim_z Z = d at even one point forces Z = X. If dim Z = d, its bounded integer-valued local dimensions attain their supremum d. Apply the preceding argument; this includes the formulation where Z is irreducible. Smooth case: a smooth connected space is normal and connected, hence irreducible (§1.4), of constant local dimension. For Y ⊆ M connected, apply (ii) in the connected component M_0 ∋ y: Y ⊇ M_0, and Y ⊆ M_0 since Y is connected.

*Needs:* §1.4; §1.5; §1.1; §1.3; §0.2; RigidAnalyticGeometry §7.3; AdicSpacesPartII R1.9.

**Checks.**

- In the bidisc, the Zariski closed V(XY) has dimension 1 < 2, so it is a proper subset; a closed subdisc of the disc has full dimension but is not Zariski closed.
- For M the disjoint union of two closed discs and Y the first disc, Y is a connected Zariski closed subset with dim_y Y = dim_y M = 1. It is the connected component of M through y, not all of M; the conclusion Y = M needs M connected.
- For X = Spa L of dimension 0, the only nonempty Zariski subset is X; for the empty subset there is no point z at which full local dimension can be asserted.

### 1.7 Riemann extension theorem for normal rigid spaces

(*riemann-extension*) Prove: For a normal rigid space X over K and a nowhere dense analytic subset Z, every bounded analytic function on X − Z extends uniquely to X. K is any complete nontrivially nonarchimedean field; geometric normality is not required. (CONRAD10 line 154, Theorem 2.1.1 and its preceding paragraph, p. 4.)

Boundedness means a real bound for |h| on all rank-one points of X − Z. The local version assumes such a bound on the complement in each member of an affinoid cover of X, and then glues. Geometric normality and geometric connectedness are not hypotheses.

One proof route is as follows. Prove the bounded extension theorem on normal affinoid neighbourhoods, as in the arbitrary-field Riemann extension theorem stated by Conrad. Uniqueness follows from the identity principle, so the local extensions glue. The bounded-extension existence theorem is a separate substantial target; it does not follow from uniqueness or from preservation of connectedness by field extension.

*Needs:* RigidAnalyticGeometry §7.3; AdicSpacesPartII R1.9; §0.3.

**Checks.**

- For a connected normal X, an idempotent on X − Z is bounded by 1; its extension is still idempotent by density and the identity principle.
- For K = ℚ₃ and the unramified quadratic extension L = K(√2), X = Spa L is normal and connected, while L ⊗_K L ≅ L × L, so its scalar extension to L has two connected components. Connectedness is not preserved by extending K; the theorem and its proof stay over K and use ordinary normality.
- On the punctured disc the function 1/T has values |π|^(−n) at T = πⁿ and is unbounded. It does not extend across 0, so boundedness cannot be omitted.
- On the cusp, t = Y/X is bounded on the punctured curve and extends to its normalization but not to K⟨t²,t³⟩. Normality is necessary.

### 1.8 Dense Zariski opens of irreducible spaces are connected

(*dense-open-connected*) Prove: Let X be a rigid space over K and Z ⊆ X a nowhere dense Zariski closed subset. If X is connected and normal, then X − Z is connected. If X is irreducible, then X − Z is irreducible; in particular every nonempty Zariski open subset of an irreducible rigid space is irreducible and connected. (CONRAD10 line 211, proof of Lemma 2.1.3, p. 5; CONRAD99 lines 801–805, proof of Theorem 2.3.1, p. 17, for the connected-complement argument over an algebraically closed base; §1.7 supplies bounded extension over the original K.)

No geometric connectedness, geometric normality or characteristic-zero hypothesis. Use the original-field Riemann extension theorem.

One proof route is as follows. If X is connected and normal, a disconnection of X − Z supplies a bounded nontrivial idempotent. The Riemann extension theorem extends it to X. Its square minus itself vanishes on the dense complement, hence on X; connectedness forces the extension to be 0 or 1, a contradiction. For irreducible X, its normalization is connected and normal; the inverse image of Z is nowhere dense. Apply the normal case and use compatibility of normalization with open restriction: the normalization of X − Z is connected, so X − Z is irreducible. Its continuous surjective normalization also proves connectedness.

*Needs:* §1.5; §1.1; §1.3; §0.3; RigidAnalyticGeometry §7.3; AdicSpacesPartII R1.9; §1.7.

**Checks.**

- The punctured disc {0 < |T| ≤ 1} is connected.
- Removing the node from the analytified nodal cubic leaves a connected space; removing the origin from Spa(K⟨X,Y⟩/(XY)) disconnects it, which is allowed because that space is not irreducible.
- For X = Spa L, Z = ∅, the complement has one component. The empty space cannot be substituted for nonempty connected X.

### Examples

The cusp is normalized by t ↦ (t²,t³). The crossing XY = 0 normalizes to two discs, whereas the integral algebraic nodal cubic y² = x²(x+1), in characteristic zero, has one global analytic component and two analytic branches at its node. Its normalization parameter is x = t² − 1, y = t(t² − 1), with t = ±1 over the node. Removing those two points from the analytic affine line leaves a connected rigid space. The two cases distinguish local branches, global components and connected complements.

### Dependencies

Layer 0; the affine normalization and Nagata inputs; the coherent finite-algebra contract; native connected components; the normal connected identity principle. The connected-complement theorem uses bounded extension over the original K, without any connectedness assertion after field extension.

## Layer 2 (RZ.2): Regular and smooth loci, strata and differential rank

### 2.1 The singular locus of a rigid space

(*singular-locus*) Construct as follows. For a rigid space X over K, the singular (non-regular) locus Sing(X) ⊆ |X| is the Zariski closed subset whose trace on each affinoid open Spa(A, A°) is V(J_A), where V(J_A) ⊆ Spec A is the non-regular locus of the excellent ring A (Zariski closed, J_A radical). Its classical points are the classical x with `O_(X,x)` not regular. Reg(X) = |X| − Sing(X) is the regular locus. If X is reduced, Sing(X) is nowhere dense. (CONRAD99 line 329, §1.2, p. 7; BH22 line 346, Corollary 2.10, p. 8.)

Use all-characteristic affinoid excellence, its open regular locus and detection of local regularity by completion. No separability assumption is imposed on K.

Its API has the following properties, with the hypotheses of this subsection.

- Sing(X), a Zariski closed subset of |X|.
- A classical x lies in Sing(X) iff `O_(X,x)` is not a regular local ring.
- On Spa(A, A°), Sing = V(J_A) with V(J_A) the complement of the regular locus `TauCeti.Excellence.regularLocus` of A, which is open because A is excellent.
- If X is reduced, Sing(X) is nowhere dense.
- For U ⊆ X open, Sing(U) = Sing(X) ∩ U; for an étale (more generally smooth) f : Y → X, Sing(Y) = f⁻¹Sing(X).
- For a scheme X locally of finite type over K, Sing(X^an) = (Sing X)^an as reduced Zariski closed subsets; compare completed local rings at classical points and use equality of classical traces.

One proof route is as follows. For an affinoid A and a classical point x ↔ m, A_m and `O_(X,x)` have the same completion (RigidAnalyticGeometry §8.1; AdicSpacesPartII R1.5). The completion maps are flat local with closed fibre the residue field, so `TauCeti.isRegularLocalRing_iff_of_flat_of_map_maximalIdeal_eq` gives: `O_(X,x)` is regular iff A_m is regular iff m ∉ V(J_A). For an affinoid subdomain A → A′ and corresponding maximal ideals m and m′, the local map A_m → A′_m′ is flat (§0.5) and induces an isomorphism of completions, so m generates m′ and the same Tau Ceti theorem shows that A_m is regular iff A′_m′ is. For smooth f the induced flat local maps have geometrically regular, hence regular, closed fibres (§0.5): regularity descends by `TauCeti.IsRegularLocalRing.of_flat_of_isLocalHom` and ascends by gap:regular-local-flat-transfer, which gives Sing(Y) = f⁻¹Sing(X). Thus J_A A′ and `J_(A')` have the same vanishing locus on classical points; the Jacobson property identifies their radicals, so these closed subsets glue. Nowhere density for reduced X: a reduced excellent ring is regular at its minimal primes (localizations are fields), so J_A is contained in no minimal prime; apply §0.3(c).

*Needs:* §0.1; §0.3; RigidAnalyticGeometry §8.1; AdicSpacesPartII R1.5; RigidAnalyticGeometry §§1.1–1.2; RigidAnalyticGeometry §1.2 (all-characteristic excellence); SchemeAndStackFoundations §0.21; `TauCeti.Excellence.regularLocus`; `TauCeti.isRegularLocalRing_iff_of_flat_of_map_maximalIdeal_eq`; `IsRegularLocalRing`; §0.5; for the smooth-pullback clause also `TauCeti.IsRegularLocalRing.of_flat_of_isLocalHom` and gap:regular-local-flat-transfer.

**Checks.**

- Sing(Spa(K⟨X,Y⟩/(Y² − X³))) is the single classical point X = Y = 0.
- Sing(Spa(K⟨X,Y⟩/(XY))) is the origin.
- Sing of a polydisc, of Spa K and of the empty space is empty.
- For X = Spec K[x,y]/(y² − x³), Sing(X^an) is the analytification of the closed point (0,0).
- Sing(Spa(K⟨T⟩/(T²))) = |X|; a statement of nowhere density without the reducedness hypothesis fails here.

### 2.2 Smooth equals regular over a perfect field

(*smooth-iff-regular*) Prove: Let K be perfect (in particular it may have characteristic 0) and X be a rigid space over K. For x ∈ |X|, X → Spa(K, K°) is smooth on a neighbourhood of x if and only if x ∉ Sing(X). At such points `Omega_(X/K)` is locally free of rank dim_x X, and for a classical point x with residue field k(x) the completed local ring `Ohat_(X,x)` is a formal power series ring over k(x) in dim_x X variables. Hence the smooth locus X^sm is the Zariski open Reg(X), dense when X is reduced. (CONRAD99 line 1010, proof of Lemma 3.3.1, pp. 21–22.)

Perfectness ensures that every finite classical residue extension is separable. Without it regular and smooth need not coincide.

One proof route is as follows. Smooth morphisms are locally étale over relative polydiscs. At a classical point an étale map gives the corresponding completed local algebra after the finite separable residue-field extension, not necessarily an isomorphism with the unextended target completion. The local map is flat and the maximal ideal of the target generates that of the source, so `TauCeti.isRegularLocalRing_iff_of_flat_of_map_maximalIdeal_eq` transports regularity from the polydisc to the source local ring. Regular ⇒ smooth at classical points: if `O_(X,x)` is regular of dimension d with k(x)/K separable, `Ohat_(X,x)` ≅ k(x)⟦t_1, …, t_d⟧, so `Omega_(X/K,x)` ⊗ `Ohat_(X,x)` is free of rank d; hence `Omega_(X/K)` is free of rank d near x, and the Jacobian criterion (AdicSpacesPartII R0.15–R0.17, in a local closed embedding into a polydisc) gives smoothness near x (CONRAD99 line 1008, proof of Lemma 3.3.1). Identify the two Zariski open loci by their classical traces, using the coherent Jacobian description of the smooth locus and the Jacobson property. Arbitrary topological open subsets are not being compared merely by density. Rank: on a smooth neighbourhood, rank Ω = dim of the étale-local polydisc = dim_x X (AdicSpacesPartII R0.15–R0.17).

*Needs:* §2.1; §0.2; AdicSpacesPartII R0.15–R0.17; RigidAnalyticGeometry §§1.1–1.2; `TauCeti.isRegularLocalRing_iff_of_flat_of_map_maximalIdeal_eq`.

**Checks.**

- The smooth locus of the analytified nodal cubic is the complement of the node.
- Over an imperfect field of characteristic p the statement fails: Spa(k⟨T⟩[Y]/(Y^p − a)) with a ∉ k^p is regular but not smooth.
- For Spa K, the local ring and completion are K and the cotangent rank is 0. Over imperfect K of characteristic p, K(a^(1/p)) is a regular field but Ω over K has dimension 1; it is not smooth.

### 2.3 Tangent spaces and differentials at classical points

(*tangent-space*) Construct as follows. Let X be a rigid space over K and x a classical point with residue field k(x). The Zariski tangent space is T_x X = `Hom_(k(x))`(m_x/m_x², k(x)), m_x ⊆ `O_(X,x)`. A morphism f : X → Y induces df_x : T_x X → `T_(f(x))` Y `tensor_[k(f(x))]` k(x). If k(x) = K (or k(x)/K is separable), T_x X is dual to `Omega_(X/K)` ⊗ k(x); for a K-rational point of a smooth X, dim T_x X = dim_x X, and df_x is the fibre at x of the dual of f^*`Omega_(Y/K)` → `Omega_(X/K)`. For L/K a complete extension and x ∈ X(L), T_x X_L is defined the same way on X_L = X ×_K Spa L. (SCHNEIDER11, §9, Lemma 9.2 and Remark 9.4, pp. 56–59 (uncertified); HK2 line 2602, proof of Theorem 9.1.3, p. 58.)

Intrinsic tangent spaces use classical points. For general, possibly inseparable residue extensions, use the relative cotangent fibre for differential ranks; compare it with m_x/m_x² only when k(x)/K is separable. An L-point for a complete extension is a rational point of X_L.

Its API has the following properties, with the hypotheses of this subsection.

- T_x X = `Hom_(k(x))`(m_x/m_x², k(x)) for a classical point x.
- df_x : T_x X → `T_(f(x))` Y ⊗ k(x), with d(g ∘ f)_x = `dg_(f(x))` ∘ df_x and d(id)_x = id.
- For x K-rational, T_x X ≅ Hom_K(`Omega_(X/K)` ⊗ k(x), K).
- If X is smooth at a K-rational x, dim T_x X = dim_x X; in general dim T_x X ≥ dim `O_(X,x)` with equality iff `O_(X,x)` is regular.
- For a locally closed immersion, df_x is injective.
- For L/K complete and x ∈ X(K), T_x(X_L) = T_x X ⊗_K L.
- For a scheme X of finite type and a closed point x, T_x(X^an) = T_x X.

One proof route is as follows. m_x/m_x² is finite over k(x) because `O_(X,x)` is noetherian; the completion does not change it (RigidAnalyticGeometry §8.1; AdicSpacesPartII R1.5). Functoriality and the chain rule: f^♯ : `O_(Y,f(x))` → `O_(X,x)` is local, inducing `m_(f(x))`/`m_(f(x))`² ⊗ k(x) → m_x/m_x², whose dual is df_x; composition is respected. Comparison with differentials at a rational point: the map m_x/m_x² → `Omega_(X/K)` ⊗ k(x), g ↦ dg, is an isomorphism for k(x) = K (continuous differentials, the continuous-differential sheaf contract above). Smooth case: `Omega_(X/K)` is locally free of rank dim_x X (§2.2).

*Needs:* RigidAnalyticGeometry §8.1; AdicSpacesPartII R1.5; the continuous-differential sheaf contract above; §2.2; `IsLocalRing`; `Module.finrank`.

**Checks.**

- For the closed unit polydisc D^n and x = 0, T_0 D^n = K^n with basis ∂/∂T_i.
- For f(z) = z² on the disc (char K ≠ 2), df_a = 2a; it vanishes only at a = 0.
- T_x Spa(K) = 0, and for X = Spa(K⟨T⟩/(T²)) at its point, T_x X = K although dim X = 0.
- For the affine line A¹_K and x = 0, T_0((A¹)^an) = T_0 A¹ = K.
- At the cusp of Spa(K⟨X,Y⟩/(Y² − X³)), dim T_x = 2 > 1 = dim_x X: tangent dimension does not compute dimension at singular points.

### 2.4 Stratification of a reduced space by smooth locally closed subspaces

(*singular-stratification*) Prove: Let K be perfect and Y be a reduced rigid space over K of finite dimension d (not necessarily quasi-compact). Put Y_0 = Y and `Y_(i+1)` = Sing(Y_i) with its reduced structure. Then dim `Y_(i+1)` < dim Y_i whenever Y_i ≠ ∅, so `Y_(d+1)` = ∅, and |Y| is the disjoint union of the finitely many locally closed subspaces Y_i − `Y_(i+1)` (0 ≤ i ≤ d), each smooth over K and Zariski open in the Zariski closed Y_i. Every point of Y lies on exactly one stratum. (HK2 line 2581, proof of Theorem 9.1.3, p. 57; BH22 line 346, Corollary 2.10, p. 8.)

Finite dimension bounds the number of strata, including for non-quasi-compact spaces. All successive singular subsets have their reduced induced structures. Perfectness of K enters only through §2.2, which makes the regular strata smooth.

One proof route is as follows. Y_i is reduced and Zariski closed in Y; Sing(Y_i) is nowhere dense in Y_i (§2.1), so dim_z `Y_(i+1)` < dim_z Y_i at every z ∈ `Y_(i+1)` (§0.3(e)), whence dim `Y_(i+1)` ≤ dim Y_i − 1. Y_i − `Y_(i+1)` = Reg(Y_i) is smooth over K (§2.2) and open in Y_i. Disjointness and covering: z ∈ Y lies in Y_i − `Y_(i+1)` for the largest i with z ∈ Y_i.

*Needs:* §2.1; §2.2; §0.3; §0.2; §0.1.

**Checks.**

- For the union of a plane and a line meeting it in a point inside the 3-dimensional polydisc, Y_1 is the intersection point and Y_2 = ∅.
- For the cuspidal disc, the strata are the punctured cuspidal curve and the cusp.
- For a reduced zero-dimensional space, Y₁ = ∅ and there is one smooth stratum. For the empty space there are no strata. Taking reduced singular sets is essential: the unreduced double point would otherwise persist.

### 2.5 Zariski-open loci of maximal rank of a differential

(*rank-loci*) Prove: Let f : V → W be a morphism of smooth rigid spaces over K. For r ≥ 0 let `V_(>=r)` be the set of x ∈ |V| at which the map f^*`Omega_(W/K)` ⊗ k(x) → `Omega_(V/K)` ⊗ k(x) has rank ≥ r. Then `V_(>=r)` is Zariski open: locally, in coordinates where Ω_V and Ω_W are free, it is the complement of the common zero locus of the r × r minors of the Jacobian matrix. If V is connected and r_max = max_x rank, then `V_(>=r_max)` is a nonempty Zariski open subset whose complement is nowhere dense, and on it rank df_x = r_max at every classical point x (rank of df_x on T_x `V_(k(x))`). (HK2 line 2590, proof of Theorem 9.1.3, pp. 57–58.)

V, W smooth over K, so Ω_V and Ω_W are locally free of finite rank (AdicSpacesPartII R0.15–R0.17). Define rank at every point using the fibre of f^*`Omega_(W/K)` → `Omega_(V/K)`. Its dual agrees with the map on m/m² tangent spaces at rational points and at classical points with separable residue extension; do not assert this comparison at arbitrary inseparable classical points.

One proof route is as follows. Locally Ω_V and f^*Ω_W are free with bases dT_j, f^*dS_i; the map is given by the Jacobian matrix (∂f_i/∂T_j), and rank ≥ r at x iff some r × r minor does not vanish at x; the ideal of minors is coherent, so `V_(>=r)` is Zariski open. Rank is lower semicontinuous and bounded by dim W, so r_max is attained; `V_(>=r_max)` is nonempty Zariski open. Its complement is a proper Zariski closed subset of the connected smooth, hence irreducible, V (§1.4), so it is nowhere dense (§1.5). On `V_(>=r_max)` the rank is ≥ r_max and ≤ r_max, hence constant. The field-valued matrix rank equals the largest order of a nonzero minor. This is linear algebra applied to the actual continuous-cotangent fibres, with zero minors and empty matrices treated by the rank-zero convention.

*Needs:* §2.3; §1.5; §1.4; §0.1; AdicSpacesPartII R0.15–R0.17; the continuous-differential sheaf contract above; `Matrix.rank`; `Matrix.det`.

**Checks.**

- For f(z) = z² on the disc (char K ≠ 2), `V_(>=1)` = D − {0} and r_max = 1.
- For a constant map `V_(>=0)` = V and r_max = 0; for the identity of D^n, r_max = n everywhere.
- For r = 0 the empty minor is 1 and `V_(>=0)` = V. For r greater than both cotangent ranks every minor vanishes and the locus is empty. These fix both boundary conventions.

### Examples

The cusp has dimension 1, tangent dimension 2 and singular set {0}; its two strata are the punctured curve and the origin. A plane and a line meeting only at the origin in the tridisc have singular set {0}, then empty singular set after reduction. For T ↦ T² the differential is 2T, giving rank 1 off the origin when char K ≠ 2, and rank 0 everywhere in characteristic 2.

### Dependencies

Layers 0–1; all-characteristic affinoid excellence; Tau Ceti's regular locus and flat-local regularity transfer, with gap:regular-local-flat-transfer for smooth pullback; continuous differentials, smooth local structure and the Jacobian criterion. Smooth stratification requires finite dimension and perfect K; the resolution application specializes to characteristic zero.

## Layer 3 (RZ.3): Classical points, finite-extension classes and Gauss closure

### 3.1 Finite-extension points and change of the field of definition

(*rigid-analytic-point*) For a rigid space X over K, a finite-extension point is a pair (L, s), where L/K is finite and s : Spa(L, L°) → X is a K-morphism. Identify (L, s) and (M, t) when their pullbacks to a common finite K-extension agree, allowing K-embeddings of both fields. The relation is reflexive, symmetric and transitive, and the image in |X| is constant on its classes. More generally the same common-extension relation defines point classes of any covariant field-valued functor on finite K-extensions. The induced maps for field embeddings are contravariant on spectra. (HK2 line 691, Definition 2.2.1(1), p. 15.)

For an arbitrary field-valued functor, use the equivalence relation generated by common-extension equality; for rigid spaces the relation itself is transitive by amalgamating finite extensions over the common embedded residue field.

Its API has the following properties, with the hypotheses of this subsection.

- Finite-extension point data consist of the field and the actual rigid morphism, with its classical image.
- Common-extension equivalence preserves the image point and commutes with a rigid morphism X → Y.
- Replacing L by a finite extension changes the representative but not its class.
- For the field-valued functor of maps Spd L → S over Spd K, these pairs are precisely the rigid analytic points of S in Howe–Klevdal’s terminology; the diamond comparison is a downstream interpretation.

One proof route is as follows. Finite extensions have common finite overfields, and the fibre of X(L) over a classical image x is the set of K-embeddings k(x) → L. Amalgamate the field embeddings over k(x). This proves transitivity and identifies the image map. The restriction of the point functor of a diamond to finite extensions has the same definition, without making diamond geometry an input to rigid geometry.

*Needs:* RigidAnalyticGeometry §§1.1–1.2; RigidAnalyticGeometry §§6.2, 8.3; AdicSpacesPartII R1.1, R1.7.

**Checks.**

- Spa K over itself has one class, represented by the identity.
- For a Galois extension L/K of degree n, its n automorphism maps Spa L → Spa L are different representatives of the same class over K; treating representatives as classes gives n instead of 1.
- For the disc, representatives over L are elements of L° and their classes correspond to the maximal ideals of K⟨T⟩.
- A map from a completed algebraic closure is excluded when that field is not finite over K; it is a geometric point rather than finite-extension point data.

### 3.2 Point classes and classical images

(*classical-points-rigid-analytic-points*) Prove: The image map is a bijection from common-finite-extension classes of points of a rigid K-space X onto its classical points. For each finite L/K, X(L) is the set of pairs (x, ι), with x classical and ι : k(x) → L a K-embedding. When a diamond point functor is identified with X(L) on all finite extensions, this same bijection identifies its rigid analytic point classes with classical points of X. (HK2 line 699, Remark 2.2.2, p. 15.)

The final formulation is the naturality statement for an identification of field-valued functors; the geometric full-faithfulness comparison is owned by the diamond consumer. No seminormality condition is imposed on X for the rigid statement.

One proof route is as follows. Every representative has a finite residue-field image. Representatives over the same x become equal after embedding their coefficient fields over k(x) into a common finite extension. Conversely equality after extension forces equality of images. The representative with field k(x) proves surjectivity.

*Needs:* §3.1; RigidAnalyticGeometry §§1.1–1.2.

**Checks.**

- On the disc over a characteristic-zero L, point classes are Galois orbits of integral elements algebraic over L; over a fixed L′, the representatives are `O_(L')`.
- For G = G_a, the only rigid analytic point of the B_dR⁺ affine Grassmannian Gr_G is 0 (HK2 line 1458, Example 5.0.5, p. 32); its geometric points cannot be identified with finite-extension point classes.
- For G = G_m, the B_dR⁺ affine Grassmannian is the constant sheaf ℤ: the lattices tⁿB_dR⁺ give one rigid analytic point per n ∈ ℤ. The assertion for G_a cannot be applied to G_m.

### 3.3 The L-points of a polydisc with the subspace topology

(*polydisc-points-topology*) Prove: Let L be a complete nonarchimedean field with nontrivial absolute value and D = Spa(L⟨T_1, …, T_n⟩, L°⟨T_1, …, T_n⟩) the closed unit polydisc. Use the supplied injectivity of O_L^n → |D|, a ↦ the classical point T = a. Prove that with the subspace topology on its image D(L) ⊆ |D| it is a homeomorphism onto D(L) from O_L^n with its valuation topology. Hence D(L) is a complete metric space and a Baire space. (HK2 line 2723, proof of Lemma 9.3.5, p. 60.)

L is not required to be discretely valued; the polydisc is the unit one.

One proof route is as follows. Injectivity is the supplied field specialization of `TauCeti.ValuationSpectrum.classicalPoint_injective_of_isField`. A rational domain pulls back to inequalities |f_i(a)| ≤ |g(a)| ≠ 0. Around an a satisfying them, choose a small ball on which |g| is constant and each f_i changes by less than |g(a)|. The ultrametric inequality preserves the weak inequalities on that ball. Thus the inverse image is open; ordinary continuity alone would not justify weak inequalities. Openness onto the image: the ball {|T_i − a_i| ≤ |c|} (c ∈ L^×) is a rational subset whose L-points are exactly the corresponding ball of O_L^n; balls form a basis of O_L^n. O_L^n is closed in the complete finite product L^n, so it is complete. Obtain its BaireSpace instance by the complete-metric Baire theorem.

*Needs:* §3.1; `TauCeti.ValuationSpectrum.closedPolydisc`; `TauCeti.ValuationSpectrum.classicalPoint`; `TauCeti.ValuationSpectrum.classicalPoint_injective_of_isField`; `BaireSpace`; `IsUltrametricDist`.

**Checks.**

- If L̃ is infinite and n ≥ 1, D(L) is not closed, since its closure contains the nonclassical Gauss point (§3.4). Over ℚ_p, D(ℚ_p) = ℤ_p is closed in the one-dimensional disc. For x outside ℤ_p, continuity of its valuation gives a rational neighbourhood excluding a sufficiently small ball around each a ∈ ℤ_p; compactness of ℤ_p reduces these exclusions to finitely many. For example, η has the rational neighbourhood |Tᵖ − T| ≥ 1 disjoint from ℤ_p, while the point T = √p has |T² − p| ≤ |p|² as such a neighbourhood (p = 2 and 3 included).
- For n = 0, D(L) is the single point Spa L.
- A rational trace |T−a| ≤ |π|ᵏ is an open and closed metric ball among rational points. The rational inequality is weak but its trace is open by the ultrametric law; ordinary real continuity alone would not justify this.

### 3.4 A closed set containing the rational points of a disc contains its Gauss point

(*gauss-point-in-closure*) Prove: Let L be a complete nonarchimedean field whose residue field L̃ is infinite, D the closed unit polydisc of dimension n over L and η ∈ |D| its Gauss point, the rank-one point |Σ a_α T^α|_η = max_α |a_α|. Then every open neighbourhood of η in |D| contains L-points; more precisely a rational neighbourhood {|f_i| ≤ |g|} of η normalised so that |g|_η = 1 (so g ∈ L°⟨T⟩ with nonzero reduction ḡ ∈ L̃[T]) contains every a ∈ O_L^n whose reduction ā satisfies ḡ(ā) ≠ 0, and such a exist. Consequently a closed subset of |D| containing D(L) contains η, and a closed subset of a rigid space S containing the L-points of an affinoid neighbourhood isomorphic to a closed polydisc contains the corresponding Gauss point. If L̃ is finite and n ≥ 1 the conclusion fails; in dimension 0 it holds over every L. The Lean headline `gaussPoint_mem_closure_rationalPoints` asserts existence together with this closure property for every n, using `IsUnitGaussPoint` to specify the valuation class on the native polydisc. (HK2 line 2730, proof of Lemma 9.3.5, p. 60; BH22 line 228, Example 2.1, p. 6.)

The residue field is infinite. Normalize a nonzero denominator by a coefficient attaining its Gauss norm. The supplied one-variable Gauss valuation is used on its native carrier; in several variables use `MvPowerSeries.IsRestricted.gaussNorm_mul` through `TauCeti.Huber.restrictedMvPowerSeriesGaussEquiv` to obtain the multiplicative norm on the native ring; its comparison specifies the valuation class.

One proof route is as follows. Normalise: at η, |g|_η = 1 > 0, so scaling makes g ∈ L°⟨T⟩ with Gauss norm 1; then |f_i|_η ≤ 1 forces f_i ∈ L°⟨T⟩. Its reduction ḡ ∈ L̃[T_1, …, T_n] is a nonzero polynomial; since L̃ is infinite, ḡ(ā) ≠ 0 for some ā ∈ L̃^n (Mathlib MvPolynomial.funext over an infinite field); lift to a ∈ O_L^n . Then |g(a)| = 1 and |f_i(a)| ≤ 1 = |g(a)|, so x_a lies in the neighbourhood. Rational subsets containing η form a neighbourhood basis of η, so every open neighbourhood of η meets D(L); a closed set containing D(L) contains η. Failure for finite L̃ = F_q, n = 1: the rational subset {|T^q − T| ≥ 1} = {1 ≤ |T^q − T|} contains η (|T^q − T|_η = 1) but no point of O_L, where |a^q − a| < 1.

*Needs:* `MvPowerSeries.IsRestricted.gaussNorm_mul`; `TauCeti.Huber.restrictedMvPowerSeriesGaussEquiv`; §3.3; §3.1; `TauCeti.ValuationSpectrum.closedPolydisc`; `MvPowerSeries.gaussNorm`; `MvPolynomial.funext`; `MvPolynomial`.

**Checks.**

- Over L = `Q_p^ur`-completion (residue field F̄_p), the open neighbourhood {|T| ≥ 1} ∩ {|T − 1| ≥ 1} of η contains the L-point T = ζ for a root of unity ζ ≠ 1 of order prime to p.
- Over Q_p (residue field F_p), {|T^p − T| ≥ 1} is an open neighbourhood of the Gauss point of the disc containing no Q_p-point.
- For n = 0, D⁰(L) and the Gauss point coincide, without a residue-infinitude hypothesis. For n ≥ 1 the finite-residue negative control above excludes dropping that hypothesis.

### Examples

On the disc over the completion of ℚ_p^ur, choose a prime-to-p root of unity ζ with reduction distinct from 0 and 1. Then T = ζ satisfies |T| = |T−1| = 1 and belongs to the Gauss neighbourhood defined by those inequalities. Over residue field 𝔽_q, |T^q−T| = 1 at the Gauss point but |a^q−a| < 1 at every rational integral a. The same argument works for q = 2 and 3. In dimension zero there is one rational point and it is the Gauss point.

### Dependencies

Native polydisc, evaluation and Gauss-norm carriers; supplied classical points and their density; finite extension amalgamation; polynomial uniqueness over infinite residue fields; complete-metric Baire. No analytic manifold or diamond construction is an input.

## Layer 4 (RZ.4): Specialization, Shilov points and residue transcendence

### 4.1 Reduction of an affinoid and the specialisation map

(*specialisation-map*) Construct as follows. For a K-affinoid algebra A, use the supplied power-bounded ring A°, topologically nilpotent ideal A°° and canonical reduction Ã = A°/A°°, a K̃-algebra of finite type. The specialisation map sp : Spa(A, A°) → Spec Ã sends x to the prime ideal {a ∈ A° : |a(x)| < 1}/A°°. It is continuous and surjective, functorial for morphisms of affinoids (through φ̃ : Ã → B̃), sends classical points to closed points, and for the closed unit polydisc sends the Gauss point to the generic point of Spec K̃[T_1, …, T_n]. (BH22 line 235, Proposition 2.2 and proof, pp. 6–7.)

Canonical reduction, including its finite-type K̃-algebra structure, is consumed from the affinoid supplier. The map here is the canonical-reduction map on adic points, distinct from any choice of formal model.

Its API has the following properties, with the hypotheses of this subsection.

- sp : Spa(A, A°) → PrimeSpectrum Ã, x ↦ {a ∈ A° : |a(x)| < 1}/A°°.
- sp is continuous: sp⁻¹D(ā) = {|a| = 1}.
- sp is surjective.
- For φ : A → B, sp_A ∘ Spa(φ) = Spec(φ̃) ∘ sp_B.
- Classical points specialise to closed points of Spec Ã.

One proof route is as follows. sp(x) is prime: {a ∈ A° : |a(x)| < 1} is the preimage of the maximal ideal of the valuation ring of x, and contains A°° because topologically nilpotent elements have |a(x)| < 1. Continuity: for a ∈ A°, sp⁻¹(D(ā)) = {x : |a(x)| ≥ 1} = {x : |a(x)| = 1}, a rational subset, hence open. For surjectivity choose an open bounded topologically finitely presented K°-algebra A₀ ⊆ A° with Spec Ã → Spec(A₀/t) a universal homeomorphism, as in BH22 line 243. The contraction of sp(x) to A₀/t is the formal specialization λ(x) = {a ∈ A₀ : |a(x)| < 1}, so it suffices to show that λ : Spa(A, A°) = d(Spf A₀) → |Spf A₀| is onto. Fix a point p₀ of the special fibre. By AdicSpacesPartIII R2.4 (v), `specialisationLimitHomeomorph`, λ is the projection of a homeomorphism d(Spf A₀) ≅ lim |X′| over the cofiltered system of admissible blow-ups X′ → Spf A₀. Each admissible blow-up is surjective on special fibres (AdicSpacesPartIII R2.5, `admissibleBlowUp.isProper_surjective_specialFibre`), so the fibres F(X′) over p₀ are nonempty. The point p₀ is pro-constructible in the spectral space |Spf A₀|, so each F(X′) is pro-constructible, hence compact in the Hausdorff constructible topology, and the spectral transition maps are continuous for these topologies (AdicSpacesPartII R0.19.1–R0.19.2). A cofiltered limit of nonempty compact Hausdorff spaces is nonempty (Mathlib `TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system`); a point of lim F(X′) is a point of d(Spf A₀) with λ equal to p₀. This uses a specified model comparison, rather than a bare valuation of the reduction with no lift to A. Functoriality: φ(A°) ⊆ B°, φ(A°°) ⊆ B°° (RigidAnalyticGeometry §§2.1–2.2) and sp_A ∘ Spa(φ) = Spec(φ̃) ∘ sp_B. A classical point maps to a maximal ideal: its residue field is finite over K, so the image is a point whose residue field is finite over K̃.

*Needs:* RigidAnalyticGeometry §§2.1–2.2; RigidAnalyticGeometry §§1.1–1.2; AdicSpacesPartIII R2.4–R2.5; AdicSpacesPartII R0.19.1–R0.19.2; `TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system`; `TauCeti.Huber.powerBoundedSubring`; `TauCeti.Huber.topologicallyNilpotentIdeal`; `PrimeSpectrum`.

**Checks.**

- For A = K⟨T⟩: Ã = K̃[T], sp(Gauss point) = (0), and sp(T = a) = (T − ā) for a ∈ K°.
- For A = K⟨X, Y⟩/(XY − c), 0 < |c| < 1, Ã = K̃[X, Y]/(XY), whose two generic points are the specialisations of the Gauss points of the two boundary circles.
- For A = K, Ã = K̃ and sp maps the single point to the single point.
- For A = K⟨T⟩, the power-bounded subring is K°⟨T⟩ and the topologically nilpotent ideal consists of restricted series of norm less than 1.
- sp is not injective: on the disc, all points of the open residue disc {|T| < 1} (classical and not) specialise to the closed point T = 0.

### 4.2 Four characterizations of Shilov points

(*shilov-point-characterisation*) Prove: Let A be a K-affinoid algebra and x ∈ Spa(A, A°) a rank-one point. The following are equivalent: (1) sp(x) is the generic point of an irreducible component of Spec Ã; (2) {x} = sp⁻¹(sp(x)); (3) the valuation ring K_x^+ of the completed residue field of x is the t-adic completion of the local ring of Spec A° at sp(x) (t a pseudo-uniformizer of K); (4) the seminorm |·|_x lies in the Shilov boundary of the Banach K-algebra A. (BH22 line 235, Proposition 2.2, pp. 6–7, and line 295, Remark 2.3, p. 7.)

A is K-affinoid; the equivalences fail for general complete Tate rings (Bhatt–Hansen, Remark 2.3: a perfectoid counterexample).

Construct the rank-one comparison map from the rank-one locus of Spa(A,A°) to the supplied `Huber.GelfandSpectrum` of A, sending x to the real-valued multiplicative seminorm representing its valuation class and restricting to the fixed absolute value on K. Normalization on K makes this representative unique. For nonzero A, the Shilov boundary means the smallest closed subset of this Banach spectrum on which the spectral supremum of every f ∈ A is attained; prove its existence together with the characterization above. For the zero algebra define the boundary to be empty and the spectral supremum to be 0, without asserting attainment at a point. Closedness here uses the pointwise topology of the Banach spectrum. The comparison concerns rank-one points, not all adic points.

One proof route is as follows. Choose an open bounded topologically finitely presented K°-subalgebra A_0 ⊆ A° with A° integral over A_0 and Spec Ã → Spec(A_0/t) a universal homeomorphism (Noether normalization and the canonical-reduction comparison in BH22 line 243); describe Spa(A, A°) = d(Spf A_0) as the limit of the underlying spaces of the admissible blow-ups X_i → Spf A_0, with O^+ the limit of their structure sheaves, by the Zariski–Riemann description of AdicSpacesPartIII R2.4 (v) (`specialisationLimitHomeomorph`). At a generic point of the canonical reduction, take the inverse-image prime in A° before localizing, and then take the separated t-adic completion. The generic valuation construction, using finite Noether normalization and valuation extension, gives the rank-one completed valuation ring and the singleton fibre. The reduction ring itself has t = 0 and cannot be the valuation ring. (2) ⇒ (3): the local rings of the X_i at the unique preimages are integral over `A_(0,sp(x))` and isomorphisms after inverting t; the t-completed colimit is integrally closed, hence equals the completed local ring of A°. (3) ⇒ (2): points of Spa are classes of maps A_0 → V to t-complete valuation rings. (2) ⇒ (1): if sp(x) were not generic, a valuation of the function field of a component through it, centred at sp(x), composed with K_y^+ for a lift y of the generic point, gives a rank ≥ 2 point over sp(x) different from x. Use the rank-one comparison map to the Banach spectrum supplied by AdicSpacesPartIII R3.9 and its smallest closed spectral-norming boundary, as in Bhatt–Hansen Proposition 2.2(4). This is a target comparison on these carriers, not an identification of all adic points with the Banach spectrum.

*Needs:* §4.1; RigidAnalyticGeometry §§1.1–1.2; RigidAnalyticGeometry §§2.1–2.2; AdicSpacesPartIII R2.4–R2.5; AdicSpacesPartIII R3.9, gelfand-spectrum-banach-ring.

**Checks.**

- For the disc, (2) holds at η: only η specialises to the generic point; for a classical point the fibre sp⁻¹(sp(x)) is a whole residue disc.
- For XY = c, 0 < |c| < 1, the fibres over (Y) and (X) are the singletons with (|X|,|Y|) = (1,|c|) and (|c|,1). Thus the following Shilov API gives cardinalities 1 for the disc and 2 for this annulus.
- In ℚ_p⟨T⟩, the boundary is {η} and the spectral supremum of p + T² is max(|p|,1) = 1.
- In K[ε]/(ε²), every spectral seminorm has |ε| = 0 since |ε|² = 0, although the maximum norm gives ‖ε‖ = 1; the spectrum is that of K and the boundary is its single point.
- For the zero algebra spectrum and boundary are empty and the spectral supremum is 0.
- For A = K⟨ε⟩/(ε²), Ã = K̃ and Spa A has one point; the completed localization of A° kills the nilpotent and yields K°. Completing the reduction instead gives a ring with t = 0, which cannot yield this valuation ring.

### 4.3 Shilov points of an affinoid

(*shilov-point*) Let A be a K-affinoid algebra. A point x ∈ Spa(A, A°) is a Shilov point if it has rank one and sp(x) is the generic point of an irreducible component of Spec Ã. The Shilov points form a finite set, at most one over each generic point of Spec Ã. (BH22 line 310, Definition 2.4, p. 7, and line 235, Proposition 2.2, pp. 6–7.)

Rank one: the valuation of x has value group of rank one (x is a maximal point of the spectral space).

Its API has the following properties, with the hypotheses of this subsection.

- x is Shilov iff x has rank one and sp(x) ∈ minimalPrimes Ã.
- The set of Shilov points is finite, in bijection with the minimal primes of Ã.
- For a rank-one x, being Shilov is equivalent to its full specialization fibre being {x}.
- For nonzero A and every f ∈ A, its spectral supremum is the maximum of |f| at the finite nonempty Shilov set; for the zero algebra the supremum is zero and the Shilov set is empty.
- A finite injective map of affinoid domains sends Shilov points to Shilov points; use the integral finite map on canonical reductions and the componentwise dimension theorem.

One proof route is as follows. Finiteness: Spec Ã is noetherian, so it has finitely many irreducible components; by §4.2(2) each generic point has exactly one preimage.

*Needs:* §4.1; §4.2; `PrimeSpectrum`; `minimalPrimes`.

**Checks.**

- The Shilov points of the closed unit polydisc are exactly the Gauss point.
- The annulus K⟨X, Y⟩/(XY − c), 0 < |c| < 1, has exactly two Shilov points.
- For A = L finite over K, the unique point of Spa L is Shilov; the zero algebra has none.
- For f = p + T² ∈ Q_p⟨T⟩, |f|_sup = 1 = |f(η)| is attained at the Shilov point η, agreeing with the Banach-algebra Shilov boundary.
- A classical point of the disc is not Shilov: it specialises to a closed point of Spec K̃[T].

### 4.4 Weakly Shilov points of a rigid space

(*weakly-shilov-point*) Let X be a rigid space over K. A point x ∈ |X| is weakly Shilov if there is an affinoid open W ⊆ X containing x such that x is a Shilov point of W. Weakly Shilov points have rank one. They are dense in |X|: every nonempty affinoid open contains one (Bhatt–Hansen, Lemma 2.8). (BH22 line 314, Definition 2.5, Example 2.6 and Lemma 2.8, pp. 7–8.)

X is any rigid space over K; no quasi-separatedness.

Its API has the following properties, with the hypotheses of this subsection.

- x is weakly Shilov iff x is a Shilov point of some affinoid open neighbourhood.
- A weakly Shilov point has rank one.
- Weakly Shilov points are dense in |X| (Bhatt–Hansen Lemma 2.8).
- Every Shilov point of an affinoid open is weakly Shilov.

One proof route is as follows. Rank one: Shilov points have rank one by definition. Density: a nonempty open subset contains a nonempty affinoid open W, and Spec W̃ has a generic point; its preimage under the surjective sp is nonempty and consists of a single rank-one point (§4.2), which is Shilov in W.

*Needs:* §4.3; §4.2; §4.1.

**Checks.**

- On the unit disc, the Gauss points `eta_(a,r)` with a ∈ K°, r ∈ |K×| and 0 < r ≤ 1 are weakly Shilov; each is the Shilov point of its rational closed subdisc.
- On X = Spa L, L/K finite, the unique point is weakly Shilov (dimension 0, trdeg 0).
- A classical point x with dim_x X > 0 is not weakly Shilov: its secondary residue field is finite over K̃, so trdeg = 0. A zero-dimensional connected component is a necessary exception, even when dim X > 0.
- On the closed disc, weakly Shilov points are exactly type 2 points in the usual classification: residue transcendence degree 1. Types 1, 3 and 4 have residue transcendence degree 0, and type 5 has rank 2.

### 4.5 Abhyankar's bound for secondary residue fields

(*abhyankar-bound*) Prove: Let X be a rigid space over K and x ∈ |X| a rank-one point with completed residue field H(x) and secondary residue field K̃_x (the residue field of its valuation ring). Then K̃_x is a field extension of K̃ with `trdeg_(Ktilde)` K̃_x ≤ dim_x X. (POINEAU13 lines 182–184, Notations, p. 271; BH22 line 329, Proposition 2.9, p. 8.)

x of rank one; dim_x X the local dimension (§0.2).

One proof route is as follows. Choose an affinoid neighbourhood Spa(A, A°) with dim A = dim_x X =: d and a finite injective K⟨T_1, …, T_e⟩ → A/supp(x) with e = dim A/supp(x) ≤ d (RigidAnalyticGeometry §§1.1–1.2). The image y of x in the e-dimensional polydisc has H(x) finite over H(y), so K̃_x is algebraic over K̃_y. For the point of the polydisc, the images of polynomials are dense in the completed residue field: polynomial approximation in the Tate algebra also approximates quotients with nonzero denominator at the point. Every residue class of a unit therefore has a representative in the rational function field of the polynomial image. Lifts of an algebraically independent residue family are algebraically independent over K: divide any proposed relation by a coefficient of greatest norm and reduce. Their number is at most e. Finite extensions of completed residue fields have algebraic secondary residue extensions.

*Needs:* §0.2; RigidAnalyticGeometry §§1.1–1.2; `Algebra.trdeg`; `ValuationSubring`; `Valuation`.

**Checks.**

- At the Gauss point of the polydisc, K̃_x = K̃(T_1, …, T_n) has transcendence degree n = dim; at a classical point it is a finite extension of K̃.
- At an irrational-radius Gauss point of the disc, residue transcendence degree is 0 and local dimension is 1. At the unit Gauss point they are 1 and 1; at a classical point of Spa L they are 0 and 0.

### 4.6 Weakly Shilov points are those of maximal residue transcendence degree

(*weakly-shilov-transcendence-criterion*) Prove: Let X be a rigid space over K and x ∈ |X| a rank-one point. The following are equivalent: (1) x is weakly Shilov; (2) `trdeg_(Ktilde)` K̃_x = dim_x X; (3) when X is quasi-separated and quasi-paracompact, there is a formal model 𝔛 of X such that x specialises to the generic point of an irreducible component of the special fibre 𝔛_s. (BH22 line 329, Proposition 2.9, p. 8; POINEAU13 line 705, Lemma 4.4, p. 284, line 857, Corollary 4.15, p. 287, and line 893, Corollary 4.18, p. 288.)

The formal-model condition applies when X is quasi-separated and quasi-paracompact and uses the formal localization contract. Conditions (1) and (2) require neither condition.

The equivalent conditions also give the following consequences.

- For U ⊆ X open and x ∈ U, x is weakly Shilov in U iff in X: the completed residue field and local dimension are unchanged by open restriction.
- A rank-one x is weakly Shilov iff `trdeg_(Ktilde)` K̃_x = dim_x X.

One proof route is as follows. For a Shilov point of a strict affinoid neighbourhood, Poineau Lemma 4.4 identifies the residue transcendence degree with the local dimension. Dimension is invariant under open restriction. Conversely, choose an affinoid neighbourhood U of x whose dimension is d = dim_x X. If trdeg K̃_x = d, Abhyankar’s inequality excludes every lower-dimensional component and every intersection of distinct d-dimensional components through x. Thus x lies on exactly one component of U, of dimension d. Apply Poineau Corollary 4.18 (and Corollary 4.15 in the irreducible case): there is a strict Laurent domain in U having x as its unique Shilov-boundary point. A strict Laurent domain is a rational affinoid open on the adic side. Proposition 2.2 of Bhatt–Hansen identifies the Berkovich Shilov boundary with the rank-one adic Shilov points. No field extension or descent of a chosen domain is needed. For the formal condition, realize the affinoid Shilov neighbourhood as the generic fibre of a formal affine open after admissible blow-up, and refine its ring of definition so its special-fibre spectrum agrees with canonical reduction. Generic points then agree. Conversely take a formal affine open containing the generic specialization. The exact formal localization input is specified in the supplier contract.

*Needs:* §4.4; §4.5; §4.2; §0.2; AdicSpacesPartIII R2.4–R2.5 and gap:formal-affinoid-localization; §1.4; §0.3.

**Checks.**

- At a type 3 point of the disc trdeg = 0 < 1: not weakly Shilov; at type 2 points trdeg = 1 = dim.
- At a classical point on a positive-dimensional disc, 0 ≠ 1 for residue transcendence and local dimension. At the isolated point of Spa(K⟨T⟩ × K), both numbers are 0, so the criterion includes this point even though the global dimension is 1.

### 4.7 Weakly Shilov points avoid nowhere dense Zariski closed sets

(*weakly-shilov-avoid-nowhere-dense*) Prove: Let X be a rigid space over K and Z ⊆ X a nowhere dense Zariski closed subset. Then Z contains no weakly Shilov point of X. Consequently: (i) if X is reduced, every weakly Shilov point lies in the regular locus Reg(X); (ii) if X is irreducible and Z ⊊ X is Zariski closed, Z contains no weakly Shilov point; (iii) a subset of |X| that contains all weakly Shilov points, or whose complement is a countable union of nowhere dense Zariski closed sets, is dense. (BH22 line 346, Corollary 2.10, p. 8; HK2 line 2710, Lemma 9.3.5, p. 60.)

For (ii), proper Zariski closed subsets of irreducible spaces are nowhere dense (§1.5).

One proof route is as follows. If z ∈ Z is weakly Shilov in X, then trdeg K̃_z = dim_z X (§4.6); but z is also a rank-one point of Z with the same completed residue field, so trdeg K̃_z ≤ dim_z Z (§4.5) < dim_z X (§0.3(e)). Contradiction. (i): Sing(X) is a nowhere dense Zariski closed subset when X is reduced (§2.1). (ii) is the main statement with §1.5. (iii): weakly Shilov points are dense (§4.4); none lies in a nowhere dense Zariski closed set, so a countable union of such sets contains none.

*Needs:* §4.6; §4.5; §4.4; §0.3; §2.1; §1.5.

**Checks.**

- On the disc, every proper Zariski closed subset is a discrete set of classical points and misses all type 2 points.
- Howe–Klevdal II, Lemma 9.3.5: on a smooth connected S each proper Hodge locus is Zariski closed and nowhere dense, hence contains no weakly Shilov point. Their union, the Hodge exceptional locus, therefore contains none however many loci occur, and the Hodge generic locus is dense. Proposition 9.3.4 (HK2 line 2663) separately writes the exceptional locus as a countable union of topologically closed subsets, images of compact families of lines; these pieces are not asserted to be Zariski closed.
- The union of all classical points of a positive-dimensional disc, however large its cardinality, still contains no weakly Shilov point. Thus avoidance holds for arbitrary unions of nowhere dense Zariski closed sets; countability is only needed by particular applications.

### Examples

For the annulus XY = c, 0 < |c| < 1, the two boundary valuations have (|X|,|Y|) = (1,|c|) and (|c|,1). They specialize to (Y) and (X) in K̃[X,Y]/(XY), respectively. Each has secondary residue transcendence degree 1. A classical point has degree 0, so in a one-dimensional component it is not weakly Shilov; an isolated zero-dimensional classical component is weakly Shilov.

### Dependencies

Layers 0–3; canonical reduction and finite reduction maps; AdicSpacesPartIII R3.9 for the Banach spectrum and spectral maximum; rank-one residue valuations; the formal-model contract for the model proof of §4.2 and the third characterization in §4.6. The residue-transcendence proof uses the strict Laurent-domain comparison in §4.6; it does not assume avoidance in advance.

## Layer 5 (RZ.5): Rigid blow-ups and functorial resolution

### 5.1 Blow-ups of rigid spaces along coherent ideals

(*rigid-blow-up*) Construct as follows. Let X be a rigid space over K and 𝓘 ⊆ O_X a coherent ideal. The blow-up π : Bl_𝓘(X) → X is the relative analytification of Proj_X(`direct_sum_(n>=0) I^n`): over an affinoid open U = Spa(A, A°) with 𝓘|_U = Ĩ it is (Proj ⊕ I^n)^an relative to Spa(A, A°), and these glue. π is proper, 𝓘·`O_Bl` is an invertible ideal, π is an isomorphism over X − V(𝓘), and π is universal among morphisms Y → X with 𝓘·O_Y invertible. Formation commutes with flat base change Y → X (in particular with restriction to opens and with smooth morphisms). If X is reduced and V(𝓘) is nowhere dense, π⁻¹(V(𝓘)) is a nowhere dense Cartier divisor and Bl_𝓘(X) is reduced. (CONRAD06 lines 1937–1960, Definition 4.1.1 and following properties, pp. 1096–1097; TEMKIN12 line 1516, proof of Theorem 5.2.2, p. 33, uses these blow-ups.)

The relative algebraic blow-up over Spec A is analytified relative to Spa(A, A°), rather than treated as finite type over K. Projective relative analytification is proper. The birational assertions require a nowhere dense centre and reduced X.

Its API has the following properties, with the hypotheses of this subsection.

- Bl_𝓘(X) → X for a coherent ideal 𝓘.
- Over Spa(A, A°), Bl_Ĩ = (Proj_A ⊕ I^n)^an relative to the affinoid.
- 𝓘·`O_(Bl_I X)` is an invertible ideal.
- Every Y → X with 𝓘·O_Y invertible factors uniquely through Bl_𝓘(X).
- π is proper.
- π is an isomorphism over X − V(𝓘).
- For flat g : Y → X, `Bl_(I O_Y)(Y)` ≅ Y ×_X Bl_𝓘(X).
- For a scheme X locally of finite type over K and an ideal sheaf 𝓘, `Bl_(I^an)(X^an)` ≅ (Bl_𝓘 X)^an.

One proof route is as follows. Affinoid chart: P = Proj ⊕ I^n is projective over Spec A; its relative analytification over Spa(A, A°) is proper (RigidAnalyticGeometry §8.1; AdicSpacesPartII R1.2–R1.6 and closed immersions). Gluing: for an affinoid subdomain A → A′ (flat), Proj ⊕ (IA′)^n = P `times_[Spec A]` Spec A′ and relative analytification commutes with this base change, so the charts glue. Universal property: on each chart it is the analytification of the universal property of the algebraic blow-up, via the universal property of relative analytification. Flat base change: the Rees algebra of 𝓘 commutes with flat pullback. Nowhere density of the exceptional divisor: on a reduced X with V(𝓘) nowhere dense, π is an isomorphism over the dense Zariski open X − V(𝓘) and π⁻¹(V(𝓘)) is cut out locally by one nonzerodivisor.

*Needs:* SchemeAndStackFoundations §0.3; StableReduction Layer 4; RigidAnalyticGeometry §8.1; AdicSpacesPartII R1.2–R1.6; the coherent-sheaf contract above; AdicSpacesPartII R0.10–R0.12; §0.1; §0.3.

**Checks.**

- Blowing up the 2-dimensional unit polydisc at the origin gives exceptional divisor (P¹_K)^an and is an isomorphism elsewhere.
- `Bl_(O_X)(X)` = X; `Bl_0(X)` = ∅ for every X, since Proj of the Rees algebra O_X ⊕ 0 ⊕ 0 ⊕ ⋯ is empty (equivalently, the zero ideal is invertible on no nonempty open).
- For X = A²_K and I=(x,y), `Bl_(I^an)(X^an)` is the analytification of the blow-up of the origin defined by I. This ideal is not the zero ideal.
- Blowing up the disc at the origin is an isomorphism: a definition by 'replacing the centre by its projectivised normal bundle' without the universal property would wrongly change a Cartier centre.

### 5.2 Marked sequences of rigid blow-ups

(*blow-up-sequence*) A marked rigid blow-up sequence of length n is a chain X_n → ⋯ → X_0 = X with specified coherent centre ideals and `X_(i+1)` the blow-up of X_i in its specified ideal. A stage with empty centre (unit ideal) is an identity stage and is called empty in the sequence convention. A contracted sequence omits exactly these stages. A sequence is T-supported when every centre maps into T, and strong when every centre is regular. Flat pullback carries both spaces and centre ideals to the corresponding marked sequence; identity and composition comparisons preserve the markings. (TEMKIN12 line 430, §§2.2.1–2.2.7, pp. 10–11.)

Scheme blow-ups and their marked sequences use the scheme supplier. Here the objects are rigid spaces and the blow-ups are those of §5.1. A nonempty Cartier centre remains a stage even though its blow-up morphism is an isomorphism.

Its API has the following properties, with the hypotheses of this subsection.

- A sequence records every rigid space and every chosen closed centre, rather than only its composite morphism.
- Flat pullback preserves sequences, and successive pullbacks agree with pullback along the composite.
- Contraction removes precisely the empty-centre stages; the original sequence is a trivial extension of its contraction.
- For a T-supported sequence the restricted sequence on X − T has only empty stages.
- A strong sequence has regular centres. Its composite is proper and is an isomorphism away from the images of the centres.
- Two sequences are identified by the unique isomorphisms over X preserving all successive centres.

For non-quasi-compact spaces, define a marked blow-up hypersequence to be a diagram (Xᵢ, fⱼᵢ) indexed by a countable totally ordered set with least element 0 and successors at every nonfinal index. Each successor map is a blow-up with its centre retained, fᵢᵢ is the identity and fₖᵢ = fⱼᵢ ∘ fₖⱼ for i ≤ j ≤ k. Every point of X₀ has an open neighbourhood on which the diagram is a trivial extension of a finite marked sequence. Construct its terminal object by gluing the terminal spaces of these local finite sequences; it can be adjoined as a final index ∞. Restriction to each quasi-compact open is a trivial extension of a finite sequence. The local condition, rather than countability alone, is the finiteness assertion (TEMKIN12 line 1534, §5.3.2 and Remark 5.3.1, pp. 33–34).

One proof route is as follows. Use the flat base-change and universal properties of §5.1 to compare each stage and its centre. Contract a stage exactly when its pulled-back centre is empty. Universal properties give unique isomorphisms preserving all markings; these satisfy the identity and composition equations.

*Needs:* §5.1; `Module.Flat`.

**Checks.**

- The blow-up of the bidisc at the origin is a one-stage contracted sequence with exceptional fibre (P¹_K)^an.
- Length zero has composite id_X. A unit-ideal centre gives an identity stage removed by contraction; a zero-ideal blow-up has empty total space.
- Restricting the bidisc blow-up to the complement of the origin gives an empty stage. Translation by (1,0) pulls back the blow-up at (1,0) to that at (0,0).
- A nonempty Cartier centre gives an isomorphism of spaces but a nonempty marked stage; recording only the composite loses this distinction.
- For the disjoint union of the curves Y² = X^(2n+1), n ≥ 0, on unit polydiscs in characteristic zero, for n ≥ 1 each blow-up at the singular origin changes the exponent 2n+1 to 2n−1, and a smooth curve is reached in n steps; at n = 0 the curve is already smooth and there is no blow-up. A quasi-compact open meets finitely many components, so the resolving diagram stabilizes there; no single bound works for this displayed tower on the entire disjoint union. Countability alone would not give local stabilization for an arbitrary diagram.

### 5.3 Functorial resolution of singularities of rigid spaces

(*rigid-resolution*) Prove: Let K have characteristic 0 and X be a rigid space over K whose non-reduced locus is nowhere dense (for instance X reduced). There is a countable blow-up hypersequence of rigid blow-ups with regular (smooth) centres, locally finite over X and stabilising over every quasi-compact open, with limit π : X_∞ → X, such that X_∞ is smooth over K, every centre lies over Sing(X) and is disjoint from the preimage of Reg(X), and π is a proper morphism which is an isomorphism over Reg(X) = X^sm. The construction is functorial for smooth morphisms X′ → X (the hypersequence of X′ is the pullback with empty blow-ups removed) and compatible with complete extensions of K. For quasi-compact X the hypersequence is a finite blow-up sequence. (TEMKIN12 line 1504, Theorem 5.2.2, p. 33, and line 1563, Theorem 5.3.2, p. 34.)

The nonreduced locus is nowhere dense; this includes reduced spaces. A countable hypersequence is indexed by a countable totally ordered invariant set, locally a trivial extension of a finite sequence. It need not be indexed functorially by ℕ. The same construction glues on non-quasi-separated spaces by using affinoid pieces of overlaps.

One proof route is as follows. Quasi-compact case (Temkin Theorem 5.2.2): cover X by finitely many affinoids X_i = Spa(A_i) and the pairwise intersections by affinoids X_ijk; A_i, A_ijk are excellent and A_i → A_ijk are regular (§0.5). Apply the supplied functorial scheme resolution, including its generically reduced extension, to Spec A_i. Analytify the centre ideals to obtain rigid blow-up sequences. Regular-morphism functoriality identifies them on affinoid overlaps, and disjoint-union synchronization identifies the ordering and the empty stages. Regularity transfers: X_n is regular at classical points iff the algebraic X_n is regular at closed points, since both local rings have the same completion (`TauCeti.isRegularLocalRing_iff_of_flat_of_map_maximalIdeal_eq` applied twice), and regular = smooth in characteristic 0 (§2.2). Non-compact case (Temkin Theorem 5.3.2): saturate with empty blow-ups indexed by the countable set of invariants; the hypersequences of the affinoid charts agree on overlaps and glue to a countable blow-up hypersequence whose limit X_∞ → X is a single proper morphism. Functoriality for smooth X′ → X: affinoid charts of X′ map by smooth, hence regular, ring maps to those of X (§0.5). For a complete isometric extension K′/K in characteristic zero, prove separately that A → A ⊗̂_K K′ is a regular ring map. Use the completed local descriptions and the separability of all field extensions in characteristic zero; geometric regularity must be tested after finite residue-field extensions. Apply regular functoriality to compare the analytified towers. Flatness alone supplies no such conclusion.

*Needs:* §5.1; §0.5; §5.2; §2.1; §2.2; RigidAnalyticGeometry §8.1; AdicSpacesPartII R1.5; RigidAnalyticGeometry §§6.2, 8.3; AdicSpacesPartII R1.1, R1.7; ResolutionOfSingularitiesCharacteristicZero §§7.1, 7.5–7.8; `TauCeti.isRegularLocalRing_iff_of_flat_of_map_maximalIdeal_eq`; gap:generically-reduced-functorial-resolution for generically reduced charts; gap:countable-resolution-invariants for synchronization on non-quasi-compact reduced spaces.

**Checks.**

- The resolution of the cuspidal disc is its normalization by one blow-up of the cusp; the resolution of a smooth space is the identity.
- For the empty space and for every smooth X, all resolving stages are empty and the final map is the identity. A generically nonreduced double point must first be reduced to obtain a surjective cover.

### 5.4 Properties of the resolution used by Howe–Klevdal

(*resolution-consequences*) Prove: For the resolution π : S̃ → S of any reduced rigid space over a characteristic-zero K, π is proper and surjective, S̃ is smooth, and π⁻¹(S^sm) → S^sm is an isomorphism between dense Zariski open subspaces. If S is irreducible, S̃ is connected and hence irreducible. For an arbitrary rigid T, resolving T_red gives a proper surjection onto T with the same underlying points, including when T is a fibre product of resolutions. The diamond and v-cover interpretations of these geometric facts are downstream consequences. (TEMKIN12 line 1563, Theorem 5.3.2, p. 34; HK2 line 1598, §5.3, p. 35, and line 2708, §9.3, p. 60.)

No geometric irreducibility is assumed. Apply the resolution theorem to the reduction when a fibre product has nilpotents.

One proof route is as follows. (i) Surjectivity: π is an isomorphism over the dense S^sm (§2.2, Layer 2/singular-locus) and proper, so its image is closed (Zariski closed, §0.4) and contains a dense set, hence is everything. Density of π⁻¹(S^sm): its complement is contained in the union of the exceptional divisors, nowhere dense Cartier divisors (§5.1). (iv) S irreducible ⇒ S^sm ≅ π⁻¹(S^sm) is a dense Zariski open of S, hence irreducible and connected (§1.8); it is dense in |S̃| by (i), and the closure of a connected set is connected; S̃ smooth and connected is irreducible. For arbitrary T, compose the closed immersion T_red → T with its resolution. This is proper and surjective on underlying points. No regular source is claimed birational to a generically nonreduced space.

*Needs:* §5.3; §5.1; §2.2; §2.1; §0.4; §1.8; §1.3.

**Checks.**

- The cuspidal disc resolves to the disc by one blow-up, with a bijective underlying map that is not an isomorphism of rigid spaces. The isomorphism over the punctured cusp does not extend to an isomorphism at the cusp.
- For Spa(K⟨X,Y⟩/(XY)), the resolution is two discs and is disconnected; irreducibility is essential for connectedness.
- For nonempty X, the zero-ideal blow-up has empty source and cannot be a resolution cover; the nowhere-dense-centre hypothesis excludes it.
- For the double point T = Spa(K[ε]/(ε²)), resolving T_red gives Spa K → T, proper and surjective on its single underlying point. A construction deleting its generically nonreduced component would instead have empty source and would not cover T.

### Examples

Blow up the bidisc in (X,Y). In the X-chart write Y = XU; on the exceptional set X = 0 the coordinate U runs over an affine chart of P¹, and the Y-chart provides the other. Blowing up the disc in (T) gives the disc itself, while the centre remains marked. The cusp resolves by one blow-up, and the crossing resolves into two smooth components. A smooth space has the empty resolving sequence.

### Dependencies

Layers 0–2; relative analytification and proper analytic projective space; supplied scheme blow-ups and scheme resolution, including gap:generically-reduced-functorial-resolution and gap:countable-resolution-invariants; regularity of affinoid restrictions and completed scalar extension. Connectedness of a resolution uses §1.8. No diamond comparison is used in constructing it.

## Layer 6 (RZ.6): Analytic manifolds, constant rank and identities

### 6.1 The constant rank theorem for analytic maps

(*constant-rank-theorem*) Prove the analytic normal-form theorem. Let F be a complete nontrivially normed field of characteristic 0, M and N analytic manifolds over F of dimensions m and n (Mathlib ChartedSpace with IsManifold over the model space F^m, smoothness ω), and f : M → N an analytic map such that the rank of the tangent map T_x f is equal to k for all x in a neighbourhood of a. Then there are analytic charts φ around a and ψ around f(a) such that ψ ∘ f ∘ φ⁻¹(x_1, …, x_m) = (x_1, …, x_k, 0, …, 0) near φ(a). In particular f is locally a submersion onto a k-dimensional submanifold. If k = n, f satisfies `Manifold.IsSubmersionAt` at a (with complement `F^(m−n)`) and is open near a; if k = m, f satisfies `Manifold.IsImmersionAt` at a. Both follow because the charts φ and ψ are analytic with analytic inverses, hence belong to the maximal atlases. The Lean headline `analytic_constantRank` states this on native analytic manifolds, with centred open partial homeomorphisms, analytic inverses, and f mapping the source chart domain into the target chart domain; the model-space theorem is its specialization. (HK2 line 2602, proof of Theorem 9.1.3, p. 58; SCHNEIDER11, §5, Corollary 5.8 and Proposition 5.9, p. 33, and §9, Proposition 9.3, p. 58 (uncertified).)

The differential rank is k throughout a neighbourhood, with k ≤ m and k ≤ n. The theorem is stated for complete nontrivially normed characteristic-zero fields; the rigid application uses nonarchimedean fields. Analyticity is Mathlib’s convergent AnalyticAt notion, and tangent coordinates are taken in the analytic charts.

One proof route is as follows. Reduce to model spaces: f : U ⊆ F^m → F^n analytic, a = 0, f(0) = 0, df_0 of rank k; after linear changes of coordinates df_0 = [I_k 0; 0 0]. Put g(x) = (f_1(x), …, f_k(x), `x_(k+1)`, …, x_m); dg_0 is invertible, so g is a local analytic isomorphism (the Mathlib analytic inverse contract), and f ∘ g⁻¹(y) = (y_1, …, y_k, h(y)). Constant rank k forces ∂h/∂y_j = 0 for j > k near 0, so h depends only on (y_1, …, y_k) on a polydisc (in characteristic 0, a power series whose partial derivatives in `y_(k+1)`, …, y_m vanish on a polydisc does not involve those variables, by the identity theorem for power series, Schneider Corollary 5.8). Then ψ(z) = (z_1, …, z_k, `z_(k+1)` − `h_(k+1)`(z_1, …, z_k), …) is a local analytic isomorphism of F^n with ψ ∘ f ∘ g⁻¹ = (y_1, …, y_k, 0, …, 0). Apply this argument in manifold charts. The analytic inverse and coefficient-uniqueness inputs have their own supplied statements; constant rank at a single point is not a substitute for the neighbourhood hypothesis.

*Needs:* the Mathlib analytic inverse contract above; `IsManifold`; `ChartedSpace`; `modelWithCornersSelf`; `mfderiv`; `Module.finrank`; `LinearMap.range`; `Manifold.IsSubmersionAt`; `Manifold.IsImmersionAt`.

**Checks.**

- f(x, y) = (x, 0) on F² has constant rank 1 and is already in normal form; f(x) = x² on F has rank 1 off 0 and rank 0 at 0, so the theorem applies on F − {0} but not at 0.
- In characteristic p, Tᵖ has constant rank 0 and takes πⁿ to π^(np) ≠ 0, so it is not locally constant. A characteristic-zero hypothesis is essential.
- For m = n = k = 0 the unique map between point neighbourhoods has the empty-coordinate normal form. A constant map with k = 0 has zero target coordinates after centring.

### 6.2 Polydisc neighbourhoods of rational points of smooth rigid spaces

(*rigid-inverse-function-theorem*) Prove: Let F be a complete nontrivially nonarchimedean normed field and V a rigid space over F, smooth of dimension m at an F-rational point x. Then x has a basis of open neighbourhoods in |V| each isomorphic, as a rigid space, to a closed polydisc of dimension m and radius in |F^×|, centred at x. More generally, a morphism f : V → W of smooth rigid spaces with df_x bijective at an F-rational x restricts to an isomorphism of polydisc neighbourhoods of x and f(x). (HK2 line 2723, proof of Lemma 9.3.5, p. 60; SCHNEIDER11, Proposition 5.9, p. 33 (uncertified).)

x is F-rational: k(x) = F. For non-rational classical points pass to `V_(k(x))`. F is nonarchimedean. Polydisc neighbourhood means an admissible open isomorphic to a closed polydisc; its embedding in the original ambient coordinates need not be a standard round disc.

One proof route is as follows. Near x, V is étale over a polydisc (AdicSpacesPartII R0.15–R0.17); locally V is a closed subspace of a polydisc Dᵐ⁺ʳ cut out by r functions h_1, …, h_r whose differentials together with dT_1, …, dT_m form a basis (AdicSpacesPartII R0.15–R0.17). Apply the convergent power-series inverse theorem to (T,h) at the rational point. Choose a target closed polydisc strictly inside the convergence neighbourhood of the inverse series. The inverse series and the original map then define inverse rigid morphisms between this target and its image neighbourhood. This image is an affinoid open isomorphic to a polydisc, but need not be a standard-radius ambient polydisc. The equations h = 0 become the last r coordinate equations in the target polydisc. Images of arbitrarily small closed polydiscs under the inverse give the required basis of rigid neighbourhoods. At a rational point, shrinking by powers of any fixed c with 0 < |c| < 1 is cofinal. The relative statement follows by applying this to the graph of f.

*Needs:* the Mathlib analytic inverse contract above; §3.3; AdicSpacesPartII R0.15–R0.17.

**Checks.**

- For V = G_m^an and x = 1, the discs {|T − 1| ≤ |c|}, for 0 < |c| < 1, are neighbourhoods isomorphic to closed discs. Over ℚ_p, taking c = p gives |c| = 1/p and |T| = 1 throughout the disc, so it lies in G_m^an; at radius 1 it contains T = 0 and fails. For the cusp at the origin no neighbourhood is a disc (not smooth there).
- For dimension zero and a rational point, the neighbourhood is Spa F itself. At a non-rational classical point with residue L ≠ F, a pointed F-polydisc chart would force residue F; base change to L is required.

### 6.3 The analytic manifold of rational points of a smooth rigid space

(*manifold-of-classical-points*) Construct as follows. Let F be a complete nontrivially nonarchimedean normed field and V a rigid space over F, smooth of pure dimension m. The set V(F) of F-rational points, with the subspace topology from |V|, has a canonical maximal compatible analytic atlas, and hence a structure of F-analytic manifold of dimension m (Mathlib ChartedSpace (Fin m → F) with IsManifold 𝓘(F, Fin m → F) ω) whose charts are the coordinate maps of the polydisc neighbourhoods of §6.2. A morphism f : V → W of smooth rigid spaces induces an analytic map f_F : V(F) → W(F) with tangent map T_x f_F = df_x on Zariski tangent spaces (T_x(V(F)) = T_x V). For E a complete field, V smooth over E and E′/E a finite extension or a complete algebraically closed extension (such as the completion C of an algebraic closure), V(E′) := `V_(E')`(E′) is an E′-analytic manifold of dimension m; for E′ = E finite over Q_p this is the usual p-adic analytic manifold. (HK2 line 2602, proof of Theorem 9.1.3, p. 58; SCHNEIDER11, §§7–9, pp. 45–61 (uncertified).)

Pure dimension m; for V of varying dimension the construction is done on each connected component. Mathlib IsManifold does not imply Hausdorffness or second countability. If V is separated then V(F) is Hausdorff and fits Schneider’s convention; no global Hausdorff claim is made for a general smooth nonseparated V. An analytic atlas is unique up to compatibility of charts. The finite-extension scalar restriction here uses normed-space charts, including inseparable extensions; it makes no representability assertion about an algebraic restriction of scalars.

Its API has the following properties, with the hypotheses of this subsection.

- ChartedSpace (Fin m → F) V(F) with charts from polydisc neighbourhoods.
- IsManifold 𝓘(F, Fin m → F) ω V(F): transition maps are analytic.
- A morphism f : V → W of smooth rigid spaces gives an analytic map f_F, with (g ∘ f)_F = g_F ∘ f_F and id_F = id.
- mfderiv of f_F at x is df_x on Zariski tangent spaces T_x V → `T_(f(x))` W.
- The manifold topology on V(F) is the subspace topology from |V|.
- For any complete isometric F′/F the inclusion of rational points is continuous and agrees with all F-defined charts. For finite F′/F, restriction of scalars has dimension m[F′:F] over F and V(F) is an F-analytic submanifold of dimension m; no finite-dimensional scalar-restriction assertion is made for infinite extensions.
- For X smooth of finite type over F, X(F) carries the analytic manifold structure transported from (X^an)(F) through the canonical bijection X(F) ≅ (X^an)(F).

One proof route is as follows. Charts: polydisc neighbourhoods U ≅ D^m(δ) of rational points give bijections U(F) ≅ (radius-δ ball in F^m), homeomorphisms by §3.3. Transition maps between two such charts are given by restricted power series, hence analytic (Mathlib AnalyticOnNhd); so the atlas is in the analytic groupoid. Morphisms: in charts f is given by power series, so f_F is analytic; its derivative at x is the Jacobian, i.e. df_x (§2.3). Uniqueness: any two atlases built from polydisc neighbourhoods are compatible by the same argument. Base change to E′ uses `V_(E')` = V ×_E Spa E′ (smooth of the same dimension, AdicSpacesPartII R0.15–R0.17).

*Needs:* §6.2; §3.3; §2.3; §3.1; AdicSpacesPartII R0.15–R0.17; `ChartedSpace`; `IsManifold`; `modelWithCornersSelf`; `AnalyticOnNhd`; `TangentSpace`.

**Checks.**

- For V the closed unit disc over Q_p, V(Q_p) is Z_p with the identity chart, a 1-dimensional Q_p-manifold.
- For V = Spa F, V(F) is a single point, a manifold of dimension 0; for V = ∅ it is empty.
- For V = (G_m)^an, V(F) = F^× as an open submanifold of F, and the group law is analytic, agreeing with Mathlib's manifold structure on an open subset of a normed field.
- For V the disc over Q_p and E′ = Q_p(√p), V(E′) = `O_(E')` is a 1-dimensional E′-manifold, of dimension 2 as a Q_p-manifold: a construction recording dimension over the base field E rather than over E′ fails.
- For the disc over Q_p and F′ = C_p, the C_p-manifold of C_p-points has dimension one over C_p. Its model C_p is infinite-dimensional over Q_p, so restriction of scalars must not be assigned any finite Q_p-manifold dimension.

### 6.4 Algebraic-point analytic atlases over complete normed fields

(*algebraic-point-atlas*) Construct the algebraic-point analytic atlas as follows. Let F be a complete nontrivially normed field of characteristic zero and G a smooth finite-type algebraic group over F, with d = dim_F T₁G. Give G(F), with Tau Ceti's evaluation topology `TauCeti.SchemePointTopology.topology` (the final topology for the affine Zariski charts, each carrying `TauCeti.PointTopology.topology`), the maximal compatible F-analytic atlas obtained from smooth algebraic local coordinates. Because the units of F are open and inversion is continuous on them, the F-points of an affine open subscheme form an open subset carrying its evaluation topology; this is part of the construction. At g ∈ G(F), choose an F-defined étale coordinate map u : U → 𝔸^d_F and restrict u_F − u_F(g) to an analytic chart around g with image an open neighbourhood of 0 in F^d. This constructs a d-dimensional analytic manifold; the chart tangent maps identify its tangent spaces with the algebraic tangent spaces. (STACKS line 3743, Tag 054L, Lemma 29.37.21, p. 83, supplies the algebraic coordinates; the native analytic inverse contract supplies the analytic step.)

Its API has the following properties under these hypotheses.

- The topology of the atlas is the evaluation topology, and transition maps between algebraic-coordinate charts are analytic; any two atlases obtained this way are compatible.
- For smooth finite-type F-groups G and H, an algebraic homomorphism f : G → H induces an analytic map f_F : G(F) → H(F) with its algebraic tangent maps. Group multiplication G(F) × G(F) → G(F) and inversion G(F) → G(F) are analytic.
- For a complete isometric extension F′/F and g ∈ G(F), each chosen F-defined coordinate map admits charts near g over F and F′ that agree on F-points after shrinking: u_F′(g′) = u_F(g′) in F′^d for g′ ∈ G(F) in the common neighbourhood. The charts may be chosen so that the F′ chart intersects G(F) in the F chart domain, and its coordinate image intersects F^d in the F chart image. This is a local assertion about charts centred at an F-rational point; no finite-dimensional restriction of scalars is asserted for an infinite extension.
- For nonarchimedean F, the atlas agrees up to chart compatibility with the atlas on (G^an)(F) from §6.3 through G(F) ≅ (G^an)(F).
- For F nondiscrete and locally compact (ℝ, ℂ or a finite extension of ℚ_p) and G affine, the atlas is compatible with that of ReductiveGroupsPartII RG2.0 *smooth-group-analytic-charts*. For G = GL_n it is compatible with Mathlib's `Units` atlas on the units of the matrix algebra.

One proof route uses the supplied smooth étale coordinates. In a standard smooth affine presentation, append the defining equations to the free coordinates; the invertible Jacobian minor gives an invertible derivative of this map between ambient normed F-vector spaces. Native analytic inversion restricts its inverse to the zero set of the defining equations, giving the desired point chart and analytic transition maps. The equations and coordinate maps are defined over F. After any complete isometric extension the same nonzero Jacobian minor remains invertible, and inverse uniqueness makes the two local inverses agree on a smaller F-ball. The image of F is closed by completeness, so the charts can be restricted to matching domains. Applying this argument to algebraic morphisms proves analyticity, and comparison with §6.3 uses the same algebraic coordinates after rigid analytification.

*Needs:* `TauCeti.SchemePointTopology.topology`; `TauCeti.PointTopology.topology`; SchemeAndStackFoundations §0.8, etale_coordinates; the Mathlib analytic inverse contract above; `NormedAlgebra`; `ChartedSpace`; `IsManifold`; `modelWithCornersSelf`; §6.3 and AdicSpacesPartII R1.2–R1.6 only for the nonarchimedean comparison; ReductiveGroupsPartII RG2.0 *smooth-group-analytic-charts* only for the locally compact comparison; Mathlib's `Units` manifold instances only for the comparison on GL_n.

**Checks.**

- For G_m and ℝ ⊆ ℂ, z ↦ z − 1 maps |z − 1| < 1/2 to the disc |w| < 1/2. Its intersection with ℝ× maps to (−1/2,1/2), with inverse w ↦ 1 + w. This real domain lies in {x ∈ ℝ : x > 0}; inversion in coordinates is w ↦ −w/(1+w), whose derivative at 0 is −1.
- For GL₂ and ℝ ⊆ ℂ, the four entries of g − I are compatible coordinates near I. For g = I + H, det g = 1 + h₁₁ + h₂₂ + h₁₁h₂₂ − h₁₂h₂₁. If every |hᵢⱼ| < 1/8, then |det g − 1| < 1/4 + 1/32 = 9/32 < 1, so the determinant is nonzero over both fields. The chart derivative sends H to its four entries, with determinant 1.
- For a finite étale group, d = 0 and an identity neighbourhood has just the identity F-point, mapped to the single point of F⁰. Over ℝ, μ₃ has only the identity real point and has three complex points, but its identity chart remains a singleton after extension. Extra nonreal points do not enlarge that local chart.
- Over ℚ_p, the G_m chart |z − 1| < 1 has coordinate w = z − 1 and inverse 1 + w, agreeing with the rigid atlas; its extension to ℂ_p has the same formulas and intersects ℚ_p in the original chart. The constant map to 0 has derivative 0 rather than 1, so it cannot be a chart.
- For GL₂ over ℝ or ℂ, Mathlib's chart at every point of the units of the 2 × 2 matrices is the inclusion into the matrices, while the chart above at I is g ↦ g − I in the four entries. The transition H ↦ I + H is affine, hence analytic, with derivative the identity, so the two atlases are compatible. A chart differing from the inclusion by a non-analytic homeomorphism of the matrix space would fail this comparison.

### 6.5 Smooth morphisms give submersions; orbit maps are submersions

(*smooth-morphism-submersion*) Prove: Let F be a complete nontrivially nonarchimedean normed field of characteristic 0 and f : V → W a smooth morphism of smooth rigid spaces over F. Then f_F : V(F) → W(F) is a submersion: T_x f_F is surjective for all x ∈ V(F), so f_F is open and locally a projection in charts. In particular, if G is a smooth linear algebraic group over a subfield E ⊆ F, H ⊆ G a closed subgroup and y ∈ (G/H)(F), the orbit map G(F) → (G/H)(F), g ↦ g·y, is a submersion at every point. (HK2 line 2611, proof of Theorem 9.1.3, p. 58.)

G is a smooth finite-type affine algebraic group over E, H is a closed subgroup, and the fppf quotient G/H is represented by a scheme. In characteristic zero Cartier smoothness makes H smooth. The represented smooth-quotient contract above supplies the algebraic torsor map.

One proof route is as follows. Smooth f: df_x is surjective at rational x by the differential criterion (AdicSpacesPartII R0.15–R0.17: f^*Ω_W → Ω_V split injective near x), so T_x f_F = df_x is surjective (§6.3). Constant rank n = dim W on V(F), so the constant rank theorem gives a projection in charts (§6.1). For y ∈ (G/H)(F), choose a faithfully flat field extension F′/F over which y lifts to g_0 ∈ G(F′). After this extension the algebraic orbit morphism is the quotient `G_(F')` → `(G/H)_(F')` composed with right translation by g_0. In characteristic zero H is smooth, so this is a smooth H-torsor. Smoothness descends to F; analytify and apply the first part. Surjectivity on F-points of G → G/H is not assumed.

*Needs:* §6.3; §6.1; AdicSpacesPartII R0.15–R0.17; RigidAnalyticGeometry §8.1; AdicSpacesPartII R1.2–R1.6; ReductiveGroups Layer 3; gap:represented-smooth-homogeneous-quotient; `Manifold.IsSubmersionAt`.

**Checks.**

- For G = GL_2 acting on P¹ = GL_2/B, the orbit map of ∞ is a submersion GL_2(F) → P¹(F).
- For a smooth projection D² → D, df sends (u,v) to u, so it is surjective. The square map has derivative 0 at 0 and is not a smooth submersion there.

### 6.6 Identity theorem across a subfield

(*subfield-identity-theorem*) Prove: Let E and C be nontrivially normed fields and C a normed E-algebra, so that E → C is an isometric embedding. If φ is analytic on a neighbourhood of 0 in C^m and vanishes at the points of E^m in a neighbourhood of 0, then φ vanishes on a neighbourhood of 0 in C^m. Consequently, if E and C are moreover complete of characteristic 0, G is a smooth finite-type algebraic group over E, K_0 ≤ G(E) is an open subgroup, U is an open neighbourhood of 1 in G(C) and φ : U → C is C-analytic with φ = 0 on U ∩ K_0, then φ vanishes on some open neighbourhood of 1 contained in U. The Lean headline `analytic_germ_eq_zero_of_subfield` is the coordinate statement, with the normed E-algebra structure on C fixing the embedding. (HK2 line 2611, proof of Theorem 9.1.3, p. 58; SCHNEIDER11, §5, Corollary 5.8, p. 33 (uncertified).)

The coordinate statement uses only that E is nontrivially normed, hence infinite with nonzero elements of arbitrarily small norm, and that the embedding is isometric; it needs no completeness and no characteristic hypothesis. Completeness and characteristic zero enter the group form through the atlas of §6.4, and completeness of E makes its isometric image closed in C. In the nonarchimedean application one may take E = ℚ_p and C = ℂ_p.

One proof route is as follows. Expand φ = Σ P_n near 0, where P_n(z), the sum of the terms c_α z^α with |α| = n and c_α ∈ C, is the homogeneous part of degree n of its power series, convergent on a polydisc of radius ε ∈ |E^×|. For fixed y ∈ E^m, the function t ↦ φ(ty) of t ∈ E near 0 is the one-variable series Σ_n P_n(y) tⁿ with coefficients in C, and it vanishes. If k were least with P_k(y) ≠ 0, dividing by t^k and letting t → 0 through nonzero elements of E would give P_k(y) = 0; so P_n(y) = 0 for every n, first for small y and then for all y ∈ E^m by homogeneity. Choose an E-basis of the finite-dimensional E-span of the c_α with |α| = n. Each coordinate of P_n restricted to E^m is a polynomial over E vanishing on E^m, hence zero because E is infinite (`MvPolynomial.funext`). Thus every c_α vanishes and φ is zero on its convergence polydisc. In characteristic zero the coefficients can instead be recovered by iterated derivatives, α! times c_α, as in Schneider Corollary 5.8. For G, use the compatible algebraic-point charts of §6.4 at 1 over E and C. Their coordinate maps agree on G(E), and the C-chart meets G(E) in the E-chart domain. Thus G(E) near 1 is the intersection with E^m in coordinates, and openness of K_0 makes its coordinate image contain an E-neighbourhood of 0. Apply the scalar germ theorem in these charts. For nonarchimedean fields §6.4 identifies these charts with §6.3; the general group conclusion uses no rigid space over an archimedean field.

*Needs:* `HasFPowerSeriesOnBall`; `NormedAlgebra`; `MvPolynomial.funext`; §6.4 for the group consequence.

**Checks.**

- For E = Q_p, C = C_p and m = 1, a power series Σ c_n z^n with c_n ∈ C_p that vanishes on p^k Z_p has all c_n = 0.
- z ↦ z(z − a) with a ∈ C − E vanishes at the E-point 0 but on no E-neighbourhood of 0: vanishing on an open set of E-points is needed.
- For m = 0 the neighbourhood has one point and vanishing is f(0) = 0 on both sides.
- In characteristic p, over E = 𝔽_p((t)) inside the completion C of an algebraic closure, z ↦ zᵖ has derivative identically 0 but takes the nonzero value t^(kp) at the E-point z = t^k for every k ≥ 1, so it vanishes on no E-neighbourhood of 0. The theorem concerns values, not derivatives, which is why it needs no characteristic hypothesis.
- For E = ℝ, C = ℂ, G = G_m and K_0 = {x ∈ ℝ : x > 0}, z − 1 identifies K_0 near 1 with a real interval about 0. A holomorphic germ vanishing there has every coefficient zero, so it vanishes on a complex disc about 1. For a finite étale G, both identity charts have dimension 0 and the assertion reduces to φ(1) = 0.

### Examples

On ℚ_p², (x,y) ↦ (x,x²) has rank 1; the target coordinate change (u,v) ↦ (u,v−u²) gives (x,0). The inverse branch of T + T² begins T−T²+2T³. For GL₂ acting on P¹ and the point [1:0], the affine coordinate near that point is c/a for a matrix with first column (a,c); its derivative at the identity is δc. This surjective tangent map pins the quotient action and the submersion convention.

### Dependencies

Layers 2–3 and the native analytic inverse theorem; analytic power series and finite-dimensional normed spaces. Orbit submersions additionally use the represented smooth-quotient contract. The coordinate subfield theorem uses only coefficient recovery over the smaller field; its group form uses the algebraic-point atlas of §6.4, built from Tau Ceti's point topology, SchemeAndStackFoundations §0.8 and native analytic inversion. Section 6.3 is required only for its nonarchimedean comparison.

## Downstream consumers

AdmissiblePairsAndPadicHodgeStructures consumes Layers 0–2 for coherent Zariski closures, maximal-rank strata and the full-dimension criterion; Layer 4 for weakly Shilov avoidance; Layer 5 for proper smooth covers and connected desingularization; and Layer 6 for analytic charts, orbit submersions and identities across ℚ_p ⊆ ℂ_p. Its admissible pairs, Hodge loci and bi-analytic Ax–Lindemann theorem are its own targets (HK2, Theorem 9.1.3 and Lemma 9.3.5, pp. 56–60).

AdmissiblePairsAndPadicHodgeStructures also consumes the finite-extension point classes of §§3.1–3.2, identifying them with the rigid analytic points of the diamond of a rigid space, and the Gauss-point closure of §3.4; the diamond comparison is its own.

ClassicalAdicEtaleCohomologyPartII consumes Layer 0 (Zariski closed subsets, local dimension, nowhere density and proper images), Layer 1 (normalization, irreducible components and Riemann extension), Layer 2 (the singular locus and smooth = regular), Layer 4 (weakly Shilov points, their transcendence criterion and avoidance) and Layer 5 (rigid resolution and its consequences), for its proper-hypercover and branched-cover arguments.

## Worked examples

For the cuspidal disc, write A = K⟨t²,t³⟩ and its normalization B = K⟨t⟩. The origin has local dimension 1, cotangent dimension 2 and singular support {0}. The normalization is finite because B = A + At; t is integral with t² ∈ A but t ∉ A. The map is bijective on underlying points, as t = Y/X away from the origin and the origin has one lift. It is a homeomorphism by properness. Blowing up (X,Y) gives the regular strict transform x = u², y = u³. The punctured curve and its normalization's punctured disc are connected. This single example tests reduced Zariski structures, normalization, Riemann extension's normality hypothesis, the stratification and resolution.

For the integral nodal cubic y² = x²(x+1) in characteristic zero, the analytic square root of 1+x exists on a sufficiently small disc about 0, including over ℚ₂ after making the radius smaller. There are two local branches y = ±x√(1+x). Algebraic analytification preserves its one global component, while normalization has two points t = ±1 over the node. The two analytic stalk branches are components of small admissible neighbourhoods, not two global components. On XY = 0 there are two global axes, and removing the intersection disconnects the space. This compares both directions of the irreducibility criterion and excludes using stalk minimal primes as global components.

For a rank-one point x of the disc, let s(x) = trdeg over K̃ of H(x)̃. At the unit Gauss point s(x) = 1 = dim_x D. At the Gauss point of an irrational-radius disc, s(x) = 0 < 1; its value-group contribution to the full Abhyankar inequality accounts for the missing dimension. A classical point has s(x) = 0, and a zero-dimensional classical component has local dimension 0. Weakly Shilov means equality with local dimension and rank one, not equality with global dimension and not equality in the full residue-plus-value-group Abhyankar inequality. Countably many proper coherent Zariski subsets of an irreducible space miss every weakly Shilov point. Over infinite residue field the rational polydisc closure contains a Gauss point, so a closed subset containing a polydisc of rational points cannot be contained in this union of exceptional Zariski subsets.

## References

All locators use the versions recorded in sources.toml. Statements above are in the roadmap author's words. The numbered-source line references locate the supporting theorem or proof in the legal extraction; they are not copied passages.

- HK2: Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax–Lindemann theorem*, [arXiv:2308.11064v2](https://arxiv.org/abs/2308.11064v2), §§1.1, 2.2, 5.0, 5.3, 9.2–9.3. All theorem numbers and pp. 5, 15–16, 32, 35, 56–60 refer to v2, rather than the differently numbered published version.
- CONRAD99: Brian Conrad, *Irreducible components of rigid spaces*, [author copy](https://virtualmath1.stanford.edu/~conrad/papers/irredpaper.pdf), Ann. Inst. Fourier 49 (1999), 473–541, §§1.1–2.3 and 3.3; author-copy pagination.
- CONRAD06: Brian Conrad, *Relative ampleness in rigid-analytic geometry*, [open published text](https://www.numdam.org/item/AIF_2006__56_4_1049_0.pdf), Ann. Inst. Fourier 56 (2006), 1049–1126, Definition 4.1.1 and following properties, pp. 1096–1097.
- CONRAD10: Brian Conrad, *Moishezon spaces in rigid geometry*, [author version dated 1 August 2010](https://virtualmath1.stanford.edu/~conrad/papers/moish.pdf), §2.1, Theorem 2.1.1 and Lemma 2.1.3, pp. 4–5.
- BH22: Bhargav Bhatt and David Hansen, *The six functors for Zariski-constructible sheaves in rigid geometry*, [arXiv:2101.09759v2](https://arxiv.org/abs/2101.09759v2), §2.1, pp. 6–8, and proof of Theorem 2.29, p. 13; Compos. Math. 158 (2022), 437–482. All numbering is v2.
- TEMKIN12: Michael Temkin, *Functorial desingularization of quasi-excellent schemes in characteristic zero: the nonembedded case*, [arXiv:0904.1592v2](https://arxiv.org/abs/0904.1592v2), §§1.2, 2.2–2.3, 5.2–5.3, pp. 3, 10–14, 32–34; Duke Math. J. 161 (2012), 2207–2254. All numbering is v2.
- POINEAU13: Jérôme Poineau, *Les espaces de Berkovich sont angéliques*, [open published text](https://www.numdam.org/article/BSMF_2013__141_2_267_0.pdf), Bull. Soc. Math. France 141 (2013), 267–297, Notations, p. 271, and §4, pp. 283–288.
- STACKS: The Stacks Project Authors, *The Stacks Project*, [Tag 054L](https://stacks.math.columbia.edu/tag/054L), Lemma 29.37.21, Morphisms of Schemes, p. 83: smooth local étale coordinates; Tags 00OF and 031E (Algebra, Lemmas 10.110.9 and 10.112.8), 07QI, 07NT and 07C0 (More on Algebra, Lemmas 15.42.4, 15.42.7 and 15.42.2) and 07PM (More on Algebra, Proposition 15.50.2), read on the online Stacks Project: regularity transfer, composition and descent of regular maps, and the complete-local formal-smoothness criterion.
- SCHNEIDER11: Peter Schneider, *p-Adic Lie Groups*, [Springer 2011](https://doi.org/10.1007/978-3-642-21147-8), §§5–9, pp. 33–61. This paywalled reference is uncertified and is cited only by its specified locators; the inverse-function interface itself is pinned Mathlib.
