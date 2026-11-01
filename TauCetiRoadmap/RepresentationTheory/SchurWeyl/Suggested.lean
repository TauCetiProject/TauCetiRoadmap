import Mathlib
import TauCeti.RingTheory.MvPolynomial.Symmetric.Schur.Basis
import TauCeti.RingTheory.MvPolynomial.Symmetric.Schur.MurnaghanNakayama
import TauCeti.RepresentationTheory.Symmetric.FrobeniusCharacteristic
import TauCeti.RepresentationTheory.Symmetric.Specht.Complex
import TauCeti.RepresentationTheory.Symmetric.Specht.Character
import TauCeti.RepresentationTheory.Symmetric.ClassSize
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
the Specht self-duality (Layer 4); the Littlewood–Richardson rule with the coefficient defined by
ballot tableaux, the character-side Murnaghan–Nakayama rule, the Hall form on the finite-variable
symmetric polynomials with its power-sum normalisation and the isometry property of the native
Frobenius characteristic (Layer 7); the simultaneous `Sₙ × GLₔ` decomposition of the tensor power
(Layer 8); the orthogonal first fundamental theorem and the reverse centralizer, the harmonic
tensors and the orthogonal shape spaces `E_λ` with their nonvanishing criterion, irreducibility and
the harmonic decomposition (Layer 9).

Not statable at the pins, and therefore not stated: the stable ring `Λ_R` with its Hall form,
`ω`, the free elementary generators and the stable Frobenius characteristic (no inverse-limit
carrier of symmetric functions exists at the pins); the induction compatibility
`ch(Ind(f ⊠ g)) = ch(f) ch(g)` (the external product of class functions on the block subgroup has
no carrier); the RSK bijection as an equivalence and its compatibility with evacuation (no carrier
links `TauCeti.rowInsert` on row lists to `TauCeti.StandardYoungTableau`); the Brauer algebra
`B_k(δ)`, its loop rule, its semisimplicity for `|δ| ≥ 2k − 2`, the nonsemisimplicity of `B₃(−2)`,
its cell modules and the trace filtration (no Brauer-algebra carrier exists; only the diagram
combinatorics and the orthogonal and symplectic generator actions do); the symplectic first
fundamental theorem, the symplectic harmonic classification `ℓ(λ) ≤ l` and the symplectic
multiplicity spaces (only the two-strand `TauCeti.symplecticCupCap` exists, no cup-cap at an
arbitrary pair of slots); the induction and Kronecker transpose comparisons of Layer 4 (no external
tensor product of representations of a product group).
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

/-! ## Layer 9: orthogonal Schur–Weyl duality and harmonic tensors -/

/-- The native diagonal action of the complex orthogonal group `O_n = Matrix.orthogonalGroup (Fin n) ℂ`
(the symmetric bilinear orthogonal group, since Mathlib's star on `ℂ` here is trivial) on the
`k`-th tensor power of `ℂⁿ`. -/
noncomputable abbrev orthAction (n k : ℕ) :
    Representation ℂ (Matrix.orthogonalGroup (Fin n) ℂ) (⨂[ℂ] (_ : Fin k), (Fin n → ℂ)) :=
  (TauCeti.stdOrthogonalRep ℂ n).tensorPower k

/-- The Brauer generators on `V^{⊗k}`: the native permutation action of `S_k` and the cup-cap
operators `e_{ab}` contracting two distinct slots against the dot product and re-expanding them. The
subalgebra they generate is the image of the Brauer algebra `B_k(n)`. -/
def brauerGenerators (n k : ℕ) : Set (Module.End ℂ (⨂[ℂ] (_ : Fin k), (Fin n → ℂ))) :=
  Set.range (TauCeti.permTensorAction ℂ n k) ∪
    {f | ∃ a b : Fin k, a ≠ b ∧ f = TauCeti.orthogonalCupCapAt ℂ n k a b}

/-- **The orthogonal first fundamental theorem on tensors (Brauer)**: the centralizer of `O_n` on
`V^{⊗k}` is the algebra generated by the permutations and the cup-caps, in every dimension `n`
(Goodman–Wallach, §10.1.1 and §5.3.2; Doty–Hu, Theorem 1.2(b)). It holds for the
full disconnected `O_n`: for `SO_2` on `V ⊗ V` the vector `e₁ ⊗ e₂ − e₂ ⊗ e₁` is an extra invariant. -/
theorem orthogonal_centralizer_eq_adjoin_brauerGenerators (n k : ℕ) :
    Subalgebra.centralizer ℂ (Set.range fun g : Matrix.orthogonalGroup (Fin n) ℂ => orthAction n k g)
      = Algebra.adjoin ℂ (brauerGenerators n k) := sorry

/-- **The reverse centralizer**: the centralizer of the Brauer image is the algebra generated by the
image of `O_n`, the double-centralizer form of orthogonal Schur–Weyl duality (Goodman–Wallach,
§10.1.1). -/
theorem centralizer_adjoin_brauerGenerators_eq_adjoin_orthAction (n k : ℕ) :
    Subalgebra.centralizer ℂ (Algebra.adjoin ℂ (brauerGenerators n k) : Set _)
      = Algebra.adjoin ℂ (Set.range fun g : Matrix.orthogonalGroup (Fin n) ℂ => orthAction n k g) :=
  sorry

/-- **The harmonic (traceless) tensors** `H^k ⊆ V^{⊗k}`: the common kernel of the contractions of two
distinct slots against the dot product. The cup is injective for `n ≥ 1`, so the kernel of the
cup-cap `e_{ab}` is the kernel of the contraction at `(a, b)`; for `n = 0` every space is zero.
For `k ≤ 1` the intersection is empty and `H^k = V^{⊗k}`. -/
noncomputable def harmonicTensors (n k : ℕ) : Submodule ℂ (⨂[ℂ] (_ : Fin k), (Fin n → ℂ)) :=
  ⨅ (a : Fin k) (b : Fin k) (_ : a ≠ b), LinearMap.ker (TauCeti.orthogonalCupCapAt ℂ n k a b)

/-- The harmonic tensors are stable under `O_n`. -/
theorem harmonicTensors_orthAction_mem (n k : ℕ) (g : Matrix.orthogonalGroup (Fin n) ℂ)
    {v : ⨂[ℂ] (_ : Fin k), (Fin n → ℂ)} (hv : v ∈ harmonicTensors n k) :
    orthAction n k g v ∈ harmonicTensors n k := sorry

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
    orthAction n (TauCeti.diagramOf lam).card g v ∈ orthShapeSpace n lam t := sorry

/-- **Nonvanishing of `E_λ`**: the shape space is nonzero exactly when `λᵗ₁ + λᵗ₂ ≤ n`
(Goodman–Wallach, §10.2.5). -/
theorem orthShapeSpace_ne_bot_iff (n : ℕ) {q : ℕ} (lam : q.Partition)
    (t : TauCeti.YoungTableau (TauCeti.diagramOf lam)) :
    orthShapeSpace n lam t ≠ ⊥ ↔ OrthAdmissible n lam := sorry

/-- **Irreducibility of `E_λ`** for admissible `λ`: every `O_n`-stable subspace of `E_λ` is `0` or
`E_λ` (Goodman–Wallach, §10.2.5). -/
theorem orthShapeSpace_irreducible (n : ℕ) {q : ℕ} (lam : q.Partition)
    (t : TauCeti.YoungTableau (TauCeti.diagramOf lam)) (hlam : OrthAdmissible n lam)
    (W : Submodule ℂ (⨂[ℂ] (_ : Fin (TauCeti.diagramOf lam).card), (Fin n → ℂ)))
    (hW : ∀ g : Matrix.orthogonalGroup (Fin n) ℂ, W.map (orthAction n (TauCeti.diagramOf lam).card g) ≤ W)
    (hWE : W ≤ orthShapeSpace n lam t) :
    W = ⊥ ∨ W = orthShapeSpace n lam t := sorry

/-- **The harmonic decomposition** `H^q ≅ ⊕_{λ ⊢ q admissible} E_λ ⊗ S^λ` as an
`O_n × S_q`-representation, for any choice of a `λ`-tableau for each `λ` (Goodman–Wallach,
§10.2.4). The `O_n`-action on `E_λ` and on `H^q` is the restriction of `orthAction`
(stable by `orthShapeSpace_orthAction_mem` and `harmonicTensors_orthAction_mem`), the `S_q`-action on
`H^q` the restriction of the permutation action, and on `S^λ` the complex Specht action. -/
theorem harmonicTensors_decomposition (n q : ℕ)
    (t : ∀ lam : q.Partition, TauCeti.YoungTableau (TauCeti.diagramOf lam)) :
    ∃ e : harmonicTensors n q ≃ₗ[ℂ]
        DirectSum {lam : q.Partition // OrthAdmissible n lam}
          (fun lam => TensorProduct ℂ (orthShapeSpace n lam.1 (t lam.1)) (TauCeti.spechtModuleℂ lam.1)),
      (∀ g : Matrix.orthogonalGroup (Fin n) ℂ,
        e.toLinearMap ∘ₗ
            (orthAction n q g).restrict (fun _ hv => harmonicTensors_orthAction_mem n q g hv)
          = DirectSum.lmap
              (fun lam : {lam : q.Partition // OrthAdmissible n lam} =>
                TensorProduct.map
                  ((orthAction n (TauCeti.diagramOf lam.1).card g).restrict
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
