import Mathlib
import TauCeti.RingTheory.MvPolynomial.Symmetric.Schur.Basis
import TauCeti.RingTheory.MvPolynomial.Symmetric.Schur.MurnaghanNakayama
import TauCeti.RepresentationTheory.Symmetric.FrobeniusCharacteristic
import TauCeti.RepresentationTheory.Symmetric.Specht.Complex
import TauCeti.RepresentationTheory.Symmetric.Specht.Character
import TauCeti.RepresentationTheory.Symmetric.ClassSize
import TauCeti.GroupTheory.Perm.SumCongr
import TauCeti.RepresentationTheory.Symmetric.SignCharacter
import TauCeti.RepresentationTheory.LinearCharacter.Basic
import TauCeti.Combinatorics.Enumerative.Partition.Conjugate
import TauCeti.Combinatorics.Young.RimHook
import TauCeti.RepresentationTheory.Symmetric.Symmetrizer
import TauCeti.RepresentationTheory.Symmetric.TensorAction.Basic
import TauCeti.RepresentationTheory.ClassicalGroups.WeylModule.Basic
import TauCeti.RepresentationTheory.ClassicalGroups.BrauerGenerators.Orthogonal.TensorPower

/-!
# Representations of the symmetric group, Specht modules, and Schur–Weyl duality: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions those statements need.

Stated here: the Specht sign-transpose isomorphism `S^λ ⊗ sgn ≅ S^{λᵗ}` with its character form and
the Specht self-duality and the induced and Kronecker transpose comparisons (Layer 4); the Littlewood–Richardson rule with the coefficient defined by
ballot tableaux, the finite Frobenius power-sum/Schur formulas in both directions and the cycle-type formula,
the character-side Murnaghan–Nakayama rule, the Hall form on the finite-variable
symmetric polynomials with its power-sum normalisation and the isometry property of the native
Frobenius characteristic, the integral matrix Newton recurrence and the finite power-sum basis
(Layer 7); the simultaneous `Sₙ × GLₔ` decomposition of the tensor power and the
balanced-tensor presentation of each Schur functor
(Layer 8); the orthogonal first fundamental theorem over infinite fields of characteristic different from
two and the complex reverse centralizer, the harmonic
tensors and the orthogonal shape spaces `E_λ` with their nonvanishing criterion, irreducibility and
the harmonic decomposition (Layer 9).

Not statable at the pins, and therefore not stated: the stable ring `Λ_R` with its Hall form,
`ω`, the free elementary generators and the stable Frobenius characteristic (no inverse-limit
carrier of symmetric functions exists at the pins); the stable induction compatibility
`ch(Ind(f ⊠ g)) = ch(f) ch(g)` (its target is that same missing stable ring); the RSK bijection as an equivalence and its compatibility with evacuation (no carrier
links `TauCeti.rowInsert` on row lists to `TauCeti.StandardYoungTableau`); the Brauer algebra
`B_k(δ)`, its loop rule, its semisimplicity for `|δ| ≥ 2k − 2`, the nonsemisimplicity of `B₃(−2)`,
its cell modules and the trace filtration (no Brauer-algebra carrier exists; only the diagram
combinatorics and the orthogonal and symplectic generator actions do); the symplectic first
fundamental theorem, the symplectic harmonic classification `ℓ(λ) ≤ l` and the symplectic
multiplicity spaces (only the two-strand `TauCeti.symplecticCupCap` exists, no cup-cap at an
arbitrary pair of slots).
-/

namespace TauCetiRoadmap.RepresentationTheory.SchurWeyl

open CategoryTheory
open scoped TensorProduct DirectSum

/-! ## Layer 4: the sign-transpose intertwiner and self-duality -/

/-- **The Specht sign-transpose isomorphism** `S^λ ⊗ sgn_n ≅ S^{λᵗ}` in `FDRep ℚ (Perm (Fin n))`,
with `sgn_n` the one-dimensional sign representation (Fulton–Harris, Lecture 4, Exercise 4.4;
James, Chapter 4 and Theorem 8.15). -/
theorem spechtModule_tensor_sign_iso {n : ℕ} (μ : n.Partition) :
    Nonempty (MonoidalCategoryStruct.tensorObj (TauCeti.spechtModule μ)
        (FDRep.ofLinearCharacter (TauCeti.signLinearCharacter ℚ (Fin n)))
      ≅ TauCeti.spechtModule (TauCeti.conjugate μ)) := sorry

/-- **The character form** of the sign-transpose isomorphism: `χ^{λᵗ}(σ) = sgn(σ) · χ^λ(σ)` on the
integer-valued Specht characters. -/
theorem spechtChar_conjugate {n : ℕ} (μ : n.Partition) (σ : Equiv.Perm (Fin n)) :
    TauCeti.spechtChar (TauCeti.conjugate μ) σ = (Equiv.Perm.sign σ : ℤ) * TauCeti.spechtChar μ σ :=
  sorry

/-- **Specht self-duality**: the restriction of the invariant tabloid form to `S^λ` is nondegenerate
over `ℚ`, so `v ↦ B(v, ·)` is an equivariant linear bijection from `S^λ` onto its dual with the
contragredient action `(σ · φ)(v) = φ(σ⁻¹ v)` (James, Chapter 4 and Theorem 8.15). -/
theorem spechtModule_self_dual {n : ℕ} (μ : n.Partition) :
    ∃ f : TauCeti.spechtModule μ →ₗ[ℚ] Module.Dual ℚ (TauCeti.spechtModule μ),
      Function.Bijective f ∧
        ∀ (σ : Equiv.Perm (Fin n)) (v : TauCeti.spechtModule μ),
          f ((TauCeti.spechtModule μ).ρ σ v) = Representation.dual (TauCeti.spechtModule μ).ρ σ (f v) := sorry

/-- The representation induced from the external product of the rational Specht modules along
`S_a × S_b → S_(a+b)`, using the two projection pullbacks and native tensor and induction. -/
noncomputable def inducedSpecht {a b : ℕ} (lam : a.Partition) (mu : b.Partition) :=
  Representation.ind (Equiv.Perm.finSumPermHom a b)
    (Representation.tprod
      ((TauCeti.spechtModule lam).ρ.comp (MonoidHom.fst _ _))
      ((TauCeti.spechtModule mu).ρ.comp (MonoidHom.snd _ _)))

/-- Transposing the two inducing shapes and the output shape preserves the induced Specht
multiplicity space (James, Theorem 16.4; the sign projection formula). -/
theorem inducedSpechtTranspose {a b : ℕ} (lam : a.Partition) (mu : b.Partition)
    (nu : (a + b).Partition) :
    Nonempty (Representation.IntertwiningMap (TauCeti.spechtModule nu).ρ (inducedSpecht lam mu)
      ≃ₗ[ℚ] Representation.IntertwiningMap (TauCeti.spechtModule (TauCeti.conjugate nu)).ρ
        (inducedSpecht (TauCeti.conjugate lam) (TauCeti.conjugate mu))) := sorry

/-- Transposing both factors of an internal Specht tensor product cancels the two sign twists. -/
theorem kroneckerDoubleTranspose {n : ℕ} (lam mu : n.Partition) :
    Nonempty (MonoidalCategoryStruct.tensorObj
      (TauCeti.spechtModule (TauCeti.conjugate lam)) (TauCeti.spechtModule (TauCeti.conjugate mu)) ≅
      MonoidalCategoryStruct.tensorObj (TauCeti.spechtModule lam) (TauCeti.spechtModule mu)) := sorry

/-- Transposing one factor of an internal Specht tensor product twists the product by sign. -/
theorem kroneckerSingleTranspose {n : ℕ} (lam mu : n.Partition) :
    Nonempty (MonoidalCategoryStruct.tensorObj
      (TauCeti.spechtModule (TauCeti.conjugate lam)) (TauCeti.spechtModule mu) ≅
      MonoidalCategoryStruct.tensorObj
        (MonoidalCategoryStruct.tensorObj (TauCeti.spechtModule lam) (TauCeti.spechtModule mu))
        (FDRep.ofLinearCharacter (TauCeti.signLinearCharacter ℚ (Fin n)))) := sorry

/-! ## Layer 7: Littlewood–Richardson, Murnaghan–Nakayama and the Hall form -/

/-- The cells of the skew shape `outer / inner`. -/
def skewCells (inner outer : YoungDiagram) : Finset (ℕ × ℕ) := outer.cells \ inner.cells

/-- The Littlewood–Richardson reading order of the skew cells: rows from the top down, each row from
right to left. -/
noncomputable def skewReadingCells (inner outer : YoungDiagram) : List (ℕ × ℕ) :=
  (skewCells inner outer).toList.mergeSort fun p q =>
    decide (p.1 < q.1 ∨ (p.1 = q.1 ∧ q.2 ≤ p.2))

/-- **The ballot (lattice-word) condition** on a word in the letters `0, 1, 2, …`: every prefix
contains at least as many letters `k` as letters `k + 1`. -/
def IsBallotWord (w : List ℕ) : Prop :=
  ∀ t k : ℕ, ((w.take t).count (k + 1)) ≤ ((w.take t).count k)

/-- **A semistandard skew tableau** of shape `outer / inner`: an entry function on the cells of the
plane that vanishes outside the skew cells, weakly increases along rows and strictly increases down
columns of the skew shape. -/
structure SkewSemistandardYoungTableau (inner outer : YoungDiagram) where
  inner_le_outer : inner ≤ outer
  entry : ℕ × ℕ → ℕ
  zero_outside : ∀ p, p ∉ skewCells inner outer → entry p = 0
  row_weak : ∀ p ∈ skewCells inner outer, ∀ q ∈ skewCells inner outer,
    p.1 = q.1 → p.2 < q.2 → entry p ≤ entry q
  col_strict : ∀ p ∈ skewCells inner outer, ∀ q ∈ skewCells inner outer,
    p.2 = q.2 → p.1 < q.1 → entry p < entry q

/-- The content of a skew tableau: the number of skew cells carrying each letter. -/
noncomputable def skewContent {inner outer : YoungDiagram}
    (T : SkewSemistandardYoungTableau inner outer) : ℕ →₀ ℕ :=
  ((skewCells inner outer).val.map T.entry).toFinsupp

/-- **Littlewood–Richardson tableaux** of shape `outer / inner` and content `content`: the skew
semistandard tableaux whose letter `k` occurs `content.rowLen k` times and whose reading word is a
ballot word. -/
abbrev LRTableau (inner outer content : YoungDiagram) :=
  {T : SkewSemistandardYoungTableau inner outer //
    (∀ k, skewContent T k = content.rowLen k) ∧
      IsBallotWord ((skewReadingCells inner outer).map T.entry)}

/-- **The Littlewood–Richardson coefficient** `c^κ_{μ,ν}`, the number of Littlewood–Richardson
tableaux of shape `κ / μ` and content `ν`. -/
noncomputable def lrCoefficient (μ ν κ : YoungDiagram) : ℕ :=
  Nat.card (LRTableau μ κ ν)

/-- **The Littlewood–Richardson rule** `s_μ · s_ν = ∑_κ c^κ_{μ,ν} s_κ`, in every finite alphabet and
over every commutative semiring (Macdonald I.9, (9.2); Fulton, *Young Tableaux*, §5.1,
Corollary 2). -/
theorem littlewoodRichardson (σ R : Type*) [Fintype σ] [CommSemiring R]
    {n m : ℕ} (μ : n.Partition) (ν : m.Partition) :
    TauCeti.schurPoly σ R μ * TauCeti.schurPoly σ R ν =
      ∑ κ : (n + m).Partition,
        (lrCoefficient (TauCeti.diagramOf μ) (TauCeti.diagramOf ν) (TauCeti.diagramOf κ) : R) •
          TauCeti.schurPoly σ R κ := by sorry

/-- The Littlewood–Richardson rule on the diagram-indexed Schur polynomials. -/
theorem diagramLittlewoodRichardson (d : ℕ) (R : Type*) [CommSemiring R]
    (μ ν : YoungDiagram) :
    TauCeti.diagramSchurPoly d R μ * TauCeti.diagramSchurPoly d R ν =
      ∑ κ : (μ.card + ν.card).Partition,
        (lrCoefficient μ ν (TauCeti.diagramOf κ) : R) •
          TauCeti.diagramSchurPoly d R (TauCeti.diagramOf κ) := by sorry

/-- The integral finite Frobenius formula: a power-sum product expands in Schur polynomials
with the integer Specht character values as coefficients, over every commutative ring and
in every finite alphabet (Etingof et al., arXiv:0901.0827v5, Proposition 4.61,
p. 66, followed by integral descent and coefficient change). -/
theorem finiteFrobenius (σ R : Type*) [Fintype σ] [CommRing R]
    {n : ℕ} (ρ : n.Partition) :
    MvPolynomial.psumPart σ R ρ =
      ∑ lam : n.Partition, (TauCeti.spechtCharValue lam ρ : R) •
        TauCeti.schurPoly σ R lam := sorry

/-- The integral inverse Frobenius formula, with class-size weights computed in the natural
numbers before passage to the coefficient ring. It holds in every finite alphabet and over
every commutative ring, by finite Frobenius and integral row orthogonality. -/
theorem finiteFrobeniusInverse (σ R : Type*) [Fintype σ] [CommRing R]
    {n : ℕ} (lam : n.Partition) :
    (n.factorial : R) • TauCeti.schurPoly σ R lam =
      ∑ ρ : n.Partition,
        (((n.factorial / TauCeti.zPart ρ : ℕ) : R) * (TauCeti.spechtCharValue lam ρ : R)) •
          MvPolynomial.psumPart σ R ρ := sorry

/-- The cycle-type formula for the native Schur-coordinate Frobenius characteristic:
each power-sum coefficient is the class-function value divided by its centralizer order
(finite Frobenius formula and character orthogonality). -/
theorem finiteFrobeniusCharacteristic (n d : ℕ) (h : n ≤ d)
    (f : TauCeti.ClassFunction ℂ (Equiv.Perm (Fin n))) :
    (TauCeti.frobeniusCharacteristic n d h f : MvPolynomial (Fin d) ℂ) =
      ∑ ρ : n.Partition,
        (TauCeti.ClassFunction.toConjClasses f (TauCeti.partitionEquivConjClasses n ρ) /
          (TauCeti.zPart ρ : ℂ)) • MvPolynomial.psumPart (Fin d) ℂ ρ := sorry

open scoped Classical in
/-- **The Murnaghan–Nakayama rule** on cycle-type partitions: removing one part `r` from the cycle
type `ρ` of `S_{n+r}` and summing over the rim hooks `κ / μ` of size `r` with the sign
`(−1)^{height}` (Macdonald I.7, Example 5; James, Theorem 21.1). -/
theorem murnaghanNakayama {n r : ℕ} (hr : 0 < r)
    (κ ρ : (n + r).Partition) (ν : n.Partition)
    (hρ : ρ.parts = Multiset.cons r ν.parts) :
    TauCeti.spechtCharValue κ ρ =
      ∑ μ : n.Partition with (TauCeti.diagramOf κ).IsRimHook (TauCeti.diagramOf μ),
        (-1 : ℤ) ^ (TauCeti.diagramOf κ).rimHookHeight (TauCeti.diagramOf μ) *
          TauCeti.spechtCharValue μ ν := by sorry

/-- **The Hall form** on the symmetric homogeneous polynomials of degree `n` in `d` variables: the
bilinear form for which the Schur basis `TauCeti.schurPolyBasis` is orthonormal (Macdonald I.4,
(4.8)). For `d ≥ n` this is the degree-`n` part of the Hall inner product. -/
noncomputable def hallForm (d : ℕ) (R : Type*) [CommRing R] (n : ℕ) :
    LinearMap.BilinForm R (TauCeti.symmetricHomogeneousSubmodule (Fin d) R n) :=
  (TauCeti.schurPolyBasis (Fin d) R n).toDual

/-- **The power-sum normalisation of the Hall form**: for `d ≥ n`, `⟨p_μ, p_ν⟩ = δ_{μν} z_μ`
(Macdonald I.4, (4.7)). The bound `n ≤ d` is needed: in one variable `p_{(2)} = p_{(1,1)}`. -/
theorem hallForm_psumPart (d : ℕ) (R : Type*) [CommRing R] {n : ℕ} (h : n ≤ d) (μ ν : n.Partition)
    (f g : TauCeti.symmetricHomogeneousSubmodule (Fin d) R n)
    (hf : (f : MvPolynomial (Fin d) R) = MvPolynomial.psumPart (Fin d) R μ)
    (hg : (g : MvPolynomial (Fin d) R) = MvPolynomial.psumPart (Fin d) R ν) :
    hallForm d R n f g = if μ = ν then (TauCeti.zPart μ : R) else 0 := by sorry

/-- **The Frobenius characteristic is an isometry** from the class functions of `Sₙ` with the
character pairing `(1/n!) ∑_g f(g) h(g⁻¹)` to the Hall form (Macdonald I.7, (7.3)). -/
theorem hallForm_frobeniusCharacteristic (n d : ℕ) (h : n ≤ d)
    (f g : TauCeti.ClassFunction ℂ (Equiv.Perm (Fin n))) :
    hallForm d ℂ n (TauCeti.frobeniusCharacteristic n d h f) (TauCeti.frobeniusCharacteristic n d h g)
      = TauCeti.ClassFunction.characterPairing f g := by sorry

/-- Newton's integral trace recurrence for the coefficients of `det(1-tA)`, over any
commutative ring and in every positive degree (Macdonald I.2, (2.11′), specialized to matrices). -/
theorem matrixTraceNewton {R : Type*} [CommRing R] {d : ℕ}
    (A : Matrix (Fin d) (Fin d) R) (r : ℕ) (hr : 0 < r) :
    (r : R) * A.charpolyRev.coeff r =
      -(∑ j ∈ Finset.range r,
        A.charpolyRev.coeff (r - (j + 1)) * Matrix.trace (A ^ (j + 1))) := sorry

/-- In degree `r ≤ d`, all partition-indexed power-sum products are a rational basis of the
symmetric homogeneous polynomials in `d` variables (Macdonald I.2, (2.12)). -/
theorem finitePowerSumBasis (d r : ℕ) (h : r ≤ d) :
    LinearIndependent ℚ (fun mu : r.Partition => MvPolynomial.psumPart (Fin d) ℚ mu) ∧
      Submodule.span ℚ (Set.range fun mu : r.Partition => MvPolynomial.psumPart (Fin d) ℚ mu) =
        TauCeti.symmetricHomogeneousSubmodule (Fin d) ℚ r := sorry

/-! ## Layer 8: Schur–Weyl duality -/

/-- **Schur–Weyl duality**: `(ℂᵈ)^{⊗n} ≅ ⊕_{λ ⊢ n, ℓ(λ) ≤ d} S^λ ⊗ 𝕊^λ(ℂᵈ)` as an
`Sₙ × GLₔ`-representation. The equivariance is the theorem: the isomorphism intertwines the native
permutation action with the summand-wise complex Specht actions and the native diagonal
`GLₔ`-action with the summand-wise Schur-functor actions (Fulton–Harris, Theorem 6.3;
Goodman–Wallach, §9.1.1). -/
theorem schurWeylDecomposition (d n : ℕ) :
    ∃ e : (⨂[ℂ] (_ : Fin n), (Fin d → ℂ)) ≃ₗ[ℂ]
        DirectSum {μ : n.Partition // μ.parts.card ≤ d}
          (fun μ => TensorProduct ℂ (TauCeti.spechtModuleℂ μ.1)
            (TauCeti.schurFunctor d (TauCeti.diagramOf μ.1))),
      (∀ σ : Equiv.Perm (Fin n),
        e.toLinearMap ∘ₗ (TauCeti.permTensorAction ℂ d n σ)
          = DirectSum.lmap
              (fun μ : {μ : n.Partition // μ.parts.card ≤ d} =>
                TensorProduct.map ((TauCeti.spechtModuleℂ μ.1).ρ σ)
                  (LinearMap.id : (TauCeti.schurFunctor d (TauCeti.diagramOf μ.1)) →ₗ[ℂ]
                    (TauCeti.schurFunctor d (TauCeti.diagramOf μ.1))))
            ∘ₗ e.toLinearMap) ∧
      ∀ g : GL (Fin d) ℂ,
        e.toLinearMap ∘ₗ (TauCeti.tensorPowerRep ℂ d n g)
          = DirectSum.lmap
              (fun μ : {μ : n.Partition // μ.parts.card ≤ d} =>
                TensorProduct.map
                  (LinearMap.id : (TauCeti.spechtModuleℂ μ.1) →ₗ[ℂ] (TauCeti.spechtModuleℂ μ.1))
                  ((TauCeti.schurFunctor d (TauCeti.diagramOf μ.1)).ρ g))
            ∘ₗ e.toLinearMap := sorry

/-- The balancing relations in the tensor power tensored with a complex Specht module.
The tensor power is a right symmetric-group module via the inverse permutation action;
linearity makes these group-element relations generate all group-algebra relations. -/
noncomputable def balancedSchurRelations (d n : ℕ) (mu : n.Partition) :
    Submodule ℂ ((⨂[ℂ] (_ : Fin n), (Fin d → ℂ)) ⊗[ℂ] (TauCeti.spechtModuleℂ mu)) :=
  Submodule.span ℂ {x | ∃ (v : ⨂[ℂ] (_ : Fin n), (Fin d → ℂ))
    (s : TauCeti.spechtModuleℂ mu) (g : Equiv.Perm (Fin n)),
    x = (TauCeti.permTensorAction ℂ d n g⁻¹ v) ⊗ₜ[ℂ] s -
      v ⊗ₜ[ℂ] ((TauCeti.spechtModuleℂ mu).ρ g s)}

/-- The balanced tensor of the right tensor power with the left Specht module is the Schur
functor, as a general-linear-group representation (Fulton–Harris, §6.1). The surjection and
exact kernel specify the full quotient equivalence, including shapes with more than `d` rows. -/
theorem balancedSchurPresentation (d n : ℕ) (mu : n.Partition) :
    ∃ f : ((⨂[ℂ] (_ : Fin n), (Fin d → ℂ)) ⊗[ℂ] (TauCeti.spechtModuleℂ mu)) →ₗ[ℂ]
        TauCeti.schurFunctor d (TauCeti.diagramOf mu),
      Function.Surjective f ∧ LinearMap.ker f = balancedSchurRelations d n mu ∧
      ∀ (g : GL (Fin d) ℂ) (v : ⨂[ℂ] (_ : Fin n), (Fin d → ℂ))
        (s : TauCeti.spechtModuleℂ mu),
      f ((TauCeti.tensorPowerRep ℂ d n g v) ⊗ₜ[ℂ] s) =
        (TauCeti.schurFunctor d (TauCeti.diagramOf mu)).ρ g (f (v ⊗ₜ[ℂ] s)) := sorry

/-! ## Layer 9: orthogonal Schur–Weyl duality and harmonic tensors -/

/-- The native diagonal action of the bilinear orthogonal group over a commutative ring on
the tensor power of its standard coordinate module; the form is the dot product. -/
noncomputable abbrev orthAction (R : Type*) [CommRing R] (n k : ℕ) :
    Representation R (Matrix.orthogonalGroup (Fin n) R) (⨂[R] (_ : Fin k), (Fin n → R)) :=
  (TauCeti.stdOrthogonalRep R n).tensorPower k

/-- The Brauer generators over a commutative ring: permutations of slots and cup-caps on
distinct slots. Their generated algebra is the image of the orthogonal Brauer action. -/
def brauerGenerators (R : Type*) [CommRing R] (n k : ℕ) :
    Set (Module.End R (⨂[R] (_ : Fin k), (Fin n → R))) :=
  Set.range (TauCeti.permTensorAction R n k) ∪
    {f | ∃ a b : Fin k, a ≠ b ∧ f = TauCeti.orthogonalCupCapAt R n k a b}

/-- The orthogonal tensor FFT: over an infinite field of characteristic different from two,
the commutant of the full orthogonal group is generated by permutations and cup-caps in every
dimension (Doty–Hu, Theorem 1.2(b), with change of form and descent to the dot product). -/
theorem orthogonal_centralizer_eq_adjoin_brauerGenerators
    (K : Type*) [Field K] [Infinite K] [NeZero (2 : K)] (n k : ℕ) :
    Subalgebra.centralizer K
      (Set.range fun g : Matrix.orthogonalGroup (Fin n) K => orthAction K n k g)
      = Algebra.adjoin K (brauerGenerators K n k) := sorry

/-- **The reverse centralizer**: the centralizer of the Brauer image is the algebra generated by the
image of `O_n`, the double-centralizer form of orthogonal Schur–Weyl duality (Goodman–Wallach,
§10.1.1). -/
theorem centralizer_adjoin_brauerGenerators_eq_adjoin_orthAction (n k : ℕ) :
    Subalgebra.centralizer ℂ (Algebra.adjoin ℂ (brauerGenerators ℂ n k) : Set _)
      = Algebra.adjoin ℂ (Set.range fun g : Matrix.orthogonalGroup (Fin n) ℂ => orthAction ℂ n k g) :=
  sorry

/-- **The harmonic (traceless) tensors** `H^k ⊆ V^{⊗k}`: the common kernel of the contractions of two
distinct slots against the dot product. The cup is injective for `n ≥ 1`, so the kernel of the
cup-cap `e_{ab}` is the kernel of the contraction at `(a, b)`; for `n = 0` every positive tensor power is zero, while the empty tensor power is `ℂ`.
For `k ≤ 1` the intersection is empty and `H^k = V^{⊗k}`. -/
noncomputable def harmonicTensors (n k : ℕ) : Submodule ℂ (⨂[ℂ] (_ : Fin k), (Fin n → ℂ)) :=
  ⨅ (a : Fin k) (b : Fin k) (_ : a ≠ b), LinearMap.ker (TauCeti.orthogonalCupCapAt ℂ n k a b)

/-- The harmonic tensors are stable under `O_n`. -/
theorem harmonicTensors_orthAction_mem (n k : ℕ) (g : Matrix.orthogonalGroup (Fin n) ℂ)
    {v : ⨂[ℂ] (_ : Fin k), (Fin n → ℂ)} (hv : v ∈ harmonicTensors n k) :
    orthAction ℂ n k g v ∈ harmonicTensors n k := sorry

/-- The harmonic tensors are stable under the permutation action of `S_k`. -/
theorem harmonicTensors_permTensorAction_mem (n k : ℕ) (σ : Equiv.Perm (Fin k))
    {v : ⨂[ℂ] (_ : Fin k), (Fin n → ℂ)} (hv : v ∈ harmonicTensors n k) :
    TauCeti.permTensorAction ℂ n k σ v ∈ harmonicTensors n k := sorry

/-- **The orthogonal shape space** `E_λ ⊆ V^{⊗|λ|}` of a partition `λ` and a `λ`-tableau `t`: the
image of the Young symmetrizer `c_t` acting through the permutation action, intersected with the
harmonic tensors (Goodman–Wallach, §10.2.1). Another tableau gives an `O_n`-isomorphic space. -/
noncomputable def orthShapeSpace (n : ℕ) {q : ℕ} (lam : q.Partition)
    (t : TauCeti.YoungTableau (TauCeti.diagramOf lam)) :
    Submodule ℂ (⨂[ℂ] (_ : Fin (TauCeti.diagramOf lam).card), (Fin n → ℂ)) :=
  LinearMap.range ((TauCeti.permTensorAction ℂ n (TauCeti.diagramOf lam).card).asAlgebraHom
      (TauCeti.YoungTableau.youngSymmetrizerOver ℂ t)) ⊓
    harmonicTensors n (TauCeti.diagramOf lam).card

/-- **The orthogonal admissibility condition**: the first two columns of `λ` together have at most
`n` cells, `λᵗ₁ + λᵗ₂ ≤ n`. -/
def OrthAdmissible {q : ℕ} (n : ℕ) (lam : q.Partition) : Prop :=
  (TauCeti.diagramOf lam).colLen 0 + (TauCeti.diagramOf lam).colLen 1 ≤ n

/-- The shape space is stable under `O_n`. -/
theorem orthShapeSpace_orthAction_mem (n : ℕ) {q : ℕ} (lam : q.Partition)
    (t : TauCeti.YoungTableau (TauCeti.diagramOf lam)) (g : Matrix.orthogonalGroup (Fin n) ℂ)
    {v : ⨂[ℂ] (_ : Fin (TauCeti.diagramOf lam).card), (Fin n → ℂ)}
    (hv : v ∈ orthShapeSpace n lam t) :
    orthAction ℂ n (TauCeti.diagramOf lam).card g v ∈ orthShapeSpace n lam t := sorry

/-- **Nonvanishing of `E_λ`**: the shape space is nonzero exactly when `λᵗ₁ + λᵗ₂ ≤ n`
(Goodman–Wallach, §§10.2.4–10.2.5, pp. 442, 446; dimension zero is direct). -/
theorem orthShapeSpace_ne_bot_iff (n : ℕ) {q : ℕ} (lam : q.Partition)
    (t : TauCeti.YoungTableau (TauCeti.diagramOf lam)) :
    orthShapeSpace n lam t ≠ ⊥ ↔ OrthAdmissible n lam := sorry

/-- **Irreducibility of `E_λ`** for admissible `λ`: every `O_n`-stable subspace of `E_λ` is `0` or
`E_λ` (Goodman–Wallach, §§10.2.4–10.2.5, pp. 442, 446; dimension zero is direct). -/
theorem orthShapeSpace_irreducible (n : ℕ) {q : ℕ} (lam : q.Partition)
    (t : TauCeti.YoungTableau (TauCeti.diagramOf lam)) (hlam : OrthAdmissible n lam)
    (W : Submodule ℂ (⨂[ℂ] (_ : Fin (TauCeti.diagramOf lam).card), (Fin n → ℂ)))
    (hW : ∀ g : Matrix.orthogonalGroup (Fin n) ℂ, W.map (orthAction ℂ n (TauCeti.diagramOf lam).card g) ≤ W)
    (hWE : W ≤ orthShapeSpace n lam t) :
    W = ⊥ ∨ W = orthShapeSpace n lam t := sorry

/-- **The harmonic decomposition** `H^q ≅ ⊕_{λ ⊢ q admissible} E_λ ⊗ S^λ` as an
`O_n × S_q`-representation, for any choice of a `λ`-tableau for each `λ` (Goodman–Wallach,
§§10.2.4–10.2.5, pp. 442, 446; dimension zero is direct). The `O_n`-action on `E_λ` and on `H^q` is the restriction of `orthAction`
(stable by `orthShapeSpace_orthAction_mem` and `harmonicTensors_orthAction_mem`), the `S_q`-action on
`H^q` the restriction of the permutation action, and on `S^λ` the complex Specht action. -/
theorem harmonicTensors_decomposition (n q : ℕ)
    (t : ∀ lam : q.Partition, TauCeti.YoungTableau (TauCeti.diagramOf lam)) :
    ∃ e : harmonicTensors n q ≃ₗ[ℂ]
        DirectSum {lam : q.Partition // OrthAdmissible n lam}
          (fun lam => TensorProduct ℂ (orthShapeSpace n lam.1 (t lam.1)) (TauCeti.spechtModuleℂ lam.1)),
      (∀ g : Matrix.orthogonalGroup (Fin n) ℂ,
        e.toLinearMap ∘ₗ
            (orthAction ℂ n q g).restrict (fun _ hv => harmonicTensors_orthAction_mem n q g hv)
          = DirectSum.lmap
              (fun lam : {lam : q.Partition // OrthAdmissible n lam} =>
                TensorProduct.map
                  ((orthAction ℂ n (TauCeti.diagramOf lam.1).card g).restrict
                    (fun _ hv => orthShapeSpace_orthAction_mem n lam.1 (t lam.1) g hv))
                  LinearMap.id)
            ∘ₗ e.toLinearMap) ∧
      ∀ σ : Equiv.Perm (Fin q),
        e.toLinearMap ∘ₗ
            (TauCeti.permTensorAction ℂ n q σ).restrict
              (fun _ hv => harmonicTensors_permTensorAction_mem n q σ hv)
          = DirectSum.lmap
              (fun lam : {lam : q.Partition // OrthAdmissible n lam} =>
                TensorProduct.map LinearMap.id ((TauCeti.spechtModuleℂ lam.1).ρ σ))
            ∘ₗ e.toLinearMap := sorry

end TauCetiRoadmap.RepresentationTheory.SchurWeyl
