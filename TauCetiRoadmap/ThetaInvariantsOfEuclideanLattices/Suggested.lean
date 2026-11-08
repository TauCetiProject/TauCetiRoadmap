module

public import Mathlib
public import TauCeti.Algebra.Module.ZLattice.Dual

/-!
# Theta invariants of Euclidean lattices: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, with only the definitions
their statements need. A Euclidean lattice is a `ℤ`-submodule `L` of a finite-dimensional real
inner product space `E`, with Mathlib's `DiscreteTopology L` and `IsZLattice ℝ L`; its dual is
Tau Ceti's `ZLattice.dual L`, the dual submodule of the inner product. An Arakelov divisor of a
number field `K` enters as the pair of its fractional ideal `I` and its real numbers `x v` at the
infinite places.

Definitions: README 1.1, `h0θ` and `h1θ`; README 4.1, `arakelovNormSq` and `h0Arakelov`.

Headline theorems stated here:

* README 1.2, `h0θ_sub_h1θ`: the Poisson–Riemann–Roch formula `h⁰_θ − h¹_θ = −log covol`.
* README 1.3, `h0θ_nonneg` and `h0θ_eq_zero_iff`: `h⁰_θ` is nonnegative and vanishes exactly on the
  zero lattice.
* README 1.4, `h0θ_le_of_contraction` and `h0θ_eq_of_contraction_iff`: monotonicity under
  injective contractions, with its equality case.
* README 1.5, `h0θ_sub_log_relIndex_le`: comparison with a sublattice of finite index.
* README 1.6, `h0θ_prod`: additivity on orthogonal sums.
* README 1.7, `h0θ_span_one`: `h⁰_θ(ℤ) = log (π^(1/4) / Γ(3/4))`.
* README 2.1, `tsum_exp_add_eq_tsum_exp_iff`: the coset mass equals the lattice mass exactly on
  the lattice.
* README 2.2, `tsum_fibre_le`: the fibre bound over a vector of the quotient lattice.
* README 2.3, `h0θ_le_h0θ_add_h0θ` and `h0θ_eq_h0θ_add_h0θ_iff`: subadditivity of `h⁰_θ` in an
  admissible extension, with equality exactly when it splits orthogonally.
* README 2.4, `h1θ_le_h1θ_add_h1θ`: subadditivity of `h¹_θ`.
* README 3.1, `exp_h0θ_sub_one_le_of_le_norm`: the upper bound by the first minimum.
* README 3.2, `exp_h0θ_sub_one_le_div_of_le_norm`: the Banaszczyk form of that bound.
* README 3.3, `tsum_tail_le`: the Gaussian mass of a coset outside a ball.
* README 4.2, `h0Arakelov_spanSingleton_mul`: invariance under principal divisors.
* README 4.3, `h0Arakelov_sub_h0Arakelov_dual`: the Riemann–Roch formula of van der Geer and
  Schoof.
* README 4.4, `exists_h0Arakelov_le`: decay of `h⁰` in degree at most `½ log |Δ_K|`.
* README 4.5, `h0Arakelov_le_of_forall_degree_eq_zero`: the conditional bound by the degree.

Every headline of the README is stated. The ideal lattice of an Arakelov divisor as a Euclidean
lattice is LFunctions' (Layer 1), whose declarations are not at the pins; the statements of Layer 4
are therefore written with the sums over the fractional ideal, which is what `h0Arakelov` is.
-/

@[expose] public section

open Module NumberField
open scoped Real RealInnerProductSpace nonZeroDivisors

namespace TauCetiRoadmap.ThetaInvariantsOfEuclideanLattices

variable {E F : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [NormedAddCommGroup F] [InnerProductSpace ℝ F]

/-! ## Layer 1: theta invariants and the Poisson–Riemann–Roch formula -/

/-- README 1.1. The theta invariant `h⁰_θ(L) = log ∑_{v ∈ L} exp (-π ‖v‖²)` of a `ℤ`-submodule `L`
of a real inner product space (Bost, (2.2.1)). -/
noncomputable def h0θ (L : Submodule ℤ E) : ℝ :=
  Real.log (∑' v : L, Real.exp (-π * ‖(v : E)‖ ^ 2))

/-- README 1.1. The theta invariant `h¹_θ(L) = h⁰_θ(L^∨)`, where `L^∨` is the dual lattice
`ZLattice.dual L` (Bost, (2.2.2)). -/
noncomputable def h1θ (L : Submodule ℤ E) : ℝ :=
  h0θ (ZLattice.dual L)

/-- README 1.2. The Poisson–Riemann–Roch formula `h⁰_θ(L) − h¹_θ(L) = −log covol(L)` for a full
lattice (Bost, (2.2.3)). -/
theorem h0θ_sub_h1θ [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L] :
    h0θ L - h1θ L = -Real.log (ZLattice.covolume L) :=
  sorry

/-- README 1.3. The theta invariant of a discrete subgroup is nonnegative (Bost, Proposition
2.3.1). -/
theorem h0θ_nonneg [FiniteDimensional ℝ E] (L : Submodule ℤ E) [DiscreteTopology L] :
    0 ≤ h0θ L :=
  sorry

/-- README 1.3. The theta invariant of a discrete subgroup vanishes exactly on the zero subgroup
(Bost, Proposition 2.3.1). -/
theorem h0θ_eq_zero_iff [FiniteDimensional ℝ E] (L : Submodule ℤ E) [DiscreteTopology L] :
    h0θ L = 0 ↔ L = ⊥ :=
  sorry

/-- README 1.4. A linear contraction injective on `L` and mapping `L` into a discrete `M` does not
decrease `h⁰_θ` (Bost, Proposition 2.3.2 (1)). -/
theorem h0θ_le_of_contraction [FiniteDimensional ℝ F] (φ : E →ₗ[ℝ] F) (hφ : ∀ x, ‖φ x‖ ≤ ‖x‖)
    (L : Submodule ℤ E) (M : Submodule ℤ F) [DiscreteTopology M] (hinj : Set.InjOn φ L)
    (hLM : ∀ v ∈ L, φ v ∈ M) :
    h0θ L ≤ h0θ M :=
  sorry

/-- README 1.4. Equality holds in `h0θ_le_of_contraction` exactly when `φ` preserves the norm on
`L` and maps `L` onto `M` (Bost, Proposition 2.3.2, equality case). -/
theorem h0θ_eq_of_contraction_iff [FiniteDimensional ℝ F] (φ : E →ₗ[ℝ] F)
    (hφ : ∀ x, ‖φ x‖ ≤ ‖x‖) (L : Submodule ℤ E) (M : Submodule ℤ F) [DiscreteTopology M]
    (hinj : Set.InjOn φ L) (hLM : ∀ v ∈ L, φ v ∈ M) :
    h0θ L = h0θ M ↔ (∀ v ∈ L, ‖φ v‖ = ‖v‖) ∧ ∀ w ∈ M, ∃ v ∈ L, φ v = w :=
  sorry

/-- README 1.5. For a subgroup `M` of finite index in a discrete `L`,
`h⁰_θ(L) − log [L : M] ≤ h⁰_θ(M)` (Bost, Corollary 2.3.4). -/
theorem h0θ_sub_log_relIndex_le [FiniteDimensional ℝ E] {M L : Submodule ℤ E}
    [DiscreteTopology L] (hML : M ≤ L) (hfin : M.toAddSubgroup.relIndex L.toAddSubgroup ≠ 0) :
    h0θ L - Real.log (M.toAddSubgroup.relIndex L.toAddSubgroup) ≤ h0θ M :=
  sorry

/-- README 1.6. The theta invariant of the orthogonal sum `L ⊕ M ⊆ E ⊕₂ F` is the sum of the
theta invariants (Bost, Proposition 2.5.1). -/
theorem h0θ_prod [FiniteDimensional ℝ E] [FiniteDimensional ℝ F] (L : Submodule ℤ E)
    (M : Submodule ℤ F) [DiscreteTopology L] [DiscreteTopology M] :
    h0θ ((L.prod M).comap (WithLp.linearEquiv 2 ℤ (E × F)).toLinearMap) = h0θ L + h0θ M :=
  sorry

/-- README 1.7. `h⁰_θ(ℤ) = log (π^(1/4) / Γ(3/4))` (van der Geer–Schoof, Proposition 4). -/
theorem h0θ_span_one :
    h0θ (Submodule.span ℤ {(1 : ℝ)}) = Real.log (π ^ (1 / 4 : ℝ) / Real.Gamma (3 / 4)) :=
  sorry

/-! ## Layer 2: cosets and admissible extensions -/

/-- README 2.1. The Gaussian mass of the coset `x + L` of a full lattice equals that of `L`
exactly when `x ∈ L` (Bost, (2.1.7); Groenewegen, Lemma 5.2). -/
theorem tsum_exp_add_eq_tsum_exp_iff [FiniteDimensional ℝ E] (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (x : E) :
    ∑' v : L, Real.exp (-π * ‖x + v‖ ^ 2) = ∑' v : L, Real.exp (-π * ‖(v : E)‖ ^ 2) ↔ x ∈ L :=
  sorry

/-- README 2.2. For a subspace `K` spanned by `L ∩ K`, the Gaussian mass of the vectors of `L`
projecting to `g` in `Kᗮ` is at most `exp (-π ‖g‖²)` times the mass of `L ∩ K` (Bost, Lemma
2.8.2). -/
theorem tsum_fibre_le [FiniteDimensional ℝ E] (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (K : Submodule ℝ E)
    (hK : Submodule.span ℝ (L.comap (K.subtype.restrictScalars ℤ) : Set K) = ⊤) (g : Kᗮ) :
    ∑' v : {v : L // Kᗮ.orthogonalProjectionOnto (v : E) = g},
        Real.exp (-π * ‖((v : L) : E)‖ ^ 2) ≤
      Real.exp (-π * ‖(g : E)‖ ^ 2) *
        ∑' e : L.comap (K.subtype.restrictScalars ℤ), Real.exp (-π * ‖((e : K) : E)‖ ^ 2) :=
  sorry

/-- README 2.3. Subadditivity of `h⁰_θ` in the admissible extension
`0 → L ∩ K → L → π_{Kᗮ}(L) → 0` (Bost, Proposition 2.8.1; Groenewegen, Lemma 5.3). -/
theorem h0θ_le_h0θ_add_h0θ [FiniteDimensional ℝ E] (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (K : Submodule ℝ E)
    (hK : Submodule.span ℝ (L.comap (K.subtype.restrictScalars ℤ) : Set K) = ⊤) :
    h0θ L ≤ h0θ (L.comap (K.subtype.restrictScalars ℤ)) +
      h0θ (L.map (((Kᗮ.orthogonalProjectionOnto : E →L[ℝ] Kᗮ) : E →ₗ[ℝ] Kᗮ).restrictScalars ℤ)) :=
  sorry

/-- README 2.3. Equality holds in `h0θ_le_h0θ_add_h0θ` exactly when the extension splits
orthogonally: the projection of every vector of `L` to `Kᗮ` lies in `L` (Bost, Proposition 2.8.1;
Groenewegen, Lemma 5.3). -/
theorem h0θ_eq_h0θ_add_h0θ_iff [FiniteDimensional ℝ E] (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (K : Submodule ℝ E)
    (hK : Submodule.span ℝ (L.comap (K.subtype.restrictScalars ℤ) : Set K) = ⊤) :
    h0θ L = h0θ (L.comap (K.subtype.restrictScalars ℤ)) +
        h0θ (L.map (((Kᗮ.orthogonalProjectionOnto : E →L[ℝ] Kᗮ) : E →ₗ[ℝ] Kᗮ).restrictScalars ℤ)) ↔
      ∀ v ∈ L, Kᗮ.starProjection v ∈ L :=
  sorry

/-- README 2.4. Subadditivity of `h¹_θ` in the same admissible extension, the duals taken in `K`
and `Kᗮ` (Bost, (2.8.3)). -/
theorem h1θ_le_h1θ_add_h1θ [FiniteDimensional ℝ E] (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (K : Submodule ℝ E)
    (hK : Submodule.span ℝ (L.comap (K.subtype.restrictScalars ℤ) : Set K) = ⊤) :
    h1θ L ≤ h1θ (L.comap (K.subtype.restrictScalars ℤ)) +
      h1θ (L.map (((Kᗮ.orthogonalProjectionOnto : E →L[ℝ] Kᗮ) : E →ₗ[ℝ] Kᗮ).restrictScalars ℤ)) :=
  sorry

/-! ## Layer 3: theta invariants and the first minimum -/

/-- README 3.1. If every nonzero vector of a full lattice of rank `n` has norm at least `r > 0`
and `n < 2π r²`, then `exp h⁰_θ(L) − 1 ≤ 3ⁿ (1 − n/(2π r²))⁻¹ exp (-π r²)` (Bost, Proposition
2.6.2; Groenewegen, Proposition 4.4). -/
theorem exp_h0θ_sub_one_le_of_le_norm [FiniteDimensional ℝ E] [Nontrivial E]
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L] {r : ℝ} (hr : 0 < r)
    (hL : ∀ v ∈ L, v ≠ 0 → r ≤ ‖v‖) (hn : (finrank ℝ E : ℝ) < 2 * π * r ^ 2) :
    Real.exp (h0θ L) - 1 ≤
      3 ^ finrank ℝ E * (1 - finrank ℝ E / (2 * π * r ^ 2))⁻¹ * Real.exp (-π * r ^ 2) :=
  sorry

/-- README 3.2. If every nonzero vector of a full lattice of rank `n` has norm at least
`(n/2π)^(1/2) t` with `t > 1`, then `exp h⁰_θ(L) − 1 ≤ q/(1 − q)` for
`q = (t exp (-(t² − 1)/2))ⁿ` (Bost, Corollary 3.2.3). -/
theorem exp_h0θ_sub_one_le_div_of_le_norm [FiniteDimensional ℝ E] [Nontrivial E]
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L] {t : ℝ} (ht : 1 < t)
    (hL : ∀ v ∈ L, v ≠ 0 → √(finrank ℝ E / (2 * π)) * t ≤ ‖v‖) :
    Real.exp (h0θ L) - 1 ≤
      (t * Real.exp (-(t ^ 2 - 1) / 2)) ^ finrank ℝ E /
        (1 - (t * Real.exp (-(t ^ 2 - 1) / 2)) ^ finrank ℝ E) :=
  sorry

/-- README 3.3. For `x : E` and `t ≥ 1`, the Gaussian mass of the vectors `v ∈ L` with
`‖v − x‖ ≥ (n/2π)^(1/2) t` is at most `(t exp (-(t² − 1)/2))ⁿ` times the mass of `L` (Bost,
Proposition 3.2.2). -/
theorem tsum_tail_le [FiniteDimensional ℝ E] [Nontrivial E] (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (x : E) {t : ℝ} (ht : 1 ≤ t) :
    ∑' v : {v : L // √(finrank ℝ E / (2 * π)) * t ≤ ‖(v : E) - x‖},
        Real.exp (-π * ‖((v : L) : E) - x‖ ^ 2) ≤
      (t * Real.exp (-(t ^ 2 - 1) / 2)) ^ finrank ℝ E * ∑' v : L, Real.exp (-π * ‖(v : E)‖ ^ 2) :=
  sorry

/-! ## Layer 4: Arakelov divisors of a number field -/

variable (K : Type*) [Field K] [NumberField K]

/-- README 4.1. The squared norm `‖f‖²_D = ∑_σ exp (-2 x_v / mult v) |σ f|²` of the Arakelov
divisor with infinite part `x`, the sum over the field embeddings `σ : K → ℂ`, `v` the place of
`σ` (van der Geer–Schoof, §2). -/
noncomputable def arakelovNormSq (x : InfinitePlace K → ℝ) (f : K) : ℝ :=
  ∑ σ : K →+* ℂ,
    Real.exp (-2 * x (InfinitePlace.mk σ) / ((InfinitePlace.mk σ).mult : ℝ)) * ‖σ f‖ ^ 2

/-- README 4.1. The invariant `h⁰(D) = log ∑_{f ∈ I} exp (-π ‖f‖²_D)` of the Arakelov divisor with
fractional ideal `I` and infinite part `x` (van der Geer–Schoof, §3). -/
noncomputable def h0Arakelov (I : FractionalIdeal (𝓞 K)⁰ K) (x : InfinitePlace K → ℝ) : ℝ :=
  Real.log (∑' f : (I : Submodule (𝓞 K) K), Real.exp (-π * arakelovNormSq K x f))

/-- README 4.2. `h⁰` is invariant under adding the principal divisor of `f ∈ Kˣ`, whose ideal is
`f⁻¹ 𝓞_K` and whose infinite part is `v ↦ −mult v · log |f|_v` (van der Geer–Schoof, §3). -/
theorem h0Arakelov_spanSingleton_mul (I : FractionalIdeal (𝓞 K)⁰ K) (x : InfinitePlace K → ℝ)
    {f : K} (hf : f ≠ 0) :
    h0Arakelov K (FractionalIdeal.spanSingleton (𝓞 K)⁰ f⁻¹ * I)
        (fun v ↦ x v - v.mult * Real.log (v f)) =
      h0Arakelov K I x :=
  sorry

/-- README 4.3. The Riemann–Roch formula `h⁰(D) − h⁰(κ − D) = deg D − ½ log |Δ_K|`, where
`κ − D` has the trace dual of `I` as ideal and `−x` as infinite part, and
`deg D = ∑_v x_v − log N(I)` (van der Geer–Schoof, Proposition 1). -/
theorem h0Arakelov_sub_h0Arakelov_dual (I : FractionalIdeal (𝓞 K)⁰ K) (hI : I ≠ 0)
    (x : InfinitePlace K → ℝ) :
    h0Arakelov K I x - h0Arakelov K (FractionalIdeal.dual ℤ ℚ I) (-x) =
      (∑ v, x v - Real.log (FractionalIdeal.absNorm I)) - Real.log |(discr K : ℝ)| / 2 :=
  sorry

/-- README 4.4. There is `β` such that `h⁰(D) ≤ β exp (-π n exp (-2 deg D / n))` for every
Arakelov divisor of degree at most `½ log |Δ_K|`, `n = [K : ℚ]` (van der Geer–Schoof, Corollary 1
of Proposition 2). -/
theorem exists_h0Arakelov_le :
    ∃ β : ℝ, ∀ I : FractionalIdeal (𝓞 K)⁰ K, I ≠ 0 → ∀ x : InfinitePlace K → ℝ,
      ∑ v, x v - Real.log (FractionalIdeal.absNorm I) ≤ Real.log |(discr K : ℝ)| / 2 →
        h0Arakelov K I x ≤ β * Real.exp (-π * finrank ℚ K *
          Real.exp (-2 * (∑ v, x v - Real.log (FractionalIdeal.absNorm I)) / finrank ℚ K)) :=
  sorry

/-- README 4.5. If `h⁰` is at most `h⁰(𝓞_K)` on the divisors of degree zero, then
`h⁰(D) ≤ deg D + h⁰(𝓞_K)` for every divisor of nonnegative degree (van der Geer–Schoof,
Proposition 3). -/
theorem h0Arakelov_le_of_forall_degree_eq_zero
    (hmax : ∀ I : FractionalIdeal (𝓞 K)⁰ K, I ≠ 0 → ∀ x : InfinitePlace K → ℝ,
      ∑ v, x v - Real.log (FractionalIdeal.absNorm I) = 0 → h0Arakelov K I x ≤ h0Arakelov K 1 0)
    (I : FractionalIdeal (𝓞 K)⁰ K) (hI : I ≠ 0) (x : InfinitePlace K → ℝ)
    (hdeg : 0 ≤ ∑ v, x v - Real.log (FractionalIdeal.absNorm I)) :
    h0Arakelov K I x ≤ (∑ v, x v - Real.log (FractionalIdeal.absNorm I)) + h0Arakelov K 1 0 :=
  sorry

end TauCetiRoadmap.ThetaInvariantsOfEuclideanLattices
