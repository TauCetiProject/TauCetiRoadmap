import Mathlib
import TauCeti.RingTheory.Valuation.Discrete.Order
import TauCeti.FieldTheory.FunctionField.Divisor.Eval
import TauCeti.FieldTheory.FunctionField.Place.RatFunc.Basic
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Transvection

/-!
# K2SymbolsBrauer: representative target signatures

This file is not the roadmap: `README.md` is, and it is definitive. The file records the
definitions and theorem signatures of the roadmap that can be stated against the pinned Mathlib
and Tau Ceti APIs, so that contributors and reviewers converge on names and signatures; it is not
exhaustive. Every theorem is proved by `sorry` unless a short proof is given.

The generic universal-extension machinery comes from StableHomotopyKTheory. Layer 0 of the
README constructs the classical matrix and Steinberg carriers and their comparison contracts. Commutators use
`⁅a, b⁆ = a * b * a⁻¹ * b⁻¹`. The integral Milnor quotients retain the diagonal symbol, and the
tame convention is `∂{u, π} = ū`. The finite matrix example checks the lifted bar-boundary sign;
it does not formalize the topological product comparison.
-/

namespace TauCetiRoadmap.K2SymbolsBrauer

open scoped TensorProduct commutatorElement WithZero

universe u

/-! ## Layer 1: the bar-boundary calibration -/

/-- The image of `[ba] - [ab]`, the boundary of a lifted oriented torus cycle, in the
relative one-chain quotient. It is the inverse of the positive commutator. -/
def torusLiftBoundary {G : Type*} [Group G] (a b : G) : G :=
  b * a * (a * b)⁻¹

/-- In the Heisenberg subgroup of `GL₃(𝔽₃)`, the boundary and positive commutator have different
central coordinates. Thus this example detects reversal of the calibration sign. -/
example :
    let a := TauCeti.transvectionUnit (show (0 : Fin 3) ≠ 1 by decide) (1 : ZMod 3)
    let b := TauCeti.transvectionUnit (show (1 : Fin 3) ≠ 2 by decide) (1 : ZMod 3)
    (((torusLiftBoundary a b : Matrix.GeneralLinearGroup (Fin 3) (ZMod 3)) : Matrix (Fin 3) (Fin 3) (ZMod 3)) 0 2) = 2 ∧
      (((⁅a, b⁆ : Matrix.GeneralLinearGroup (Fin 3) (ZMod 3)) : Matrix (Fin 3) (Fin 3) (ZMod 3)) 0 2) = 1 := by
  dsimp only
  simp only [torusLiftBoundary, commutatorElement_def, mul_inv_rev,
    TauCeti.transvectionUnit_inv, Matrix.GeneralLinearGroup.coe_mul,
    TauCeti.coe_transvectionUnit]
  decide

/-! ## Layer 5: Steinberg pairings and Milnor K-theory -/

section Milnor

variable (F : Type u) [Field F]

/-- A Steinberg pairing: bimultiplicative into an additive group and zero on complementary
units. -/
structure IsSteinbergPairing {A : Type*} [AddCommGroup A] (c : Fˣ → Fˣ → A) : Prop where
  mul_left : ∀ a b d : Fˣ, c (a * b) d = c a d + c b d
  mul_right : ∀ a b d : Fˣ, c a (b * d) = c a b + c a d
  steinberg : ∀ a b : Fˣ, (a : F) + b = 1 → c a b = 0

/-- The constant pairing `1` is not a Steinberg pairing: bilinearity at `(1, 1, 1)` would give
`1 = 2`. -/
example : ¬ IsSteinbergPairing F (fun _ _ => (1 : ℤ)) := by
  intro h
  have := h.mul_left 1 1 1
  norm_num at this

/-- The span of the tensors `a ⊗ b` with `a + b = 1`. -/
def steinbergRelations : Submodule ℤ (Additive Fˣ ⊗[ℤ] Additive Fˣ) :=
  Submodule.span ℤ {x | ∃ a b : Fˣ, (a : F) + b = 1 ∧ x = Additive.ofMul a ⊗ₜ Additive.ofMul b}

/-- The degree-two symbol group `(Fˣ ⊗ Fˣ) / ⟨a ⊗ b : a + b = 1⟩`, the universal target of
Steinberg pairings; it is `K₂ᴹ(F)`. -/
abbrev SymbolGroup : Type u := (Additive Fˣ ⊗[ℤ] Additive Fˣ) ⧸ steinbergRelations F

variable {F}

/-- The class `{a, b}` of `a ⊗ b`. -/
def symbol (a b : Fˣ) : SymbolGroup F :=
  Submodule.Quotient.mk (Additive.ofMul a ⊗ₜ Additive.ofMul b)

/-- The Steinberg relation in the symbol group. -/
theorem symbol_steinberg (a b : Fˣ) (h : (a : F) + b = 1) : symbol a b = 0 :=
  (Submodule.Quotient.mk_eq_zero _).2 (Submodule.subset_span ⟨a, b, h, rfl⟩)

/-- Skew-symmetry `{a, b} = -{b, a}` and `{a, a} = {a, -1}` (Weibel, III.6.1; Matsumoto,
Proposition 5.7). -/
theorem symbol_swap (a b : Fˣ) : symbol a b = -symbol b a := by
  sorry

theorem symbol_self (a : Fˣ) : symbol a a = symbol a (-1) := by
  sorry

/-- `{-1, -1}` is nonzero over `ℝ`: the sign pairing detects it, so the symbol group is not an
exterior square. -/
theorem symbol_neg_one_neg_one_real : symbol (-1 : ℝˣ) (-1) ≠ 0 := by
  sorry

/-- The degree-two symbol group of a finite field vanishes (Weibel, III.6.1.1). -/
theorem subsingleton_symbolGroup_of_finite [Finite F] : Subsingleton (SymbolGroup F) := by
  sorry

/-- Every Steinberg pairing factors uniquely through the symbol group. -/
theorem existsUnique_lift_of_isSteinbergPairing {A : Type*} [AddCommGroup A] {c : Fˣ → Fˣ → A}
    (hc : IsSteinbergPairing F c) :
    ∃! f : SymbolGroup F →+ A, ∀ a b, f (symbol a b) = c a b := by
  sorry

variable (F)

/-- The relation generating the Steinberg ideal of the tensor algebra. -/
def milnorRel : TensorAlgebra ℤ (Additive Fˣ) → TensorAlgebra ℤ (Additive Fˣ) → Prop :=
  fun x y => ∃ a b : Fˣ, (a : F) + b = 1 ∧
    x = TensorAlgebra.ι ℤ (Additive.ofMul a) * TensorAlgebra.ι ℤ (Additive.ofMul b) ∧ y = 0

/-- Milnor K-theory `K_*ᴹ(F)`, the quotient of the tensor algebra of `Additive Fˣ` over `ℤ` by
the two-sided ideal generated by the Steinberg products (Weibel, III.7.1). -/
abbrev MilnorK : Type u := RingQuot (milnorRel F)

variable {F}

/-- The degree-one class of a unit. -/
def MilnorK.ofUnit (a : Fˣ) : MilnorK F :=
  RingQuot.mkRingHom (milnorRel F) (TensorAlgebra.ι ℤ (Additive.ofMul a))

/-- The Milnor symbol `{a₁, …, aₙ}`, the ordered product of degree-one classes. -/
def MilnorK.symbol (l : List Fˣ) : MilnorK F :=
  (l.map MilnorK.ofUnit).prod

/-- A complementary two-entry Milnor symbol vanishes. -/
theorem MilnorK.symbol_steinberg (a b : Fˣ) (h : (a : F) + b = 1) :
    MilnorK.symbol [a, b] = 0 := by
  simp only [MilnorK.symbol, List.map_cons, List.map_nil, List.prod_cons, List.prod_nil,
    mul_one, MilnorK.ofUnit]
  rw [← map_mul, RingQuot.mkRingHom_rel (r := milnorRel F) ⟨a, b, h, rfl, rfl⟩, map_zero]

/-- The degree-zero unit survives the two-sided Steinberg quotient. -/
theorem MilnorK.one_ne_zero : (1 : MilnorK F) ≠ 0 := by
  sorry

/-- The real sign detector retains the integral diagonal in the Milnor ring. -/
theorem MilnorK.real_diagonal_ne_zero : MilnorK.symbol [(-1 : ℝˣ), -1] ≠ 0 := by
  sorry

/-- A permutation of the entries multiplies a Milnor symbol by its sign. -/
theorem MilnorK.symbol_perm (l : List Fˣ) (σ : Equiv.Perm (Fin l.length)) :
    MilnorK.symbol (List.ofFn fun i => l.get (σ i)) =
      ((Equiv.Perm.sign σ : ℤˣ) : ℤ) • MilnorK.symbol l := by
  sorry

/-- For a finite field the Milnor symbols with at least two entries vanish (Weibel,
III.7.2(a)). -/
theorem MilnorK.symbol_eq_zero_of_finite [Finite F] (l : List Fˣ) (hl : 2 ≤ l.length) :
    MilnorK.symbol l = 0 := by
  sorry

end Milnor

/-! ## Layer 9: tame symbols and Milnor residues -/

section Tame

variable {F : Type*} [Field F]

open Valuation in
/-- The unit part of the tame symbol, `(-1)^{v(f)v(g)} f^{v(g)} g^{-v(f)}`, whose residue is
`∂_v{f, g}`; it is a unit of the valuation ring. -/
noncomputable def tameUnit (v : Valuation F ℤᵐ⁰) (f g : Fˣ) : Fˣ :=
  (-1) ^ (ord v (f : F) * ord v (g : F)) * f ^ ord v (g : F) * g ^ (-ord v (f : F))

open Valuation in
/-- The normalisation `∂{u, π} = ū`. -/
example (v : Valuation F ℤᵐ⁰) (u π : Fˣ) (hu : ord v (u : F) = 0) (hπ : ord v (π : F) = 1) :
    tameUnit v u π = u := by
  simp [tameUnit, hu, hπ]

open Valuation in
/-- At the zero place of `k(t)` in characteristic zero (in particular `ℚ(t)`), the two orders
of `(2,t)` give `2` and `1/2`. This tests the normalization away from 2-torsion. -/
example (k : Type*) [Field k] [CharZero k] :
    let P := TauCeti.Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))
    let u := Units.map (algebraMap k (RatFunc k)).toMonoidHom (Units.mk0 (2 : k) (by norm_num))
    let t := Units.mk0 (RatFunc.X : RatFunc k) RatFunc.X_ne_zero
    (tameUnit P.valuation u t : RatFunc k) = 2 ∧
      (tameUnit P.valuation t u : RatFunc k) = 1 / 2 ∧
      (tameUnit P.valuation u t : RatFunc k) ≠ (tameUnit P.valuation t u : RatFunc k) := by
  dsimp only
  let P := TauCeti.Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))
  have hu : ord P.valuation ((algebraMap k (RatFunc k)).toMonoidHom (2 : k)) = 0 :=
    P.ord_algebraMap 2
  have ht : ord P.valuation (RatFunc.X : RatFunc k) = 1 := by
    apply P.isUniformizer_iff_ord_eq_one.mp
    simpa only [P, RatFunc.algebraMap_X] using
      (TauCeti.Place.isUniformizer_adicOfIrreducible (Polynomial.irreducible_X (R := k)))
  dsimp only [P] at hu ht
  simp only [tameUnit, Units.val_mul, Units.val_zpow_eq_zpow_val,
    Units.coe_map, Units.val_mk0]
  rw [hu, ht]
  norm_num [map_ofNat]

/-- The tame unit lies in the unit group of the valuation ring. -/
theorem tameUnit_mem_unitGroup (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) (f g : Fˣ) :
    tameUnit v f g ∈ v.valuationSubring.unitGroup := by
  sorry

/-- Bimultiplicativity of the tame unit. -/
theorem tameUnit_mul_left (v : Valuation F ℤᵐ⁰) (f f' g : Fˣ) :
    tameUnit v (f * f') g = tameUnit v f g * tameUnit v f' g := by
  sorry

/-- **The Steinberg relation for the tame symbol** (Weibel, Lemma III.6.3): if `f + g = 1` the
tame unit is a principal unit, so its residue is `1`. -/
theorem tameUnit_steinberg (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) (f g : Fˣ)
    (h : (f : F) + g = 1) : v ((tameUnit v f g : F) - 1) < 1 := by
  sorry

end Tame

/-! ## Layer 10: rational function fields, Milnor norms and reciprocity -/

section Reciprocity

variable {k F : Type*} [Field k] [Field F] [Algebra k F]

/-- **Weil reciprocity for disjoint supports**, the degree-two disjoint case of Suslin's
reciprocity law for any function field of one variable: `f(div g) = g(div f)`. -/
theorem weil_reciprocity_of_disjoint (hF : TauCeti.IsFunctionField k F) (f g : Fˣ)
    (h : Disjoint (TauCeti.Divisor.principal hF f).support
      (TauCeti.Divisor.principal hF g).support) :
    TauCeti.Divisor.eval (TauCeti.Divisor.principal hF g) f =
      TauCeti.Divisor.eval (TauCeti.Divisor.principal hF f) g := by
  sorry

end Reciprocity

/-! ## Layer 13: Dennis–Stein symbols and relative K₂ -/

namespace K2

section DennisStein

variable (A : Type u) [CommRing A]

/-- Threefold stability (van der Kallen–Maazen–Stienstra, §2.3): for any three unimodular pairs
`(aᵢ, bᵢ)` one `t` makes every `aᵢ + bᵢ t` a unit. -/
def IsThreefoldStable : Prop :=
  ∀ a b : Fin 3 → A, (∀ i, IsCoprime (a i) (b i)) → ∃ t : A, ∀ i, IsUnit (a i + b i * t)

/-- A field is threefold stable exactly when it has at least four elements: each pair excludes
at most one `t`, and over `𝔽₂`, `𝔽₃` the pairs `(-c, 1)` exclude every `t`. -/
theorem isThreefoldStable_field_iff (F : Type u) [Field F] :
    IsThreefoldStable F ↔ 4 ≤ ENat.card F := by
  sorry

/-- `𝔽₂` is not threefold stable: the pairs `(0, 1)` and `(1, 1)` need `t` and `1 + t` to be
units. -/
example : ¬ IsThreefoldStable (ZMod 2) := by
  intro h
  obtain ⟨t, ht⟩ := h ![0, 1, 0] ![1, 1, 1] (fun i => by fin_cases i <;> simp)
  have h0 := ht 0
  have h1 := ht 1
  fin_cases t <;> simp_all

/-- Three forbidden values cannot exhaust `𝔽₅`; choosing each coordinate independently also
makes the nonlocal semilocal ring `𝔽₅ × 𝔽₅` threefold stable. -/
example : IsThreefoldStable (ZMod 5) ∧ IsThreefoldStable (ZMod 5 × ZMod 5) := by
  let : Fact (Nat.Prime 5) := ⟨by decide⟩
  have h5 : IsThreefoldStable (ZMod 5) := by
    intro a b hab
    classical
    let forbidden := Finset.univ.image (fun i : Fin 3 => -a i / b i)
    have hcard : forbidden.card < (Finset.univ : Finset (ZMod 5)).card := by
      have hle : forbidden.card ≤ 3 := Finset.card_image_le
      norm_num at *
      omega
    obtain ⟨t, _, ht⟩ := Finset.exists_mem_notMem_of_card_lt_card hcard
    refine ⟨t, fun i => isUnit_iff_ne_zero.mpr ?_⟩
    intro hz
    by_cases hb : b i = 0
    · have ha : a i = 0 := by simpa [hb] using hz
      exact not_isCoprime_zero_zero (ha ▸ hb ▸ hab i)
    · apply ht
      apply Finset.mem_image.mpr
      refine ⟨i, Finset.mem_univ _, ?_⟩
      apply (div_eq_iff hb).mpr
      calc
        -a i = b i * t := (eq_neg_of_add_eq_zero_right hz).symm
        _ = t * b i := mul_comm _ _
  refine ⟨h5, ?_⟩
  intro a b hab
  obtain ⟨t₁, ht₁⟩ := h5 (fun i => (a i).1) (fun i => (b i).1)
    (fun i => (hab i).map (RingHom.fst _ _))
  obtain ⟨t₂, ht₂⟩ := h5 (fun i => (a i).2) (fun i => (b i).2)
    (fun i => (hab i).map (RingHom.snd _ _))
  exact ⟨(t₁, t₂), fun i => Prod.isUnit_iff.mpr ⟨ht₁ i, ht₂ i⟩⟩

/-- Admissible Dennis–Stein pairs: `(r, s)` with `1 - r s` a unit. -/
def DSPair : Type u := {p : A × A // IsUnit (1 - p.1 * p.2)}

/-- The Dennis–Stein relations D1–D3 (modern convention, §13.2) among admissible pairs:
`D(r,s) + D(s,r)`, `D(r,s) + D(r,t) - D(r, s + t - r s t)` and `D(r, s t) - D(r s, t) - D(r t, s)`,
each imposed exactly when all displayed pairs are admissible. -/
def dsRel : Set (FreeAbelianGroup (DSPair A)) :=
  {x | (∃ p q : DSPair A, q.1 = p.1.swap ∧ x = .of p + .of q) ∨
    (∃ p q w : DSPair A, p.1.1 = q.1.1 ∧
      w.1 = (p.1.1, p.1.2 + q.1.2 - p.1.1 * p.1.2 * q.1.2) ∧ x = .of p + .of q - .of w) ∨
    (∃ p q w : DSPair A, ∃ r s t : A, p.1 = (r, s * t) ∧ q.1 = (r * s, t) ∧ w.1 = (r * t, s) ∧
      x = .of p - .of q - .of w)}

/-- The Dennis–Stein group `D(A)`: the free abelian group on admissible pairs modulo D1–D3. -/
abbrev DennisSteinGroup : Type u :=
  FreeAbelianGroup (DSPair A) ⧸ AddSubgroup.closure (dsRel A)

/-- **The field case of the Dennis–Stein presentation** (Weibel, III.5.11.1(a)): for a field,
`D(F)` is the degree-two symbol group, with `D(r, s) ↦ {r, 1 - r s}` for a unit `r`. -/
theorem dennisSteinGroup_equiv_symbolGroup (F : Type u) [Field F] :
    ∃ e : DennisSteinGroup F ≃+ SymbolGroup F, ∀ (r : Fˣ) (s : F) (h : IsUnit (1 - (r : F) * s)),
      e (QuotientAddGroup.mk (FreeAbelianGroup.of ⟨((r : F), s), h⟩)) = symbol r h.unit := by
  sorry

variable {A}

/-- Relative Dennis–Stein generators: pairs with at least one entry in `I` (§13.9). -/
def RelDSGen (I : Ideal A) : Type u := {p : A × A // p.1 ∈ I ∨ p.2 ∈ I}

/-- The guarded relations of Keune's presentation: D1 and D2 when every displayed pair is a
relative generator, and D3 only when one of its inputs `r, s, t` lies in `I`. -/
def relDSRel (I : Ideal A) : Set (FreeAbelianGroup (RelDSGen I)) :=
  {x | (∃ p q : RelDSGen I, q.1 = p.1.swap ∧ x = .of p + .of q) ∨
    (∃ p q w : RelDSGen I, p.1.1 = q.1.1 ∧
      w.1 = (p.1.1, p.1.2 + q.1.2 - p.1.1 * p.1.2 * q.1.2) ∧ x = .of p + .of q - .of w) ∨
    (∃ p q w : RelDSGen I, ∃ r s t : A, (r ∈ I ∨ s ∈ I ∨ t ∈ I) ∧ p.1 = (r, s * t) ∧
      q.1 = (r * s, t) ∧ w.1 = (r * t, s) ∧ x = .of p - .of q - .of w)}

/-- The output pairs of `(x,y,x+y)` over the iterated dual numbers are relative, but the
input guard of `relDSRel` rejects that triple for `I=(xy)`. -/
example :
    let x : DualNumber (DualNumber (ZMod 3)) := TrivSqZeroExt.inl DualNumber.eps
    let y : DualNumber (DualNumber (ZMod 3)) := DualNumber.eps
    let I := Ideal.span ({x * y} : Set (DualNumber (DualNumber (ZMod 3))))
    x * (y * (x + y)) ∈ I ∧
      x * y ∈ I ∧ y * (x + y) ∈ I ∧ (x + y) * x ∈ I ∧
      IsUnit (1 - x * y * (x + y)) ∧
      ¬ (x ∈ I ∨ y ∈ I ∨ x + y ∈ I) := by
  dsimp only
  let x : DualNumber (DualNumber (ZMod 3)) := TrivSqZeroExt.inl DualNumber.eps
  let y : DualNumber (DualNumber (ZMod 3)) := DualNumber.eps
  let I := Ideal.span ({x * y} : Set (DualNumber (DualNumber (ZMod 3))))
  have hxy : x * y ∈ I := Ideal.subset_span (Set.mem_singleton _)
  have h0 : x * (y * (x + y)) = 0 := by ext <;> decide
  have h1 : y * (x + y) = x * y := by ext <;> decide
  have h2 : (x + y) * x = x * y := by ext <;> decide
  have hu : IsUnit (1 - x * y * (x + y)) := by
    have he : (1 - x * y * (x + y)) = 1 := by ext <;> decide
    rw [he]
    exact isUnit_one
  refine ⟨?_, hxy, h1 ▸ hxy, h2 ▸ hxy, hu, ?_⟩
  · rw [h0]
    exact I.zero_mem
  · rintro (hx | hy | hsum)
    · obtain ⟨a, ha⟩ := Ideal.mem_span_singleton'.mp hx
      have := congrArg (fun z => z.fst.snd) ha
      norm_num [x, y, TrivSqZeroExt.fst_mul] at this
    · obtain ⟨a, ha⟩ := Ideal.mem_span_singleton'.mp hy
      have := congrArg (fun z => z.snd.fst) ha
      norm_num [x, y, TrivSqZeroExt.snd_mul] at this
    · obtain ⟨a, ha⟩ := Ideal.mem_span_singleton'.mp hsum
      have := congrArg (fun z => z.fst.snd) ha
      norm_num [x, y, TrivSqZeroExt.fst_mul] at this

/-- The same relations with D3 imposed only when its first input lies in `I`, the form of van der
Kallen–Maazen–Stienstra, §2.5. -/
def relDSRelFirst (I : Ideal A) : Set (FreeAbelianGroup (RelDSGen I)) :=
  {x | (∃ p q : RelDSGen I, q.1 = p.1.swap ∧ x = .of p + .of q) ∨
    (∃ p q w : RelDSGen I, p.1.1 = q.1.1 ∧
      w.1 = (p.1.1, p.1.2 + q.1.2 - p.1.1 * p.1.2 * q.1.2) ∧ x = .of p + .of q - .of w) ∨
    (∃ p q w : RelDSGen I, ∃ r s t : A, r ∈ I ∧ p.1 = (r, s * t) ∧
      q.1 = (r * s, t) ∧ w.1 = (r * t, s) ∧ x = .of p - .of q - .of w)}

/-- The relative Dennis–Stein group `D(A, I)`. -/
abbrev relDennisSteinGroup (I : Ideal A) : Type u :=
  FreeAbelianGroup (RelDSGen I) ⧸ AddSubgroup.closure (relDSRel I)

/-- The two D3 guards present the same group: D3 with `s ∈ I` follows from D3 with first input
`s` and D1. No radical hypothesis is needed. -/
theorem closure_relDSRelFirst (I : Ideal A) :
    AddSubgroup.closure (relDSRelFirst I) = AddSubgroup.closure (relDSRel I) := by
  sorry

/-- For the zero ideal every relative generator has a zero entry and vanishes. -/
theorem subsingleton_relDennisSteinGroup_bot : Subsingleton (relDennisSteinGroup (⊥ : Ideal A)) := by
  sorry

/-- The double `A ×_{A/I} A`: pairs whose coordinates agree modulo `I`. Its first projection is
split by the diagonal, and its two kernels meet in zero and multiply to zero. -/
def idealDouble (I : Ideal A) : Subring (A × A) :=
  RingHom.eqLocus ((Ideal.Quotient.mk I).comp (RingHom.fst A A))
    ((Ideal.Quotient.mk I).comp (RingHom.snd A A))

example (I : Ideal A) (x : A) (hx : x ∈ I) : ((0 : A), x) ∈ idealDouble I := by
  show (Ideal.Quotient.mk I) 0 = (Ideal.Quotient.mk I) x
  rw [map_zero, eq_comm, Ideal.Quotient.eq_zero_iff_mem]
  exact hx

end DennisStein

/-- The parity detector on `ℤ/4` of §13.14: value `1` at `(2,2)`, `(2,3)`, `(3,2)`. -/
def zmodFourSymbolParity (r s : ZMod 4) : ZMod 2 :=
  if (r = 2 ∧ s = 2) ∨ (r = 2 ∧ s = 3) ∨ (r = 3 ∧ s = 2) then 1 else 0

/-- The detector satisfies D1–D3 on admissible pairs; in `ℤ/4` an element `u` is a unit exactly
when `u * u = 1`. -/
example :
    (∀ r s : ZMod 4, (1 - r * s) * (1 - r * s) = 1 →
      zmodFourSymbolParity r s + zmodFourSymbolParity s r = 0) ∧
    (∀ r s t : ZMod 4, (1 - r * s) * (1 - r * s) = 1 → (1 - r * t) * (1 - r * t) = 1 →
      zmodFourSymbolParity r s + zmodFourSymbolParity r t =
        zmodFourSymbolParity r (s + t - r * s * t)) ∧
    (∀ r s t : ZMod 4, (1 - r * s * t) * (1 - r * s * t) = 1 →
      zmodFourSymbolParity r (s * t) =
        zmodFourSymbolParity (r * s) t + zmodFourSymbolParity (r * t) s) := by
  decide

/-- The detector retains the dyadic diagonal, vanishes on the unit-entry tests, and excludes
`(1,1)` from its admissible domain. -/
example : zmodFourSymbolParity 3 2 = 1 ∧ zmodFourSymbolParity 1 2 = 0 ∧
    zmodFourSymbolParity 2 2 = 1 ∧ zmodFourSymbolParity 2 1 = 0 ∧
    ¬ IsUnit (1 - (1 : ZMod 4) * 1) := by
  let : Fact (1 < 4) := ⟨by decide⟩
  refine ⟨by decide, by decide, by decide, by decide, ?_⟩
  simpa only [mul_one, sub_self] using (not_isUnit_zero : ¬ IsUnit (0 : ZMod 4))

end K2

end TauCetiRoadmap.K2SymbolsBrauer

/-
The README specifies the remaining carriers and milestones: the calibrated Hopf and Hurewicz
comparisons; faithful row/column maps and normalized finite-rank sections; star products, Weyl
and diagonal words, commuting-unit and finite-rank symbols, monomial and unipotent subgroups;
the native quotient grading, real detector and Milnor-to-Quillen ring map; unit parts, residue
and specialization maps, Serre's residue algebra, Bass–Tate filtrations and transfers; complete
valuation extensions and component lattices, Kato norms and integral reciprocity; total residues,
localization and Quillen-transfer comparisons; unramified groups, tame kernels, auxiliary integer
word models and the integer/rational computations; Dennis–Stein words in the Steinberg group and
the generator maps out of the presentation groups, double-ring relative Steinberg groups and their
double-quotient description, cross classes, the split radical fibre comparison and double excision,
Dennis–Stein generation, the reduction to the double, the split radical presentation, Keune's
theorem, the lift-change sequence and residue-isomorphism transfer for local rings, differential
symbols, van der Kallen's dual-number module, square-zero quotients and the dyadic computations.

README-only construction APIs, by section (the carriers and full contracts are specified there):
§4.1:
  K2.classicalHomologyEquiv_natural
  K2.classicalPlusEquiv_KSpace
  K2.classicalPlusEquiv_cover
  K2.classicalPlusEquiv_natural
  K2.classicalPlusEquiv_transport
§5.2:
  symbol_inv_left
  symbol_mul_left
  symbol_mul_right
  symbol_one_left
  symbol_one_right
§5.4:
  MilnorK.hom_ext
  MilnorK.map_id_comp
  MilnorK.symbol_mul
  MilnorK.symbol_product
§5.5:
  MilnorK.concat_quotient
  MilnorK.degreePresentation_natural
§5.15:
  MilnorK.realPositive_divisible
  MilnorK.realSign_kernel
§11.4:
  MilnorK.globalResidueHom_apply
  MilnorK.globalResidueHom_degree_one
  MilnorK.globalResidueHom_degree_two
  MilnorK.globalResidueHom_eq_zero_iff
  MilnorK.globalResidueHom_quillen
  MilnorK.globalResidueHom_reindex
  MilnorK.globalResidueHom_support_subset
  MilnorK.globalResidueHom_unique
§12.1:
  symbol_mem_unramifiedSubgroup
§13.1:
  K2.coe_dennisStein
  K2.dennisStein_eq_steinbergSymbol
  K2.dennisStein_index_indep
  K2.dennisStein_plusConvention
  K2.dennisStein_zero_left
  K2.dennisStein_zero_right
  K2.map_dennisStein
  K2.phi_dennisSteinWord
  K2.steinbergSymbol_eq_dennisStein
§13.3:
  IsThreefoldStable.exists_unit_perturbation
  isThreefoldStable_iff_residue_card_ge_four
§13.7:
  K2.K2Double_split
  K2.crossCommutator_mem_K2
  K2.relK2_bot
  K2.toK2_relDennisStein
§13.8:
  K2.relK2PlusEquiv_of_split
  K2.relK2PlusMap_forget
  K2.relK2_exact_K3
§13.9:
  K2.relDennisSteinGroup.toRelK2_bijective
  K2.relDennisSteinGroup.toRelK2_surjective
§13.13:
  K2.vanDerKallenModule_equiv_kaehler
§13.14:
  zmodFourSymbolParity_relations
-/
