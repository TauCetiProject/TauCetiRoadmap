import Mathlib

/-!
# Polylogarithms: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned APIs: ideal volume, the Lobachevsky and Kummer formulas,
the explicit trilogarithm relations, weight-three Zagier existence and every-family
rationality, totally-real even-weight existence, and elliptic-kernel absolute convergence.
The analytic functions are restated by the formulas of PolylogarithmFunctions; universal
relation tests express the weight-three cycle condition on native tensor carriers.

The descent/Borel comparisons and configuration lifting cannot yet be stated on their actual
objects: the pins lack the Bloch-group, configuration-complex and higher K-theory regulator
carriers. Explicit/universal chain-regulator comparisons lack manifold form-test currents,
higher-cycle Deligne complexes and their regulator maps; the Green presentation is in H^(2n)
of the modified fiber, at higher-Chow index zero. Reciprocity constructions, including
characteristic-zero strong reciprocity, lack curve-function-field Bloch complexes and their
residue homotopies. The next-to-Milnor residue exactness, canonically truncated
reciprocity systems and motivic comparison also lack the pre-Bloch and higher-Chow carriers;
the pinned linear and cochain APIs do not provide those objects. The elliptic regulator
pairing additionally lacks those curve/current regulator maps. These headlines have no
substitute statements here. The weight-four theorem belongs to Polylogarithms, Part II.
-/

namespace TauCetiRoadmap.Polylogarithms

open scoped Classical TensorProduct BigOperators
open NumberField

universe u

/-! ## Definitions for the headline statements -/

/-- The natural-index classical polylogarithm `Liₙ`, with the lower boundary value on the cut.
This is PolylogarithmFunctions' function, with its API and Checks there; an implementation uses
that declaration. -/
noncomputable def polylog (n : ℕ) (z : ℂ) : ℂ :=
  if n = 0 then z / (1 - z)
  else if n = 1 then -Complex.log (1 - z)
  else (1 / ((n - 2).factorial : ℂ)) *
    ∫ t : ℝ in (0 : ℝ)..1,
      ((-Real.log t) ^ (n - 2) : ℝ) * (-Complex.log (1 - (t : ℂ) * z)) / (t : ℂ)

/-- Zagier's Bernoulli combination `Lₙ`, using `bernoulli 1 = -1/2`, for `n ≥ 2`; the
PolylogarithmFunctions function restated by its formula. -/
noncomputable def singleValued (n : ℕ) (z : ℂ) : ℝ :=
  let s : ℂ := ∑ k ∈ Finset.range n,
    ((2 : ℂ) ^ k * (bernoulli k : ℂ) / (k.factorial : ℂ)) *
      polylog (n - k) z * (Real.log ‖z‖ : ℂ) ^ k
  if Odd n then s.re else s.im

/-- The Bloch–Wigner function `D = L₂`, restated from PolylogarithmFunctions; the logarithmic
term vanishes at `z = 0` by totalization. -/
noncomputable def blochWigner (z : ℂ) : ℝ :=
  (polylog 2 z).im + Complex.arg (1 - z) * Real.log ‖z‖

/-- The rationalized unit vector; zero has no unit and is assigned the zero vector. -/
noncomputable def unitVector {F : Type u} [Field F] (x : F) :
    ℚ ⊗[ℤ] Additive Fˣ :=
  if h : x = 0 then 0 else
    (1 : ℚ) ⊗ₜ[ℤ] Additive.ofMul (Units.mk0 x h)

/-- Functions satisfying precisely the normalized rational five-term presentation. -/
def FiveTermFunction {F : Type u} [Field F] {V : Type u}
    [AddCommGroup V] [Module ℚ V] (b : F → V) : Prop :=
  b 0 = 0 ∧ b 1 = 0 ∧ ∀ x y : F,
    x ≠ 0 → x ≠ 1 → y ≠ 0 → y ≠ 1 → x ≠ y →
    b x - b y + b (y / x) - b ((1 - x⁻¹) / (1 - y⁻¹)) +
      b ((1 - x) / (1 - y)) = 0

/-- One cyclic block of the coordinate 22-term trilogarithm relation. -/
def trilogCyclic {F : Type u} [Field F] {V : Type u} [AddCommGroup V]
    (b : F → V) (a c d : F) : V :=
  let A := d * a - a + 1
  let B := c * d - d + 1
  b A + b (A / (d * a)) + b d + b (B / (A * c)) - b (A / d) +
    b (-B * a / A) - b (B / (A * c * d)) - b 1

/-- Functions on the explicit rational weight-three presentation, including the endpoint 0. -/
def TrilogRelationFunction {F : Type u} [Field F] {V : Type u}
    [AddCommGroup V] [Module ℚ V] (b : F → V) : Prop :=
  b 0 = 0 ∧
  (∀ x : F, x ≠ 0 → b x = b x⁻¹) ∧
  (∀ x : F, x ≠ 0 → b x + b (1 - x) + b (1 - x⁻¹) = b 1) ∧
  ∀ a c d : F, a ≠ 0 → c ≠ 0 → d ≠ 0 →
    d * a - a + 1 ≠ 0 → a * c - c + 1 ≠ 0 → c * d - d + 1 ≠ 0 →
    trilogCyclic b a c d + trilogCyclic b c d a + trilogCyclic b d a c +
      b (-a * c * d) = 0

/-- A weight-three cycle is a rational symbol sum whose cobracket vanishes against every
five-term function. The README target `isCycle3_iff_delta_eq_zero` identifies this native
predicate with δ₃c = 0 through the quotient universal property. -/
def IsCycle3 {F : Type u} [Field F] (c : F →₀ ℚ) : Prop :=
  ∀ (V : Type u) [AddCommGroup V] [Module ℚ V] (b : F → V),
    FiveTermFunction b →
      c.sum (fun x a => a • (b x ⊗ₜ[ℚ] unitVector x)) = 0

/-- The period matrix has embeddings as rows and symbol families as columns. -/
noncomputable def periodMatrix {F : Type u} [Field F] {ι : Type*}
    (n : ℕ) (σ : ι → F →+* ℂ) (c : ι → F →₀ ℚ) : Matrix ι ι ℝ :=
  fun i j => (c j).sum (fun x a => (a : ℝ) * singleValued n (σ i x))

/-- π^(n([F:Q]−d)) / √|disc F| times the d by d polylogarithmic determinant. -/
noncomputable def normalizedPeriod {F : Type u} [Field F] [NumberField F]
    {ι : Type*} [Fintype ι] [DecidableEq ι]
    (n : ℕ) (σ : ι → F →+* ℂ) (c : ι → F →₀ ℚ) : ℝ :=
  Real.pi ^ (n * (Module.finrank ℚ F - Fintype.card ι)) /
    Real.sqrt |(NumberField.discr F : ℝ)| * (periodMatrix n σ c).det

/-! ## Layer 2: dilogarithmic regulators, volume and Fourier estimates -/

/-- Lobachevsky's π-periodic function, defined by its convergent logarithmic integral. -/
noncomputable def lobachevsky (θ : ℝ) : ℝ :=
  -∫ t : ℝ in (0 : ℝ)..θ, Real.log |2 * Real.sin t|

/-- The analytic angle formula, before its identification with a geometric volume. -/
theorem blochWigner_lobachevsky (z : ℂ) (hz : 0 < z.im) :
    blochWigner z = lobachevsky (Complex.arg z) +
      lobachevsky (Complex.arg (1 / (1 - z))) +
      lobachevsky (Complex.arg (1 - z⁻¹)) := by
  sorry

/-- The upper-half-space ideal region above the triangle with vertices zero, one and z.
For nonreal z its fourth face is the hemisphere through those vertices; real shapes have
empty region. -/
noncomputable def idealRegion (z : ℂ) : Set (ℂ × ℝ) :=
  if z.im = 0 then ∅ else
  let c : ℂ := 1 / 2 + Complex.I * (((‖z‖ ^ 2 - z.re) / (2 * z.im) : ℝ) : ℂ)
  {p | 0 < p.2 ∧ p.1 ∈ convexHull ℝ ({0, 1, z} : Set ℂ) ∧
    ‖c‖ ^ 2 ≤ p.2 ^ 2 + ‖p.1 - c‖ ^ 2}

/-- Oriented hyperbolic volume in upper-half-space coordinates, with density h⁻³. -/
noncomputable def signedIdealVolume (z : ℂ) : ℝ :=
  Real.sign z.im * ∫ p : ℂ × ℝ in idealRegion z, p.2 ^ (-3 : ℤ)

/-- The cusp geometry gives finite volume before comparison with a special function.
Milnor, Chapter 7, Theorem 7.2.1 and Lemma 7.2.2. -/
theorem idealRegion_finiteVolume (z : ℂ) (hz : z.im ≠ 0) :
    MeasureTheory.IntegrableOn (fun p : ℂ × ℝ => p.2 ^ (-3 : ℤ)) (idealRegion z) := by
  sorry

/-- The signed geometric integral equals the Bloch–Wigner dilogarithm for every nonreal shape.
Milnor, Theorem 7.2.1; Zagier, The dilogarithm function, equation (8). -/
theorem idealTetrahedron_volume (z : ℂ) (hz : z.im ≠ 0) :
    signedIdealVolume z = blochWigner z := by
  sorry

/-- Reduction to three unit-circle points, with all denominators protected. -/
theorem blochWigner_kummer (z : ℂ) (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    blochWigner z = (1 / 2 : ℝ) *
      (blochWigner (z / star z) +
       blochWigner ((1 - star z) / (1 - z)) +
       blochWigner ((1 - z⁻¹) / star (1 - z⁻¹))) := by
  sorry

/-! ## Layer 3: the explicit trilogarithmic complex -/

/-- The real single-valued trilogarithm satisfies the explicit weight-three presentation,
including the endpoint form of the three-term relation; it therefore descends to the explicit
group. -/
theorem singleValued_three_relations :
    TrilogRelationFunction (singleValued 3) := by
  sorry

/-- Prime valuations distinguish three nonzero independent rationalized units. -/
example : LinearIndependent ℚ (![unitVector (2 : ℚ), unitVector (3 : ℚ), unitVector (5 : ℚ)]) := by
  let : Fact (Nat.Prime 5) := ⟨by decide⟩
  let ord (p : ℕ) [Fact p.Prime] : Additive ℚˣ →+ ℚ :=
    { toFun := fun x => (padicValRat p (x.toMul : ℚ) : ℚ)
      map_zero' := by simp
      map_add' := by
        intro x y
        change (padicValRat p ((x.toMul : ℚ) * (y.toMul : ℚ)) : ℚ) = _
        rw [padicValRat.mul (Units.ne_zero _) (Units.ne_zero _), Int.cast_add] }
  let L (p : ℕ) [Fact p.Prime] : (ℚ ⊗[ℤ] Additive ℚˣ) →ₗ[ℚ] ℚ :=
    TensorProduct.AlgebraTensorModule.lift
      ((LinearMap.id : ℚ →ₗ[ℚ] ℚ).smulRight (ord p).toIntLinearMap)
  have hunit (p : ℕ) [Fact p.Prime] (a : ℚ) (ha : a ≠ 0) :
      L p (unitVector a) = (padicValRat p a : ℚ) := by
    rw [unitVector, dite_eq_right ha]
    change (1 : ℚ) • (padicValRat p a : ℚ) = _
    simp
  rw [Fintype.linearIndependent_iff]
  intro c hc
  simp only [Fin.sum_univ_three] at hc
  change c 0 • unitVector (2 : ℚ) + c 1 • unitVector (3 : ℚ) + c 2 • unitVector (5 : ℚ) = 0 at hc
  have h2 := congrArg (L 2) hc
  have h3 := congrArg (L 3) hc
  have h5 := congrArg (L 5) hc
  simp only [map_add, map_smul, map_zero, hunit _ 2 (by norm_num),
    hunit _ 3 (by norm_num), hunit _ 5 (by norm_num)] at h2 h3 h5
  have hval (p q : ℕ) [Fact p.Prime] [Fact q.Prime] :
      padicValRat p (q : ℚ) = if p = q then 1 else 0 := by
    rw [padicValRat.of_nat]
    split_ifs with h
    · subst q; simp
    · simp [padicValNat_primes h]
  have hv22 := hval 2 2
  have hv23 := hval 2 3
  have hv25 := hval 2 5
  have hv32 := hval 3 2
  have hv33 := hval 3 3
  have hv35 := hval 3 5
  have hv52 := hval 5 2
  have hv53 := hval 5 3
  have hv55 := hval 5 5
  norm_num at hv22 hv23 hv25 hv32 hv33 hv35 hv52 hv53 hv55
  rw [hv22, hv23, hv25] at h2
  rw [hv32, hv33, hv35] at h3
  rw [hv52, hv53, hv55] at h5
  norm_num at h2 h3 h5
  intro i
  fin_cases i
  · exact h2
  · exact h3
  · exact h5

/-- Weight-three Zagier existence, including the actual rational cycle condition.
Goncharov, Advances 1995, Theorem 1.1; the row equivalence selects every infinite place. -/
theorem zagier_three_exists (F : Type u) [Field F] [NumberField F]
    (e : Fin (InfinitePlace.nrRealPlaces F + InfinitePlace.nrComplexPlaces F) ≃
      InfinitePlace F) :
    ∃ c : Fin (InfinitePlace.nrRealPlaces F + InfinitePlace.nrComplexPlaces F) → F →₀ ℚ,
      (∀ j, IsCycle3 (c j)) ∧ ∃ q : ℚ, q ≠ 0 ∧
        normalizedPeriod 3 (fun i => (e i).embedding) c =
          (q : ℝ) * (NumberField.dedekindZeta F 3).re := by
  sorry

/-- Every rational weight-three cycle family has rational zeta-normalized period.
The proof uses the all-configuration cycle-lifting target of README §3.8. -/
theorem zagier_three_everyFamily (F : Type u) [Field F] [NumberField F]
    (e : Fin (InfinitePlace.nrRealPlaces F + InfinitePlace.nrComplexPlaces F) ≃
      InfinitePlace F)
    (c : Fin (InfinitePlace.nrRealPlaces F + InfinitePlace.nrComplexPlaces F) → F →₀ ℚ)
    (hc : ∀ j, IsCycle3 (c j)) :
    ∃ q : ℚ, normalizedPeriod 3 (fun i => (e i).embedding) c =
      (q : ℝ) * (NumberField.dedekindZeta F 3).re := by
  sorry

/-! ## Layer 4: inductive Bloch groups and the meaning of Zagier's statement -/

/-- Over a totally real field an even weight has no rows, and the empty determinant is a
nonzero rational multiple of `ζ_F(n)`: Borel's even-weight rationality, through
BorelRegulators. -/
theorem zagierExistence_totallyRealEven (F : Type u) [Field F] [NumberField F]
    [NumberField.IsTotallyReal F] (n : ℕ) (hn : 2 ≤ n) (heven : Even n)
    (σ : Fin 0 → F →+* ℂ) (c : Fin 0 → F →₀ ℚ) :
    ∃ q : ℚ, q ≠ 0 ∧
      normalizedPeriod n σ c = (q : ℝ) * (NumberField.dedekindZeta F n).re := by
  sorry

/-! ## Layer 5: logarithmic currents and explicit regulators -/

/-- The unitary character of a full complex lattice, normalized by its positive covolume. -/
noncomputable def ellipticCharacter (Λ : Submodule ℤ ℂ) [DiscreteTopology Λ]
    [IsZLattice ℝ Λ] (γ : Λ) (z : ℂ) : ℂ :=
  Complex.exp (2 * (Real.pi : ℂ) * Complex.I *
    (((z * star (γ : ℂ)).im / ZLattice.covolume Λ : ℝ) : ℂ))

/-- One coefficient of the generalized elliptic trilogarithm kernel.
The index carries both the zero-sum constraint and all three nonzero-frequency conditions. -/
noncomputable def ellipticTrilogSummand (Λ : Submodule ℤ ℂ) [DiscreteTopology Λ]
    [IsZLattice ℝ Λ] (x y z : ℂ)
    (g : {g : Fin 3 → Λ // (∑ i, g i) = 0 ∧ ∀ i, g i ≠ 0}) : ℂ :=
  ellipticCharacter Λ (g.val 0) x * ellipticCharacter Λ (g.val 1) y *
    ellipticCharacter Λ (g.val 2) z *
      (star ((g.val 2 : Λ) : ℂ) - star ((g.val 1 : Λ) : ℂ)) /
      ((‖((g.val 0 : Λ) : ℂ)‖ ^ 2 * ‖((g.val 1 : Λ) : ℂ)‖ ^ 2 *
        ‖((g.val 2 : Λ) : ℂ)‖ ^ 2 : ℝ) : ℂ)

/-- Absolute convergence of the full nonzero-triad elliptic trilogarithm kernel at all points.
The dyadic lattice estimate applies without any divisor-cycle restriction on x, y, z. -/
theorem ellipticTrilogKernel_summable (Λ : Submodule ℤ ℂ) [DiscreteTopology Λ]
    [IsZLattice ℝ Λ] (x y z : ℂ) :
    Summable (fun g : {g : Fin 3 → Λ // (∑ i, g i) = 0 ∧ ∀ i, g i ≠ 0} =>
      ‖ellipticTrilogSummand Λ x y z g‖) := by
  sorry

end TauCetiRoadmap.Polylogarithms
