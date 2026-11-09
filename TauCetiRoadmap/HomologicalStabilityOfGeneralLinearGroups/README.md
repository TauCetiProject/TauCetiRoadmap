# Roadmap: homological stability of general linear groups

**Summary.** Over a commutative ring `R`, van der Kallen's subgroups `G_n^(P,Q)` of `GL_n(R)`, the
matrices fixing some standard columns and rows, act on the complexes of unimodular frames of
SchemeKTheoryOperations §6.7 with stabilisers of the same shape, and their spectral sequences, with
`E¹` the homology of stabilisers, carry van der Kallen's induction for twisted and relative
coefficients and for the elementary subgroups; over a semilocal ring with infinite residue fields
the stabilisers of frames have the homology of smaller general linear groups (the
Nesterenko–Suslin property), which gives Suslin's spectral sequence (Layer 1). Its end theorems
(Layer 2): with `e = max(1, sdim)` under Bass's condition `SR_(sdim+2)`, the stabilization
`g ↦ diag(g, 1)` induces a surjection `H_m(E_n(R); ℤ) → H_m(E_(n+1)(R); ℤ)` for `n ≥ 2m + e − 1`
and a bijection for `n ≥ 2m + e`, on Mathlib's hypotheses for a noetherian ring of Krull dimension
at most `d` (`sdim = d`) and for a ring whose quotient by its Jacobson radical is semisimple
(`sdim = 0`); for a semilocal ring with all residue fields infinite,
`H_m(GL_n(R); ℤ) → H_m(GL_(n+1)(R); ℤ)` is bijective for `m ≤ n`; and for `m ≥ 1`,
`π_m(BGL_n(R)⁺) ≅ K_m(R)` for `n ≥ max(3, 2m + e + 1)`. Layer 3 treats twisted coefficients: van
der Kallen's stability for strongly central coefficient systems of finite degree, after Dwyer, with
end theorem the stability of `H_m(GL_n(R); Rⁿ)`, onto for `n ≥ 2m + sdim + 1` and bijective for
`n ≥ 2m + sdim + 3`. The constant-coefficient theorem for `GL_n(R)` itself is
SchemeKTheoryOperations §6.7's.

Suggested home: `TauCeti/RepresentationTheory/Homological/GroupHomology/Stability/`.

## Scope and ownership

**Owned here.** The groups `G_n^(P,Q)` of van der Kallen, their actions on the complexes of frames
and the transitivity of these actions, and the spectral sequence of such an action with any
coefficient module, with its `d¹` differentials (1.1–1.2); the Nesterenko–Suslin property of
semilocal rings with infinite residue fields and Suslin's spectral sequence of `GL_n` acting on the
whole frame complex (1.3); van der Kallen's stability theorem for the elementary subgroups `E_n(R)`
with its specializations (2.1–2.2); stability for semilocal rings with infinite residue fields in
the range `m ≤ n` (2.3); the comparison of the stable range with `BGL_n(R)⁺` and with
`K_m(R)` (2.4); coefficient systems in van der Kallen's sense, their degree, the relative spectral
sequence of a pair of groups with coefficients, and stability with coefficients in a strongly
central coefficient system of finite degree (Layer 3). One other roadmap owns part of this
subject, SchemeKTheoryOperations §6.7 (below). AlgebraicKTheory (Layer 4) owns stable range and
the stability of `K₁`, not of homology; ArithmeticKTheory §3.2 states rank-filtration bounds and
says that they are not homological stability bounds for `GL_m`;
InverseGaloisAndArithmeticFundamentalGroupsPartII owns homological stability for Hurwitz spaces and
MotivicStructuresInModuliOfCurves §3.4 for mapping class groups, for other families of groups.

**Left to SchemeKTheoryOperations.** Section 6.7 of SchemeKTheoryOperations owns, over any ring
satisfying `SR_(s+2)`: the group hyperhomology `H_n(G; C)` of a complex of `G`-modules, with its
spectral sequence `E¹_(p,q) = H_q(G, C_p)`, its vanishing when `C` is exact in low degrees and the
Shapiro identification of `E¹` for permutation modules; the unimodular frames, their complexes
`F_n^δ` (`δ ∈ {0, 1}`) and `F_n^δ(u)`, for columns and for row vectors, with the `GL_n(R)`-actions
and their exactness in degrees `≤ n − 2 − s` and `≤ n − 2 − s − k` (van der Kallen 1980, Theorem
2.6(i)–(ii)); the identification of the homology of a directed union of subgroups with the colimit;
and van der Kallen's theorem for `GL_n(R)` with constant integral coefficients, one step and
compared with `GL(R)`, with its noetherian and semilocal forms. Its proof is the
constant-coefficient case `XL(R) = GL(R)` of the argument of Layers 1–2, and this roadmap
restates none of these. What stays here is what §6.7 does not state: the elementary subgroups
(`XL(R) = E(R)`), coefficient modules and pairs of groups in 1.1–1.2, the semilocal range of 1.3
and 2.3, the plus construction of 2.4, and Layer 3.

**Left to AlgebraicKTheory.** Bass's stable range condition `HasStableRangeLE R s` and its
equivalent forms, with injective stability for `K₁`, `injective_stability` (AlgebraicKTheory 4.1);
Bass's bound for commutative noetherian rings `hasStableRangeLE_of_ringKrullDim_le` and stable
range one for semilocal rings `hasStableRangeLE_one_of_isSemisimpleRing` (AlgebraicKTheory 4.2).
This roadmap states its theorems on `SR_(sdim+2)`, which is `HasStableRangeLE R (sdim + 1)`.

**Left to Tau Ceti.** The stabilization `TauCeti.stabilizeGL`, the elementary subgroup
`TauCeti.elementarySubgroup` and its perfectness `TauCeti.commutator_elementarySubgroup_self`, the
block-diagonal homomorphism `TauCeti.fromBlocksGL`, and the stable group
`TauCeti.StableGeneralLinearGroup` (supplier contracts below).

**Left to StableHomotopyKTheory and GeneralAlgebraicKTheory.** Classifying spaces and the comparison
of their homology with group homology (StableHomotopyKTheory 1.30 and 1.32), homotopy groups of
filtered colimits (1.14), the relative Hurewicz theorem (3.16), the plus construction with respect
to a perfect normal subgroup, its homology and its universal property (StableHomotopyKTheory 3.12,
3.25–3.27), the universal cover `BP⁺` of `BG⁺` (3.31), the H-space `BGL(R)⁺` (StableHomotopyKTheory
4.14), Quillen's `K_m(R)`
(GeneralAlgebraicKTheory 3.2) and the identification `π_m(BGL(R)⁺) ≅ K_m(R)` for `m ≥ 1`
(GeneralAlgebraicKTheory 3.14).

**Relation to K3BlochGroups.** Over an infinite field `F`, Suslin's spectral sequence of 1.3 and the
range of 2.3 are the spectral sequence and the stability range of K3BlochGroups 4.8
(`generalLinear_homology_stable`), and the Nesterenko–Suslin property of 1.3 for `F` is a case of
K3BlochGroups 4.3. K3BlochGroups also owns the Milnor K-theory quotient
`H_n(GL_n(F))/H_n(GL_(n−1)(F))` (4.5–4.8) and the stability of the symmetric groups,
`symmetricGroup_homology_stable` (4.0 and 4.15). This roadmap uses none of them; Layer 2 records the
field and symmetric-group theorems among its Examples.

**Supplied by Mathlib and consumed by name.** Matrices and `Matrix.GeneralLinearGroup` with its
action on rectangular matrices, block matrices, stabilisers of an action, subgroups and their
images, integral representations, restriction along a group homomorphism, group homology with its
functoriality and Shapiro's lemma, Krull dimension, noetherian, semisimple, semilocal and local
rings, maximal and prime spectra.

**Out of scope.** Noncommutative rings (van der Kallen's theorems hold for associative rings
satisfying `SR_(sdim+2)`, with `Rⁿ` the right module of columns; every ring here is commutative);
the homotopical form of the connectivity of the posets of unimodular sequences, which the stability
arguments do not use; the Milnor K-theory quotient `H_n(GL_n(A), GL_(n−1)(A); ℤ) ≅ K_n^M(A)` for
local rings `A` that are not fields, since no roadmap defines Milnor K-theory of a ring that is not
a field (for fields it is K3BlochGroups 4.5–4.8 on K2SymbolsBrauer's `MilnorK`); the finer
descriptions of the relative groups beyond the ranges here, such as those of Galatius, Kupers and
Randal-Williams; and the general frameworks of Hatcher–Wahl and Randal-Williams–Wahl for families of
groups with a homogeneous category, which cover automorphism groups beyond `GL_n` and are not needed
for the theorems here.

## Conventions

1. **Columns and frames.** `Rⁿ` is the module of column vectors, the `n × 1` matrices, and
   `GL_n(R)` acts on `n × k` matrices by left multiplication (Mathlib's action of
   `Matrix.GeneralLinearGroup`). A unimodular `k`-frame is an `n × k` matrix `A` with a left
   inverse `B A = 1`: its columns form a basis of a free direct summand of `Rⁿ`, which is van der
   Kallen's unimodular sequence (van der Kallen 1980, 2.4) and SchemeKTheoryOperations §6.7's
   frame. Witness: over `ℤ`, the columns `(1, 0)` and `(1, 1)` form a frame (left inverse
   `[[1, −1], [0, 1]]`), the columns `(1, 0)` and `(0, 2)` are linearly independent and form no
   frame (`det = 2` is not a unit).
2. **Stabilization.** The stabilization is Tau Ceti's `TauCeti.stabilizeGL R (Nat.le_succ n)`,
   `g ↦ diag(g, 1)`: `g` is the upper left block and the new coordinate is the last one; on column
   vectors the matching inclusion `Rⁿ → Rⁿ⁺¹` puts `0` in the last coordinate, and
   `diag(g, 1)(v; 0) = (g v; 0)`. Witness: over `ℚ`, `(2) ↦ diag(2, 1)`, with inverse
   `diag(1/2, 1)`, determinant `2`; for `n = 0` the empty matrix goes to `(1)`.
3. **Stable range.** Bass's condition `SR_N` (Bass 1964) says that every unimodular row of
   length `N` can be shortened; it is AlgebraicKTheory's `HasStableRangeLE R (N − 1)`. Following
   van der Kallen (1980, 2.2), `sdim ≥ 0` is an integer with `SR_(sdim+2)(R)` and
   `e = max(1, sdim)`. Witnesses (AlgebraicKTheory 4.1–4.2): a field has `SR₂` (`sdim = 0`,
   `e = 1`); `ℤ` fails `SR₂` (the row `(2, 5)`) and has `SR₃` (`sdim = 1`, `e = 1`); `ℤ[x]`, of
   Krull dimension `2`, has `SR₄` (`sdim = 2`, `e = 2`).
4. **Degrees and acyclicity.** The frames of length `j + 1` span the chains of degree `j`, the
   augmentation is in degree `−1`, and the boundary is the alternating sum of the faces, the face
   `i` deleting column `i` with sign `(−1)ⁱ`. A complex is `k`-acyclic when its reduced homology
   vanishes in every degree `j ≤ k`; `(−1)`-acyclic means nonempty (van der Kallen 1980, 2.9).
   Witness: over `𝔽₂` with `n = 2` the augmented chain groups have ranks `1, 3, 6` and the
   reduced homology is `0, 0, ℤ⁴` in degrees `−1, 0, 1`: the complex is `0`-acyclic, as
   SchemeKTheoryOperations §6.7 states for `n − 2 − s = 0`, and not `1`-acyclic.
5. **Homology.** Group homology is Mathlib's `groupHomology`, with integral trivial coefficients
   unless a representation is displayed. Relative groups `H_m(G', G; M', M)` along
   `(f, φ) : (G, M) → (G', M')` are the homology of the mapping cone of the induced map of
   inhomogeneous chains, with the long exact sequence
   `H_m(G; M) → H_m(G'; M') → H_m(G', G; M', M) → H_(m−1)(G; M)` (van der Kallen 1980, 3.8 and
   3.10). Witness: for `G = G'` and `φ = id` all relative groups vanish.
6. **Universes.** Rings live in `Type`, the universe of the coefficient ring `ℤ`, so that
   Mathlib's `groupHomology` applies to `GL_n(R)` and its subgroups with integral coefficients
   without transport. Witness: `ℤ`, `ℚ` and `ZMod 4` are in `Type`.
7. **Semilocal rings.** A semilocal ring is a commutative ring with finitely many maximal ideals,
   `Finite (MaximalSpectrum R)`; for commutative rings this is the condition that
   `R ⧸ Ring.jacobson R` is semisimple. "All residue fields infinite" is
   `∀ 𝔪 : MaximalSpectrum R, Infinite (R ⧸ 𝔪.asIdeal)`, and "connected" is
   `ConnectedSpace (PrimeSpectrum R)`. Witness: `ℤ_(2)` is local with residue field `𝔽₂`, not
   infinite; `ℚ⟦t⟧` is local with residue field `ℚ`, infinite; the zero ring has no maximal ideal,
   so it is semilocal with all residue fields infinite, and it is not connected, its spectrum
   being empty.

## Exact supplier contracts

**From Mathlib** (at the pins).

- Matrices: `Matrix`, `Matrix.GeneralLinearGroup` with its `DistribMulAction` on
  `Matrix n m R`, `Matrix.fromRows`, `Matrix.fromBlocks_mul_fromRows`, `MonoidHom.inl`,
  `MonoidHom.codRestrict`, `MulAction.stabilizer`, `MulAction.mem_stabilizer_iff`,
  `Subgroup.inclusion`, `MonoidHom.subgroupMap`, `Fin.lastCases`.
- Group homology: `Rep`, `Rep.trivial`, `Rep.res`, `Rep.ofDistribMulAction`, `groupHomology`,
  `groupHomology.map`, `groupHomology.chainsMap`, `groupHomology.indIso` (Shapiro's lemma).
- Rings: `IsNoetherianRing`, `ringKrullDim`, `IsSemisimpleRing`, `Ring.jacobson`,
  `MaximalSpectrum`, `PrimeSpectrum`, `ConnectedSpace`, `Ideal.Quotient`.

**From Tau Ceti** (at the pins), in
`TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Elementary.lean` and `…/Stable.lean`.

- `TauCeti.stabilizeGL` (`g ↦ diag(g, 1)`, Convention 2) and `TauCeti.coe_stabilizeGL_apply`.
- `TauCeti.elementarySubgroup n R`, the subgroup `E_n(R)` generated by the elementary matrices;
  `TauCeti.map_stabilizeGL_elementarySubgroup_le`, which says that the stabilization sends `E_n(R)`
  into `E_(n+1)(R)`; `TauCeti.commutator_elementarySubgroup_self`, which says that `E_n(R)` is
  perfect for `n ≥ 3`.
- `TauCeti.fromBlocksGL` and `TauCeti.coe_fromBlocksGL`, the block-diagonal homomorphism
  `(g, h) ↦ diag(g, h)`.
- `TauCeti.StableGeneralLinearGroup` and `TauCeti.StableGeneralLinearGroup.of`, the stable group
  `GL(R)` and its canonical maps.

**From SchemeKTheoryOperations.** Section 6.7: the group hyperhomology `H_n(G; C)` with its first
spectral sequence `E¹_(p,q) = H_q(G, C_p)`, its vanishing for complexes exact in low degrees and the
Shapiro identification of `E¹_(p,q)` with `H_q(Stab_G(x), ℤ)` for a transitive permutation module;
the unimodular frames, the complexes `F_n^δ` and `F_n^δ(u)` for columns and for row vectors, their
`GL_n(R)`-actions and their exactness ranges under `SR_(s+2)`; van der Kallen's theorem for
`GL_n(R)` with constant coefficients and its comparison with `GL(R)`.

**From AlgebraicKTheory.** 4.1 (`HasStableRangeLE`, its monotonicity and `injective_stability`),
4.2 (`hasStableRangeLE_of_ringKrullDim_le`, `hasStableRangeLE_one_of_isSemisimpleRing`).

**From StableHomotopyKTheory.** 1.14 (homotopy groups commute with filtered colimits), 1.30 and
1.32 (`H_*(BG) ≅ H_*(G)`), 3.12 (the plus construction is an integral homology isomorphism), 3.16
(the relative Hurewicz theorem with trivial `π₁`-action), 3.25–3.27 (the plus construction with
respect to a perfect normal subgroup, its universal property and functoriality), 3.31 (`BP⁺` is the
universal cover of `BG⁺`), 4.14 (`BGL(R)⁺` and its H-space structure).

**From GeneralAlgebraicKTheory.** 3.2 (Quillen's `K_m(R)`) and 3.14 (`π_m(BGL(R)⁺) ≅ K_m(R)` for
`m ≥ 1`).

## How to read the build

Layer 1 lets the groups `G_n^(P,Q)` act on SchemeKTheoryOperations §6.7's complexes of frames,
builds the spectral sequence of each action from §6.7's hyperhomology and Shapiro's lemma, with its
`d¹` differentials, and, over a semilocal ring with infinite residue fields, identifies the homology
of the stabilisers of frames with that of smaller general linear groups, which gives Suslin's
spectral sequence. Layer 2 proves van der Kallen's theorem for the elementary subgroups by his
induction on the degree (the case of `GL_n(R)` being §6.7's), states it on Mathlib's hypotheses,
proves the range `m ≤ n` for semilocal rings with infinite residue fields by Suslin's spectral
sequence, and passes to K-theory through the plus construction. Layer 3 repeats the
argument of Layer 2 with coefficient systems and the relative spectral sequence of a pair of
groups.

## Layer 1: van der Kallen's groups and their spectral sequences

### 1.1 Frames as `G_n^(P,Q)`-sets

For finite sets `P, Q` with `P ∪ Q = [1, t]`, let `G_n^(P,Q)` be the subgroup of `GL_n(R)` of
matrices fixing the columns `e_j`, `j ∈ P`, and the rows `e_i*`, `i ∈ Q` (van der Kallen 1980, 3.2,
p. 278); `G_n^(∅,∅) = GL_n(R)`, and `G_n^(P,Q)` is isomorphic to `GL_(n−t)(R)` when
`P = Q = [1, t]`, the square case. Prove, under `SR_(sdim+2)`, van der Kallen's Examples 3.5
(pp. 279–280): each `G_n^(P,Q)` acts on a complex of frames of one of four kinds (frames in a free
summand, in an affine subspace, of row vectors, of mixed type), that complex is `d`-acyclic with
`d = n − t − 2 − sdim` (SchemeKTheoryOperations §6.7, after van der Kallen 1980, Theorem
2.6(i)–(ii), p. 274; Remark 2.7.1 there notes that parts (iii)–(iv) serve only the proof), the
action is transitive on frames of each length `k + 1 ≤ d + ε + 1`, with `ε = 0` when `P = Q` and
`ε = 1` otherwise (van der Kallen 1980, 3.4 and Examples 3.5, pp. 279–280), and the stabiliser of
the standard frame of length `k + 1` is a group `G_n^(P',Q')` with `|P' ∪ Q'| = t + k + 1 − ε`:
it is `G_n^(P(k),Q)` with `P(k) = P ∪ [t + 1, t + k + 1]` when `P = Q`, and `G_n^(P(k),Q)` or
`G_n^(P,Q(k))` with `P(k) = P ∪ [t, t + k]`, `Q(k) = Q ∪ [t, t + k]` otherwise (van der Kallen
1980, Examples 3.5.1–3.5.4).
*Needs:* SchemeKTheoryOperations §6.7 (frames, `F_n^δ`, `F_n^δ(u)`, row vectors, exactness);
AlgebraicKTheory 4.1; Mathlib `Matrix.GeneralLinearGroup`.

API:

- `G_n^(P,Q)` as a subgroup of `GL_n(R)`, with `G_n^(∅,∅) = GL_n(R)`, the upper inclusion
  `G_n^(P,Q) → G_(n+1)^(P,Q)` along the stabilization, and the largest square subgroup
  `Sq(G_n^(P,Q)) = G_n^(T,T)`, `T = P ∪ Q` (van der Kallen 1980, 3.2).
- The action of `G_n^(P,Q)` on its complex of frames, the standard frames `σ_k`, and the
  identification of `Stab(σ_k)` with `G_n^(P(k),Q)` or `G_n^(P,Q(k))`.

**Checks.**

- For `t = 0` and `k = 0`, transitivity on unimodular vectors of `Rⁿ` is the completion of a
  unimodular vector to a basis; it is claimed for `0 ≤ d = n − 2 − sdim`. Over a field it is
  claimed from `n = 2` on and holds for every `n ≥ 1`; the stabiliser of `e₁` is the affine group
  `{(1 *; 0 *)}`, which for `n = 2` over `𝔽₂` has order `2`.
- For the square group `GL₂(ℤ)` (`sdim = 1`, `t = 0`), `d = −1` and `ε = 0`, so nothing is
  claimed; transitivity on unimodular vectors holds there all the same, `ℤ` being a principal
  ideal domain, with stabiliser of `e₁` the group `{(1 b; 0 ±1)}`.
- The bound `d + ε + 1` cannot be raised to `d + 2` for square groups. For
  `R = ℝ[x, y, z]/(x² + y² + z² − 1)`, noetherian of dimension `2` (`sdim = 2`), and `n = 3`,
  `t = 0`, `d = −1`, nothing is claimed, while the length `d + 2 = 1` would claim transitivity on
  unimodular vectors: `(x, y, z)` is unimodular and completes to no basis, its complement being
  the stably free, non-free module of tangent fields.
- The stabiliser of `(e₁, …, e_n)` in `GL_n(R)` is trivial: `G_n^([1,n],∅) = 1`, which ends the
  induction.
- The count `t + k + 1 − ε` loses one in the non-square case. For `P = ∅`, `Q = {1}`, `n = 2`
  (Example 3.5.2 with `t = 1`), `G = {(1 0; a u)}` acts on the affine line `e₁ + Re₂`, `σ₀ = (e₁)`,
  and `Stab(σ₀) = {(1 0; 0 u)} = G₂^({1},{1}) ≅ GL₁(R)`, with `|P' ∪ Q'| = 1 = t + k + 1 − ε`,
  not `t + k + 1 = 2`: the stabiliser fixes the column `e₁` and the row `e₁*` and nothing more,
  and over `𝔽₃` it has order `2`, while `G₂^([1,2],[1,2])` and `G₂^([1,2],{1})` are trivial.

### 1.2 The spectral sequence

For `G = G_n^(P,Q)` acting on its `d`-acyclic complex of frames `C` (1.1) and a `G`-module `M`,
construct the first-quadrant spectral sequence `E(P, Q; n)` with `E¹_(0,s) = H_s(G, M)`,
`E¹_(r,s) = H_s(Stab_G(σ_(r−1)), M)` for `1 ≤ r ≤ d + ε + 1`, where `σ_(r−1)` is the standard frame
of length `r`, converging to zero (the columns `r > d + ε + 1` are not described); the differential
`E¹_(1,s) → E¹_(0,s)` is induced by the inclusion `Stab_G(σ₀) → G` (van der Kallen 1980,
Proposition 3.7, p. 280). For `1 ≤ r ≤ d + ε` the differential `E¹_(r+1,s) → E¹_(r,s)` is
`Σ_(i=1)^(r+1) (−1)^(i+1) H_s(Int(m_ir), l(m_ir))`, where `m_ir ∈ G` carries `σ_(r−1)` to the `i`-th
face of `σ_r`, `Int(m_ir)` is conjugation by `m_ir` and `l(m_ir)` is `x ↦ m_ir x` on `M` (van der
Kallen 1980, 4.2, pp. 284–285). For trivial coefficients `A` and `r, s` with `1 ≤ r ≤ d + ε` such
that `H_s(Sq(Stab_G σ_r), A) → H_s(Stab_G σ_r, A)` is onto, this differential is zero for `r` odd
and the map induced by `Stab_G(σ_r) → Stab_G(σ_(r−1))` for `r` even (van der Kallen 1980, Lemma
4.5, pp. 285–286). Route: SchemeKTheoryOperations §6.7's hyperhomology spectral sequence for the
augmented complex `C` truncated above degree `d + ε`, which vanishes in the acyclic range; the
chains of degree `r − 1` are a permutation module with one orbit (1.1), so Shapiro's lemma
`groupHomology.indIso` identifies `H_s(G, C_(r−1) ⊗ M)` with `H_s(Stab_G(σ_(r−1)), M)`; for the
parity rule, the `m_ir` can be chosen to centralise `Sq(Stab_G(σ_r))` (van der Kallen 1980, 4.4,
p. 285), so on the image of `H_s(Sq(Stab_G σ_r), A)` the `r + 1` terms are equal and their
alternating sum is the inclusion map or zero by the parity of `r`.
*Needs:* 1.1; SchemeKTheoryOperations §6.7 (hyperhomology, Shapiro identification); Mathlib
`groupHomology`, `groupHomology.map`, `groupHomology.indIso`.

**Checks.**

- `E¹_(1,0) → E¹_(0,0)` is `ℤ → ℤ`, the identity of `H₀`, since `G` is transitive on frames of
  length one: the abutment vanishes in degree `0`.
- For `GL₂(𝔽₂)`, a square group with `d = 0` and `ε = 0`, the described columns are `r = 0, 1`:
  `E¹_(0,1) = H₁(GL₂(𝔽₂)) = ℤ/2` and `E¹_(1,1) = H₁(Stab(e₁)) = ℤ/2`, the stabiliser being
  generated by the transvection `(1 1; 0 1)`, an odd permutation of the three nonzero vectors, so
  the differential `E¹_(1,1) → E¹_(0,1)` is onto.
- The parity rule needs its surjectivity hypothesis. For `GL₃(𝔽₂)` (`t = 0`, `d = 1`, `ε = 0`)
  and `r = s = 1`, `Stab(σ₁) = {1 + aE₁₃ + bE₂₃} ≅ (ℤ/2)²` and `H₁(Stab(e₁)) = ℤ/2` through the
  sign of the lower `GL₂(𝔽₂)` block; the two face terms send `(a, b)` to `b` and to `a`, so the
  differential `E¹_(2,1) → E¹_(1,1)` is `(a, b) ↦ a + b ≠ 0`, although `r = 1` is odd. Here
  `Sq(Stab σ₁) = GL₁(𝔽₂) = 1` and `H₁(1) = 0 → (ℤ/2)²` is not onto, so the rule asserts nothing.
- Acyclicity is what makes the abutment vanish: for `n = 1` over `𝔽₃` (`d = −1`) the two frames
  of length one span chains whose reduced `H₀` is `ℤ`, and `GL₁(𝔽₃)` acting on them gives no
  vanishing in degree `0`.

### 1.3 Semilocal rings with infinite residue fields

Let `A` be a semilocal ring with all residue fields infinite (Convention 7), and let the affine
group `affineGroup A n m` be the stabiliser in `GL_(n+m)(A)`, acting on `Aⁿ ⊕ Aᵐ`, of the vectors
`(0; e_j)`, `j ≤ m`: the block matrices `(g 0; u 1)` with `g ∈ GL_n(A)`. Define
`affineInclusion A n m : GL_n(A) → affineGroup A n m`, `g ↦ diag(g, 1)`. Prove
`homology_affineInclusion_bijective`, the Nesterenko–Suslin property: `affineInclusion A n m`
induces a bijection on `H_k(−; ℤ)` for all `k, n, m ≥ 0` (Galatius–Kupers–Randal-Williams 2025,
Definition 5.12, Proposition 5.15 and Example 5.16, after Nesterenko–Suslin 1989, Proposition 1.10;
for infinite fields, K3BlochGroups 4.3). Prove that `GL_n(A)` acts transitively on the unimodular
frames of `Aⁿ` of each length `r ≤ n`, with stabiliser of `(e₁, …, e_r)` isomorphic to
`affineGroup A (n − r) r`, and construct Suslin's spectral sequence: the hyperhomology spectral
sequence of `GL_n(A)` acting on the whole augmented frame complex of `Aⁿ`, with
`E¹_(r,s) ≅ H_s(GL_(n−r)(A))` for `0 ≤ r ≤ n`, abutting to `H_(r+s−n)(GL_n(A); U_n)`, where `U_n`
is the top homology of the frame complex, and with `d¹ : E¹_(r+1,s) → E¹_(r,s)` the map induced by
the stabilization `GL_(n−r−1)(A) → GL_(n−r)(A)` for `r` even and zero for `r` odd. Route: a frame
completes to a basis since its complement is projective of constant rank over a semilocal ring;
the frame complex is `(n − 2)`-acyclic by SchemeKTheoryOperations §6.7 with `s = 0`
(AlgebraicKTheory 4.2), so its hyperhomology is that of `U_n` shifted by `n − 1`; Shapiro's lemma
and the Nesterenko–Suslin property identify `E¹`; the property also makes every
`H_s(Sq(Stab σ_r)) → H_s(Stab σ_r)` onto, and the computation of 1.2 (van der Kallen 1980, 4.2–4.5)
gives the differentials. For infinite fields this is the spectral sequence of K3BlochGroups 4.8.
*Needs:* 1.2; SchemeKTheoryOperations §6.7 (hyperhomology, frames); AlgebraicKTheory 4.2; Tau Ceti
`TauCeti.fromBlocksGL`; Mathlib `MulAction.stabilizer`, `Matrix.fromRows`, `MonoidHom.codRestrict`,
`MaximalSpectrum`, `groupHomology.map`.

API:

- `affineGroup A n m`, a subgroup of `GL_(n+m)(A)` indexed by `Fin n ⊕ Fin m`, and
  `affineInclusion A n m`, through `TauCeti.fromBlocksGL`.
- The projection `affineGroup A n m → GL_n(A)`, `(g 0; u 1) ↦ g`, a retraction of
  `affineInclusion A n m`, with kernel the additive group of `m × n` matrices.
- The identification of the stabiliser of `(e₁, …, e_r)` in `GL_n(A)` with
  `affineGroup A (n − r) r`.

**Checks.**

- The property needs infinite residue fields, and in degrees above one: for `A = 𝔽₃` and
  `n = m = 1`, `affineGroup` is `𝔽₃ ⋊ 𝔽₃ˣ ≅ 𝔖₃`, and `H₁(𝔖₃) = ℤ/2 = H₁(GL₁(𝔽₃))`, but
  `H₃(𝔖₃; ℤ) = ℤ/6` while `H₃(GL₁(𝔽₃); ℤ) = H₃(ℤ/2; ℤ) = ℤ/2`.
- Over `ℚ` with `n = m = 1`, `H₁(ℚ ⋊ ℚˣ) = ℚˣ ⊕ ℚ_(ℚˣ)`, and the coinvariants `ℚ/(2 − 1)ℚ` vanish,
  so `H₁` is `ℚˣ = H₁(GL₁(ℚ))`, as claimed.
- The group is lower block triangular: over `ℚ`, `(1 0; 1 1)` fixes `(0; 1)` and lies in
  `affineGroup ℚ 1 1`, while `(1 1; 0 1)` sends `(0; 1)` to `(1; 1)`; the upper triangular choice
  would fix `Aⁿ` instead of `Aᵐ`. For `m = 0` the group is all of `GL_n(A)`, and for `n = 0` it is
  trivial, as is `GL₀(A)`.
- In Suslin's spectral sequence, `s = 0` gives the row `ℤ ← ℤ ← ℤ ← ⋯` with differentials
  `Σ_(i=1)^(r+1) (−1)^(i+1)`, that is `1` for `r` even and `0` for `r` odd; for `n = 3` over `ℚ`
  and `s = 1`, `E¹_(2,1) = H₁(GL₁(ℚ)) → E¹_(1,1) = H₁(GL₂(ℚ))` is zero, the two face terms being
  the same isomorphism `ℚˣ → ℚˣ` through the determinant.

### Examples

- For a field the groups `G_n^(P,Q)` with `P = Q` are the `GL_(n−t)(F)` and the others are affine
  groups; the spectral sequences of 1.2 are those of van der Kallen's proof, and those of 1.3 for
  infinite `F` are Suslin's (Suslin 1984).
- For `ℤ` (`sdim = 1`) and `n = 3`, `t = 0`: `d = 0`, so 1.1 gives transitivity on unimodular
  vectors only, and the spectral sequence of 1.2 has the columns `r = 0, 1`.

### Dependencies

SchemeKTheoryOperations §6.7 (hyperhomology, frames and their exactness); AlgebraicKTheory 4.1–4.2;
Tau Ceti `TauCeti.fromBlocksGL`; Mathlib. Within the layer, 1.2 uses 1.1 and 1.3 uses 1.2.

## Layer 2: stability with constant coefficients

### 2.1 Van der Kallen's theorem for the elementary subgroups

Prove: if `R` satisfies `SR_(sdim+2)` and `e = max(1, sdim)`, the stabilization induces maps
`H_m(E_n(R); ℤ) → H_m(E_(n+1)(R); ℤ)` that are onto for `n ≥ 2m + e − 1` and bijective for
`n ≥ 2m + e`, for every `m ≥ 0` (van der Kallen 1980, Theorem 4.11, p. 289); the same statement for
`GL_n(R)` is SchemeKTheoryOperations §6.7's. Route: van der Kallen's Theorem 4.8 (p. 287) for the
groups `G_n^(P,Q) ∩ E(R)`, by induction on `m` through the spectral sequences of 1.2 with trivial
coefficients (pp. 287–288), in the case `XL(R) = E(R)`, with injective stability for `K₁`
(AlgebraicKTheory 4.1) to identify `G_n^(∅,∅) ∩ E(R)` with `E_n(R)` for `n ≥ sdim + 2`; for
`m = 1`, `H₁(E_n(R)) = 0` for `n ≥ 3` (`TauCeti.commutator_elementarySubgroup_self`).
*Needs:* 1.1, 1.2; AlgebraicKTheory 4.1 (`HasStableRangeLE`, `injective_stability`); Tau Ceti
`TauCeti.elementarySubgroup`, `TauCeti.stabilizeGL`,
`TauCeti.map_stabilizeGL_elementarySubgroup_le`, `TauCeti.commutator_elementarySubgroup_self`.

**Checks.**

- `m = 0`: both sides are `ℤ` and the map is the identity, for every `n ≥ 0`.
- `m = 1` over `𝔽₂` (`e = 1`): `E_n(𝔽₂) = GL_n(𝔽₂)`, `H₁(E₁(𝔽₂)) = 0`,
  `H₁(E₂(𝔽₂)) = H₁(𝔖₃) = ℤ/2` and `H₁(E₃(𝔽₂)) = 0`, `GL₃(𝔽₂)` being simple of order `168`. The
  map for `n = 1` is not onto and for `n = 2` is onto and not injective, so both bounds `n ≥ 2m`
  and `n ≥ 2m + 1` are attained.
- `m = 1` over `ℤ` (`sdim = 1`, `e = 1`): `E₂(ℤ) = SL₂(ℤ)` has abelianization `ℤ/12` and
  `E_n(ℤ) = SL_n(ℤ)` is perfect for `n ≥ 3`; the map `H₁(E₂(ℤ)) → H₁(E₃(ℤ))` is `ℤ/12 → 0`, onto
  as claimed at `n = 2`, and `0 → 0` from `n = 3`. For `GL_n(ℤ)` the abelianizations are `(ℤ/2)²`
  and `ℤ/2`: the elementary form is a different statement, not a restriction of §6.7's.

### 2.2 Noetherian and semilocal rings

Define `elementaryStabilization R n : E_n(R) →* E_(n+1)(R)`, the restriction of
`TauCeti.stabilizeGL R (Nat.le_succ n)` to `TauCeti.elementarySubgroup (Fin n) R`, landing in
`TauCeti.elementarySubgroup (Fin (n + 1)) R` by `TauCeti.map_stabilizeGL_elementarySubgroup_le`.
Prove `elementaryHomology_stabilization_of_ringKrullDim_le`: for a commutative noetherian ring of
Krull dimension at most `d` and `e = max 1 d`, the map
`groupHomology.map (elementaryStabilization R n) φ m` with `φ` the identity of `ℤ` is onto for
`n ≥ 2m + e − 1` and bijective for `n ≥ 2m + e`. Prove
`elementaryHomology_stabilization_of_isSemisimpleRing`: if `R ⧸ Ring.jacobson R` is semisimple, it
is onto for `n ≥ 2m` and bijective for `n ≥ 2m + 1`. Route: 2.1 with AlgebraicKTheory 4.2 (Bass's
bound `hasStableRangeLE_of_ringKrullDim_le`, with `sdim = d`, and
`hasStableRangeLE_one_of_isSemisimpleRing`, with `sdim = 0`).
*Needs:* 2.1; AlgebraicKTheory 4.2; Tau Ceti `TauCeti.stabilizeGL`, `TauCeti.elementarySubgroup`,
`TauCeti.map_stabilizeGL_elementarySubgroup_le`; Mathlib `MonoidHom.subgroupMap`,
`Subgroup.inclusion`, `Rep.trivial`, `Rep.res`, `groupHomology.map`.

API:

- `elementaryStabilization R n`, whose value at `g` has the underlying matrix of
  `TauCeti.stabilizeGL R (Nat.le_succ n) g`, and its injectivity.

**Checks.**

- `elementaryStabilization` sends the elementary matrix `e₁₂(a)` of size `n` to `e₁₂(a)` of size
  `n + 1`; the lower right embedding would send it to `e₂₃(a)`, a different map that conjugates
  this one by a permutation.
- It is a restriction, not the stabilization of all of `GL_n`: over `ℤ`, `diag(−1, −1) ∈ E₂(ℤ)`
  goes to `diag(−1, −1, 1) ∈ E₃(ℤ)`, while `diag(−1, 1)` is not in `E₂(ℤ) = SL₂(ℤ)`. For
  `n = 0`, `E₀(R)` and `E₁(R)` are trivial.
- For `ℤ[x]` (`d = 2`, `e = 2`) the theorem gives bijectivity on `H₁` from `n ≥ 4`, while for
  `ℤ` (`d = 1`) it gives it from `n ≥ 3`: the bound grows with `d` only from `d = 2` on.
- The zero ring has `E_n = 1` for every `n`, and every map in the statement is the identity of
  `ℤ` or of `0`.

Not a target: over `𝔽₂`, where `E_n(𝔽₂) = GL_n(𝔽₂)`, the bijectivity bound `n ≥ 2m + 1` of the
semisimple case is attained for `m ≤ 3` and not for `m ≥ 4`. For `m = 1` see 2.1, Checks. For
`m = 2`, `GL₄(𝔽₂) ≅ 𝔄₈` has Schur multiplier `ℤ/2` and `GL₅(𝔽₂)` has trivial multiplier, so the
map is not injective at `n = 4`. For `m = 3`, `H³(GL₆(𝔽₂); 𝔽₂) ≠ 0` (Szymik 2020) and
`H₂(GL₆(𝔽₂); ℤ) = 0`, so `H₃(GL₆(𝔽₂); ℤ)` has nonzero `2`-torsion; `H₃(GL₇(𝔽₂); ℤ)` is stable by
2.1 and its `2`-part vanishes by Quillen's computation of the homology of `GL(𝔽_q)` at the
characteristic (Quillen 1972), so the map is not injective at `n = 6`. For `m ≥ 4`, the vanishing
of `H_d(GL_n(𝔽₂), GL_(n−1)(𝔽₂); 𝔽₂)` for `d < 2(n − 1)/3` (Galatius–Kupers–Randal-Williams 2024,
Theorem B) and Quillen's computation at the odd primes give bijectivity for
`n ≥ ⌊3(m + 1)/2⌋ + 1`, which is `n ≥ 8` for `m = 4` and below `2m + 1` from `m = 4` on. The same
holds for SchemeKTheoryOperations §6.7's semilocal form for `GL_n(𝔽₂)`.

### 2.3 Semilocal rings with infinite residue fields

Prove `homology_stabilization_of_infinite_residueFields`: for a semilocal ring `R` whose residue
fields are all infinite (Convention 7), the map
`groupHomology.map (TauCeti.stabilizeGL R (Nat.le_succ n)) φ m`, with `φ` the identity of `ℤ`, is
bijective for `m ≤ n`. For connected `R` its content is the vanishing of the relative groups
`H_d(GL_n(R), GL_(n−1)(R); ℤ)` for `d < n`, with the surjectivity of
`H_n(GL_n(R); ℤ) → H_n(GL_n(R), GL_(n−1)(R); ℤ)` (Galatius–Kupers–Randal-Williams 2025, Theorem 9.4
and its proof in §9.2, where the map from `n`-fold products of units onto the relative group factors
through `H_n(GL_n(R))`; for local rings Nesterenko–Suslin 1989, Theorems 2.7 and 3.25; for connected
semilocal rings Guin 1989, Théorème 2), and the exact sequence of Convention 5: the first gives
surjectivity for `m ≤ n` and injectivity for `m < n`, the second injectivity for `m = n`; the
connectedness in Galatius–Kupers–Randal-Williams 2025, Theorem 9.4, serves the identification of
the relative group with Milnor K-theory, which is out of scope here. Route: for connected `R`,
Nesterenko and Suslin's induction on `n` through Suslin's spectral sequence of 1.3, as in Suslin's
proof for infinite fields (K3BlochGroups 4.8). In general, `R` is a finite product of connected
semilocal rings `R₁ × ⋯ × R_l` with infinite residue fields, each connected component of its
spectrum being clopen and containing a closed point; `GL_n(R) = GL_n(R₁) × ⋯ × GL_n(R_l)`,
compatibly with the stabilization, and the natural Künneth sequence for a product of two groups,
with terms `H_i ⊗ H_j` (`i + j = m`) and `Tor(H_i, H_j)` (`i + j = m − 1`), all with `i, j ≤ n`,
gives bijectivity by the five lemma and induction on `l`; for `l = 0`, the zero ring, all groups
are trivial.
*Needs:* 1.3; Tau Ceti `TauCeti.stabilizeGL`; Mathlib `MaximalSpectrum`, `PrimeSpectrum`,
`ConnectedSpace`, `Rep.trivial`, `Rep.res`, `groupHomology.map`.

**Checks.**

- The hypothesis on the residue fields is needed, not only an infinite ring: for `ℤ_(2)`, local
  with residue field `𝔽₂`, the composite `GL₁(ℤ_(2)) → GL₂(ℤ_(2)) → GL₂(𝔽₂) ≅ 𝔖₃` is trivial,
  since `GL₁(𝔽₂) = 1`, while `H₁(GL₂(ℤ_(2))) → H₁(𝔖₃) = ℤ/2` is onto, so
  `H₁(GL₁(ℤ_(2))) → H₁(GL₂(ℤ_(2)))` is not onto, although `m = n = 1`.
- For the finite field `𝔽₂`, bijectivity at `m = 1 ≤ n = 2` fails: `ℤ/2 → H₁(GL₃(𝔽₂)) = 0`
  (2.1, Checks).
- For an infinite field `F` and `m = n = 1`: `H₁(GL₁(F)) = Fˣ → H₁(GL₂(F)) = Fˣ` is the identity
  through the determinant, bijective as claimed; this is the case `m = n`, which the vanishing of
  the relative groups alone does not give.
- `m = n = 0`: `GL₀(R) = 1 → GL₁(R)` induces the identity of `H₀ = ℤ`.
- Connectedness is not needed: `ℚ × ℚ` is semilocal with infinite residue fields and not
  connected, and `GL_n(ℚ × ℚ) = GL_n(ℚ) × GL_n(ℚ)`. For `m ≤ n` the Künneth terms
  `H_i(GL_n(ℚ)) ⊗ H_j(GL_n(ℚ))` (`i + j = m`) and `Tor(H_i, H_j)` (`i + j = m − 1`) have
  `i, j ≤ n`, where both factors are bijective, so the five lemma gives bijectivity; for
  `m = n = 1`, `H₁ = ℚˣ × ℚˣ → ℚˣ × ℚˣ` through the two determinants.
- The zero ring satisfies the hypotheses vacuously: `GL_n(0)` is trivial and every map in the
  statement is the identity of `ℤ` (`m = 0`) or of `0`.

### 2.4 The plus construction and K-theory

Prove: under `SR_(sdim+2)`, with `e = max(1, sdim)`, for `m ≥ 1`,
`π_m(BGL_n(R)⁺) → π_m(BGL_(n+1)(R)⁺)` is onto for `n ≥ max(3, 2m + e − 1)` and injective for
`n ≥ 2m + e + 1`, where `BGL_n(R)⁺` is the plus construction with respect to the normal closure of
the perfect group `E_n(R)`, `n ≥ 3` (van der Kallen 1980, Corollary 4.12, p. 289); hence
`π_m(BGL_n(R)⁺) → K_m(R)` is bijective for `n ≥ max(3, 2m + e + 1)`. Route: `E_n(R)` is normal in
`GL_n(R)` for `n ≥ sdim + 2` (AlgebraicKTheory 4.1), so in the range used `BE_n(R)⁺` is the
universal cover of `BGL_n(R)⁺` (StableHomotopyKTheory 3.31) and
`H_*(BE_n(R)⁺) = H_*(E_n(R))` (StableHomotopyKTheory 1.30, 1.32 and 3.12); 2.1 and the relative
Hurewicz theorem (StableHomotopyKTheory 3.16) give the first claim (van der Kallen 1980, proof of
Corollary 4.12), and for `m = 1` the injective stability of `K₁` (AlgebraicKTheory 4.1); for the
second, the mapping telescope of the `BGL_n(R)⁺` is a plus construction of `BGL(R)`, with
`GL(R) = TauCeti.StableGeneralLinearGroup R` (StableHomotopyKTheory 3.25), its homotopy groups are
the colimits of the `π_m(BGL_n(R)⁺)` (StableHomotopyKTheory 1.14), and `K_m(R) ≅ π_m(BGL(R)⁺)`
(GeneralAlgebraicKTheory 3.14).
*Needs:* 2.1; AlgebraicKTheory 4.1 (`injective_stability`, normality of `E_n(R)`); Tau Ceti
`TauCeti.commutator_elementarySubgroup_self`, `TauCeti.StableGeneralLinearGroup`,
`TauCeti.StableGeneralLinearGroup.of`; StableHomotopyKTheory 1.14, 1.30, 1.32, 3.12, 3.16,
3.25–3.27, 3.31, 4.14; GeneralAlgebraicKTheory 3.2, 3.14.

**Checks.**

- For `m = 1`, `π₁(BGL_n(R)⁺)` is `GL_n(R)` modulo the normal closure of `E_n(R)`, and the claim
  gives `K₁(R)` for `n ≥ e + 3`, inside AlgebraicKTheory 4.1's range `n ≥ sdim + 2` for
  `GL_n(R)/E_n(R) ≅ K₁(R)`.
- `n ≥ 3` is needed: `E₂(𝔽₂) = GL₂(𝔽₂) ≅ 𝔖₃` is not perfect, so `BGL₂(𝔽₂)⁺` with respect to it
  is not defined.
- For `ℤ` and `m = 2`, `K₂(ℤ) = ℤ/2` is `π₂(BGL_n(ℤ)⁺)` for `n ≥ 6`.

### Examples

- Infinite fields: Suslin's range `H_i(GL_n(F)) ≅ H_i(GL_(n+1)(F))` for `i ≤ n` (Suslin 1984;
  K3BlochGroups 4.8, `generalLinear_homology_stable`) is the field case of 2.3; van der Kallen's
  range (SchemeKTheoryOperations §6.7) gives bijectivity only for `n ≥ 2i + 1`.
- Symmetric groups: Nakaoka's range, `H_i(Σ_n) ≅ H_i(Σ_(n+1))` for `n ≥ 2i` (Nakaoka 1960;
  Kerz 2005, Theorem 2; K3BlochGroups 4.15, `symmetricGroup_homology_stable`), is the range of
  2.1 for `e = 0`, the "field with one element": its proof is that of 1.2 and 2.1 for the complex
  of injective words, whose stabilisers are again symmetric groups. The inclusion of permutation
  matrices `Σ_n → GL_n(R)` commutes with the stabilizations.

### Dependencies

Layer 1; SchemeKTheoryOperations §6.7 (for comparison in Examples and in Scope); AlgebraicKTheory
4.1–4.2; Tau Ceti `TauCeti.stabilizeGL`, `TauCeti.elementarySubgroup`,
`TauCeti.map_stabilizeGL_elementarySubgroup_le`, `TauCeti.commutator_elementarySubgroup_self`,
`TauCeti.StableGeneralLinearGroup`; StableHomotopyKTheory 1.14, 1.30, 1.32, 3.12, 3.16, 3.25–3.27,
3.31, 4.14 and GeneralAlgebraicKTheory 3.2, 3.14 for 2.4. Within the layer, 2.2 and 2.4 use 2.1,
and 2.3 uses Layer 1 only.

## Layer 3: twisted coefficients

### 3.1 Coefficient systems

Define, after Dwyer and van der Kallen (1980, 5.2–5.5, pp. 290–291), a coefficient system
`ρ = (ρ_n, F_n)`: `GL_n(R)`-modules `ρ_n` with maps `F_n : ρ_n → ρ_(n+1)` linear along the
stabilization `TauCeti.stabilizeGL`; central when the image of `ρ_n` in `ρ_(n+2)` is fixed by
`s_(n+2)`, where `s_n(e_i) = e_i` for `i ≤ n − 2`, `s_n(e_(n−1)) = e_n`, `s_n(e_n) = e_(n−1)` (the
choice `γ = 1` of van der Kallen 1980, 5.2, available for `GL`); strongly central when that image
is also fixed by the elementary matrix `e_(n+1,n+2)`; the shifted system `Σρ` (restriction along the
lower inclusion), the map `τ : ρ → Σρ`, and the degree: `Σρ` splits when `τ` is injective and
`Σρ = τ(ρ) ⊕ ρ'` for a subsystem `ρ'`, so that `ρ' ≅ coker τ`; `ρ` has degree `< 0` when it is
zero, and degree `k ≥ 0` when `Σρ` splits and `coker τ` is strongly central of degree `k − 1`
(van der Kallen 1980, 5.5, p. 290). Define the relative groups
`Rel_m^n(ρ) = H_m(GL_(n+1)(R), GL_n(R); ρ_(n+1), ρ_n)` (Convention 5).
*Needs:* Tau Ceti `TauCeti.stabilizeGL`; Mathlib `Rep`, `Rep.res`, `groupHomology.chainsMap`.

API:

- Coefficient systems and their morphisms, with the predicates central and strongly central.
- The shift `Σρ`, the natural map `τ : ρ → Σρ`, `ker τ` and `coker τ` as coefficient systems.
- The degree, `< 0` exactly for the zero system; a system of degree `k` also has degree `k + 1`,
  and `deg ρ` is the least such `k`, with `deg(ρ ⊕ ρ') ≤ max(deg ρ, deg ρ')`.
- The relative groups `Rel_m^n(ρ)` and their long exact sequence (Convention 5).

**Checks.**

- A constant system (`ρ_n = A` with trivial action, `F_n = id`) is strongly central of degree
  `0`: `Σρ = ρ` and `coker τ = 0`, of degree `−1`.
- The standard system `ρ_n = Rⁿ`, with `F_n` the inclusion of Convention 2, is strongly central:
  the image of `Rⁿ` in `Rⁿ⁺²` is spanned by `e₁, …, e_n`, fixed by `s_(n+2)` and by
  `e_(n+1,n+2)`, which moves only `e_(n+2)`. It has degree `1`: `(Σρ)_n = Rⁿ⁺¹` with `GL_n(R)`
  acting on the last `n` coordinates splits as `Re₁ ⊕ τ(Rⁿ)`, and `Re₁` is constant (van der
  Kallen 1980, 5.5).
- The system `ρ_n = Rⁿ` with `F_n = 0`, over `R ≠ 0`, is central and has no degree: `τ` is zero,
  so `Σρ` never splits off a copy of `ρ` through `τ`.
- Injectivity of `τ` is part of the splitting. Over a field (`sdim = 0`) let `ρ_n = A ≠ 0` with
  trivial action for `n ≤ 2`, `ρ_n = 0` for `n ≥ 3`, `F_n = id` for `n < 2`: it is strongly
  central, and `τ` is onto, so `Σρ = τ(ρ) ⊕ 0`; but `τ_2 : A → 0` is not injective, and `ρ` has no
  degree. A degree `0` would make 3.3 claim `Rel_1^2(ρ) = 0` at `n = 2 ≥ 2m + sdim + k = 2`, while
  the exact sequence of Convention 5 gives `Rel_1^2(ρ) = H₁(GL₃, GL₂; 0, A) ≅ H₀(GL₂; A) = A`.

### 3.2 The relative spectral sequence

For `P, Q` as in 1.1, `G = G_n^(P,Q)`, `G' = G_(n+1)^(P,Q)`, a `G`-module `M`, a `G'`-module `M'`
and `f : M → M'` linear along the upper inclusion `G → G'`, construct the first-quadrant spectral
sequence `E(P, Q; n + 1, n)` with `E¹_(0,s) = H_s(G', G; M', M)` and
`E¹_(r,s) = H_s(Stab_G'(σ_(r−1)), Stab_G(σ_(r−1)); M', M)` for `1 ≤ r ≤ d + ε + 1`, `d` and `ε`
those of `G` (1.1), converging to zero, whose differential `E¹_(1,s) → E¹_(0,s)` is the natural map
`H_s(Stab_G'(σ₀), Stab_G(σ₀); M', M) → H_s(G', G; M', M)` (van der Kallen 1980, 3.12–3.14,
pp. 282–284); for `r = d + ε + 2` there is a surjection from
`H₀(Stab_G'(σ_(r−1)), Stab_G(σ_(r−1)); M', M)` onto `E¹_(r,0)` (3.15, p. 284). Prove van der
Kallen's Lemma 5.13 (p. 293): for `(P, Q)` equal to `(∅, ∅)` or `({1}, ∅)`, `d + ε ≥ 1`, `ρ`
strongly central, `M = ρ_n` and `M' = ρ_(n+1)`, if the map
`Rel_m^(n−2)(ρ) → H_m(Stab_G'(σ₁), Stab_G(σ₁); ρ_(n+1), ρ_n)` induced by the lower inclusions and
by `(Στ)τ` is onto, then the differential `E¹_(2,m) → E¹_(1,m)` vanishes. Route: the mapping cone
of the map of the hyperhomology double complexes of SchemeKTheoryOperations §6.7 for `G` acting on
its frame complex `F` and for `G'` acting on its frame complex `F' ⊇ F`, which is `(d + 1)`-acyclic,
with relative groups computed by mapping cones as in Convention 5 (van der Kallen 1980, 3.12–3.13);
for Lemma 5.13, the differential is the difference of two maps induced by the same morphism of
pairs (5.12–5.13, pp. 292–293).
*Needs:* 1.1, 1.2, 3.1; SchemeKTheoryOperations §6.7 (hyperhomology); Mathlib
`groupHomology.chainsMap`, `groupHomology.indIso`.

**Checks.**

- For constant coefficients `ρ_n = ℤ`, `s = 0`: `H₀(G', G; ℤ, ℤ)` is the cokernel of
  `H₀(G) → H₀(G')`, the identity of `ℤ`, so it vanishes, as does every `E¹_(r,0)`.
- For the identity morphism of pairs, `G' = G`, `M' = M`, all relative groups vanish (Convention 5)
  and so does the whole spectral sequence; the spectral sequence of a pair is not the difference of
  the two spectral sequences of 1.2, whose columns are described in different ranges, `d` for `G`
  and `d + 1` for `G'`.
- Lemma 5.13 needs `d + ε ≥ 1`: for `(P, Q) = (∅, ∅)` over a field and `n = 2`, `d = 0` and
  `ε = 0`, the column `r = 2` lies beyond `d + ε + 1 = 1`, is not described, and the lemma asserts
  nothing; from `n = 3` on, `d + ε = n − 2 ≥ 1`.

### 3.3 Stability for strongly central systems

Prove: if `R` satisfies `SR_(sdim+2)` and `ρ` is strongly central of degree `k`, then
`Rel_m^n(ρ) = 0` for `n ≥ 2m + sdim + k`; hence `H_m(GL_n(R); ρ_n) → H_m(GL_(n+1)(R); ρ_(n+1))` is
onto for `n ≥ 2m + sdim + k` and bijective for `n ≥ 2m + sdim + k + 2` (van der Kallen 1980, Theorem
5.6, p. 291, with the exact sequence of Convention 5). Route: induction on `k` and `m` through the
relative spectral sequences of 3.2, with Lemma 5.13 for the differential `E¹_(2,m) → E¹_(1,m)`
(van der Kallen 1980, 5.12–5.16, pp. 292–294, after the argument of 5.8–5.11 for Theorem 5.7).
*Needs:* 1.1, 3.1, 3.2; AlgebraicKTheory 4.1.

**Checks.**

- For a constant system (`k = 0`) the bound `n ≥ 2m + sdim` for surjectivity equals that of
  SchemeKTheoryOperations §6.7, `n ≥ 2m + e − 1`, when `sdim = 0`, and is one weaker when
  `sdim ≥ 1`.
- `m = 0`: `Rel_0^n(ρ) = coker(ρ_n → (ρ_(n+1))_(GL_(n+1)))` on coinvariants; for `ρ = Rⁿ` and
  `n ≥ 1` the coinvariants of `Rⁿ⁺¹` vanish (`e₁ = (e_(12) − 1)e₂`), so `Rel_0^n = 0` from
  `n ≥ 1`, within the claimed `n ≥ sdim + 1`.
- Degree matters: for `ρ_n = Rⁿ ⊗ Rⁿ` (degree `2`, van der Kallen 1980, 5.5) the bound is one
  more than for `Rⁿ`.

### 3.4 The standard representation

Define `standardRep R n`, the integral representation of `GL_n(R)` on `n × 1` matrices by left
multiplication (`Rep.ofDistribMulAction`). Prove `twistedHomology_stabilization_of_ringKrullDim_le`:
for a commutative noetherian ring of Krull dimension at most `d`, with
`φ : standardRep R n ⟶ Rep.res (TauCeti.stabilizeGL R _) (standardRep R (n + 1))` the inclusion of
the first `n` coordinates, the map `H_m(GL_n(R); Rⁿ) → H_m(GL_(n+1)(R); Rⁿ⁺¹)` is onto for
`n ≥ 2m + d + 1` and bijective for `n ≥ 2m + d + 3`. Prove
`twistedHomology_stabilization_of_isSemisimpleRing`: if `R ⧸ Ring.jacobson R` is semisimple, onto
for `n ≥ 2m + 1` and bijective for `n ≥ 2m + 3`. Route: 3.3 for the standard system (3.1, Checks)
with `k = 1`, and AlgebraicKTheory 4.2.
*Needs:* 3.1, 3.3; AlgebraicKTheory 4.2; Tau Ceti `TauCeti.stabilizeGL`; Mathlib
`Rep.ofDistribMulAction`, `Fin.lastCases`.

API:

- `standardRep R n`, with `(standardRep R n).ρ g v = g * v`, and the inclusion `v ↦ (v; 0)` as a
  morphism `standardRep R n ⟶ Rep.res (TauCeti.stabilizeGL R _) (standardRep R (n + 1))`.

**Checks.**

- `m = 0` over `𝔽₂`: `H₀(GL₁(𝔽₂); 𝔽₂) = 𝔽₂`, since `GL₁(𝔽₂) = 1`, and
  `H₀(GL₂(𝔽₂); 𝔽₂²) = 0` (the coinvariants of 3.3, Checks): the map `𝔽₂ → 0` is onto and not
  injective at `n = 1`, outside the bijective range `n ≥ 3`.
- `m = 0` over `ℤ` (`d = 1`): `H₀(GL₁(ℤ); ℤ) = ℤ/(−1 − 1) = ℤ/2` maps onto `H₀(GL₂(ℤ); ℤ²) = 0`
  at `n = 1`, not in the claimed range `n ≥ 2` for surjectivity, and indeed onto.
- The coefficient map must be the inclusion `v ↦ (v; 0)`: the map `v ↦ (0; v)`, putting `v` in
  the last `n` coordinates, is not `GL_n(R)`-linear along `diag(g, 1)` for `n ≥ 2`, so no `φ`
  with that formula exists.

Not a target: over `𝔽₂` and `m = 1`, the surjectivity bound `n ≥ 3` of the semisimple case is
attained and bijectivity holds from `n = 4`, one step before the bound `n ≥ 5`. Over a field
`dim H₁(G; V) = dim H¹(G; V*)`, and the inverse-transpose automorphism of `GL_n` identifies
`H¹(GL_n; V*)` with `H¹(GL_n; V)` for `V = 𝔽₂ⁿ`. Computing `H¹(GL_n(𝔽₂); 𝔽₂ⁿ)` as cocycles on a
generating pair modulo coboundaries (own computation, with two generating pairs: `1 + E₁₂` with
the cyclic permutation matrix, and `1 + E₁₂` with a Singer cycle) gives the dimensions
`0, 0, 1, 0, 0` for `n = 1, …, 5`; the value at `n = 3` is the non-split extension `2³·L₃(2)`.
So the map is `0 → 𝔽₂` at `n = 2`, not onto; `𝔽₂ → 0` at `n = 3`, onto and not injective; and
`0 → 0` at `n = 4`, bijective.

### Examples

- For a field `F` with at least three elements the groups `H_m(GL_n(F); Fⁿ)` vanish, `n ≥ 1`: a
  central scalar `λ ≠ 1` acts on them trivially, as an inner automorphism, and as multiplication
  by the unit `λ`, so `λ − 1` kills them. Over `𝔽₂` there is no such scalar and
  `H₀(GL₁(𝔽₂); 𝔽₂) = 𝔽₂` (3.4, Checks).
- Dwyer's theorem (Dwyer 1980) is the case of a principal ideal domain, with a qualitative
  range.

### Dependencies

Layers 1–2; SchemeKTheoryOperations §6.7 (hyperhomology); AlgebraicKTheory 4.1–4.2; Tau Ceti
`TauCeti.stabilizeGL`. Within the layer, 3.2 uses 3.1, 3.3 uses 3.1–3.2 and 3.4 uses 3.1 and 3.3.

## Downstream consumers

No roadmap consumes a target of this one. SchemeKTheoryOperations
names this roadmap as a later consumer of its §6.7, which supplies the hyperhomology, the frame
complexes and the constant-coefficient theorem for `GL_n(R)` here. K3BlochGroups names it in its
scope; over an infinite field the spectral sequence and the stability range of its §4.8 are the
field cases of 1.3 and 2.3, and its `generalLinearStabilization`, `g ↦ diag(g, 1)`, is the map
of `TauCeti.stabilizeGL` over a field.
ArithmeticKTheory §3.2 states rank-filtration bounds for `GL_m` of rings of integers and
says that they are not homological stability bounds; it cites no target here.

## Research context

Quillen showed, in unpublished work, that `H_m(GL_n(F)) → H_m(GL_(n+1)(F))` is bijective for
`n ≥ m + 1` over fields `F ≠ 𝔽₂`, by the spectral sequence of the action on a highly connected
complex of unimodular sequences; he proved the connectivity for local rings and conjectured it for
finite-dimensional noetherian rings. Maazen (announced in Maazen 1979) proved stability for subrings
of `ℚ` and for the symmetric groups in Nakaoka's range by the same method, Charney for Dedekind
domains with split buildings, and van der Kallen the conjecture, with the ranges of Layer 2 (van der
Kallen 1980, §§1.5–1.7, pp. 271–272). The optimal ranges remain open in general: for infinite fields
the injectivity of `H_n(GL_(n−1)(F)) → H_n(GL_n(F))` is a question of Suslin, and the `E∞`-cellular
methods of Galatius, Kupers and Randal-Williams describe the relative groups beyond the line of 2.3.
At the characteristic the ranges change: for `𝔽_q`, `q = p^r ≠ 2`, the relative groups
`H_d(GL_n(𝔽_q), GL_(n−1)(𝔽_q); 𝔽_p)` vanish for `d < n + r(p − 1) − 2`, and for `𝔽₂` in a range of
slope `2/3` (Galatius–Kupers–Randal-Williams 2024, Theorems A and B). Randal-Williams and Wahl
recast the spectral-sequence argument for families of groups with a homogeneous category, with
constant and twisted coefficients, and deduce a stability range for `GL_n(R)` in terms of its stable
rank (Randal-Williams–Wahl 2017, Theorem 5.11 in the numbering of arXiv:1409.3541).

Two questions are open as far as we know. First, for a local ring `R` whose residue field is
finite with at least three elements (`ℤ_(3)`, `ℤ/9`, `𝔽₃⟦t⟧`), is the stabilization bijective on
`H_m(−; ℤ)` for `m ≤ n`, as 2.3 states for infinite residue fields? It fails for residue field
`𝔽₂` (2.3, Checks); for fields other than `𝔽₂`, finite fields included, the slope-one range is
Quillen's argument as written up by Sprehn and Wahl (Sprehn–Wahl 2020); the ranges in print for
local rings assume an infinite residue field (Nesterenko–Suslin 1989; Schlichting 2017;
Galatius–Kupers–Randal-Williams 2025, for connected semi-local rings), and van der Kallen's theorem
gives only slope one half. For `ℤ/9` the degrees `m ≤ 2` agree with the slope-one prediction (own
computation): `H₁(GL_n(ℤ/9); ℤ) = (ℤ/9)ˣ = ℤ/6` for `n = 1, 2, 3`, through the determinant, and
`H₂(GL₂(ℤ/9); ℤ) = H₂(GL₃(ℤ/9); ℤ) = 0`, the second from the Lyndon–Hochschild–Serre spectral
sequence of `1 → 1 + 3M₃(ℤ/9) → GL₃(ℤ/9) → GL₃(𝔽₃) → 1`, whose terms of total degree `2` vanish
(`H₂(GL₃(𝔽₃); ℤ) = 0`, `H¹(GL₃(𝔽₃); 𝔤𝔩₃(𝔽₃)) = 0`, `(Λ² 𝔤𝔩₃(𝔽₃))_(GL₃(𝔽₃)) = 0`). Second, the
exact bijectivity range over `𝔽₂` in degrees `m ≥ 4`: by the non-target after 2.2 it begins at
`n ≤ ⌊3(m + 1)/2⌋ + 1`, so at `n ≤ 8` for `m = 4`.

## References

- W. van der Kallen, « Homology stability for linear groups », *Invent. Math.* 60 (1980), no. 3,
  269–295. doi:10.1007/BF01390018. GDZ: PPN356556735_0060.
- Yu. P. Nesterenko, A. A. Suslin, « Homology of the full linear group over a local ring, and
  Milnor's K-theory », *Izv. Akad. Nauk SSSR Ser. Mat.* 53 (1989), no. 1, 121–146; English
  translation *Math. USSR-Izv.* 34 (1990), no. 1, 121–145. doi:10.1070/IM1990v034n01ABEH000610.
- D. Guin, « Homologie du groupe linéaire et K-théorie de Milnor des anneaux », *J. Algebra* 123
  (1989), no. 1, 27–59. doi:10.1016/0021-8693(89)90033-1.
- S. Galatius, A. Kupers, O. Randal-Williams, « E∞-cells and general linear groups of infinite
  fields », *Duke Math. J.* 174 (2025), no. 14, 2927–3046. doi:10.1215/00127094-2025-0005.
  arXiv:2005.05620; Definition 5.12, Proposition 5.15, Example 5.16 and Theorem 9.4 in the
  numbering of arXiv version 3.
- S. Galatius, A. Kupers, O. Randal-Williams, « E∞-cells and general linear groups of finite
  fields », *Ann. Sci. Éc. Norm. Supér.* (4) 57 (2024), no. 6, 1845–1882.
  doi:10.24033/asens.2599. arXiv:1810.11931.
- M. C. Kerz, « The complex of words and Nakaoka stability », *Homology Homotopy Appl.* 7 (2005),
  no. 1, 77–85. doi:10.4310/HHA.2005.v7.n1.a5. arXiv:math/0410261.
- H. Maazen, « Stabilité de l'homologie de GL_n », *C. R. Acad. Sci. Paris Sér. A* 288 (1979),
  707–708. Zbl 0411.20028.
- W. G. Dwyer, « Twisted homological stability for general linear groups », *Ann. of Math.* (2)
  111 (1980), no. 2, 239–251. doi:10.2307/1971200.
- A. A. Suslin, « Homology of GL_n, characteristic classes and Milnor K-theory », in *Algebraic
  K-theory, number theory, geometry and analysis* (Bielefeld, 1982), Lecture Notes in Math. 1046,
  Springer, 1984, 357–375. Zbl 0528.18007.
- R. Charney, « Homology stability for GL_n of a Dedekind domain », *Invent. Math.* 56 (1980),
  no. 1, 1–17. doi:10.1007/BF01403153.
- M. Nakaoka, « Decomposition theorem for homology groups of symmetric groups », *Ann. of Math.*
  (2) 71 (1960), 16–42. doi:10.2307/1969878.
- H. Bass, « K-theory and stable algebra », *Publ. Math. IHÉS* 22 (1964), 5–60.
  doi:10.1007/BF02684689.
- H. Bass, *Algebraic K-Theory*, W. A. Benjamin, New York, 1968, Chapter V. Zbl 0174.30302.
- A. Hatcher, N. Wahl, « Stabilization for mapping class groups of 3-manifolds », *Duke Math. J.*
  155 (2010), no. 2, 205–269. doi:10.1215/00127094-2010-055. arXiv:0709.2173.
- O. Randal-Williams, N. Wahl, « Homological stability for automorphism groups », *Adv. Math.* 318
  (2017), 534–626. doi:10.1016/j.aim.2017.07.022. arXiv:1409.3541.
- M. Szymik, « The third Milgram–Priddy class lifts », *J. Algebra* 547 (2020), 173–178.
  doi:10.1016/j.jalgebra.2019.11.028. Zbl 1485.20116. arXiv:1909.05064.
- D. Quillen, « On the cohomology and K-theory of the general linear groups over a finite field »,
  *Ann. of Math.* (2) 96 (1972), 552–586. doi:10.2307/1970825. Zbl 0249.18022.
- D. Sprehn, N. Wahl, « Homological stability for classical groups », *Trans. Amer. Math. Soc.*
  373 (2020), no. 7, 4807–4861. doi:10.1090/tran/8030. Zbl 1460.20011. arXiv:1812.08742.
- M. Schlichting, « Euler class groups and the homology of elementary and special linear groups »,
  *Adv. Math.* 320 (2017), 1–81. doi:10.1016/j.aim.2017.08.034. Zbl 1387.19002.
  arXiv:1502.05424.
