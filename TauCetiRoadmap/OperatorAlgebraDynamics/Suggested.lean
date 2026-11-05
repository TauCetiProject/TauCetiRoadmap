/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib
public import TauCeti.RepresentationTheory.Continuous.Unitary.Basic

/-!
# Operator-algebra dynamics: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, together with the
few definitions those statements need. Actions are `G →* (A ≃⋆ₐ[ℂ] A)` with point-norm
continuity stated separately; `ContRepresentation` carries bounded operators, so strong
continuity in the group variable is an explicit hypothesis; integrated forms are vector
integrals, never operator-norm Bochner integrals.

Stated here: the vector-integral integrated form of a covariant pair, its norm bound and its
multiplicativity on compactly supported continuous functions (D1); the projective integrated form
of a continuous central multiplier cocycle (D1.CentralTwists); irreducibility of the orbit
representations (D2.OrbitRepresentations); the Powers partition property of free groups and the
simplicity and unique trace of the reduced C*-algebra of a free group on at least two generators
(D2.FreeGroups); the LCA Weyl classification, that every covariant pair of strongly continuous
unitary representations of a locally compact Hausdorff abelian group and of its dual is a Hilbert
sum of copies of the Schrödinger pair on `L²(G)` (D4.LCAWeyl); the residue-class Cuntz family on a
separable Hilbert space (D6); invariance of KMS states and the analytic KMS identity (D7).

Not statable at the pins, with the carrier each lacks:
- the universal property of `A ⋊_α G`, the full and reduced comparison, the ideal exact sequence,
  Takai duality and the twisted products `A ⋊_(α,ω) G`: no crossed-product C*-algebra;
- the Fourier isomorphism `C*(G) ≅ C₀(Ĝ)` of the full group C*-algebra and the identification
  `C*(Ĝ) ≅ C₀(G)` (D4.Harmonic): no group C*-algebra `ℂ ⋊ G`;
- Green and symmetric imprimitivity (D3): no crossed-product C*-algebra to serve as the
  coefficient algebras of the imprimitivity bimodule (`CStarModule` is the module carrier, but
  `A ⋊_α G` and `D ⋊_β H` are not available);
- disintegration, Renault equivalence and the universal identification of `O_n` (D5–D6): no
  groupoid C*-algebra and no universal Cuntz algebra;
- the Choquet simplex of KMS states (D7): no Choquet simplex carrier;
- the quasi-free KMS states (D8) and the high-temperature uniqueness theorem (D9): no CAR algebra,
  Weyl algebra or quasi-local algebra.
-/

@[expose] public section

noncomputable section
open MeasureTheory
open scoped ComplexOrder MultiplierAlgebra

namespace TauCetiRoadmap.OperatorAlgebraDynamics

/-! ## D1: Covariant representations and integrated forms -/

variable {A G H : Type*} [NonUnitalCStarAlgebra A]
  [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-- A covariant pair: `U_g π(a) = π(α_g(a)) U_g` for every `g` and `a`, stated as an identity of
composed operators. -/
def IsCovariant (α : G →* (A ≃⋆ₐ[ℂ] A))
    (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H)) (U : ContRepresentation ℂ G H) : Prop :=
  ∀ g a, (U g).comp (π a) = (π (α g a)).comp (U g)

variable [MeasurableSpace G] [BorelSpace G] [LocallyCompactSpace G] [T2Space G]

/-- The convolution `(f * g)(s) = ∫ f(r) α_r(g(r⁻¹ s)) dμ(r)` of coefficient functions, as a
Bochner integral in `A`. -/
def convolution (α : G →* (A ≃⋆ₐ[ℂ] A)) (μ : Measure G) (f g : G → A) (s : G) : A :=
  ∫ r, f r * α r (g (r⁻¹ * s)) ∂μ

/-- The integrated form of a strongly continuous unitary representation and a representation of
`A`: for integrable `f`, the vector integrals `ξ ↦ ∫ π(f(s)) U_s ξ dμ(s)` assemble to a bounded
operator of norm at most `‖f‖₁`. Local compactness and inner regularity are used to show that the
integrand is strongly measurable on the σ-finite support of `f`: a continuous orbit `s ↦ U_s ξ` has
compact, hence separable, range on each compact set, and nothing else makes it strongly measurable
when `H` is not separable. Covariance is not needed for this bound. -/
theorem exists_integratedOperator (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H))
    (U : ContRepresentation ℂ G H) (hU : _root_.ContRepresentation.IsUnitary U)
    (hcont : ∀ ξ, Continuous fun g => U g ξ)
    (μ : Measure G) [μ.InnerRegularCompactLTTop]
    (f : G → A) (hf : Integrable f μ) :
    ∃ T : H →L[ℂ] H,
      (∀ ξ, T ξ = ∫ g, π (f g) (U g ξ) ∂μ) ∧ ‖T‖ ≤ ∫ g, ‖f g‖ ∂μ := by
  sorry

/-- Multiplicativity of the integrated form of a covariant pair: for left Haar measure `μ` and
compactly supported continuous `f, g`, the integrated operator of `f * g` is the composite of the
integrated operators of `f` and `g`. Only covariance, the group law of `U` and strong continuity
are used (Williams, Proposition 2.23, p. 49). -/
theorem integrated_convolution (α : G →* (A ≃⋆ₐ[ℂ] A))
    (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H)) (U : ContRepresentation ℂ G H)
    (hcont : ∀ ξ, Continuous fun g => U g ξ) (hcov : IsCovariant α π U)
    (μ : Measure G) [μ.IsHaarMeasure]
    (f g : G → A) (hf : Continuous f) (hfc : HasCompactSupport f)
    (hg : Continuous g) (hgc : HasCompactSupport g) (ξ : H) :
    ∫ s, π (convolution α μ f g s) (U s ξ) ∂μ =
      ∫ r, π (f r) (U r (∫ t, π (g t) (U t ξ) ∂μ)) ∂μ := by
  sorry

/-! ## D1.CentralTwists: continuous central multiplier cocycles -/

/-- A normalized continuous central `α`-cocycle with values in the unitary centre of the
multiplier algebra `M(A) = 𝓜(ℂ, A)`. Strict continuity is expressed through the native left and
right actions on `A`. The cocycle law `α̃_r(ω(s,t)) ω(r,st) = ω(r,s) ω(rs,t)` is stated on left
actions, using `α̃_r(m) b = α_r(m α_r⁻¹(b))` for the unique unital extension of `α_r`; left
multipliers determine a multiplier of a C*-algebra. -/
structure CentralCocycle (α : G →* (A ≃⋆ₐ[ℂ] A)) where
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
projective law `U_s U_t = π̃(ω(s,t)) U_(st)` stated after left multiplication by `π(a)`, where
`π(a) π̃(ω(s,t)) = π(a ω(s,t))`; nondegeneracy makes the two forms equivalent. `U` is not a
representation unless the represented cocycle is trivial. -/
structure CentralCovariantPair (α : G →* (A ≃⋆ₐ[ℂ] A)) (ω : CentralCocycle α) where
  /-- The coefficient representation. -/
  pi : A →⋆ₙₐ[ℂ] (H →L[ℂ] H)
  /-- Nondegeneracy of the coefficient representation. -/
  nondegenerate : Dense (Submodule.span ℂ {η : H | ∃ a ξ, pi a ξ = η} : Set H)
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
  /-- The projective law after left multiplication by `π(a)`. -/
  projective : ∀ s t (a : A),
    pi a * (unitaryMap s : H →L[ℂ] H) * (unitaryMap t : H →L[ℂ] H) =
      pi ((ω.value s t : 𝓜(ℂ, A)).snd a) * (unitaryMap (s * t) : H →L[ℂ] H)

/-- The integrated form of a twisted covariant pair: the vector integrals
`ξ ↦ ∫ π(f(s)) U_s ξ dμ(s)` of an integrable `f` assemble to a bounded operator of norm at most
`‖f‖₁`; the same measurability argument as for `exists_integratedOperator` applies. -/
theorem exists_centralIntegratedOperator (α : G →* (A ≃⋆ₐ[ℂ] A))
    (ω : CentralCocycle α) (P : CentralCovariantPair (H := H) α ω)
    (μ : Measure G) [μ.InnerRegularCompactLTTop]
    (f : G → A) (hf : Integrable f μ) :
    ∃ T : H →L[ℂ] H,
      (∀ ξ, T ξ = ∫ s, P.pi (f s) ((P.unitaryMap s : H →L[ℂ] H) ξ) ∂μ) ∧
        ‖T‖ ≤ ∫ s, ‖f s‖ ∂μ := by
  sorry

/-! ## D2.OrbitRepresentations: discrete orbits -/

omit [TopologicalSpace G] [IsTopologicalGroup G] [MeasurableSpace G] [BorelSpace G]
  [LocallyCompactSpace G] [T2Space G] in
/-- Irreducibility of an orbit representation. On the Hilbert sum `ℓ²(I)` of a transitive
`G`-set `I`, let `D f` be multiplication by a point-separating family of bounded functions and
`U g` the permutation `ξ ↦ ξ(g⁻¹ ·)`. Every bounded operator commuting with all `D f` and all `U g`
is a scalar: point separation kills the off-diagonal matrix coefficients, and transitivity makes
the diagonal constant. No discreteness or countability of `I` is used. -/
theorem transitive_commutant_scalar {I F : Type*} [MulAction G I]
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
def generatedCStarAlgebra {ι : Type*} (T : ι → (H →L[ℂ] H)) : StarSubalgebra ℂ (H →L[ℂ] H) :=
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

/-! ## D4.LCAWeyl: the locally compact abelian Weyl classification -/

section LCAWeyl

universe u

variable {K : Type*} [CommGroup K] [TopologicalSpace K] [IsTopologicalGroup K]
  [LocallyCompactSpace K] [T2Space K] [MeasurableSpace K] [BorelSpace K]
  {E : Type u} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]

/-- The LCA Weyl classification (Williams, Theorems 4.24 and 4.29, pp. 133–137): for a locally
compact Hausdorff abelian group `K` with a regular Haar measure `μ`, a strongly continuous unitary
representation `U` of `K` and a strongly continuous unitary representation `V` of its dual on `E`
with the covariance `U_s V_χ U_s* = conj(χ(s)) V_χ` are, through a unitary `W` of `E` onto the
Hilbert sum of copies of `L²(K, μ)` indexed by some set `ι`, the multiplicity amplification of the
Schrödinger pair: in every coordinate and almost everywhere `U_s` acts by `ξ(t) ↦ ξ(s⁻¹ t)` and
`V_χ` by `ξ(t) ↦ χ(t) ξ(t)`. `ι` is empty for `E = 0`; nondegeneracy of the integrated form of
`V` follows from strong continuity and is not a hypothesis. -/
theorem lcaWeyl_classification (μ : Measure K) [μ.IsHaarMeasure] [μ.Regular]
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

end LCAWeyl

/-! ## D6: concrete Cuntz families -/

/-- The residue-class Cuntz family on a Hilbert space with a Hilbert basis indexed by `ℕ`: for
`n ≥ 1` there are isometries `S_j`, `j < n`, with `S_j b_k = b_(nk+j)`, adjoints
`S_j* b_k = b_(k/n)` when `k ≡ j (mod n)` and `0` otherwise, `S_i* S_j = δ_ij`, and
`∑_j S_j S_j* = 1` as identities of continuous linear maps (Cuntz, §1). -/
theorem exists_residue_family (b : HilbertBasis ℕ ℂ H) (n : ℕ) (hn : 0 < n) :
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

/-! ## D7: KMS states -/

section KMS

variable [PartialOrder A]

/-- A `β`-KMS state for `β > 0`, in the upper-strip convention: a positive functional `φ` of norm
one such that for all `a, b` there is a bounded continuous function on the closed strip
`0 ≤ Im z ≤ β`, holomorphic inside, with boundary values `F(t) = φ(a α_t(b))` and
`F(t + iβ) = φ(α_t(b) a)`. The order on `A` is the C*-order, carried by `[StarOrderedRing A]`. -/
def IsKMS [StarOrderedRing A] (α : Multiplicative ℝ →* (A ≃⋆ₐ[ℂ] A)) (β : ℝ)
    (φ : A →P[ℂ] ℂ) : Prop :=
  0 < β ∧ ‖(φ : A →L[ℂ] ℂ)‖ = 1 ∧ ∀ a b : A,
    ∃ F : ℂ → ℂ,
      ContinuousOn F {z | 0 ≤ z.im ∧ z.im ≤ β} ∧
      DifferentiableOn ℂ F {z | 0 < z.im ∧ z.im < β} ∧
      Bornology.IsBounded (F '' {z | 0 ≤ z.im ∧ z.im ≤ β}) ∧
      (∀ t : ℝ, F t = φ (a * α (Multiplicative.ofAdd t) b)) ∧
      ∀ t : ℝ, F ((t : ℂ) + (β : ℂ) * Complex.I) =
        φ (α (Multiplicative.ofAdd t) b * a)

/-- A KMS state at positive temperature is invariant under the dynamics; this is not a
consequence of the trace condition at `β = 0` (Bratteli–Robinson, Proposition 5.3.3). -/
theorem kms_invariant [StarOrderedRing A] (α : Multiplicative ℝ →* (A ≃⋆ₐ[ℂ] A))
    (hα : ∀ a, Continuous fun t : ℝ => α (Multiplicative.ofAdd t) a)
    {β : ℝ} {φ : A →P[ℂ] ℂ} (hφ : IsKMS α β φ) (t : ℝ) (a : A) :
    φ (α (Multiplicative.ofAdd t) a) = φ a := by
  sorry

/-- The analytic KMS identity: if the orbit of `b` has an entire `A`-valued extension `F`, then
`φ(a F(iβ)) = φ(b a)`, the strip function of `(a, b)` agreeing with `z ↦ φ(a F(z))` by reflection
across the real axis (Bratteli–Robinson, Proposition 5.3.7). -/
theorem kms_entire_identity [StarOrderedRing A] (α : Multiplicative ℝ →* (A ≃⋆ₐ[ℂ] A))
    (hα : ∀ a, Continuous fun t : ℝ => α (Multiplicative.ofAdd t) a)
    {β : ℝ} {φ : A →P[ℂ] ℂ} (hφ : IsKMS α β φ)
    (a b : A) (F : ℂ → A) (hF : Differentiable ℂ F)
    (hreal : ∀ t : ℝ, F t = α (Multiplicative.ofAdd t) b) :
    φ (a * F ((β : ℂ) * Complex.I)) = φ (b * a) := by
  sorry

end KMS

end TauCetiRoadmap.OperatorAlgebraDynamics
