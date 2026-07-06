import Mathlib

/-!
# Representations of the symmetric group, Specht modules, and Schur-Weyl duality: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`. The
statements here suggest Lean forms for particular milestones, so that contributors and reviewers converge
on names and signatures; discharging all of them finishes neither a layer nor the roadmap. `sorry` is
allowed in this human-owned roadmap library -- these are goals, not proofs.

Mathlib has the combinatorics of `YoungDiagram`, `SemistandardYoungTableau`, and `Nat.Partition`; the
cycle-type/conjugacy map `Equiv.Perm.partition` with `partition_eq_of_isConj`; the symmetric functions
`MvPolynomial.esymm`, `hsymm`, `psum`, `msymm` and their partition-indexed products; the permutation and
induced representations `Representation.ofMulAction` and `Representation.ind`; `FDRep`, `FDRep.character`,
`char_conj`, `char_orthonormal`, `Representation.IsIrreducible`, Maschke, and Schur's lemma; and the
tensor-power/`GL` machinery `PiTensorProduct` (with `reindex`, `map`, `mapMonoidHom`) and
`Matrix.GeneralLinearGroup`. It has **no** partition/diagram/class dictionary, **no** standard tableaux,
**no** dominance order, **no** Young subgroups or permutation modules `M^λ`, **no** Young symmetrizers,
**no** Specht modules or their classification, **no** hook-length formula, **no** Murnaghan-Nakayama rule,
**no** RSK, **no** Schur polynomials, **no** Schur-Weyl duality, and **no** Brauer algebra or any diagram
algebra (see `README.md` for the file-by-file map).

The design follows the layers of `README.md`: the partition/diagram/class dictionary and orders (Layer 0);
Young subgroups and `M^λ` (Layer 1); Young symmetrizers (Layer 2); the Specht modules `S^λ` (Layer 3);
irreducibility and completeness (Layer 4); the standard basis and hook lengths (Layer 5); the characters
and Murnaghan-Nakayama rule (Layer 6); Schur functions, the Frobenius characteristic, and RSK (Layer 7);
Schur-Weyl duality for `GLₔ × Sₙ` (Layer 8); and Schur-Weyl duality for the orthogonal and symplectic groups
via the Brauer algebra (Layer 9). `README.md` remains the definitive document.
-/

namespace TauCetiRoadmap.RepresentationTheory.SchurWeyl

open scoped TensorProduct
open CategoryTheory

/-! ## Layer 0: partitions, diagrams, tableaux, and orders -/

/-- **The partition/diagram dictionary**: a partition of `n` is the same data as a Young diagram of size
`n` (via `YoungDiagram.ofRowLens`/`equivListRowLens`). This connects Mathlib's two unrelated combinatorial
vocabularies. -/
def partitionEquivYoungDiagram (n : ℕ) :
    n.Partition ≃ {μ : YoungDiagram // μ.card = n} := sorry

/-- **Conjugacy classes of `Sₙ` are partitions of `n`** (via `Equiv.Perm.partition` and
`partition_eq_of_isConj`); the common index set of classes, characters, and Specht modules. -/
def partitionEquivConjClasses (n : ℕ) :
    n.Partition ≃ ConjClasses (Equiv.Perm (Fin n)) := sorry

theorem card_conjClasses_perm (n : ℕ) :
    Fintype.card (ConjClasses (Equiv.Perm (Fin n))) = Fintype.card n.Partition := sorry

/-- The Young diagram of a partition, as a convenience for the statements below. -/
noncomputable def diagramOf {n : ℕ} (μ : n.Partition) : YoungDiagram :=
  (partitionEquivYoungDiagram n μ).1

/-- **Dominance order** on partitions: `∀ k, ∑_{i<k} μᵢ ≥ ∑_{i<k} νᵢ` (partial order), the order in which
Specht modules appear in the permutation modules. -/
def Dominates {n : ℕ} (μ ν : n.Partition) : Prop := sorry

/-- Conjugation of diagrams reverses dominance. -/
theorem dominates_transpose_iff {n : ℕ} (μ ν : n.Partition) :
    Dominates μ ν ↔ (diagramOf ν).transpose ≤ (diagramOf μ).transpose := sorry

/-- **Standard Young tableaux** of a diagram: bijective, row- and column-increasing fillings (Mathlib has
only the semistandard `SemistandardYoungTableau`). -/
def StandardYoungTableau (μ : YoungDiagram) : Type := sorry

/-- The number of standard Young tableaux of shape `μ`; this is `f^λ`, the dimension of `S^λ`. -/
def standardCount (μ : YoungDiagram) : ℕ := sorry

/-! ## Layer 1: Young subgroups and the permutation modules `M^λ` -/

/-- **The Young subgroup** `Sλ ≤ Sₙ`, the stabilizer of the ordered partition of `Fin n` into consecutive
blocks of sizes `μ₁, μ₂, …`; isomorphic to `∏ᵢ Perm (Fin μᵢ)`. -/
def youngSubgroup {n : ℕ} (μ : n.Partition) : Subgroup (Equiv.Perm (Fin n)) := sorry

theorem card_youngSubgroup {n : ℕ} (μ : n.Partition) :
    Nat.card (youngSubgroup μ) = (μ.parts.map Nat.factorial).prod := sorry

theorem youngSubgroup_index_mul {n : ℕ} (μ : n.Partition) :
    (youngSubgroup μ).index * (μ.parts.map Nat.factorial).prod = n.factorial := sorry

/-- **The permutation module** `M^λ = ℚ[Sₙ/Sλ]` on the `λ`-tabloids, reusing `Rep.ofMulAction`. Its
dimension is the multinomial coefficient `n! / ∏ᵢ μᵢ!` (`youngSubgroup_index_mul`). -/
noncomputable def permutationModule {n : ℕ} (μ : n.Partition) : Rep ℚ (Equiv.Perm (Fin n)) :=
  Rep.ofMulAction ℚ (Equiv.Perm (Fin n)) (Equiv.Perm (Fin n) ⧸ youngSubgroup μ)

/-- **Kostka numbers**: the multiplicity of `S^λ` in `M^μ`, the number of semistandard tableaux of shape
`μ`-diagram and content `ν`. `kostkaNumber μ μ = 1` and `kostkaNumber μ ν = 0` unless `Dominates μ ν`. -/
def kostkaNumber {n : ℕ} (μ ν : n.Partition) : ℕ := sorry

/-! ## Layer 2: Young symmetrizers -/

/-- A **`λ`-tableau**: a bijective filling of the cells of `μ` by `Fin μ.card`, the datum a Young
symmetrizer is built from. -/
def youngTableau (μ : YoungDiagram) : Type := ↥μ.cells ≃ Fin μ.card

/-- The **row group** of a `λ`-tableau: permutations preserving each row. -/
def rowSubgroup {μ : YoungDiagram} (t : youngTableau μ) :
    Subgroup (Equiv.Perm (Fin μ.card)) := sorry

/-- The **column group** of a `λ`-tableau: permutations preserving each column. -/
def colSubgroup {μ : YoungDiagram} (t : youngTableau μ) :
    Subgroup (Equiv.Perm (Fin μ.card)) := sorry

/-- **The Young symmetrizer** `c_t = a_t · b_t ∈ ℚ[Sₙ]`, where `a_t = ∑_{p ∈ rowSubgroup t} p` and
`b_t = ∑_{q ∈ colSubgroup t} sign(q) • q` (using `Equiv.Perm.sign`). -/
noncomputable def youngSymmetrizer {μ : YoungDiagram} (t : youngTableau μ) :
    MonoidAlgebra ℚ (Equiv.Perm (Fin μ.card)) := sorry

/-- **Essential idempotence**: `c_t² = (n! / f^λ) • c_t`, so `(f^λ / n!) • c_t` is idempotent. -/
theorem youngSymmetrizer_sq {μ : YoungDiagram} (t : youngTableau μ) :
    youngSymmetrizer t * youngSymmetrizer t
      = ((μ.card.factorial : ℚ) / (standardCount μ : ℚ)) • youngSymmetrizer t := sorry

/-! ## Layer 3: the Specht modules `S^λ` -/

/-- **The Specht module** `S^λ`, the subrepresentation of `M^λ` spanned by the polytabloids, equivalently
the left ideal `ℚ[Sₙ] c_t`; packaged as a finite-dimensional representation. -/
noncomputable def spechtModule {n : ℕ} (μ : n.Partition) : FDRep ℚ (Equiv.Perm (Fin n)) := sorry

-- **The submodule theorem (James)** is the engine of irreducibility: for any `Sₙ`-stable submodule
-- `U ≤ M^λ`, either `S^λ ≤ U` or `U ≤ (S^λ)ᗮ` for the tabloid bilinear form. Its precise Lean statement
-- needs the concrete-submodule presentation of `S^λ` inside `permutationModule μ` and the tabloid form
-- `⟨·,·⟩`, both named in `README.md` Layer 3; pinned once those are fixed.

/-! ## Layer 4: completeness and irreducibility (the classification) -/

/-- **Irreducibility** of the Specht modules over `ℚ` (characteristic `0`). -/
theorem spechtModule_simple {n : ℕ} (μ : n.Partition) : Simple (spechtModule μ) := sorry

/-- **Distinctness**: non-isomorphic across distinct partitions. -/
theorem spechtModule_iso_iff {n : ℕ} (μ ν : n.Partition) :
    Nonempty (spechtModule μ ≅ spechtModule ν) ↔ μ = ν := sorry

/-- **Completeness**: every simple representation of `Sₙ` over `ℚ` is a Specht module. With
`partitionEquivConjClasses` and #irreducibles = #classes (from `../CharacterTheory`), `μ ↦ S^λ` is a
bijection onto the irreducibles. -/
theorem exists_spechtModule_iso {n : ℕ} (V : FDRep ℚ (Equiv.Perm (Fin n))) [Simple V] :
    ∃ μ : n.Partition, Nonempty (V ≅ spechtModule μ) := sorry

/-! ## Layer 5: the standard basis and the hook-length formula -/

/-- **The standard basis**: the polytabloids indexed by standard Young tableaux form a basis of `S^λ`,
so `dim S^λ = f^λ`. -/
noncomputable def spechtStandardBasis {n : ℕ} (μ : n.Partition) :
    Module.Basis (StandardYoungTableau (diagramOf μ)) ℚ (spechtModule μ) := sorry

theorem finrank_spechtModule {n : ℕ} (μ : n.Partition) :
    Module.finrank ℚ (spechtModule μ) = standardCount (diagramOf μ) := sorry

/-- **Hook length** of a cell (arm + leg + 1). -/
def hookLength (μ : YoungDiagram) (c : ℕ × ℕ) : ℕ := sorry

/-- **The hook-length formula** `f^λ · ∏_c hook(c) = n!`. -/
theorem hookLengthFormula (μ : YoungDiagram) :
    standardCount μ * ∏ c ∈ μ.cells, hookLength μ c = μ.card.factorial := sorry

/-! ## Layer 6: characters and the Murnaghan-Nakayama rule -/

/-- **The integer-valued Specht character** `χ^λ` (values are integers because the classes of `Sₙ` are
rational). -/
noncomputable def spechtChar {n : ℕ} (μ : n.Partition) : Equiv.Perm (Fin n) → ℤ := sorry

theorem spechtChar_cast {n : ℕ} (μ : n.Partition) (g : Equiv.Perm (Fin n)) :
    ((spechtChar μ g : ℤ) : ℚ) = (spechtModule μ).character g := sorry

/-- The character value on a class, indexed by its cycle-type partition. -/
noncomputable def spechtCharValue {n : ℕ} (μ ν : n.Partition) : ℤ := sorry

theorem spechtChar_eq_value {n : ℕ} (μ : n.Partition) (g : Equiv.Perm (Fin n)) :
    spechtChar μ g = spechtCharValue μ ((partitionEquivConjClasses n).symm (ConjClasses.mk g)) := sorry

/-- **The character table of `Sₙ`** as an integer matrix indexed by partitions. It satisfies the
character-table specification of `../CharacterTheory` (row/column orthogonality with the class sizes). -/
noncomputable def symmetricCharacterTable (n : ℕ) : Matrix n.Partition n.Partition ℤ :=
  Matrix.of fun μ ν => spechtCharValue μ ν

-- **The Murnaghan-Nakayama rule**: `χ^λ` on a class with an `r`-cycle equals the signed sum over rim
-- hooks `ρ` of size `r`, `∑_ρ (-1)^{height ρ} χ^{λ∖ρ}(σ')`, where `σ'` deletes that `r`-cycle. This
-- recursion computes the whole character table from the empty diagram. Its Lean statement needs the
-- rim-hook (border-strip), height, and skew-shape API named in `README.md` Layer 6; pinned once those
-- combinatorial objects are defined.

/-! ## Layer 7: symmetric functions, the Frobenius characteristic, and RSK -/

/-- **Schur polynomials**, defined combinatorially by semistandard tableaux (and, via Jacobi-Trudi, as a
determinant of `MvPolynomial.hsymm`); a `ℤ`-basis of the symmetric functions. -/
noncomputable def schurPoly (σ : Type*) (R : Type*) [Fintype σ] [DecidableEq σ] [CommRing R]
    {n : ℕ} (μ : n.Partition) : MvPolynomial σ R := sorry

theorem schurPoly_isSymmetric (σ : Type*) (R : Type*) [Fintype σ] [DecidableEq σ] [CommRing R]
    {n : ℕ} (μ : n.Partition) : (schurPoly σ R μ).IsSymmetric := sorry

/-- **The Frobenius characteristic / power-sum expansion** `p_μ = ∑_λ χ^λ(μ) s_λ`: the character table
is the change of basis between power sums (`MvPolynomial.psumPart`) and Schur functions. -/
theorem frobenius_powerSum (σ : Type*) [Fintype σ] [DecidableEq σ] {n : ℕ} (ν : n.Partition) :
    MvPolynomial.psumPart σ ℤ ν
      = ∑ μ : n.Partition, spechtCharValue μ ν • schurPoly σ ℤ μ := sorry

/-- **The RSK correspondence**: permutations biject with pairs of standard tableaux of the same shape,
by row insertion. -/
noncomputable def rsk (n : ℕ) :
    Equiv.Perm (Fin n) ≃
      Σ μ : n.Partition,
        StandardYoungTableau (diagramOf μ) × StandardYoungTableau (diagramOf μ) := sorry

/-- **The sum-of-squares corollary** `∑_λ (f^λ)² = n!` (both sides count `|Sₙ|`). -/
theorem sum_sq_standardCount (n : ℕ) :
    ∑ μ : n.Partition, (standardCount (diagramOf μ)) ^ 2 = n.factorial := sorry

/-! ## Layer 8: Schur-Weyl duality -/

/-- **The `Sₙ`-action** on `(ℂᵈ)^{⊗n}` by permuting tensor factors, via `PiTensorProduct.reindex`. -/
noncomputable def permAction (d n : ℕ) :
    Equiv.Perm (Fin n) →*
      ((⨂[ℂ] (_ : Fin n), (Fin d → ℂ)) ≃ₗ[ℂ] (⨂[ℂ] (_ : Fin n), (Fin d → ℂ))) := sorry

/-- **The `GLₔ`-action** on `(ℂᵈ)^{⊗n}` diagonally, via `PiTensorProduct.map`/`mapMonoidHom`. -/
noncomputable def glAction (d n : ℕ) :
    GL (Fin d) ℂ →*
      ((⨂[ℂ] (_ : Fin n), (Fin d → ℂ)) ≃ₗ[ℂ] (⨂[ℂ] (_ : Fin n), (Fin d → ℂ))) := sorry

/-- **The two actions commute** (`reindex` and a diagonal `map` commute). -/
theorem permAction_commute_glAction (d n : ℕ) (σ : Equiv.Perm (Fin n)) (g : GL (Fin d) ℂ) :
    (permAction d n σ).toLinearMap ∘ₗ (glAction d n g).toLinearMap
      = (glAction d n g).toLinearMap ∘ₗ (permAction d n σ).toLinearMap := sorry

/-- **The complex Specht module** `ℂ ⊗ S^λ`, still irreducible (absolute irreducibility over `ℚ`). -/
noncomputable def spechtModuleℂ {n : ℕ} (μ : n.Partition) :
    FDRep ℂ (Equiv.Perm (Fin n)) := sorry

/-- **The Schur functor** `𝕊^λ(ℂᵈ)`, the irreducible polynomial `GLₔ`-representation of highest weight
`λ`, whose character is `schurPoly`. -/
noncomputable def schurFunctor (d : ℕ) {n : ℕ} (μ : n.Partition) :
    FDRep ℂ (GL (Fin d) ℂ) := sorry

/-- **The dimension count** behind Schur-Weyl: `dⁿ = ∑_{ℓ(λ) ≤ d} f^λ · dim 𝕊^λ(ℂᵈ)`. -/
theorem schurWeyl_finrank (d n : ℕ) :
    d ^ n
      = ∑ μ : n.Partition, (if μ.parts.card ≤ d then
          Module.finrank ℚ (spechtModule μ) * Module.finrank ℂ (schurFunctor d μ) else 0) := sorry

/-- **Schur-Weyl duality**: as an `Sₙ × GLₔ`-representation (here stated as a `ℂ`-linear isomorphism; the
equivariance is the content of `README.md` Layer 8),
`(ℂᵈ)^{⊗n} ≅ ⊕_{λ ⊢ n, ℓ(λ) ≤ d} S^λ ⊗ 𝕊^λ(ℂᵈ)`. -/
theorem schurWeylDecomposition (d n : ℕ) :
    Nonempty ((⨂[ℂ] (_ : Fin n), (Fin d → ℂ)) ≃ₗ[ℂ]
      DirectSum {μ : n.Partition // μ.parts.card ≤ d}
        (fun μ => TensorProduct ℂ (spechtModuleℂ μ.1) (schurFunctor d μ.1))) := sorry

/-! ## Layer 9: Schur-Weyl duality for the orthogonal and symplectic groups (the Brauer algebra) -/

/-- **A Brauer diagram** on `k` strands: a perfect matching of the `2k` boundary points `Fin k ⊕ Fin k`
(`k` bottom, `k` top), i.e. a fixed-point-free involution. The `k!` matchings with no horizontal arc are the
permutation diagrams; the rest carry cups and caps. -/
abbrev brauerDiagram (k : ℕ) : Type :=
  {f : Fin k ⊕ Fin k → Fin k ⊕ Fin k // Function.Involutive f ∧ ∀ x, f x ≠ x}

noncomputable instance (k : ℕ) : Fintype (brauerDiagram k) := Fintype.ofFinite _

/-- There are `(2k-1)!!` Brauer diagrams on `k` strands. -/
theorem card_brauerDiagram (k : ℕ) :
    Fintype.card (brauerDiagram k) = Nat.doubleFactorial (2 * k - 1) := sorry

/-- **The Brauer algebra** `B_k(δ)`: the free `ℂ`-module on `brauerDiagram k`, with multiplication by
vertical stacking of diagrams weighted by `δ^{#closed loops}` (the `δ`-power loop rule). A unital associative
`ℂ`-algebra of dimension `(2k-1)!!`. Pinned opaquely with its `Ring`/`Algebra` structure; the loop-rule
multiplication and its associativity are the load-bearing combinatorics (see `README.md`). -/
def brauerAlgebra (δ : ℂ) (k : ℕ) : Type := sorry

noncomputable instance (δ : ℂ) (k : ℕ) : Ring (brauerAlgebra δ k) := sorry
noncomputable instance (δ : ℂ) (k : ℕ) : Algebra ℂ (brauerAlgebra δ k) := sorry

/-- **The diagram basis** of `B_k(δ)`, indexed by Brauer diagrams; hence `finrank = (2k-1)!!`. -/
noncomputable def brauerBasis (δ : ℂ) (k : ℕ) :
    Module.Basis (brauerDiagram k) ℂ (brauerAlgebra δ k) := sorry

/-- **The action of `B_k(n)` on `V^{⊗k}`** for `V = ℂⁿ` orthogonal (nondegenerate symmetric form,
loop value `δ = n = dim V`): through-strands permute tensor factors, bottom arcs contract a pair of slots
against the form (cap) and top arcs expand against its inverse (cup). -/
noncomputable def brauerActionOrth (n k : ℕ) :
    brauerAlgebra (n : ℂ) k →ₐ[ℂ]
      Module.End ℂ (⨂[ℂ] (_ : Fin k), (Fin n → ℂ)) := sorry

/-- **The diagonal action of the orthogonal group** `O(V) = Matrix.orthogonalGroup (Fin n) ℂ` on `V^{⊗k}`,
the restriction of Layer 8's `glAction` along `O(V) ↪ GLₙ`. -/
noncomputable def orthAction (n k : ℕ) :
    ↥(Matrix.orthogonalGroup (Fin n) ℂ) →*
      ((⨂[ℂ] (_ : Fin k), (Fin n → ℂ)) ≃ₗ[ℂ] (⨂[ℂ] (_ : Fin k), (Fin n → ℂ))) := sorry

/-- **The two actions commute** (through-strands permute, arcs contract/expand against an `O(V)`-invariant
form). -/
theorem brauerActionOrth_commute (n k : ℕ) (g : Matrix.orthogonalGroup (Fin n) ℂ)
    (b : brauerAlgebra (n : ℂ) k) :
    Commute (orthAction n k g).toLinearMap (brauerActionOrth n k b) := sorry

/-- **Orthogonal Schur-Weyl duality (double centralizer)**: the image of `ℂ[O(V)]` and the image of `B_k(n)`
in `End(V^{⊗k})` are each other's full centralizers. -/
theorem brauerOrth_doubleCentralizer (n k : ℕ) :
    Subalgebra.centralizer ℂ
        (Set.range fun g : Matrix.orthogonalGroup (Fin n) ℂ => (orthAction n k g).toLinearMap)
      = (brauerActionOrth n k).range
    ∧ Subalgebra.centralizer ℂ ((brauerActionOrth n k).range : Set _)
      = Algebra.adjoin ℂ
          (Set.range fun g : Matrix.orthogonalGroup (Fin n) ℂ => (orthAction n k g).toLinearMap) := sorry

/-- **The harmonic (traceless) tensors** in `V^{⊗k}`: the common kernel of the contraction (trace) maps
`V^{⊗k} → V^{⊗(k-2)}` that cap a pair of slots against the invariant form; these carry the irreducible
`O(V)`-pieces, and the cups rebuild the rest from lower tensor powers. -/
noncomputable def harmonicTensors (n k : ℕ) :
    Submodule ℂ (⨂[ℂ] (_ : Fin k), (Fin n → ℂ)) := sorry

/-- **The symmetric group as the no-arcs subalgebra** `ℂ[Sₖ] ↪ B_k(δ)` (the permutation diagrams,
those with only through-strands). This exhibits Layer 8's `Sₖ` inside the Brauer algebra. -/
noncomputable def permToBrauer (δ : ℂ) (k : ℕ) :
    MonoidAlgebra ℂ (Equiv.Perm (Fin k)) →ₐ[ℂ] brauerAlgebra δ k := sorry

/-- On the no-arcs subalgebra the Brauer action **is** Layer 8's `permAction`, so Layer 9 contains the
`GLₔ × Sₙ` duality of Layer 8. -/
theorem brauerActionOrth_permToBrauer (n k : ℕ) (σ : Equiv.Perm (Fin k)) :
    brauerActionOrth n k (permToBrauer (n : ℂ) k (MonoidAlgebra.single σ (1 : ℂ)))
      = (permAction n k σ).toLinearMap := sorry

/-- **The diagonal action of the symplectic group** `Sp(V) = Matrix.symplecticGroup (Fin l) ℂ` on `V^{⊗k}`,
`V = (Fin l ⊕ Fin l) → ℂ` of dimension `2l`. -/
noncomputable def sympAction (l k : ℕ) :
    ↥(Matrix.symplecticGroup (Fin l) ℂ) →*
      ((⨂[ℂ] (_ : Fin k), ((Fin l ⊕ Fin l) → ℂ)) ≃ₗ[ℂ]
        (⨂[ℂ] (_ : Fin k), ((Fin l ⊕ Fin l) → ℂ))) := sorry

/-- **The action of `B_k(-2l)` on `V^{⊗k}`** for `V` symplectic (nondegenerate alternating form, loop value
`δ = -2l = -dim V`, the sign being the trace of an alternating form). -/
noncomputable def brauerActionSymp (l k : ℕ) :
    brauerAlgebra (-(2 * l : ℂ)) k →ₐ[ℂ]
      Module.End ℂ (⨂[ℂ] (_ : Fin k), ((Fin l ⊕ Fin l) → ℂ)) := sorry

/-- **Symplectic Schur-Weyl duality (double centralizer)**: the image of `ℂ[Sp(V)]` and the image of
`B_k(-2l)` in `End(V^{⊗k})` are each other's full centralizers. -/
theorem brauerSymp_doubleCentralizer (l k : ℕ) :
    Subalgebra.centralizer ℂ
        (Set.range fun g : Matrix.symplecticGroup (Fin l) ℂ => (sympAction l k g).toLinearMap)
      = (brauerActionSymp l k).range
    ∧ Subalgebra.centralizer ℂ ((brauerActionSymp l k).range : Set _)
      = Algebra.adjoin ℂ
          (Set.range fun g : Matrix.symplecticGroup (Fin l) ℂ => (sympAction l k g).toLinearMap) := sorry

/-- **Semisimplicity of `B_k(δ)` for large/generic `δ`**: whenever `|δ| ≥ 2k - 2` (in particular for the
geometric value `δ = n` with `dim V` large relative to `k`), the Brauer algebra is semisimple, with
irreducibles indexed by partitions of `k, k-2, k-4, …`. -/
theorem brauerAlgebra_isSemisimple_of_large (n k : ℕ) (h : 2 * k - 2 ≤ n) :
    IsSemisimpleRing (brauerAlgebra (n : ℂ) k) := sorry

end TauCetiRoadmap.RepresentationTheory.SchurWeyl
