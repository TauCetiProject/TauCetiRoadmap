/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib
public import TauCeti.RepresentationTheory.Continuous.Unitary.Basic
public import TauCeti.Analysis.CStarAlgebra.Representation.Nondegenerate
public import TauCeti.Analysis.CStarAlgebra.Action.Hom
public import TauCeti.Analysis.CStarAlgebra.Action.Covariant.Regular
public import TauCeti.Analysis.CStarAlgebra.Action.CrossedProduct.Full
public import TauCeti.Analysis.CStarAlgebra.Action.CrossedProduct.Functoriality
public import TauCeti.GroupTheory.Amenable.Basic

/-!
# Operator-algebra dynamics: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, together with the
few definitions those statements need. Actions are Tau Ceti's `TauCeti.CStarAction`, covariant
pairs its `TauCeti.CStarAction.CovariantRepresentation` (a unitary, strongly continuous group
representation and a possibly degenerate coefficient representation), and the full crossed
product `A ⋊_α G` its `TauCeti.CStarAction.FullCrossedProduct`, whose integrated forms
`CovariantRepresentation.integratedFull` are defined on Hilbert spaces in the universe
`max u v` of `G : Type u` and `A : Type v`. The full group C*-algebra `C*(G)` is the full crossed
product of the trivial action on `ℂ`. Integrated forms are vector integrals, never operator-norm
Bochner integrals.

Stated here: the vector-integral integrated form of a covariant pair on integrable coefficient
functions with its norm bound, the recovery of a nondegenerate covariant pair from every
nondegenerate representation of `A ⋊_α G`, and the ideal exact sequence of full crossed products
(D1); the projective integrated form of a continuous central multiplier cocycle
(D1.CentralTwists); faithfulness on `A ⋊_α G` of the regular representation induced by a
faithful representation, for amenable `G` (D2; its instance for abelian `G` is the full/reduced
agreement of D4.Harmonic); irreducibility of the orbit representations (D2.OrbitRepresentations);
the Powers partition property of free groups and the simplicity and unique trace of the reduced
C*-algebra of a free group on at least two generators (D2.FreeGroups); the Fourier isomorphism
`C*(G) ≅ C₀(Ĝ)` of the full group C*-algebra and the identification `C*(Ĝ) ≅ C₀(G)`
(D4.Harmonic); the LCA Weyl classification, that every covariant pair of strongly continuous
unitary representations of a locally compact Hausdorff abelian group and of its dual is a Hilbert
sum of copies of the Schrödinger pair on `L²(G)` (D4.LCAWeyl); the residue-class Cuntz family on
a separable Hilbert space (D6).

Not statable at the pins, with the carrier each lacks:
- the reduced crossed product `A ⋊_{α,r} G` as an algebra, its exactness theory, and the
  universal property of `A ⋊_α G` for nondegenerate covariant homomorphisms into multiplier
  algebras: no reduced crossed-product carrier, and no extension of nondegenerate homomorphisms
  into the multiplier algebra of a C*-algebra `B` (the Hilbert-space extension is Tau Ceti's
  `NonUnitalStarAlgHom.multiplierExtension`, and the Hilbert-space form of the universal
  property, the recovery of the pair, is stated);
- `A ⋊_id G ≅ A ⊗_max C*(G)`, the coefficient-tensor identification, nuclearity and exactness
  of crossed products, and Takai duality `(A ⋊_α G) ⋊_α̂ Ĝ ≅ A ⊗ K(L²(G))`: no C*-tensor
  product and no dual action on the full crossed product;
- the twisted products `A ⋊_(α,ω) G` (D1.CentralTwists, D2.CentralTwists): no twisted crossed
  product;
- Green and symmetric imprimitivity (D3): no induced algebra and no imprimitivity-bimodule
  carrier (a bimodule with compatible left and right inner products, full on both sides);
- disintegration, Renault equivalence and the universal identification of `O_n` (D5–D6): no
  groupoid C*-algebra and no universal Cuntz algebra;
- the Choquet simplex of KMS states and the factor characterisation of its extreme points (D7):
  no Choquet simplex carrier (the invariance, analytic identity, convexity and compactness of
  KMS states are already Tau Ceti's);
- Araki's perturbed vectors `Ω^Q = exp((log Δ_Ω + Q)/2) Ω` and the perturbation of KMS states by
  them (D7): no modular operator of a cyclic separating vector (Mathlib's `StandardSubspace` has
  no Tomita conjugation);
- the quasi-free KMS states (D8) and the thermodynamic limit, variational principle and
  high-temperature uniqueness theorem (D9): no CAR C*-algebra of a Hilbert space (Tau Ceti's CAR
  files concern the algebraic Clifford algebra of a trace form), no Weyl C*-algebra and no
  quasi-local algebra (the finite-volume local algebras, dynamics and Gibbs states are already
  Tau Ceti's).
-/

@[expose] public section

noncomputable section
open MeasureTheory TauCeti
open scoped ComplexOrder MultiplierAlgebra CompactlySupported ZeroAtInfty

namespace TauCetiRoadmap.OperatorAlgebraDynamics

universe u v

/-! ## D1: Covariant representations and full crossed products -/

/-- The integrated form of a covariant pair on integrable coefficient functions: for a
Bochner-integrable `f : G → A`, the vector integrals `ξ ↦ ∫ π(f(s)) U_s ξ dμ(s)` assemble to a
bounded operator of norm at most `‖f‖₁`. Tau Ceti has this operator for compactly supported
continuous `f` and on the abstract completion of `C_c(G, A)`; this is the vector formula on
`L¹(G, A)`. Local compactness and inner regularity make the integrand strongly measurable on the
σ-finite support of `f`: a continuous orbit `s ↦ U_s ξ` has compact, hence separable, range on
each compact set, and nothing else makes it strongly measurable when `H` is not separable.
Covariance is not needed for this bound. -/
theorem exists_integratedOperator {G A H : Type*} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [LocallyCompactSpace G] [T2Space G] [MeasurableSpace G] [BorelSpace G]
    [NonUnitalCStarAlgebra A] [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    {α : CStarAction G A} (P : CStarAction.CovariantRepresentation α H)
    (μ : Measure G) [μ.InnerRegularCompactLTTop] (f : G → A) (hf : Integrable f μ) :
    ∃ T : H →L[ℂ] H,
      (∀ ξ, T ξ = ∫ g, P.coefficient (f g) (P.group g ξ) ∂μ) ∧ ‖T‖ ≤ ∫ g, ‖f g‖ ∂μ := by
  sorry

/-- Recovery of the pair (Williams, Proposition 2.40, p. 59): every nondegenerate representation
`L` of the full crossed product on a Hilbert space is the extended integrated form of a covariant
pair whose coefficient representation is nondegenerate. Uniqueness of such a pair is Tau Ceti's
`CovariantRepresentation.ext_integratedOperator`. -/
theorem exists_covariantRepresentation_integratedFull {G : Type u} {A : Type v}
    {H : Type (max u v)} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [LocallyCompactSpace G] [T2Space G] [MeasurableSpace G] [BorelSpace G]
    [NonUnitalCStarAlgebra A] [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (α : CStarAction G A) (μ : Measure G) [μ.IsHaarMeasure]
    (L : CStarAction.FullCrossedProduct α μ →⋆ₙₐ[ℂ] (H →L[ℂ] H)) (hL : L.IsNondegenerate) :
    ∃ P : CStarAction.CovariantRepresentation α H,
      P.coefficient.IsNondegenerate ∧ P.integratedFull μ = L := by
  sorry

/-- The ideal exact sequence of full crossed products (Williams, Proposition 3.19, p. 93): let
`q : A → B` be a surjective equivariant homomorphism whose kernel is the closed invariant ideal
`I`, so that `B` is the quotient `A/I` with the descended action. Then the induced maps
`I ⋊ G → A ⋊ G → B ⋊ G` form a short exact sequence: the first is injective, the second
surjective, and the kernel of the second is the range of the first. -/
theorem fullCrossedProductMap_exact {G : Type u} {A B : Type v} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [LocallyCompactSpace G] [T2Space G] [MeasurableSpace G] [BorelSpace G]
    [NonUnitalCStarAlgebra A] [NonUnitalCStarAlgebra B]
    {α : CStarAction G A} {β : CStarAction G B} (μ : Measure G) [μ.IsHaarMeasure]
    (I : NonUnitalStarSubalgebra ℂ A) [IsClosed (I : Set A)]
    (hI : _root_.IsInvariant (fun g a => α g a) (I : Set A))
    (q : CStarAction.Hom α β) (hq : Function.Surjective q) (hker : ∀ a, q a = 0 ↔ a ∈ I) :
    Function.Injective (hI.subtypeHom.fullCrossedProductMap μ) ∧
      Function.Surjective (q.fullCrossedProductMap μ) ∧
      ∀ x, q.fullCrossedProductMap μ x = 0 ↔
        x ∈ Set.range (hI.subtypeHom.fullCrossedProductMap μ) := by
  sorry

/-! ## D1.CentralTwists: continuous central multiplier cocycles -/

/-- A normalized continuous central `α`-cocycle with values in the unitary centre of the
multiplier algebra `M(A) = 𝓜(ℂ, A)`. Strict continuity is expressed through the native left and
right actions on `A`. The cocycle law `α̃_r(ω(s,t)) ω(r,st) = ω(r,s) ω(rs,t)` is stated on left
actions, using `α̃_r(m) b = α_r(m α_r⁻¹(b))` for the unique unital extension of `α_r`; left
multipliers determine a multiplier of a C*-algebra. -/
structure CentralCocycle {G A : Type*} [Group G] [TopologicalSpace G] [NonUnitalCStarAlgebra A]
    (α : CStarAction G A) where
  /-- The cocycle values. -/
  value : G → G → unitary (𝓜(ℂ, A))
  /-- Centrality in the multiplier algebra. -/
  central : ∀ s t (m : 𝓜(ℂ, A)), Commute (value s t : 𝓜(ℂ, A)) m
  /-- Normalization at the identity on the left. -/
  one_left : ∀ s, value 1 s = 1
  /-- Normalization at the identity on the right. -/
  one_right : ∀ s, value s 1 = 1
  /-- The cocycle identity on left actions. -/
  cocycle : ∀ r s t (a : A),
    α r ((value s t : 𝓜(ℂ, A)).fst ((α r).symm ((value r (s * t) : 𝓜(ℂ, A)).fst a))) =
      (value r s : 𝓜(ℂ, A)).fst ((value (r * s) t : 𝓜(ℂ, A)).fst a)
  /-- Joint norm continuity of `(s,t) ↦ ω(s,t) a`. -/
  strict_left : ∀ a : A, Continuous fun q : G × G =>
    (value q.1 q.2 : 𝓜(ℂ, A)).fst a
  /-- Joint norm continuity of `(s,t) ↦ a ω(s,t)`. -/
  strict_right : ∀ a : A, Continuous fun q : G × G =>
    (value q.1 q.2 : 𝓜(ℂ, A)).snd a

/-- A twisted covariant pair for a central cocycle: a nondegenerate representation `π` of `A` and
a strongly continuous family of unitaries `U` with `U_e = 1`, the covariance identity, and the
projective law `U_s U_t = π̃(ω(s,t)) U_(st)`, where `π̃` is the extension of `π` to the multiplier
algebra (Tau Ceti's `NonUnitalStarAlgHom.multiplierExtension`). `U` is not a representation
unless the represented cocycle is trivial. -/
structure CentralCovariantPair {G A : Type*} (H : Type*) [Group G] [TopologicalSpace G]
    [NonUnitalCStarAlgebra A] [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (α : CStarAction G A) (ω : CentralCocycle α) where
  /-- The coefficient representation. -/
  pi : A →⋆ₙₐ[ℂ] (H →L[ℂ] H)
  /-- Nondegeneracy of the coefficient representation. -/
  nondegenerate : pi.IsNondegenerate
  /-- The projective unitary family. -/
  unitaryMap : G → unitary (H →L[ℂ] H)
  /-- Normalization at the identity. -/
  at_one : unitaryMap 1 = 1
  /-- Strong continuity of the unitary family. -/
  strong_continuous : ∀ ξ : H, Continuous fun s => (unitaryMap s : H →L[ℂ] H) ξ
  /-- Covariance `U_s π(a) U_s* = π(α_s(a))`. -/
  covariance : ∀ s a,
    (unitaryMap s : H →L[ℂ] H) * pi a * star (unitaryMap s : H →L[ℂ] H) =
      pi (α s a)
  /-- The projective law `U_s U_t = π̃(ω(s,t)) U_(st)`. -/
  projective : ∀ s t,
    (unitaryMap s : H →L[ℂ] H) * (unitaryMap t : H →L[ℂ] H) =
      pi.multiplierExtension nondegenerate (ω.value s t : 𝓜(ℂ, A)) *
        (unitaryMap (s * t) : H →L[ℂ] H)

/-- The integrated form of a twisted covariant pair: the vector integrals
`ξ ↦ ∫ π(f(s)) U_s ξ dμ(s)` of an integrable `f` assemble to a bounded operator of norm at most
`‖f‖₁`; the same measurability argument as for `exists_integratedOperator` applies. -/
theorem exists_centralIntegratedOperator {G A H : Type*} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [LocallyCompactSpace G] [T2Space G] [MeasurableSpace G] [BorelSpace G]
    [NonUnitalCStarAlgebra A] [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (α : CStarAction G A) (ω : CentralCocycle α) (P : CentralCovariantPair H α ω)
    (μ : Measure G) [μ.InnerRegularCompactLTTop]
    (f : G → A) (hf : Integrable f μ) :
    ∃ T : H →L[ℂ] H,
      (∀ ξ, T ξ = ∫ s, P.pi (f s) ((P.unitaryMap s : H →L[ℂ] H) ξ) ∂μ) ∧
        ‖T‖ ≤ ∫ s, ‖f s‖ ∂μ := by
  sorry

/-! ## D2: Regular representations and amenability -/

/-- Full and reduced crossed products agree for amenable groups (Williams, Theorem 7.13,
p. 199): if `G` is amenable, in the sense of a left-invariant mean on the bounded left uniformly
continuous functions, and `ρ` is a faithful representation of `A`, then the regular covariant
representation induced by `ρ` on `L²(G, H)` integrates to a faithful representation of the full
crossed product. The representation `ρ` may be degenerate. Abelian groups are amenable, so this
contains the full/reduced agreement for abelian `G` of D4.Harmonic. -/
theorem injective_integratedFull_regular_of_amenable {G : Type u} {A H : Type v} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [LocallyCompactSpace G] [T2Space G]
    [MeasurableSpace G] [BorelSpace G] [TauCeti.Amenable G]
    [NonUnitalCStarAlgebra A] [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (α : CStarAction G A) (μ : Measure G) [μ.IsHaarMeasure] [μ.Regular]
    (ρ : A →⋆ₙₐ[ℂ] (H →L[ℂ] H)) (hρ : Function.Injective ρ) :
    Function.Injective ((CStarAction.CovariantRepresentation.regular α ρ μ).integratedFull μ) := by
  sorry

/-! ## D2.OrbitRepresentations: discrete orbits -/

/-- Irreducibility of an orbit representation. On the Hilbert sum `ℓ²(I)` of a transitive
`G`-set `I`, let `D f` be multiplication by a point-separating family of bounded functions and
`U g` the permutation `ξ ↦ ξ(g⁻¹ ·)`. Every bounded operator commuting with all `D f` and all `U g`
is a scalar: point separation kills the off-diagonal matrix coefficients, and transitivity makes
the diagonal constant. No discreteness or countability of `I` is used. -/
theorem transitive_commutant_scalar {G I F : Type*} [Group G] [MulAction G I]
    [Nonempty I] [MulAction.IsPretransitive G I]
    (value : F → I → ℂ)
    (hsep : ∀ i j : I, i ≠ j → ∃ f : F, value f i ≠ value f j)
    (D : F → (lp (fun _ : I => ℂ) 2 →L[ℂ] lp (fun _ : I => ℂ) 2))
    (hD : ∀ f ξ i, (D f ξ) i = value f i * ξ i)
    (U : G → (lp (fun _ : I => ℂ) 2 →L[ℂ] lp (fun _ : I => ℂ) 2))
    (hU : ∀ g ξ i, (U g ξ) i = ξ (g⁻¹ • i))
    (T : lp (fun _ : I => ℂ) 2 →L[ℂ] lp (fun _ : I => ℂ) 2)
    (hTD : ∀ f, T.comp (D f) = (D f).comp T)
    (hTU : ∀ g, T.comp (U g) = (U g).comp T) :
    ∃ c : ℂ, T = c • ContinuousLinearMap.id ℂ (lp (fun _ : I => ℂ) 2) := by
  sorry

/-! ## D2.FreeGroups: Powers averaging, simplicity and the canonical trace -/

/-- The Powers partition property of a free group on a basis with two distinct elements `a ≠ b`,
at arbitrary cardinality of the basis: for every finite set `F` of nontrivial elements and every
`N`, there is a partition `Γ = C ⊔ D` and elements `γ_1, …, γ_N` with `f C ∩ C = ∅` for `f ∈ F`
and the translates `γ_j D` pairwise disjoint (de la Harpe, Definition 9 and Corollary 12(i),
pp. 7–8). The translates are explicit set images, not an unspecified Powers predicate. -/
theorem exists_powers_partition {ι : Type*} (a b : ι) (hab : a ≠ b)
    (F : Finset (FreeGroup ι)) (hF : ∀ f ∈ F, f ≠ 1) (N : ℕ) :
    ∃ (C D : Set (FreeGroup ι)) (γ : Fin N → FreeGroup ι),
      Disjoint C D ∧ C ∪ D = Set.univ ∧
      (∀ f ∈ F, Disjoint ((fun x : FreeGroup ι => f * x) '' C) C) ∧
      Pairwise (fun i j : Fin N =>
        Disjoint ((fun x : FreeGroup ι => γ i * x) '' D)
          ((fun x : FreeGroup ι => γ j * x) '' D)) := by
  sorry

/-- The C*-algebra generated by a family of bounded operators: the norm closure of the unital
star subalgebra they generate. For the left-regular unitaries of a discrete group this is the
reduced group C*-algebra. -/
def generatedCStarAlgebra {H ι : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] (T : ι → (H →L[ℂ] H)) : StarSubalgebra ℂ (H →L[ℂ] H) :=
  (StarAlgebra.adjoin ℂ (Set.range T)).topologicalClosure

/-- Powers's theorem: the reduced C*-algebra of a free group on a basis with two distinct
elements is simple, as a ring: every two-sided ideal, closed or not, is `0` or everything. The
left-regular unitaries on `ℓ²(FreeGroup ι)` are pinned by their coordinate law
`(λ_g ξ)(h) = ξ(g⁻¹ h)` (de la Harpe, Theorem 14 and its proof, pp. 10–11). -/
theorem reducedFreeGroup_isSimpleRing {ι : Type*} (a b : ι) (hab : a ≠ b)
    (lam : FreeGroup ι → (lp (fun _ : FreeGroup ι => ℂ) 2 →L[ℂ] lp (fun _ : FreeGroup ι => ℂ) 2))
    (hlam : ∀ g ξ h, (lam g ξ) h = ξ (g⁻¹ * h)) :
    IsSimpleRing (generatedCStarAlgebra lam) := by
  sorry

/-- Uniqueness of the trace: every tracial state on the reduced C*-algebra of a free group on a
basis with two distinct elements is the canonical trace `τ(x) = ⟨δ_1, x δ_1⟩`, the inner product
being linear in the second variable. A state is a continuous linear functional that is positive on
`x* x` and takes the value `1` at the unit (de la Harpe, Theorem 14 with the Dixmier-property
remark on p. 19). -/
theorem reducedFreeGroup_trace_unique {ι : Type*} [DecidableEq ι] (a b : ι) (hab : a ≠ b)
    (lam : FreeGroup ι → (lp (fun _ : FreeGroup ι => ℂ) 2 →L[ℂ] lp (fun _ : FreeGroup ι => ℂ) 2))
    (hlam : ∀ g ξ h, (lam g ξ) h = ξ (g⁻¹ * h))
    (φ : generatedCStarAlgebra lam →L[ℂ] ℂ)
    (hpos : ∀ x, 0 ≤ φ (star x * x)) (hone : φ 1 = 1)
    (htrace : ∀ x y, φ (x * y) = φ (y * x)) (x : generatedCStarAlgebra lam) :
    φ x = inner ℂ (lp.single 2 (1 : FreeGroup ι) (1 : ℂ))
      ((x : lp (fun _ : FreeGroup ι => ℂ) 2 →L[ℂ] lp (fun _ : FreeGroup ι => ℂ) 2)
        (lp.single 2 (1 : FreeGroup ι) (1 : ℂ))) := by
  sorry

/-! ## D4.Harmonic: the Fourier isomorphism of the group C*-algebra and `C*(Ĝ) ≅ C₀(G)` -/

/-- The Fourier isomorphism of the full group C*-algebra (Williams, Proposition 3.1, p. 82): for a
locally compact Hausdorff abelian group `G` with a regular Haar measure `μ`, the full group
C*-algebra `C*(G) = ℂ ⋊ G` is isomorphic to `C₀(Ĝ)` by a ⋆-isomorphism sending a compactly
supported continuous `f` to its positive-character transform `χ ↦ ∫ f(g) χ(g) dμ(g)`. -/
theorem exists_fullGroupCStarAlgebra_equiv_zeroAtInfty_dual {G : Type u} [CommGroup G]
    [TopologicalSpace G] [IsTopologicalGroup G] [LocallyCompactSpace G] [T2Space G]
    [MeasurableSpace G] [BorelSpace G] (μ : Measure G) [μ.IsHaarMeasure] [μ.Regular] :
    ∃ e : CStarAction.FullCrossedProduct (CStarAction.trivial : CStarAction G ℂ) μ ≃⋆ₐ[ℂ]
        C₀(PontryaginDual G, ℂ),
      ∀ (f : C_c(G, ℂ)) (χ : PontryaginDual G),
        e (CStarAction.FullCrossedProduct.of CStarAction.trivial μ
            (CStarAction.ConvolutionAlgebra.toConv f)) χ =
          ∫ g, f g * (χ g : ℂ) ∂μ := by
  sorry

/-- The identification `C*(Ĝ) ≅ C₀(G)`: for a locally compact Hausdorff abelian group `G` and a
regular Haar measure `ν` on its dual, the full group C*-algebra of `Ĝ` is isomorphic to `C₀(G)` by
a ⋆-isomorphism sending a compactly supported continuous `f` on `Ĝ` to the function
`t ↦ ∫ f(χ) χ(t) dν(χ)`. It is the Fourier isomorphism of `Ĝ` composed with the Pontryagin
duality isomorphism `G ≅ (Ĝ)^`, `t ↦ (χ ↦ χ(t))`. -/
theorem exists_fullGroupCStarAlgebra_dual_equiv_zeroAtInfty {G : Type u} [CommGroup G]
    [TopologicalSpace G] [IsTopologicalGroup G] [LocallyCompactSpace G] [T2Space G]
    [MeasurableSpace (PontryaginDual G)] [BorelSpace (PontryaginDual G)]
    (ν : Measure (PontryaginDual G)) [ν.IsHaarMeasure] [ν.Regular] :
    ∃ e : CStarAction.FullCrossedProduct
          (CStarAction.trivial : CStarAction (PontryaginDual G) ℂ) ν ≃⋆ₐ[ℂ] C₀(G, ℂ),
      ∀ (f : C_c(PontryaginDual G, ℂ)) (t : G),
        e (CStarAction.FullCrossedProduct.of CStarAction.trivial ν
            (CStarAction.ConvolutionAlgebra.toConv f)) t =
          ∫ χ, f χ * (χ t : ℂ) ∂ν := by
  sorry

/-! ## D4.LCAWeyl: the locally compact abelian Weyl classification -/

/-- The LCA Weyl classification (Williams, Theorems 4.24 and 4.29, pp. 133–137): for a locally
compact Hausdorff abelian group `K` with a regular Haar measure `μ`, a strongly continuous unitary
representation `U` of `K` and a strongly continuous unitary representation `V` of its dual on `E`
with the covariance `U_s V_χ U_s* = conj(χ(s)) V_χ` are, through a unitary `W` of `E` onto the
Hilbert sum of copies of `L²(K, μ)` indexed by some set `ι`, the multiplicity amplification of the
Schrödinger pair: in every coordinate and almost everywhere `U_s` acts by `ξ(t) ↦ ξ(s⁻¹ t)` and
`V_χ` by `ξ(t) ↦ χ(t) ξ(t)`. `ι` is empty for `E = 0`; nondegeneracy of the integrated form of
`V` follows from strong continuity and is not a hypothesis. -/
theorem lcaWeyl_classification {K : Type*} [CommGroup K] [TopologicalSpace K]
    [IsTopologicalGroup K] [LocallyCompactSpace K] [T2Space K] [MeasurableSpace K] [BorelSpace K]
    {E : Type u} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
    (μ : Measure K) [μ.IsHaarMeasure] [μ.Regular]
    (U : ContRepresentation ℂ K E) (hU : _root_.ContRepresentation.IsUnitary U)
    (hUc : ∀ ξ, Continuous fun s => U s ξ)
    (V : ContRepresentation ℂ (PontryaginDual K) E)
    (hV : _root_.ContRepresentation.IsUnitary V)
    (hVc : ∀ ξ, Continuous fun χ => V χ ξ)
    (hcov : ∀ (s : K) (χ : PontryaginDual K),
      U s * V χ * star (U s) = ((starRingEnd ℂ) (χ s : ℂ)) • V χ) :
    ∃ (ι : Type u) (W : E ≃ₗᵢ[ℂ] lp (fun _ : ι => Lp ℂ 2 μ) 2),
      (∀ (s : K) (ξ : E) (i : ι),
        ((W (U s ξ)) i : K → ℂ) =ᵐ[μ] fun t => ((W ξ) i : K → ℂ) (s⁻¹ * t)) ∧
      (∀ (χ : PontryaginDual K) (ξ : E) (i : ι),
        ((W (V χ ξ)) i : K → ℂ) =ᵐ[μ] fun t => (χ t : ℂ) * ((W ξ) i : K → ℂ) t) := by
  sorry

/-! ## D6: concrete Cuntz families -/

/-- The residue-class Cuntz family on a Hilbert space with a Hilbert basis indexed by `ℕ`: for
`n ≥ 1` there are isometries `S_j`, `j < n`, with `S_j b_k = b_(nk+j)`, adjoints
`S_j* b_k = b_(k/n)` when `k ≡ j (mod n)` and `0` otherwise, `S_i* S_j = δ_ij`, and
`∑_j S_j S_j* = 1` as identities of continuous linear maps (Cuntz, §1). -/
theorem exists_residue_family {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] (b : HilbertBasis ℕ ℂ H) (n : ℕ) (hn : 0 < n) :
    ∃ S : Fin n → (H →L[ℂ] H),
      (∀ (j : Fin n) (k : ℕ), S j (b k) = b (n * k + j.val)) ∧
      (∀ (j : Fin n) (k : ℕ),
        ContinuousLinearMap.adjoint (S j) (b k) =
          if k % n = j.val then b (k / n) else 0) ∧
      (∀ i j : Fin n,
        (ContinuousLinearMap.adjoint (S i)).comp (S j) =
          if i = j then (1 : H →L[ℂ] H) else 0) ∧
      (∑ j : Fin n, (S j).comp (ContinuousLinearMap.adjoint (S j))) =
        (1 : H →L[ℂ] H) := by
  sorry

end TauCetiRoadmap.OperatorAlgebraDynamics
