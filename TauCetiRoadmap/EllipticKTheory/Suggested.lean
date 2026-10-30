import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.Scheme.ProjModel
import TauCeti.FieldTheory.FunctionField.Place.Residue
import TauCeti.FieldTheory.FunctionField.Divisor.Principal
import TauCeti.AlgebraicGeometry.EllipticCurve.PointCount
import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.FunctionField.Finrank
import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.FunctionField.PointPlace

/-!
# K-theory of curves and elliptic curves: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline theorems
against the pinned Mathlib and Tau Ceti APIs, with only the definitions they need.

The statable headlines are geometric integrality of the projective Weierstrass cubic, the order of
the twisted Frobenius kernel, minimal regular-model existence, terminality and marked uniqueness
over S-integers, Weil reciprocity at the last rational place, and Bloch's correction.
The K₀ ring computation, localisation and coniveau sequences, general noetherian Adams operations,
field motivic-model adapters, the tower and étale comparisons, Adams-weight comparison, Harder
finiteness, positive K-theory descent and finite-field K-group classification, model-independent
integral part and quotient Bloch-class descent cannot be stated: the pins have no higher K-groups
of schemes or fields, motivic K-theory tower or étale-cohomology carriers. The marked-model
headlines use native schemes and the S-integer subalgebra; the wider excellent-Dedekind statements
require an excellence predicate, absent at the pins. The native marked-model bundles are acceptance
adapters for the proper/regular full subcategory of RelativeJacobiansAndIntegralCurveModels §0.1;
README §6.1 specifies their equivalence, including markings, morphisms, localisation and minimality.
That equivalence is not statable here: the supplier's DedekindModel carrier is absent at the pins.
General regular-model existence is transported from its §5.1 through that equivalence.
The projective Weierstrass scheme itself is
supplied by Tau Ceti. Boundary cases and API facts are in README.md.
-/

namespace TauCetiRoadmap.EllipticKTheory

open TauCeti

/-! ## Layer 1: The Weierstrass curve as a scheme -/

/-- Every projective Weierstrass cubic over a field is geometrically integral, including singular
cubics; ellipticity is unnecessary (README §1.2; Stacks, Lemma 53.9.2). -/
theorem EllipticScheme.geometricallyIntegral {F : Type*} [Field F]
    (W : WeierstrassCurve F) :
    AlgebraicGeometry.GeometricallyIntegral W.projModelOver := by
  sorry

/-! ## Layer 5: Functoriality, isogenies and curves over finite fields -/

section TwistedFrobenius

variable {k : Type*} [Field k] [Fintype k] (W : WeierstrassCurve k)
variable (L : Type*) [Field L] [DecidableEq L] [Algebra k L]

/-- The twisted Frobenius kernel `B_i(W, L)` (README §5.10): the points of `W` over `L` that are
killed by a positive integer prime to the characteristic and satisfy `q^i • π(P) = P`, where `π` is
the `q`-power map on points. For `L` an algebraic closure it is the group of invariants of the
prime-to-`p` torsion with the extra `i`-th Tate twist, which is `K_{2i}` of the elliptic curve for
`i ≥ 1` (README §5.11). It is a subgroup of Mathlib's point group, with no second group law. -/
noncomputable def twistedFrobeniusKernel (i : ℕ) :
    AddSubgroup (WeierstrassCurve.Affine.Point (W.baseChange L)) where
  carrier := {P | (∃ m : ℕ, 0 < m ∧ Nat.Coprime m (ringChar k) ∧ m • P = 0) ∧
    (Fintype.card k ^ i) • WeierstrassCurve.Affine.Point.map (W' := W.toAffine)
      (FiniteField.frobeniusAlgHom k L) P = P}
  zero_mem' := ⟨⟨1, one_pos, Nat.coprime_one_left _, by simp⟩, by simp⟩
  add_mem' := by
    rintro P Q ⟨⟨m, hm, hmc, hmP⟩, hP⟩ ⟨⟨n, hn, hnc, hnQ⟩, hQ⟩
    refine ⟨⟨m * n, Nat.mul_pos hm hn, Nat.Coprime.mul_left hmc hnc, ?_⟩, ?_⟩
    · rw [smul_add, mul_smul, smul_comm m n P, hmP, mul_smul, hnQ, smul_zero, smul_zero, add_zero]
    · rw [map_add, smul_add, hP, hQ]
  neg_mem' := by
    rintro P ⟨⟨m, hm, hmc, hmP⟩, hP⟩
    exact ⟨⟨m, hm, hmc, by rw [smul_neg, hmP, neg_zero]⟩, by rw [map_neg, smul_neg, hP]⟩

end TwistedFrobenius

/-- **The even K-groups of an elliptic curve over a finite field have order
`1 − a_q q^i + q^{2i+1}`** (README §5.11, `finiteFieldK_orders`; Weibel, *K-book*, Theorem VI.6.7).
Here `K_{2i}(E) ≅ B_i(E, F̄_q)` and `a_q = q + 1 − #E(F_q)` is Tau Ceti's `frobeniusTrace`. The
hypothesis `1 ≤ i` is needed: for `i = 0` the group is the prime-to-`p` part of `E(F_q)`. -/
theorem card_twistedFrobeniusKernel {k : Type*} [Field k] [Fintype k] [DecidableEq k]
    (W : WeierstrassCurve k) [W.IsElliptic] [DecidableEq (AlgebraicClosure k)]
    {i : ℕ} (hi : 1 ≤ i) :
    (Nat.card (twistedFrobeniusKernel W (AlgebraicClosure k) i) : ℤ) =
      1 - W.frobeniusTrace * (Fintype.card k : ℤ) ^ i + (Fintype.card k : ℤ) ^ (2 * i + 1) := by
  sorry

/-! ## Layer 6: Regular models over S-integers and the integral part -/

section Layer6

open _root_.AlgebraicGeometry CategoryTheory Limits

universe u

/-- The native acceptance adapter for a marked regular proper model (README §6.1): a proper flat scheme over `O`, regular at every
stalk, whose generic fibre is identified with the fixed `F`-scheme `C` by an isomorphism over `F`.
The definition makes sense for any `O`-algebra field; arithmetic existence uses S-integers.
Over a Dedekind domain with fraction field `F`, README's regularProperModelEquivalence identifies
it with the proper/regular full subcategory of the supplier's DedekindModel. -/
structure RegularProperModel (O F : Type u) [CommRing O] [Field F] [Algebra O F]
    (C : Scheme.{u}) (toField : C ⟶ Spec (CommRingCat.of F)) where
  /-- The total scheme. -/
  X : Scheme.{u}
  /-- The structure map to the base. -/
  toBase : X ⟶ Spec (CommRingCat.of O)
  /-- The structure map is proper. -/
  isProper : IsProper toBase
  /-- The structure map is flat. -/
  flat : Flat toBase
  /-- Every stalk is regular, including stalks on singular fibres. -/
  regular : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)
  /-- The fixed identification of the generic fibre. -/
  genericIso : pullback toBase (Spec.map (CommRingCat.ofHom (algebraMap O F))) ≅ C
  /-- The marking preserves the specified structure map to `Spec F`. -/
  genericIso_over : genericIso.hom ≫ toField = pullback.snd _ _

namespace RegularProperModel

variable {O F : Type u} [CommRing O] [Field F] [Algebra O F]
    {C : Scheme.{u}} {toField : C ⟶ Spec (CommRingCat.of F)}

/-- The inclusion of the fixed marked generic fibre in the total scheme (README §6.3). -/
noncomputable def genericFibreInclusion (M : RegularProperModel O F C toField) : C ⟶ M.X :=
  M.genericIso.inv ≫ pullback.fst _ _

/-- A marked morphism in the native acceptance adapter (README §§6.1, 6.3): a map of total schemes
over `O` restricting to the identity on the fixed generic curve. The adapter equivalence preserves
this underlying map and identifies it with the supplier's marked morphism. -/
structure Hom (M N : RegularProperModel O F C toField) where
  /-- The morphism of total schemes. -/
  hom : M.X ⟶ N.X
  /-- The map preserves the structure map to `Spec O`. -/
  hom_toBase : hom ≫ N.toBase = M.toBase
  /-- The map restricts to the identity on the marked generic curve. -/
  generic : M.genericFibreInclusion ≫ hom = N.genericFibreInclusion

/-- Outgoing minimality (README §6.3; Conrad, Definition 3.8): every marked morphism from `M` to
another regular proper model is an isomorphism on total schemes. -/
def IsMinimal (M : RegularProperModel O F C toField) : Prop :=
  ∀ (N : RegularProperModel O F C toField) (f : Hom M N), IsIso f.hom

end RegularProperModel

/-- An elliptic curve over a number field has a minimal regular proper model over every ring of
S-integers (README §§6.5–6.6). Minimality is outgoing minimality for the fixed generic marking;
regular-model existence is supplied by RelativeJacobiansAndIntegralCurveModels §5.1. -/
theorem exists_minimalRegularProperModel {F : Type u} [Field F] [NumberField F]
    (S : Set (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))) (hS : S.Finite)
    (W : WeierstrassCurve F) [W.IsElliptic] :
    ∃ M : RegularProperModel (S.integer F) F W.projModel W.projModelOver, M.IsMinimal := by
  sorry

/-- Every regular proper model of the marked elliptic curve has a unique marked morphism to a
minimal one (README §6.6). This is the terminal-property form of the local minimality criterion. -/
theorem locallyMinimal_terminal {F : Type u} [Field F] [NumberField F]
    (S : Set (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))) (hS : S.Finite)
    (W : WeierstrassCurve F) [W.IsElliptic]
    (M : RegularProperModel (S.integer F) F W.projModel W.projModelOver) (hM : M.IsMinimal)
    (X : RegularProperModel (S.integer F) F W.projModel W.projModelOver) :
    Nonempty (Unique (RegularProperModel.Hom X M)) := by
  sorry

/-- Two minimal regular proper models of the fixed elliptic curve over S-integers have a unique
isomorphism over the base inducing the identity on the generic curve (README §6.7). -/
theorem minimal_unique {F : Type u} [Field F] [NumberField F]
    (S : Set (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))) (hS : S.Finite)
    (W : WeierstrassCurve F) [W.IsElliptic]
    (M N : RegularProperModel (S.integer F) F W.projModel W.projModelOver)
    (hM : M.IsMinimal) (hN : N.IsMinimal) :
    ∃! e : M.X ≅ N.X,
      e.hom ≫ N.toBase = M.toBase ∧
        M.genericFibreInclusion ≫ e.hom = N.genericFibreInclusion := by
  sorry

end Layer6

/-! ## Layer 7: Symbol certificates and Bloch’s classes -/

section TameValue

variable {k K : Type*} [Field k] [Field K] [Algebra k K]

/-- The tame symbol of `{f, g}` at a place `P` (README §7.1):
`(−1)^{ord_P f · ord_P g}` times the residue of `f^{ord_P g} / g^{ord_P f}`, a unit of the residue
field of `P`. It is K2SymbolsBrauer's tame symbol at the valuation of `P`, and the inverse of the
symbol of Weibel's *K-book*, Lemma III.6.3. -/
noncomputable def tameValue (P : Place k K) (f g : Kˣ) : P.ResidueFieldˣ :=
  (-1) ^ (P.ord (f : K) * P.ord (g : K)) *
    P.residueUnit (f ^ P.ord (g : K) / g ^ P.ord (f : K)) (by
      rw [Units.val_div_eq_div_val, Units.val_zpow_eq_zpow_val, Units.val_zpow_eq_zpow_val,
        P.ord_div (zpow_ne_zero _ f.ne_zero) (zpow_ne_zero _ g.ne_zero), P.ord_zpow, P.ord_zpow]
      ring)

/-- A symbol candidate: a finite formal integer combination `Σ n_{(f,g)} {f, g}` of symbols of
units of the function field (README §7.1). Its class in `K₂` is a README target, since `K₂` of a
field has no carrier at the pins. -/
abbrev SymbolCandidate (K : Type*) [Field K] := (Kˣ × Kˣ) →₀ ℤ

/-- The tame value of a candidate at a place: `∏ tameValue P f g ^ n_{(f,g)}` (README §7.1). -/
noncomputable def SymbolCandidate.tame (P : Place k K) (α : SymbolCandidate K) :
    P.ResidueFieldˣ :=
  α.prod fun fg n => tameValue P fg.1 fg.2 ^ n

end TameValue

/-- **Reciprocity fixes the last rational point** (README §7.4): if a candidate has trivial tame
value at every place except one place `P₀` of degree one, it is trivial at `P₀` as well. The input
is Weil reciprocity for the tame symbol with residue-field norms (K2SymbolsBrauer §10.30); at a place
of degree larger than one only the norm of the value is forced to be one. -/
theorem tame_last_point {k K : Type*} [Field k] [Field K] [Algebra k K]
    (hK : IsFunctionField k K) (α : SymbolCandidate K) (P₀ : Place k K) (hP₀ : P₀.degree = 1)
    (h : ∀ P : Place k K, P ≠ P₀ → SymbolCandidate.tame P α = 1) :
    SymbolCandidate.tame P₀ α = 1 := by
  sorry

/-- **Bloch's correction** (README §7.6; algebraic extension of Young, Lemma 3.1). Let `T` be a finite group of rational points of an elliptic curve killed by `C`, let
`f, g` have zeros and poles only at points of `T`, let `f_P` have divisor `C(P) − C(O)` for each
non-zero `P ∈ T`, and let `c_P ∈ F^×` be the tame value of `{f, g}` at `P`. Then
`C{f, g} + Σ_{0 ≠ P ∈ T} {f_P, c_P}` has trivial tame value at every place. The finset `S` lists the
non-zero points of `T`. -/
theorem blochCorrection {F : Type*} [Field F] [DecidableEq F]
    (W : WeierstrassCurve.Affine F) [W.IsElliptic] (T : AddSubgroup W.Point)
    (S : Finset W.Point) (hS : ∀ P, P ∈ S ↔ P ∈ T ∧ P ≠ 0)
    (C : ℕ) (hCpos : 0 < C) (hC : ∀ P ∈ T, C • P = 0) (f g : W.FunctionFieldˣ)
    (hsupp : ∀ Q : Place F W.FunctionField,
      (Q.ord (f : W.FunctionField) ≠ 0 ∨ Q.ord (g : W.FunctionField) ≠ 0) →
        ∃ P ∈ T, Q = (W.pointEquivDegreeOnePlace P : Place F W.FunctionField))
    (fP : W.Point → W.FunctionFieldˣ)
    (hfP : ∀ P ∈ S, Divisor.principal (W.isFunctionField) (fP P) =
      (C : ℤ) • (TauCeti.AlgebraicGeometry.WeilDivisor.ofPoint
          (W.pointEquivDegreeOnePlace P : Place F W.FunctionField) -
        TauCeti.AlgebraicGeometry.WeilDivisor.ofPoint (Place.infinity W)))
    (c : W.Point → Fˣ)
    (hc : ∀ P ∈ S,
      ((tameValue (W.pointEquivDegreeOnePlace P : Place F W.FunctionField) f g :
          (W.pointEquivDegreeOnePlace P : Place F W.FunctionField).ResidueFieldˣ) :
        (W.pointEquivDegreeOnePlace P : Place F W.FunctionField).ResidueField) =
        algebraMap F _ (c P : F)) :
    ∀ Q : Place F W.FunctionField,
      SymbolCandidate.tame Q ((C : ℤ) • Finsupp.single (f, g) 1 +
        ∑ P ∈ S, Finsupp.single
          (fP P, Units.map (algebraMap F W.FunctionField).toMonoidHom (c P)) 1) = 1 := by
  sorry

end TauCetiRoadmap.EllipticKTheory
