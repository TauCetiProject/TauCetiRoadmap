import Mathlib

/-!
# Habiro cyclotomic completions: headline theorems

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`; these statements suggest Lean forms for its headline results, and
discharging them finishes neither a layer nor the roadmap.

The statements cover the completion universal property (§1.3), unique normalized
factorial expansions (§2.1), convergent close-root Taylor re-expansion (§3.3),
restriction and single-root Taylor rigidity (§§4.2–4.3), evaluation uniqueness and proper integral Taylor images (§4.4), joint Taylor
injectivity and the rational Taylor isomorphism (§4.6), arbitrary comaximal
component decompositions (§5.2), and the domain factors, Taylor rigidity and
evaluation uniqueness over localized integers (§5.3). The supporting definitions use actual polynomial products, Mathlib's
`AdjoinRoot` quotients and power series. The completion topology is induced from
the product of discrete quotients. Taylor expansions are defined coefficientwise;
the roadmap also asks for their algebra-homomorphism laws.

The integral adjugate image criterion and its local detection (§§4.7–4.8) are not
stated: the weighted finite Taylor quotients, their ordered bases and comparison
matrices have no native definitions at the pins. The exact polynomial-module
completion and tensor comparison (§5.1), and ordinary completion's failure of
exactness on arbitrary polynomial-ring modules (§5.5), need the cyclotomic module
completion, its induced maps and the completed direct-sum carrier. The completed
localization identities (§5.4) need the fraction-field embeddings and denominator
monoids. These constructions require more than the light definitions here;
finite polynomial ingredients and reference calculations do not replace them.

The conventions are `P_N = ∏_{i=1}^N (1-q^i)`, additive Taylor variable `q-ζ`,
and universal multiplicative Taylor coordinate `q = z_m(1-u)`. Order sets in the
rigidity statements contain only positive orders. No conjecture about arbitrary
infinite evaluation sets or the integral unit group is assumed.
-/

noncomputable section

open Polynomial
open scoped Topology

namespace TauCetiRoadmap.HabiroCyclotomicCompletions

/-- Actual cyclotomic products, with coincident polynomials identified (§1.2). -/
def cycloIndex (R : Type*) [CommRing R] (S : Set ℕ) : Submonoid R[X] :=
  Submonoid.closure ((fun n => cyclotomic n R) '' S)

/-- Compatible quotient families under divisibility, with coordinatewise operations (§1.2). -/
def compatSubalgebra (R : Type*) [CommRing R] (S : Set ℕ) :
    Subalgebra R (∀ f : cycloIndex R S, AdjoinRoot (f : R[X])) where
  carrier := {x | ∀ (f g : cycloIndex R S) (h : (f : R[X]) ∣ g),
    AdjoinRoot.algHomOfDvd R (g : R[X]) (f : R[X]) h (x g) = x f}
  zero_mem' := by intro f g h; exact map_zero _
  one_mem' := by intro f g h; exact map_one _
  add_mem' := by
    intro x y hx hy f g h
    simp only [Pi.add_apply, map_add, hx f g h, hy f g h]
  mul_mem' := by
    intro x y hx hy f g h
    simp only [Pi.mul_apply, map_mul, hx f g h, hy f g h]
  algebraMap_mem' := by
    intro r f g h
    exact (AdjoinRoot.algHomOfDvd R (g : R[X]) (f : R[X]) h).commutes r

/-- The classical cyclotomic completion on Mathlib quotient carriers (§1.2). -/
abbrev CycloCompletion (R : Type*) [CommRing R] (S : Set ℕ) :=
  ↥(compatSubalgebra R S)

/-- The polynomial map into the compatible-family completion (§1.2). -/
def fromPoly (R : Type*) [CommRing R] (S : Set ℕ) :
    R[X] →ₐ[R] CycloCompletion R S where
  toFun p := ⟨fun f => AdjoinRoot.mk (f : R[X]) p, by
    intro f g h
    simp [AdjoinRoot.algHomOfDvd, AdjoinRoot.map, AdjoinRoot.lift_mk,
      ← AdjoinRoot.algebraMap_eq, ← Polynomial.aeval_def, AdjoinRoot.aeval_eq]⟩
  map_one' := rfl
  map_mul' _ _ := rfl
  map_zero' := rfl
  map_add' _ _ := rfl
  commutes' _ := rfl

/-- The inverse-limit topology with discrete polynomial quotients (§1.3). -/
instance (R : Type*) [CommRing R] (S : Set ℕ) :
    TopologicalSpace (CycloCompletion R S) :=
  TopologicalSpace.induced Subtype.val
    (@Pi.topologicalSpace (cycloIndex R S) (fun f => AdjoinRoot (f : R[X])) (fun _ => ⊥))

/-- Cyclotomically continuous polynomial maps extend uniquely to complete Hausdorff rings (§1.3). -/
theorem completion_universal_property (R : Type*) [CommRing R] (S : Set ℕ)
    {B : Type*} [CommRing B] [UniformSpace B] [IsUniformAddGroup B]
    [IsTopologicalRing B] [T2Space B] [CompleteSpace B]
    (ψ : R[X] →+* B)
    (hψ : ∀ U ∈ 𝓝 (0 : B), ∃ f : cycloIndex R S,
      ∀ p : R[X], (f : R[X]) ∣ p → ψ p ∈ U) :
    ∃! φ : CycloCompletion R S →+* B,
      Continuous φ ∧ φ.comp (fromPoly R S).toRingHom = ψ := by
  sorry

/-- Forgetting quotient coordinates outside a smaller order set (§1.5). -/
def restrict (R : Type*) [CommRing R] {S T : Set ℕ} (hTS : T ⊆ S) :
    CycloCompletion R S →ₐ[R] CycloCompletion R T where
  toFun x := ⟨fun f => x.1 ⟨f, Submonoid.closure_mono (Set.image_mono hTS) f.2⟩,
    by
      intro f g h
      exact x.2 ⟨f.val, Submonoid.closure_mono (Set.image_mono hTS) f.2⟩
        ⟨g.val, Submonoid.closure_mono (Set.image_mono hTS) g.2⟩ h⟩
  map_one' := rfl
  map_mul' _ _ := rfl
  map_zero' := rfl
  map_add' _ _ := rfl
  commutes' _ := rfl

/-- Additive Taylor coefficients from reduced representatives modulo `Φ_n^(k+1)` (§3.1). -/
def taylorAt {R : Type*} [CommRing R] {S : Set ℕ}
    (n : ℕ) (hn : n ∈ S) {B : Type*} [CommRing B] [Algebra R B]
    (ζ : B) (x : CycloCompletion R S) : PowerSeries B :=
  PowerSeries.mk fun k =>
    (hasseDeriv k (AdjoinRoot.modByMonicHom ((cyclotomic.monic n R).pow (k + 1))
      (x.1 ⟨cyclotomic n R ^ (k + 1),
        (cycloIndex R S).pow_mem (Submonoid.subset_closure
          (Set.mem_image_of_mem (fun n => cyclotomic n R) hn)) (k + 1)⟩))).eval₂
      (algebraMap R B) ζ

/-- Close-root Taylor coefficients satisfy convergent p-adic binomial re-expansion (§3.3). -/
theorem close_root_taylor_reexpansion {R B : Type*} [CommRing R] [CommRing B]
    [Algebra R B] {S : Set ℕ} (n n' : ℕ) (hn : n ∈ S) (hn' : n' ∈ S)
    (ζ ζ' : B) (hζ : Polynomial.aeval ζ (Polynomial.cyclotomic n R) = 0)
    (hζ' : Polynomial.aeval ζ' (Polynomial.cyclotomic n' R) = 0)
    (p : ℕ) (hp : p.Prime) [IsAdicComplete (Ideal.span {(p : B)}) B]
    (hclose : ∃ M : ℕ, 0 < M ∧ (ζ' - ζ) ^ M ∈ Ideal.span {(p : B)}) :
    letI : WithIdeal B := ⟨Ideal.span {(p : B)}⟩
    ∀ (x : CycloCompletion R S) (j : ℕ),
      HasSum (fun r : ℕ => ((j + r).choose j : B) *
        PowerSeries.coeff (j + r) (taylorAt n hn ζ x) * (ζ' - ζ) ^ r)
        (PowerSeries.coeff j (taylorAt n' hn' ζ' x)) := by
  sorry


/-- Order adjacency through separation at a prime-power ratio (§4.1, for positive orders). -/
def Adjacent (R : Type*) [CommRing R] (m n : ℕ) : Prop :=
  Subsingleton R ∨ m = n ∨ ∃ p : ℕ, p.Prime ∧
    (∃ a : ℕ, 0 < a ∧ (m = n * p ^ a ∨ n = m * p ^ a)) ∧
    IsHausdorff (Ideal.span {(p : R)}) R

/-- Nonempty order sets joined by adjacency chains lying inside the set (§4.1). -/
def IsAdjConnected (R : Type*) [CommRing R] (S : Set ℕ) : Prop :=
  S.Nonempty ∧ ∀ m ∈ S, ∀ n ∈ S,
    Relation.ReflTransGen (fun a b => a ∈ S ∧ b ∈ S ∧ Adjacent R a b) m n

/-- Universal root algebras retain every cyclotomic component (§4.5). -/
abbrev TaylorProduct (R : Type*) [CommRing R] :=
  ∀ m : ℕ+, PowerSeries (AdjoinRoot (cyclotomic (m : ℕ) R))

/-- The product topology of discrete universal Taylor coefficients (§4.5). -/
instance (R : Type*) [CommRing R] : TopologicalSpace (TaylorProduct R) :=
  TopologicalSpace.induced (fun f (i : ℕ+ × ℕ) => PowerSeries.coeff i.2 (f i.1))
    (@Pi.topologicalSpace (ℕ+ × ℕ)
      (fun i => AdjoinRoot (cyclotomic (i.1 : ℕ) R)) (fun _ => ⊥))

/-- The joint universal Taylor collection in coordinates `q = z_m(1-u)` (§4.6). -/
def iota (R : Type*) [CommRing R] (x : CycloCompletion R {n | 0 < n}) :
    TaylorProduct R :=
  fun m => PowerSeries.rescale (-AdjoinRoot.root (cyclotomic (m : ℕ) R))
    (taylorAt (m : ℕ) m.2 (AdjoinRoot.root (cyclotomic (m : ℕ) R)) x)

/-- Entire cyclotomic residues at the retained orders, without selecting roots (§4.4). -/
def universalValues (R : Type*) [CommRing R] (S T : Set ℕ) (hTS : T ⊆ S)
    (x : CycloCompletion R S) : ∀ m : T, AdjoinRoot (cyclotomic (m : ℕ) R) :=
  fun m => x.1 ⟨cyclotomic (m : ℕ) R,
    Submonoid.subset_closure (Set.mem_image_of_mem (fun n => cyclotomic n R) (hTS m.2))⟩

/-- The factorial polynomial `P_N = ∏_{i=1}^N (1-X^i)` (§1.4). -/
def factorialPoly (R : Type*) [CommRing R] (N : ℕ) : R[X] :=
  ∏ i ∈ Finset.range N, (1 - X ^ (i + 1))

/-- Every completed element has unique bounded-degree factorial digits, converging in every quotient (§2.1). -/
theorem factorial_expansion (R : Type*) [CommRing R]
    (x : CycloCompletion R {n | 0 < n}) :
    ∃! a : ℕ → R[X], (∀ n, (a n).degree ≤ n) ∧
      ∀ f : cycloIndex R {n | 0 < n}, ∀ᶠ N in Filter.atTop,
        AdjoinRoot.mk (f : R[X]) (∑ n ∈ Finset.range N, a n * factorialPoly R n) = x.1 f := by
  sorry

/-- Adjacency chains inside the source order set make restriction injective (§4.2). -/
theorem restrict_injective_of_chain (R : Type*) [CommRing R]
    {S T : Set ℕ} (hS : S ⊆ {n | 0 < n}) (hTS : T ⊆ S)
    (hchain : ∀ n ∈ S, ∃ m ∈ T,
      Relation.ReflTransGen (fun a b => a ∈ S ∧ b ∈ S ∧ Adjacent R a b) m n) :
    Function.Injective (restrict R hTS) := by
  sorry

/-- A single primitive-root Taylor expansion determines a connected completion under prime separation (§4.3). -/
theorem taylorAt_injective {R K : Type*} [CommRing R] [IsDomain R] [CharZero R]
    [Field K] [Algebra R K] [FaithfulSMul R K] {S : Set ℕ}
    (hS : S ⊆ {n | 0 < n}) (hconn : IsAdjConnected R S) (n : ℕ) (hn : n ∈ S)
    (hsep : ∀ p : ℕ, p.Prime → p ∣ n → (p ≠ 2 ∨ 4 ∣ n) →
      IsHausdorff (Ideal.span {(p : R)}) R)
    (ζ : K) (hζ : IsPrimitiveRoot ζ n) :
    Function.Injective (taylorAt (R := R) n hn
      (⟨ζ, Algebra.subset_adjoin (Set.mem_singleton ζ)⟩ : Algebra.adjoin R {ζ})) := by
  sorry

/-- Infinitely many orders adjacent to one order determine the completed element (§4.4). -/
theorem universalValues_injective (R : Subring (AlgebraicClosure ℚ))
    {S T : Set ℕ} (hS : S ⊆ {n | 0 < n}) (hconn : IsAdjConnected R S)
    (hTS : T ⊆ S) (hadj : ∃ n ∈ S, Set.Infinite {m | m ∈ T ∧ Adjacent R n m}) :
    Function.Injective (universalValues R S T hTS) := by
  sorry

/-- Every integral single-root Taylor map has proper image (§4.4). -/
theorem integral_taylor_not_surjective {K : Type*} [Field K] [CharZero K]
    (n : ℕ) (hn : 0 < n) (ζ : K) (hζ : IsPrimitiveRoot ζ n) :
    ¬Function.Surjective (taylorAt (R := ℤ) (S := {m | 0 < m}) n hn
      (⟨ζ, Algebra.subset_adjoin (Set.mem_singleton ζ)⟩ : Algebra.adjoin ℤ {ζ})) := by
  sorry

/-- Joint universal Taylor expansions are injective over every integer-torsion-free ring (§4.6). -/
theorem iota_injective (R : Type*) [CommRing R] [Module.IsTorsionFree ℤ R] :
    Function.Injective (iota R) := by
  sorry

/-- Over a rational algebra every universal Taylor collection comes from a unique Habiro element (§4.6). -/
theorem rational_taylor_isomorphism (R : Type*) [CommRing R] [Algebra ℚ R] :
    ∃ e : CycloCompletion R {n | 0 < n} ≃ₐ[R] TaylorProduct R,
      (∀ x, e x = iota R x) ∧ Continuous e ∧ Continuous e.symm := by
  sorry

/-- Arbitrary pairwise comaximal order parts give a product of complete topological algebras (§5.2). -/
theorem comaximal_decomposition (R : Type*) [CommRing R] {I : Type*}
    (C : I → Set ℕ) (hdisjoint : Pairwise (fun i j => Disjoint (C i) (C j)))
    (hcoprime : ∀ i j, i ≠ j → ∀ m ∈ C i, ∀ n ∈ C j,
      IsCoprime (Polynomial.cyclotomic m R) (Polynomial.cyclotomic n R)) :
    ∃ e : CycloCompletion R (⋃ i, C i) ≃ₐ[R] (∀ i, CycloCompletion R (C i)),
      (∀ x i, e x i = restrict R (fun _ hn => Set.mem_iUnion.mpr ⟨i, hn⟩) x) ∧
        Continuous e ∧ Continuous e.symm := by
  sorry


/-- Mathlib localization of the integers away from `Δ` (§5.3). -/
abbrev LocalizedIntegers (Δ : ℕ) := Localization.Away (Δ : ℤ)

/-- Valuations at the primes inverted by the coefficient localization (§5.3). -/
abbrev ValuationTuple (Δ : ℕ) := {p : ℕ // p.Prime ∧ p ∣ Δ} → ℕ

/-- The positive orders with the prescribed inverted-prime valuations (§5.3). -/
def valuationOrders (Δ : ℕ) (a : ValuationTuple Δ) : Set ℕ :=
  {n | 0 < n ∧ ∀ p, padicValNat p.1 n = a p}

/-- The localized Habiro ring decomposes into its valuation-class completions (§5.3). -/
theorem component_decomposition (Δ : ℕ) (hΔ : 0 < Δ) :
    ∃ e : CycloCompletion (LocalizedIntegers Δ) {n | 0 < n} ≃ₐ[LocalizedIntegers Δ]
        (∀ a : ValuationTuple Δ, CycloCompletion (LocalizedIntegers Δ) (valuationOrders Δ a)),
      (∀ x a, e x a = restrict (LocalizedIntegers Δ) (fun _ hn => hn.1) x) ∧
        Continuous e ∧ Continuous e.symm := by
  sorry

/-- Every localized-integer valuation component is a domain (§5.3). -/
theorem component_isDomain (Δ : ℕ) (hΔ : 0 < Δ) (a : ValuationTuple Δ) :
    IsDomain (CycloCompletion (LocalizedIntegers Δ) (valuationOrders Δ a)) := by
  sorry

/-- One primitive-root Taylor coordinate detects its component, including at inverted primes (§5.3). -/
theorem componentTaylor_injective (Δ : ℕ) (hΔ : 0 < Δ) (a : ValuationTuple Δ)
    (n : ℕ) (hn : n ∈ valuationOrders Δ a)
    {K : Type*} [Field K] [Algebra (LocalizedIntegers Δ) K]
    [FaithfulSMul (LocalizedIntegers Δ) K] (ζ : K) (hζ : IsPrimitiveRoot ζ n) :
    Function.Injective (taylorAt (R := LocalizedIntegers Δ) n hn
      (⟨ζ, Algebra.subset_adjoin (Set.mem_singleton ζ)⟩ :
        Algebra.adjoin (LocalizedIntegers Δ) {ζ})) := by
  sorry

/-- All universal root values determine the localized-integer Habiro element (§5.3). -/
theorem allValues_injective (Δ : ℕ) (hΔ : 0 < Δ) :
    Function.Injective (universalValues (LocalizedIntegers Δ)
      {n | 0 < n} {n | 0 < n} (fun _ hn => hn)) := by
  sorry

end TauCetiRoadmap.HabiroCyclotomicCompletions
