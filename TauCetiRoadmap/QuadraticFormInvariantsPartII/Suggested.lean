module

public import Mathlib
public import TauCeti.LinearAlgebra.QuadraticForm.Witt.Pfister.Basic
public import TauCeti.LinearAlgebra.QuadraticForm.Representation
public import TauCeti.FieldTheory.GaloisCohomology.MuTwo.Basic
public import TauCeti.RepresentationTheory.Homological.ContCohomology.Cup.TrivialF2.Basic
public import TauCeti.AlgebraicGeometry.AdicSpace.PatchPresentation

/-!
# Quadratic forms and cohomological invariants, Part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions their statements need: the quadratic Pfister form in every characteristic, the
coordinate scalar extension of a quadratic form on `Fin n → K`, the iterated cup product of mod-two
Kummer classes, the `C_i` property, the Kronecker dimension and the constant field.

Stated here:

* roundness of quadratic Pfister forms, and the equivalence of isotropy with hyperbolicity, in every
  characteristic (Layer 1);
* the Cassels–Pfister theorem, the representation theorem, Springer's odd-degree theorem, the
  similarity norm principle, the quadratic similarity theorem and the subform theorem in every
  characteristic, and the Arason–Pfister Hauptsatz when `2` is invertible (Layer 2);
* the Milnor conjecture for the Witt ring in cohomological form, `Iⁿ/Iⁿ⁺¹ ≅ Hⁿ(G_K, 𝔽₂)` with
  Pfister classes going to cup products of Kummer classes, and the invariant-zero criterion for
  Pfister forms, when `2` is invertible (Layer 3);
* Dittmann–Pop's principal-unit criterion and independent-value criterion over a henselian valued
  field, the latter containing unit reduction as its case without values (Layer 4);
* the Lang–Nagata theorem for systems of forms and the Tsen–Lang theorem (Layer 5);
* the existence of coefficient fields in henselian valued fields of residue characteristic zero,
  the transport of unit Pfister forms along any coefficient-field section, and Dittmann–Pop's
  dimension theorem for unit Pfister forms (Layer 6);
* Dittmann–Pop's openness of henselian isotropy loci in the patch topology of the valuation
  spectrum, with isotropy over the henselization phrased through the henselization's universal
  property (Layer 7).

Headline theorems of the roadmap that are not statable at the pins, with what each lacks:

* the Arason–Pfister Hauptsatz and the invariant-zero criterion in characteristic two: the pinned
  Witt ring `TauCeti.WittRing` and its fundamental ideal assume `2` invertible, and there is no
  Witt group of nonsingular quadratic forms in characteristic two, nor the module structure over
  the bilinear Witt ring that defines its filtration;
* Kato's theorem `I_qⁿ/I_qⁿ⁺¹ ≅ H₂ⁿ(F)` in characteristic two: there is no inverse Cartier
  operator on the Kähler forms of an imperfect field, hence no Kato group `H₂ⁿ(F)`;
* the Milnor conjecture for the Witt ring in Milnor's original form `Kₙᴹ(F)/2 ≅ Iⁿ/Iⁿ⁺¹`: Milnor
  K-theory of a field is not at the pins (its composite with the norm-residue isomorphism is the
  cohomological statement below);
* Jannsen's Hasse principle `H^{d+2}(F, ℤ/2) ↪ ⊕_v H^{d+2}(F_v, ℤ/2)`: Tau Ceti's restriction
  `TauCeti.galoisRes` covers finite extensions only, and there is no restriction of Galois
  cohomology along the infinite extensions `F → F_v` to the function fields over the completions
  of the global constant field.
-/

@[expose] public section

namespace TauCetiRoadmap.QuadraticFormInvariantsPartII

open QuadraticMap

universe u v

/-! ## Layer 1: quadratic Pfister forms in every characteristic -/

/-- The quadratic Pfister form `⟨⟨a₁, …, aₘ⟩⟩_b ⊗ [1, a₀]` of fold `m + 1`, in every characteristic:
the orthogonal sum, over the `2 ^ m` diagonal weights `∏_{i ∈ S} (−aᵢ)` of the bilinear Pfister form
`⟨1, −a₁⟩_b ⊗ ⋯ ⊗ ⟨1, −aₘ⟩_b` (Tau Ceti's `TauCeti.pfisterForm`), of the weighted binary block
`[1, a₀] = x² + xy + a₀ y²`, the norm form of `K[t]/(t² + t + a₀)`. It is nonsingular exactly when
`1 − 4a₀ ≠ 0`, which always holds in characteristic two (EKM, Example 9.4 and §9.B, pp. 53–54). -/
noncomputable def quadraticPfister {K : Type u} [Field K] {m : ℕ} (a : Fin m → Kˣ) (a₀ : K) :
    QuadraticForm K (Fin (2 ^ m) × Fin 2 → K) :=
  ∑ k : Fin (2 ^ m), ((TauCeti.pfisterForm a k : Kˣ) : K) •
    (QuadraticMap.proj (R := K) (k, 0) (k, 0) + QuadraticMap.proj (R := K) (k, 0) (k, 1) +
      a₀ • QuadraticMap.proj (R := K) (k, 1) (k, 1))

/-- **Quadratic Pfister forms are round** (EKM, Corollary 9.9, p. 54): every nonzero value of a
quadratic Pfister form is a similarity factor of it. No nonsingularity hypothesis is needed: the
norm form of any quadratic algebra is round, and tensoring with `⟨1, −a⟩_b` preserves roundness. -/
theorem quadraticPfister_smul_equivalent_of_represents {K : Type u} [Field K] {m : ℕ}
    (a : Fin m → Kˣ) (a₀ : K) (c : Kˣ) (hc : (quadraticPfister a a₀).Represents (c : K)) :
    ((c : K) • quadraticPfister a a₀).Equivalent (quadraticPfister a a₀) := by
  sorry

/-- **A nonsingular quadratic Pfister form is isotropic exactly when it is hyperbolic** (EKM,
Corollary 9.10, p. 54), in every characteristic; hyperbolic means isometric to the hyperbolic form
`(f, x) ↦ f x` on `V* × V` with `dim V = 2 ^ m`. The hypothesis `1 − 4a₀ ≠ 0` is nonsingularity:
over a field with `2 ≠ 0` and `a₀ = 1/4` the form `(x + y/2)²` is isotropic but not hyperbolic. -/
theorem not_anisotropic_quadraticPfister_iff_equivalent_dualProd {K : Type u} [Field K] {m : ℕ}
    (a : Fin m → Kˣ) (a₀ : K) (h : (1 : K) - 4 * a₀ ≠ 0) :
    ¬ (quadraticPfister a a₀).Anisotropic ↔
      (quadraticPfister a a₀).Equivalent (QuadraticForm.dualProd K (Fin (2 ^ m) → K)) := by
  sorry

/-! ## Layer 2: polynomial representation and the Arason–Pfister Hauptsatz -/

/-- The scalar extension of a quadratic form on `Fin n → K` to a commutative `K`-algebra `L`,
by its coordinate polynomial: `x ↦ ∑ᵢ Q(eᵢ) xᵢ² + ∑_{i<j} polar Q(eᵢ, eⱼ) xᵢ xⱼ`, with coefficients
mapped into `L`. It keeps the mixed terms in characteristic two, where Mathlib's
`QuadraticForm.baseChange` (which assumes `2` invertible) is not available (EKM, §7, p. 42). -/
noncomputable def extendScalars {K : Type u} [Field K] {n : ℕ} (Q : QuadraticForm K (Fin n → K))
    (L : Type v) [CommRing L] [Algebra K L] : QuadraticForm L (Fin n → L) :=
  ∑ i : Fin n, algebraMap K L (Q (Pi.single i 1)) • QuadraticMap.proj (R := L) i i +
    ∑ i : Fin n, ∑ j ∈ Finset.Ioi i,
      algebraMap K L (QuadraticMap.polar Q (Pi.single i 1) (Pi.single j 1)) •
        QuadraticMap.proj (R := L) i j

/-- **The Cassels–Pfister theorem** (EKM, Theorem 17.3, p. 71), for an arbitrary quadratic form in
every characteristic: a polynomial represented by `Q` over the rational function field `K(t)` is
represented by `Q` on polynomial vectors. -/
theorem exists_extendScalars_polynomial_eq {K : Type u} [Field K] {n : ℕ}
    (Q : QuadraticForm K (Fin n → K)) (h : Polynomial K)
    (hv : ∃ v : Fin n → RatFunc K,
      extendScalars Q (RatFunc K) v = algebraMap (Polynomial K) (RatFunc K) h) :
    ∃ w : Fin n → Polynomial K, extendScalars Q (Polynomial K) w = h := by
  sorry

/-- **The representation theorem** (EKM, Theorem 17.12, pp. 73–74), in every characteristic: for
anisotropic quadratic forms `ψ` and `Q`, `ψ` is isometric to a subform of `Q` exactly when every
nonzero value of `ψ` over every field extension `E` is a value of `Q` over `E`. The zero-dimensional
`ψ` satisfies both sides. -/
theorem isRepresentedBy_iff_forall_represents_extendScalars {K : Type u} [Field K] {m n : ℕ}
    (ψ : QuadraticForm K (Fin m → K)) (Q : QuadraticForm K (Fin n → K)) (hψ : ψ.Anisotropic)
    (hQ : Q.Anisotropic) :
    ψ.IsRepresentedBy Q ↔ ∀ (E : Type u) [Field E] [Algebra K E] (c : E), c ≠ 0 →
      (extendScalars ψ E).Represents c → (extendScalars Q E).Represents c := by
  sorry

/-- **Springer's theorem** (EKM, Corollary 18.5, p. 77), in every characteristic and including
inseparable extensions: an anisotropic quadratic form stays anisotropic over every finite field
extension of odd degree. -/
theorem anisotropic_extendScalars_of_odd_finrank {K : Type u} [Field K] {n : ℕ}
    (Q : QuadraticForm K (Fin n → K)) (hQ : Q.Anisotropic) (L : Type v) [Field L] [Algebra K L]
    [FiniteDimensional K L] (hodd : Odd (Module.finrank K L)) :
    (extendScalars Q L).Anisotropic := by
  sorry

/-- **The similarity norm principle** (EKM, Theorem 20.14, p. 86), in every characteristic and for
inseparable extensions: if `Q` is a nondegenerate quadratic form of even dimension `2k` and a unit
`c` of a finite extension `E` is a similarity factor of `Q` over `E`, then its norm `N_{E/K}(c)` is
a similarity factor of `Q`. -/
theorem smul_equivalent_of_smul_equivalent_extendScalars {K : Type u} [Field K] {k : ℕ}
    (Q : QuadraticForm K (Fin (2 * k) → K)) (hQ : Q.Nondegenerate) (E : Type v) [Field E]
    [Algebra K E] [FiniteDimensional K E] (c : Eˣ)
    (hc : ((c : E) • extendScalars Q E).Equivalent (extendScalars Q E)) :
    (Algebra.norm K (c : E) • Q).Equivalent Q := by
  sorry

/-- **The quadratic similarity theorem** (EKM, Theorem 20.16, pp. 86–87), in every characteristic.
Let `Q` be a nondegenerate quadratic form of even dimension `2k` and `f` a nonzero polynomial in
`t₁, …, tₙ` (the variable `t₁`, index `0`, is the most significant in the lexicographic order, as in
EKM, p. 77). The following are equivalent: `f* f` is a similarity factor of `Q` over `K(T)`, where
`f*` is the lexicographic leading coefficient; `a f` is one for some `a ∈ Kˣ`; and for every
irreducible `p` dividing `f` to an odd power, `Q` is hyperbolic over the residue field `K(p)`. The
last clause is phrased through every field receiving `K[T]` with kernel exactly `(p)`: such a field
contains `K(p)`, and `K(p)` is one of them. -/
theorem quadraticSimilarity_tfae {K : Type u} [Field K] {k n : ℕ}
    (Q : QuadraticForm K (Fin (2 * k) → K)) (hQ : Q.Nondegenerate) (f : MvPolynomial (Fin n) K)
    (hf : f ≠ 0) :
    [((algebraMap (MvPolynomial (Fin n) K) (FractionRing (MvPolynomial (Fin n) K))
          (MvPolynomial.C (MonomialOrder.lex.leadingCoeff f) * f)) •
          extendScalars Q (FractionRing (MvPolynomial (Fin n) K))).Equivalent
        (extendScalars Q (FractionRing (MvPolynomial (Fin n) K))),
      ∃ a : Kˣ, ((algebraMap (MvPolynomial (Fin n) K) (FractionRing (MvPolynomial (Fin n) K))
          (MvPolynomial.C (a : K) * f)) •
          extendScalars Q (FractionRing (MvPolynomial (Fin n) K))).Equivalent
        (extendScalars Q (FractionRing (MvPolynomial (Fin n) K))),
      ∀ p : MvPolynomial (Fin n) K, Irreducible p → Odd (multiplicity p f) →
        ∀ (L : Type u) [Field L] [Algebra K L] [Algebra (MvPolynomial (Fin n) K) L]
          [IsScalarTower K (MvPolynomial (Fin n) K) L],
          RingHom.ker (algebraMap (MvPolynomial (Fin n) K) L) = Ideal.span {p} →
          (extendScalars Q L).Equivalent (QuadraticForm.dualProd L (Fin k → L))].TFAE := by
  sorry

/-- **The subform theorem** (EKM, Theorem 22.5, p. 94), in every characteristic. Let `q` be an
anisotropic quadratic form and `ψ` an anisotropic quadratic form whose coordinate polynomial
`ψ(T) ∈ K[T₁, …, Tₘ]` is irreducible, so that the projective quadric `ψ = 0` is integral with
function field `K(ψ)`. Suppose `q` is hyperbolic over `K(ψ)`; this is phrased through every field
`L` receiving `K[T]` with kernel exactly `(ψ(T))`: each such `L` contains the fraction field of
`K[T]/(ψ(T))`, which is purely transcendental of degree one over `K(ψ)` (EKM, §22, p. 94), and
hyperbolicity ascends to `L` and descends along the purely transcendental extension. Then for
every nonzero value `a` of `q` and `b` of `ψ`, the form `a b ψ` is isometric to a subform of `q`;
in particular `m ≤ n`. The nonzero form `q` of the source is forced by `a ≠ 0`. -/
theorem isRepresentedBy_smul_of_forall_equivalent_dualProd {K : Type u} [Field K] {m n : ℕ}
    (q : QuadraticForm K (Fin n → K)) (hq : q.Anisotropic)
    (ψ : QuadraticForm K (Fin m → K)) (hψ : ψ.Anisotropic)
    (hirr : Irreducible (extendScalars ψ (MvPolynomial (Fin m) K) MvPolynomial.X))
    (hhyp : ∀ (L : Type u) [Field L] [Algebra K L] [Algebra (MvPolynomial (Fin m) K) L]
      [IsScalarTower K (MvPolynomial (Fin m) K) L],
      RingHom.ker (algebraMap (MvPolynomial (Fin m) K) L) =
        Ideal.span {extendScalars ψ (MvPolynomial (Fin m) K) MvPolynomial.X} →
      ∃ k : ℕ, (extendScalars q L).Equivalent (QuadraticForm.dualProd L (Fin k → L)))
    (a b : K) (ha : a ≠ 0) (hqa : q.Represents a) (hb : b ≠ 0) (hψb : ψ.Represents b) :
    ((a * b) • ψ).IsRepresentedBy q := by
  sorry

/-- **The Arason–Pfister Hauptsatz** (EKM, Theorem 23.7(1), p. 100) for a field in which `2` is
invertible: a nonzero anisotropic regular form whose Witt class lies in `I(K)ⁿ` has dimension at
least `2ⁿ`. The characteristic-two form needs the Witt module of nonsingular quadratic forms,
which is not at the pins. -/
theorem two_pow_le_finrank_of_wittClass_mem_fundamentalIdeal_pow {K : Type u} [Field K]
    [Invertible (2 : K)] {V : Type v} [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    [Nontrivial V] (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) (hA : Q.Anisotropic) {n : ℕ}
    (hn : TauCeti.wittClass (TauCeti.formClass Q hQ) ∈ TauCeti.fundamentalIdeal K ^ n) :
    2 ^ n ≤ Module.finrank K V := by
  sorry

/-! ## Layer 3: higher cohomological invariants -/

/-- The cup product `(a₁) ∪ ⋯ ∪ (aₙ₊₁) ∈ Hⁿ⁺¹(G_K, 𝔽₂)` of the mod-two Kummer classes of units of a
field in which `2` is invertible, taken from left to right with Tau Ceti's multiplication pairing on
trivial `𝔽₂` coefficients. On the Pfister form `⟨⟨a₁, …, aₙ₊₁⟩⟩` it is the cohomological invariant
`eₙ₊₁` (EKM, §16, p. 67). -/
noncomputable def kummerSymbol {K : Type u} [Field K] [Invertible (2 : K)] :
    (n : ℕ) → (Fin (n + 1) → Kˣ) →
      continuousCohomology (n + 1) (TauCeti.trivialF2 (TauCeti.AbsoluteGaloisGroup K))
  | 0, a => TauCeti.kummerClass (a 0)
  | n + 1, a => (TauCeti.trivialF2TopPairing (TauCeti.AbsoluteGaloisGroup K)).cup (n + 1) 1
      (kummerSymbol n (Fin.init a)) (TauCeti.kummerClass (a (Fin.last (n + 1))))

/-- **The Milnor conjecture for the Witt ring, in cohomological form** (EKM, Fact 16.2, p. 68;
Morel, Theorem 1.1, p. 65, composed with the norm-residue isomorphism): for a field in which `2` is
invertible and every `n ≥ 1`, there is an isomorphism `Iⁿ/Iⁿ⁺¹ ≅ Hⁿ(G_K, 𝔽₂)` sending the class of
each `n`-fold Pfister form `⟨⟨a₁, …, aₙ⟩⟩` to `(a₁) ∪ ⋯ ∪ (aₙ)`. Since Pfister classes generate
`Iⁿ` additively, it is unique. -/
theorem exists_addEquiv_quotient_fundamentalIdeal_pow (K : Type u) [Field K] [Invertible (2 : K)]
    (n : ℕ) :
    ∃ e : ((TauCeti.fundamentalIdeal K ^ (n + 1)).toAddSubgroup ⧸
        ((TauCeti.fundamentalIdeal K ^ (n + 2)).toAddSubgroup.addSubgroupOf
          (TauCeti.fundamentalIdeal K ^ (n + 1)).toAddSubgroup)) ≃+
        continuousCohomology (n + 1) (TauCeti.trivialF2 (TauCeti.AbsoluteGaloisGroup K)),
      ∀ a : Fin (n + 1) → Kˣ,
        e (QuotientAddGroup.mk
          ⟨TauCeti.pfisterClass a, TauCeti.pfisterClass_mem_fundamentalIdeal_pow a⟩) =
          kummerSymbol n a := by
  sorry

/-- **The invariant-zero criterion** (EKM, Fact 16.2 with Theorem 23.7; Dittmann–Pop, Fact 3.1,
p. 6) for a field in which `2` is invertible: the Pfister form `⟨⟨a₁, …, aₙ⟩⟩ = ⟨1, −a₁⟩ ⊗ ⋯ ⊗
⟨1, −aₙ⟩`, `n ≥ 1`, is isotropic exactly when `(a₁) ∪ ⋯ ∪ (aₙ) = 0` in `Hⁿ(G_K, 𝔽₂)`. -/
theorem not_anisotropic_pfisterForm_iff_kummerSymbol_eq_zero {K : Type u} [Field K]
    [Invertible (2 : K)] (n : ℕ) (a : Fin (n + 1) → Kˣ) :
    ¬ (TauCeti.presentedForm ⟨2 ^ (n + 1), TauCeti.pfisterForm a⟩).Anisotropic ↔
      kummerSymbol n a = 0 := by
  sorry

/-! ## Layer 4: henselian unit and value criteria -/

/-- **The principal-unit criterion** (Dittmann–Pop, Proposition 3.2(1), pp. 6–7), over a field with
a henselian valuation ring `O` of arbitrary rank. Let `ε` be units of `O` and `a₀ ∈ O`. If some outer
slot `εᵢ` is a principal unit, that is reduces to `1` in the residue field, the form
`⟨⟨ε⟩⟩_b ⊗ [1, a₀]` is isotropic over `K`. In residue characteristic different from two, `εᵢ` is a
square `c²` by Hensel's lemma and the outer factor `⟨1, −c²⟩_b` makes the form isotropic whatever
`a₀`; in residue characteristic two, `1 − 4a₀` is automatically a unit, the reduction is nonsingular
with the metabolic outer factor `⟨1, 1⟩_b`, and unit reduction lifts the residual zero. The slot
`i : Fin m` forces `m ≥ 1`; a principal unit in the terminal block alone gives nothing, as
`[1, 1 + t]` over `𝔽₂((t))` is anisotropic. -/
theorem not_anisotropic_quadraticPfister_of_residue_eq_one {K : Type u} [Field K]
    (O : ValuationSubring K) [HenselianLocalRing O] {m : ℕ} (ε : Fin m → Oˣ) (a₀ : O)
    (i : Fin m) (hi : IsLocalRing.residue O (ε i : O) = 1) :
    ¬ (quadraticPfister (fun j => Units.map O.subtype.toMonoidHom (ε j)) (a₀ : K)).Anisotropic := by
  sorry

/-- **The independent-value criterion** (Dittmann–Pop, Proposition 3.2(2) and its proof,
pp. 6–7), over a field with a henselian valuation ring `O` of arbitrary rank. Let `ε` be units of
`O` and `a₀ ∈ O` with `1 − 4a₀` a unit, so that the unit Pfister form `⟨⟨ε⟩⟩_b ⊗ [1, a₀]` has
nonsingular reduction; let `π₁, …, πₛ` have values that are `𝔽₂`-independent modulo squares in the
value group. Then the reduced form is isotropic over the residue field, the form is isotropic over
`K`, and `⟨⟨π⟩⟩_b ⊗ ⟨⟨ε⟩⟩_b ⊗ [1, a₀]` is isotropic over `K`, all at once. The empty `π` gives unit
reduction. When the valuation is non-dyadic every unit Pfister form `⟨⟨ε_r, …, ε₀⟩⟩` has this
shape: with `a₀ = (1 − ε₀)/4` when `2` is a unit of `O`, and with `a₀ = ε₀` in equal characteristic
two, where the terminal block is `[1, ε₀]` itself. -/
theorem quadraticPfister_isotropic_tfae_of_independent_values {K : Type u} [Field K]
    (O : ValuationSubring K) [HenselianLocalRing O] {m s : ℕ} (ε : Fin m → Oˣ) (a₀ : O)
    (ha₀ : IsUnit (1 - 4 * a₀)) (π : Fin s → Kˣ)
    (hπ : ∀ S : Finset (Fin s), S.Nonempty → ¬ IsSquare (∏ i ∈ S, O.valuation (π i : K))) :
    [¬ (quadraticPfister (fun i => Units.map (IsLocalRing.residue O).toMonoidHom (ε i))
          (IsLocalRing.residue O a₀)).Anisotropic,
      ¬ (quadraticPfister (fun i => Units.map O.subtype.toMonoidHom (ε i)) (a₀ : K)).Anisotropic,
      ¬ (quadraticPfister (Fin.append π (fun i => Units.map O.subtype.toMonoidHom (ε i)))
          (a₀ : K)).Anisotropic].TFAE := by
  sorry

/-! ## Layer 5: `C_i` fields and Kronecker dimension -/

/-- A field is `C_i` when every homogeneous polynomial of positive degree `d` in more than `dⁱ`
variables has a nonzero zero (EKM, §97, p. 385). -/
def IsCi (i : ℕ) (F : Type u) [Field F] : Prop :=
  ∀ (N d : ℕ) (f : MvPolynomial (Fin N) F), 0 < d → f.IsHomogeneous d → d ^ i < N →
    ∃ x : Fin N → F, x ≠ 0 ∧ MvPolynomial.eval x f = 0

/-- **The Tsen–Lang theorem** (EKM, Corollaries 97.5–97.6 and Theorem 97.7, p. 386): an extension
of transcendence degree `t` of a `C_i` field is `C_{i+t}`, with no finite-generation hypothesis. -/
theorem IsCi.of_trdeg {i t : ℕ} {F : Type u} {E : Type v} [Field F] [Field E] [Algebra F E]
    (hF : IsCi i F) (ht : Algebra.trdeg F E = t) : IsCi (i + t) E := by
  sorry

/-- **The Lang–Nagata theorem for systems** (EKM, Lemma 97.1 and Theorem 97.2, p. 385): over a
`C_i` field, `r` homogeneous polynomials of the same positive degree `d` in more than `r dⁱ`
variables have a common nonzero zero. -/
theorem IsCi.exists_common_zero {i : ℕ} {F : Type u} [Field F] (hF : IsCi i F) {r N d : ℕ}
    (f : Fin r → MvPolynomial (Fin N) F) (hd : 0 < d) (hf : ∀ j, (f j).IsHomogeneous d)
    (hN : r * d ^ i < N) :
    ∃ x : Fin N → F, x ≠ 0 ∧ ∀ j, MvPolynomial.eval x (f j) = 0 := by
  sorry

/-- The Kronecker dimension of a field: its absolute transcendence degree, that is over the prime
subfield, plus one in characteristic zero (Dittmann–Pop, §1, p. 1). -/
noncomputable def kroneckerDimension (F : Type u) [Field F] : Cardinal.{u} :=
  Algebra.trdeg (⊥ : Subfield F) F + if ringChar F = 0 then 1 else 0

/-- The constant field of a field: the relative algebraic closure of its prime subfield
(Dittmann–Pop, Proposition 3.2, p. 6). -/
def constantField (F : Type u) [Field F] : Subfield F :=
  (algebraicClosure (⊥ : Subfield F) F).toSubfield

/-! ## Layer 6: coefficient fields, real places and the dimension theorem -/

/-- **Coefficient fields exist in residue characteristic zero** (Dittmann–Pop, Proposition 3.2(3),
Case 2, p. 7): a henselian valuation ring `O` of arbitrary rank whose residue field `κ` has
characteristic zero admits a ring homomorphism `σ : κ → O` that is a section of the residue map; its
image is a subfield of `O` mapping isomorphically onto `κ`. Lift a transcendence basis of `κ` over
`ℚ`, on which the valuation is trivial, then extend over the separable algebraic residue extension
by Hensel's lemma applied to lifted minimal polynomials and Zorn's lemma. Residue characteristic
`p > 0` is excluded: `ℤ_p` contains no subfield. -/
theorem exists_residueSection_of_charZero {K : Type u} [Field K] (O : ValuationSubring K)
    [HenselianLocalRing O] [CharZero (IsLocalRing.ResidueField O)] :
    ∃ σ : IsLocalRing.ResidueField O →+* O,
      (IsLocalRing.residue O).comp σ = RingHom.id (IsLocalRing.ResidueField O) := by
  sorry

/-- **Unit Pfister forms descend to a coefficient field** (Dittmann–Pop, Proposition 3.2(3),
Case 2, p. 7, in residue characteristic zero). Let `O` be a henselian valuation ring of arbitrary
rank and `σ : κ → O` any section of the residue map; its existence forces `K` and `κ` to have the
same characteristic. For units `ε₁, …, εₘ` of `O` and `a₀ ∈ O` with `1 − 4a₀` a unit, the unit
Pfister form `⟨⟨ε⟩⟩_b ⊗ [1, a₀]` is isometric over `K` to the form with slots `ηᵢ = σ(ε̄ᵢ)` and
terminal coefficient `b₀ = σ(ā₀)`, all in the image of `σ`. When `2 ≠ 0` in `κ`, each `εᵢ/ηᵢ` is a
principal unit, hence a square by Hensel's lemma for `X² − εᵢ/ηᵢ`, and `[1, a₀] ≅ ⟨1, −(1 − 4a₀)⟩`;
the ratio `(1 − 4a₀)/(1 − 4b₀)` is a principal unit, so the terminal blocks agree. In
characteristic two, `a₀ − b₀` lies in `℘(O)` by Hensel's lemma for `X² + X − (a₀ − b₀)`, and
`uρ ≅ ρ` for a principal unit `u` and a unit Pfister form `ρ`, because `⟨⟨u⟩⟩_b ⊗ ρ` is hyperbolic
by the principal-unit criterion. The unit hypothesis on `1 − 4a₀` is needed: over `ℚ((t))` with
`a₀ = (1 − t)/4`, the form `[1, a₀] ≅ ⟨1, −t⟩` is nonsingular while `[1, σ(ā₀)] = [1, 1/4]` is
singular. -/
theorem quadraticPfister_equivalent_residueSection {K : Type u} [Field K]
    (O : ValuationSubring K) [HenselianLocalRing O]
    (σ : IsLocalRing.ResidueField O →+* O)
    (hσ : (IsLocalRing.residue O).comp σ = RingHom.id (IsLocalRing.ResidueField O))
    {m : ℕ} (ε : Fin m → Oˣ) (a₀ : O) (ha₀ : IsUnit (1 - 4 * a₀)) :
    (quadraticPfister (fun i => Units.map O.subtype.toMonoidHom (ε i)) (a₀ : K)).Equivalent
      (quadraticPfister
        (fun i => Units.map (O.subtype.comp (σ.comp (IsLocalRing.residue O))).toMonoidHom (ε i))
        ((σ (IsLocalRing.residue O a₀) : O) : K)) := by
  sorry

/-- **Dittmann–Pop's dimension theorem for unit Pfister forms** (Proposition 3.2(3), pp. 6–8). Let
`K` have Kronecker dimension `r` and a nontrivial henselian valuation ring `O`, with no
finite-generation hypothesis. Let `ε₁, …, ε_r` be units of `O` and `a₀ ∈ O` with `1 − 4a₀` a unit.
If the `(r + 1)`-fold form `⟨⟨ε⟩⟩_b ⊗ [1, a₀]` is isotropic over the compositum of `K` with every
real closure of the constant field `k`, then it is isotropic over `K`. The compositum condition is
phrased through every field `L` receiving `K` and a real closed field algebraic over `k`
compatibly on `k`; it is vacuous when `k` has no ordering. -/
theorem not_anisotropic_quadraticPfister_of_kroneckerDimension {K : Type u} [Field K]
    (O : ValuationSubring K) [HenselianLocalRing O] (hO : O ≠ ⊤) {r : ℕ}
    (hr : kroneckerDimension K = r) (ε : Fin r → Oˣ) (a₀ : O) (ha₀ : IsUnit (1 - 4 * a₀))
    (hreal : ∀ (R : Type u) [Field R] [IsRealClosed R] [Algebra (constantField K) R]
      [Algebra.IsAlgebraic (constantField K) R] (L : Type u) [Field L] (f : K →+* L)
      (g : R →+* L), (∀ x : constantField K, g (algebraMap (constantField K) R x) = f x) →
      ¬ (quadraticPfister (fun i => Units.map (f.comp O.subtype).toMonoidHom (ε i))
          (f (a₀ : K))).Anisotropic) :
    ¬ (quadraticPfister (fun i => Units.map O.subtype.toMonoidHom (ε i)) (a₀ : K)).Anisotropic := by
  sorry

/-! ## Layer 7: patch-open henselization loci -/

/-- **Henselian isotropy loci are patch open** (Dittmann–Pop, Lemma 3.9(2), p. 11). For every
quadratic form `q` over a field `F`, with no hypothesis of nonsingularity, Pfister shape,
characteristic or rank, the set of points `w` of the valuation spectrum of `F` (the trivial
valuation included) at which `q` is isotropic over the henselization `F_w^h` is open for the patch
topology. Isotropy over `F_w^h` is phrased as isotropy over every henselian valued field `(L, O)`
extending `F` whose valuation restricts to `w`: the henselization is one such field, and it embeds
over `F` into each of them by its universal property. -/
theorem isOpen_setOf_forall_henselian_not_anisotropic {F : Type u} [Field F] {n : ℕ}
    (q : QuadraticForm F (Fin n → F)) :
    @IsOpen (TauCeti.ValuationSpectrum F) (TauCeti.ValuationSpectrum.patchTopology F)
      {w | ∀ (L : Type u) [Field L] [Algebra F L] (O : ValuationSubring L) [HenselianLocalRing O],
        TauCeti.ValuationSpectrum.comap (algebraMap F L)
            ⟨ValuativeRel.ofValuation O.valuation⟩ = w →
          ¬ (extendScalars q L).Anisotropic} := by
  sorry

end TauCetiRoadmap.QuadraticFormInvariantsPartII
