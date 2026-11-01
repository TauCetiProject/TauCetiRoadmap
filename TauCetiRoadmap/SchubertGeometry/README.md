# Roadmap: schubert geometry, Demazure sections and flag K-theory

**Summary.** Build the scheme and section interfaces for Schubert varieties in general reductive flag varieties: relative incidence and universal bundles, root-coordinate cells and their closures, all-word Bott–Samelson operations, dominant line-bundle cohomology, compatible Frobenius splitting, all-degree standard monomial theory, exact divisor multiplicities and algebraic flag K-rings. The finite-type LS-chain/path engine and its geometric section comparison are part of this construction. Compare the complex realization with holomorphic Lefschetz characters and the existing finite Grassmannian topology. Suggested homes are `TauCeti/AlgebraicGeometry/Schubert/` and `TauCeti/RepresentationTheory/LSPath/`.

Use schemes, sheaves of modules, root data and rational representations at their stated hypotheses. A point-set rank condition is a comparison interface for a scheme, not its definition as a variety. Singular Schubert varieties are not declared smooth.

## Scope and ownership

This roadmap owns the general finite-root-datum path theory, Schubert schemes,
word resolutions, geometric sections, splitting, standard monomial theory,
Chevalley divisors and flag K-rings. The relative Grassmannian, generic coherent
cohomology and representation-theoretic foundations have the owners
listed in the supplier contracts below. S1.0–1 owns the relative parabolic
quotients and finite-locally-free flag incidence needed here; S2 owns the
integral word models and S5.6 their Schubert closure and base-change theory.
S9.0 owns the coherent analytic foundations required for S9, including
nonreduced analytification and proper GAGA. These are prerequisites of the
base programme, with the downstream uses listed under Downstream consumers. Ordinary holomorphic Picard groups,
the root-degree basis and the compact character-to-degree forgetful map belong
to GeometricQuantization §§3.3–3.4. S9.8 retains only the algebraic-to-holomorphic
equivariant-line adapter, with specified transition functions and fibre maps.
The type-A coordinate-path comparison
and tableau applications are downstream consumers of the general path theory.

## Conventions

Fix a split connected reductive group G over a field k, a pinning when root coordinates are used, T⊂B+ with positive roots Φ+, and the opposite Borel B−. Write X=X*(T), Y=X_*(T), with their actual perfect pairing, W for the Weyl group and I for the simple roots. Keep the central lattice and the isogeny type. Unless separately specified, flags mean right quotients G/P−, with P− containing B−. Minimal representatives belong to W/W_P. The standard Schubert cell is C(w)=B−wP−/P− and X(w) is its schematic closure; its dimension is ℓ(w), e is closed and the longest minimal representative is open. Opposite Schubert loci use B+. Convert left quotients and positive-Borel sources by explicit inversion/opposition maps. An unqualified Schubert union is a finite union for this one fixed Borel, or for one common opposite Borel after the stated transport. Mixed standard/opposite families are named explicitly and retain their own ideal and cohomology conditions.

For λ∈X, the associated line L(λ)=G×^(B−)k_λ has fibre character λ at e. Sections are regular functions f(gb)=λ(b)^−1f(g), with (g·f)(x)=f(g^−1x). Dominant λ have nonnegative pairings with simple coroots; for descent to G/P− require zero pairings on its Levi simple roots. The rank-one restriction has degree ⟨λ,α_i∨⟩. Thus H⁰(G/B−,L(λ)) is ∇(λ), whereas ordinary Δ(λ)* is ∇(−w₀λ). Distinguish this from the pinned contravariant dual D_τΔ(λ)=∇(λ).

Over an arbitrary base S, relative finite-locally-free flags and incidence schemes have their universal functorial meanings. Group flag forms use their actual descent type; individual fundamental line bundles or a chosen pinning need not descend. Integral split calculations use the pinned Chevalley model and its actual character/cocharacter lattices. Characteristic-p splitting is first constructed over perfect fields, including p=2; field extensions and descent are proved before using it for geometric conclusions over other fields. Over a nonreduced S, geometrically reduced fibres do not make the total space reduced.

## Exact supplier contracts

### From Mathlib

Use `MvPolynomial.weightedHomogeneousSubmodule` in
`Mathlib/RingTheory/MvPolynomial/WeightedHomogeneous.lean`, with monomial
bidegrees (1,0) and (0,1), and `MvPolynomial.pderiv` in
`Mathlib/Algebra/MvPolynomial/PDeriv.lean`. The homogeneous submodule includes
zero and imposes no contraction condition. Use `LinearMap.ker` and
`Module.Basis` for the actual kernel and basis quantifiers in S4.4a.
The native `Module.Grassmannian` and `Module.Basis.flag` supply the module
points and basis flag, not the relative Schubert schemes.

### From the named roadmap suppliers

- [ModularCurves §0G](../ModularCurves/README.md) owns finite-locally-free Grassmannian representability, its charts and universal quotient. Native `Module.Grassmannian R M q` stores a submodule with locally free quotient of rank q; an r-dimensional subspace of k^N corresponds to q=N−r. S1.1 constructs flags as closed incidence subschemes of products of those Grassmannians; a coherent quotient of a non-locally-free sheaf is not needed for this construction.
- [ReductiveGroups](../ReductiveGroups/README.md) owns Hopf/scheme/point and rational-comodule dictionaries, group/root/pinning/central-isogeny structure, and field Bruhat theory. Its integral-distribution/rational-representation extension supplies full-lattice divided-power PBW/Dist(G), Δ/∇/L, induction, pinned extremal vectors and contravariant duality. The algebraic Steinberg input is the simple module Δ((p−1)ρ)=L((p−1)ρ)=∇((p−1)ρ) on the derived simply connected cover, with dimension p^|Φ+| and normalized PBW/extremal pairing. These algebraic constructions do not consume flag splitting or SMT.

- [GroebnerGeometry G5](../GroebnerGeometry/README.md) owns polynomial minor/shuffle/straightening/Gröbner statements, flag-minor algebra and its GT initial algebra. S6 supplies the scheme, homogeneous coordinate, section and restriction identifications. The original flag algebra is not identified with its toric initial algebra.
- [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) supplies generic coherent cohomology, ample Serre, relative derived pushforward/base change and coherent/perfect K-theory at its stated scope; [StableReduction Layer2](../StableReduction/README.md) supplies relative Proj using AlgebraicVectorBundles L2A's single graded quasicoherent algebra and affine-ring interfaces. AlgebraicVectorBundles supplies tensor, dual, exterior and determinant sheaves and their pullbacks. These generic constructions are not redefined here.
- [TopologicalKTheory T1.5](../TopologicalKTheory/README.md) supplies the single finite subspace Grassmannian and finite Schubert characteristic maps. LieGroups supplies compact full flags and their homogeneous complex comparisons. S9 compares these with the algebraic models; it does not rebuild their existing carriers.
- [IndexTheory I8](../IndexTheory/README.md) owns the generic holomorphic fixed-map trace construction, in addition to its Dolbeault/Hodge and equivariant index machinery. S9 owns the flag/Bott–Samelson specialization and its section-action convention.
- [ComplexKahlerGeometry K3–K4](../ComplexKahlerGeometry/README.md) supplies finite-dimensional holomorphic germs, Weierstrass division, local analytic sets and the holomorphic sheaf/bundle calculus. S9.0 extends these local objects to analytic spaces with nilpotents and coherent analytification; K4's bundle theory alone is not coherent GAGA. RealAnalyticGeometry R3.2 supplies the native coherent module-sheaf predicate, coherent kernels and Cartan A/B on Stein manifolds. SchemeAndStackFoundations §§2.2, 2.6 and 4.12 supply algebraic coherent pushforward, projective-space cohomology and Chow modification for its proof.

## How to read the build

Construct in this order: S1's relative carriers and early root cells; S2's word/incidence API; S3's early line bundles and rank-one derived push-pull; S4.1–5's root-data LS combinatorics; S5's splitting/normalization/coherent comparisons; S7.1–2's divisor valuations; S4.6–7 and S6's geometric path sections and all-degree bases; S7.3's cycle comparison; S8's K-rings; S9's analytic and existing-owner comparisons. S4.1–5 is independent of Schubert splitting, vanishing, SMT and the concrete typeA implementation. S4.6–7 is its geometric application, after S5 and S7.1–2. The generic finite-type engine is the single root-data owner; S9.5 gives its type-A root-datum specialization. The algebraic Steinberg supplier is independent of all these geometric conclusions. The analytic fixed-point argument is a later comparison, not a premise for algebraic vanishing or SMT.

Suggested.lean states the simple-lowering obstruction on its native polynomial
carrier and lists the missing carriers of the other headline theorems. The
API targets and worked calculations belong to this README.

## Layer 1: Relative incidence and the root-cell dictionary (S1)

### 1.0 Relative parabolic quotients and integral root cells

For a reductive group scheme G over any scheme S and an étale-locally constant
parabolic type t invariant under descent, construct the scheme Par_t(G) of
parabolic subgroup schemes of that type. It is smooth and proper over S, has
its universal parabolic, and carries the relatively ample line
det(Lie(P_univ))*; it is projective over affine S. For a parabolic P/S of
type t, construct G/P→Par_t(G), gP↦gPg⁻¹, as an isomorphism of the represented
étale (equivalently fppf) quotient with that type component. Prove schematic
self-normalization of P before using this orbit map (ConradReductive,
Theorem 2.3.6, pp. 72–73, and Corollaries 5.2.8–5.2.9, pp. 155–157).
The Borel-type case agrees with ReductiveGroups Layer 8’s Borel scheme by
its representing property; it is not a second Borel carrier.

- Pullback of the universal subgroup represents change of base along every S′→S.
- Conjugation, quotient projection and change of a chosen parabolic commute
  with pullback and satisfy the composition laws on subgroup functors.
- The ample line is the dual determinant of the universal parabolic Lie algebra;
  arbitrary characters and their associated lines are treated separately in S3.

**Checks.**

- For GL₂ over ℤ, the Borel component is ℙ¹ and the canonical line has degree 2,
  whereas the weight-one associated line has degree 1.
- For P=G, the component is S and the quotient map has a single geometric point
  in every fibre; for a torus there is no positive-dimensional flag component.
- For the adjoint group of the Hamilton quaternion algebra over ℝ, the Borel
  component is the conic x²+y²+z²=0: it has no real point and becomes ℙ¹ over ℂ.
  A relative flag scheme need not admit a section.

For the split pinned ℤ-model of ReductiveGroups Layer 9, construct the standard
parabolics, their above quotients and the root-product charts. An ordered
inversion-root product gives a locally closed cell isomorphic to affine
ℓ(w)-space over ℤ; the cells exhaust the underlying flag space and commute
with arbitrary base change. Derive this from root multiplication and the
open big cell, followed by field Bruhat on every geometric fibre
(ConradReductive, Theorem 5.1.13, p. 143; ReductiveGroups Layer 7).
This is a stratification, not an isomorphism from the disjoint union of cells.
S2 constructs the contracted products over ℤ and then their base changes;
S5.6 proves closure base change without using it as a premise here.

- Cell charts, their inverses on their images and parabolic projections retain
  the chosen normalizer representatives and right-coset convention.
- Base change preserves the charts and their root-coordinate transition maps,
  including over nonreduced bases and at primes 2 and 3.
- Twisted models descend the quotient and its maps, without asserting that
  individual split cells descend when their indices are permuted.

**Checks.**

- On ℙ¹ the closed cell has one point and the open cell has q points over 𝔽_q;
  for q=2,3 their totals are 3,4, not 2 and not an affine-line count.
- For GL₃’s complete flag the cell lengths are 0,1,1,2,2,3; their 𝔽₂-point
  total is 1+2+2+4+4+8=21. A maximal partial flag gives 1+2+4=7 instead.
- Over ℤ[ε]/(ε²), the open rank-one chart is Spec(ℤ[ε][z]/(ε²)); ε remains
  nonzero although each geometric fibre is reduced.

*Needs:* ReductiveGroups Layers 7–9 (parabolics, relative descent and split
pinned groups); SchemeAndStackFoundations Layer 1 (scheme gluing and descent).

### 1.1 Finite-locally-free flags and incidence

1. For a finite locally free E/S and a strictly increasing admissible rank list, construct the universal relative flag with subbundles F_i and locally free quotients as the closed incidence subscheme of the product of ModularCurves §0G quotient Grassmannians. Export empty/single/full flag comparisons, tautological exact sequences, tensor/exterior/determinant pullbacks, forgetful maps, refinement-parameter schemes, annihilator flags in E*, and arbitrary base change. An opposite flag in E needs the displayed splitting/pairing or opposite-Borel data; no canonical opposite/refinement of an arbitrary flag is assumed. Cut out that closed immersion by the vanishing of the universal maps F_i→E/F_j for i<j; prove that the source's coordinate model and forgetful/refinement maps identify with those same maps. The product is an ambient space, not the flag itself. On a chosen splitting, compare these sheaf maps with polynomial matrix incidence equations.

- The universal incidence equations represent nested locally direct summands;
  their functor of points identifies the immersion with the flag functor.
- Forgetting ranks, pulling back E and taking annihilators preserve the
  incidence equations, tautological exact sequences and quotient ranks.
- Iterated Grassmannian presentations give smooth projective flag bundles;
  refinement is a flag bundle of the specified successive quotients.

**Checks.**

- The empty rank list gives S; a single rank r gives the quotient-rank N−r
  Grassmannian, so ranks 0 and N give S rather than an empty scheme.
- In rank 3 with ranks (1,2), the product has dimension 2+2=4, while the flag
  has dimension 3: the scalar incidence equation is essential.
- Over k[ε]/(ε²), the line generated by e₁+εe₃ and plane spanned by e₁,e₂
  give incidence value ε≠0. Their reduced points are nested, but the two
  subbundles do not form a flag; testing only geometric points loses the ideal.

*Needs:* ModularCurves §0G; AlgebraicVectorBundles tensor/dual sheaves;
SchemeAndStackFoundations Layer 1 closed immersions and base change.

### 1.2 Root-cell and classical-coordinate comparisons

2. Use S1.0’s Par_t(G), actual G/P− and integral root-coordinate charts. Construct the full source-to-model dictionary: standard and opposite cells, minimal coset representatives, chosen normalizer representatives, T-fixed points, inversion sets, relative dimension and parabolic projection. The left/right quotient map is P−g↦g^−1P− and on Weyl indices W_Pw↦w^−1W_P; prove its root-coordinate and associated-line character formulas before using the source's left-coset statements. The fixed scheme is the finite disjoint union of the indicated sections in the split model; do not identify a general twisted form with that split list. Use actual root subgroup multiplication and quotient universal properties, not merely the cardinality of the Weyl group. Include rank-zero groups, P=G, empty root systems and nontrivial central tori.
3. In typeA, compare row/column conventions, a rank-r subspace with quotient rank N−r, one-based pivots p₁<⋯<p_r and actual zero-based `Fin N` coordinates p_i−1. The increasing basis flag has dim(V∩F_j)=#{i:p_i≤j}; cell dimension is Σ_i(p_i−i). For the rectangle partition λ_i=N−r+i−p_i, this is r(N−r)−|λ|. Rank0/full rank are points and r>N is empty. For N≤1 use the direct point/empty cases, without an A₀/A_(−1) root reference.
4. Construct the determinantal rank-condition schemes relative to an actual complete subbundle flag; compare them with S5.6’s Schubert closures on S1.0’s locally split integral flag model, after that closure comparison has been proved. Give their universal ideals, restrictions, saturation/homogeneous presentations, base change and cell decompositions. Two or more arbitrary relative flags give well-defined incidence schemes but not automatic flatness, expected codimension or smooth resolutions. State and prove each such conclusion with its actual versality/transversality/regular-sequence assumptions.
5. Retain the symplectic exercise: for a nondegenerate alternating form, prove dim U≤m for isotropic U⊂k^(2m), and construct the isotropic Grassmannian as the universal zero locus of the restricted form on the tautological bundle. Compare its split group quotient, transitivity, parabolic stabilizer and dimension r(2m−r)−r(r−1)/2, including characteristic2 with an actual alternating form. Rank0 is a point and r>m is empty. Distinguish orthogonal characteristic2/non-smooth stabilizer issues. General root-type flag examples use the actual corresponding reductive model.


   **Symplectic stabilizer in the exercise coordinates.** For 0≤r≤m put
   s=m−r and take the source form
   `Q_src=[[0,H_m],[−H_m,0]]`, where H_m has ones on its antidiagonal.
   In one-based coordinates set u_i=e_i and f_i=e_(2m+1−i).
   Let C have ordered columns
   `(u_1,...,u_r; u_(r+1),...,u_m,f_(r+1),...,f_m; f_1,...,f_r)`.
   Prove `Cᵀ Q_src C=J_(r,s)`, where
   ```
   J_(r,s) = [[0,0,I_r],[0,J_0,0],[−I_r,0,0]],
   J_0     = [[0,I_s],[−I_s,0]].
   ```
   Give the actual permutation/reindexing maps to `Fin (2*m)` and the
   sum-indexed native symplectic carrier. The native
   `Matrix.J`
   is `[[0,−I],[I,0]]`; prove the global-negation and permutation comparisons,
   using `SymplecticGroup.mem_iff'` for the column-action equation.

   In these coordinates prove that the stabilizer P_r of
   `U=span(u_1,...,u_r)` consists exactly of the block upper-triangular
   symplectic matrices for block sizes (r,2s,r). Preservation of U forces
   preservation of U-perp=U⊕W_0. Construct the Levi homomorphism
   `l(A,D)=diag(A,D,A^(−T))`, with A∈GL_r and D∈Sp(W_0,J_0),
   and the unipotent matrices
   ```
   u(Y,Z) = [[I_r,YᵀJ_0,Z],[0,I_(2s),Y],[0,0,I_r]],
   Y : Matrix (Fin (2*s)) (Fin r) k,
   Z : Matrix (Fin r) (Fin r) k,
   Z−Zᵀ = YᵀJ_0Y.
   ```
   Prove every element of P_r has a unique factorization u(Y,Z)l(A,D),
   with inverse coordinate extraction from its blocks. Export the laws
   ```
   (Y,Z)(Y',Z') = (Y+Y', Z+Z'+YᵀJ_0Y'),
   (Y,Z)⁻¹      = (−Y,−Zᵀ),
   l(A,D)u(Y,Z)l(A,D)⁻¹ = u(DYAᵀ,AZAᵀ).
   ```
   Identify this kernel as the unipotent radical and construct the split
   projection P_r→GL_r×Sp_(2s), its section and the resulting semidirect
   product on the existing group-scheme/point carriers. Prove the block
   maps and their equations commute with field extension and base change.
   Since YᵀJ_0Y is alternating, choose its strictly upper-triangular part
   Z_0, with `Z_0−Z_0ᵀ=YᵀJ_0Y`; then Z−Z_0 is symmetric.
   This gives affine coordinates of dimension `2sr+r(r+1)/2` on the
   unipotent radical in every characteristic. No division by2 is used.
   Recover the isotropic-Grassmannian dimension above from this stabilizer.
   At r=0 obtain P_0=Sp_(2m) and trivial radical; at r=m obtain
   GL_m acting on the additive symmetric matrices by Z↦AZAᵀ.
   Compare this positive-coordinate parabolic with the roadmap's negative
   quotient convention by its pinned opposition map before assigning a
   root subset or Schubert index.

### Examples

For Gr(2,4), pivots (1,2), (1,3) and (3,4) have dimensions 0, 1 and 4. The empty and full subspaces each give one point. For a symplectic four-space the Lagrangian rank is 2 and its isotropic Grassmannian has dimension 2(4−2)−2(2−1)/2=3.

### Dependencies

ModularCurves §0G; ReductiveGroups Layers 7–9; SchemeAndStackFoundations Layer 1 descent and closed subschemes. S1.4’s closure identification additionally uses S5.6; the incidence construction itself does not.

## Layer 2: All-word Bott–Samelson and crank interfaces (S2)

1. For each simple root use the actual minimal parabolic P_i− and projection G/B−→G/P_i−. For X→G/B− construct the right crank X×_(G/P_i−)G/B−, a P¹-bundle over X; construct the left crank P_i−×^(B−)X, an X-bundle over P¹, with its map to G/B− when X is a B−-space. Distinguish the two projection directions, group actions and universal properties. The right projection is smooth proper of relative dimension1; if X is smooth/proper over k, so is its total space in the corresponding assertion. The left construction is locally an X-bundle over P¹ and inherits smoothness/properness over k when X has that property. Export their base-change and equivariance laws; no absolute properness is asserted for an arbitrary nonproper X.
2. For every finite word i₁…i_r, including empty and nonreduced words, construct the integral iterated-rank-one model as the contracted product P_i₁−×^(B−)…×^(B−)P_ir−/B−. Construct its quotient charts, scheme structure, iterated P¹-bundle maps, universal flag-chain description and multiplication map π to G/B−. Fix factor order and compare the crank order used in the handout. Prove dimension r, smoothness/properness, the B−/T actions, and base-change compatibility. No reducedness of the word is required for these constructions.
3. Construct subword closed embeddings, the 2^r T-fixed sections and the image of each indexed subword. For ε∈{0,1}^r put w_j=s_i₁^(ε₁)⋯s_ij^(ε_j). Prove tangent weights β_j=(−1)^(ε_j)w_(j−1)α_ij from the actual successive rank-one charts; the fibre of π*Lλ has weight w_rλ. For reduced words, identify the open product of root parameters with C(w) and prove π proper birational onto X(w), isomorphic on that open cell. Prove the subword/Bruhat criterion from the existing Coxeter exchange/deletion floor and these actual maps; do not infer an isomorphism from a mere bijection of fixed points. A proper fibre can be nonreduced even when its underlying set is one point.
   **Images for every word.** For Q=(i₁,…,i_r), define δ(Q) by δ(∅)=e
   and δ(Qi)=max(δ(Q),δ(Q)s_i) in the fixed right-word convention. Prove
   that the actual scheme-theoretic image of π_Q is X(δ(Q)), using the
   rank-one cell multiplication and induction, with its reduced closure
   and field/base-change comparison. Do not substitute the ordinary group
   product of the letters. At Q=(i,i), the image is X(s_i), not X(e);
   at the empty word it is the identity flag. Reduced words recover item3.
   Keep the all-word map distinct from a reduced-word birational resolution.

4. Construct generalized words with parabolic letters and their longest elements, refinement/unrefinement maps and composites. Prove the needed reduced-word comparisons by finite zigzags of refinements and unrefinements from actual Coxeter braid/length data. Ordinary reduced words121 and212 have no further simple-letter refinements, so no single common word refinement is assumed. The resulting diagrams/correspondences are over the flag; a braid move is not asserted to give an isomorphism of the two word schemes. A parabolic longest element reverses the positive subsystem; it need not fix the other simple roots or negate every simple root individually. Give rank-two braid and nonreduced examples.
5. Compare the complex scheme with the compact model using the actual rank-one group T·SU₂α and its finite central quotient, not an unconditional product SU₂×T^(rank−1). Consume the compact rank-one root representatives from LieGroups. Export full groupoid/functorial chart, bundle and projection comparisons, then compare the typeA finite characteristic maps with TopK's existing normalization. Generic word geometry here does not become an extra premise for TopK's finite CW construction.

### Examples

The empty word has dimension 0 and one fixed section. One simple reflection gives ℙ¹ with two fixed sections of tangent weights α and −α. The word ii has dimension 2 and four fixed sections but image of dimension 1, so its image map is not birational.

### Dependencies

S1.0–2 and ReductiveGroups Layers 7–9 for rank-one parabolics; scheme fibre products and associated-bundle descent.

## Layer 3: Line bundles, sections and rank-one push-pull (S3)

1. Construct L(λ) on the supplied quotient by descent, with its actual linearization, local transition functions and sections. Prove tensor L(λ+μ), dual, pullback, associated-bundle and field/base-change laws. Characterize descent to P− by the Levi pairings and its actual group characters. Prove ampleness for strict positivity on the complementary simple roots and global generation for dominance; a character not in the original lattice is handled only after the specified cover/flag comparison.
   **Equivariant lines and the fibre inverse.** Over the stated field k,
   construct the equivalence between the groupoid of G-linearized invertible
   sheaves on G/B− (with G-equivariant isomorphisms) and the groupoid of
   one-dimensional rational B−-modules (with B−-linear isomorphisms).
   The fibre functor takes E to E_(eB−), with its actual stabilizer action;
   its inverse is the associated-line construction above. Construct the unit
   v↦[1,v] and the counit [g,v]↦g·v, proving independence of the quotient
   representative, regularity and both inverse and triangle identities by
   descent on the supplied quotient charts. Prove full faithfulness on the
   actual isomorphism spaces, naturality, and compatibility with tensor,
   dual, the trivial line and field extension. This is the homogeneous
   application of the existing associated-bundle/descent machinery, with
   its actual G action; it does not replace that machinery.

   Prove that every algebraic character of B− is trivial on its unipotent
   radical and factors uniquely through T. Thus isomorphism classes of
   these specified G-linearized lines are X*(B−)≃X*(T), with fibre character
   λ for L(λ); retain the scalar automorphisms in the groupoid rather than
   replacing it by a discrete category of weights. A Lie functional in t*
   is not a group character without the actual lattice/integration condition.
   Give the same fibre/associated-line equivalence for G/P− and rational
   characters of P−, and compare restriction to T with precisely the zero
   Levi-coroot-pairing condition already specified above.

   Construct the forgetful map to the ordinary Picard group and its tensor
   laws. Prove that two G-linearizations on the same underlying line differ
   by a unique character of G: use H⁰(G/P−,O)=k and the linearization cocycle
   to identify their fibrewise ratio, and prove its regular dependence on G.
   In particular identify the kernel of forgetting with the restrictions
   of X*(G) inside X*(P−). Do not assert that every ordinary line admits a
   G-linearization. For a root-free torus the flag is a point, so all its
   characters give the same underlying ordinary line with different
   linearizations; the zero character gives the equivariantly trivial line.

2. Construct the regular-function realization ∇λ from the rational representation supplier and the natural section map. Prove its inverse on quotient charts. On the full flag and dominant λ, compare it with the canonical Weyl/induced pair. On X(w), define sections geometrically and identify the dual of restriction with the actual B−-span in Δ(κ), κ=−w₀λ, generated by the extremal vector of weight−wλ. Prove this comparison using the normalized pairing and the actual section-extension theorem of S5. For λ ample on G/P_λ, prove that inclusion of the corresponding geometric Schubert varieties is equivalent to inclusion of these actual extremal-span modules, using the extremal-weight/subword criterion. On walls compare the correct cosets in W/W_λ; a line contracted by the parabolic projection cannot detect distinct full-flag indices. Convert to positive-Borel Demazure modules using pinned contravariant duality/opposition; ordinary dualization alone changes λ.
3. For every integer m, specialize SchemeAndStackFoundations §2.6's projective-space cohomology to H⁰/H¹(P¹,O(m)), and construct its actual rank-one T-weight, functoriality, residue/Serre pairing and zero-case comparisons. Build the relative P¹ pushforward and higher-direct-image comparison on the actual rank-one bundle. Define the integral Demazure Euler operator by finite signed root strings. For dominant string length m=⟨λ,α_i∨⟩≥0 it gives Σ_(j=0)^m e^(λ−jα_i); for m=−1 it is0, and for m≤−2 use the negative H¹ string. Prove its localization identity D_i(eλ)=(eλ−e^(−α_i)e^(s_iλ))/(1−e^(−α_i)).
   **Positive-denominator convention.** Also construct the source operator
   Δ_i(p)=(p−e^(α_i)s_i(p))/(1−e^(α_i)) on the integral group ring of the
   actual character lattice. With weight inversion ι(eλ)=e^(−λ), prove
   Δ_i=ιD_iι. Define it integrally before localization: for
   m=⟨λ,α_i∨⟩, it sends eλ to Σ_(j=0)^(−m)e^(λ+jα_i) when m≤0,
   to0 when m=1, and to −Σ_(j=1)^(m−1)e^(λ−jα_i) when m≥2.
   Prove these finite strings give the displayed rational identity and
   independence of a presentation. In particular they prove divisibility
   over ℤ without an analytic removable-pole argument. For
   N=p−e^(α_i)s_i(p), the exact identity is s_i(N)=−e^(−α_i)N,
   rather than unweighted antisymmetry. Deduce s_iΔ_i(p)=Δ_i(p),
   Δ_i²=Δ_i and the braid comparisons by the actual inversion conjugacy.

   Compare the source's positive-Borel/left-crank convention with the
   current negative-Borel/right-word one through S1's inversion and S3's
   associated-line/opposition maps. In particular left multiplication
   s_iw becomes w⁻¹s_i after inverting the Weyl index; retain the actual
   character inversion and longest-representative fibre factors as well.
   For the source's left-crank map, compute the two base fixed fibres with
   their actual bundle lift, obtaining Δ_i. Use S5's cohomological comparison
   to pass from Euler character to H⁰ in the dominant case. If the next
   Demazure product is unchanged, the same comparison proves that Δ_i fixes
   the corresponding character; at the longest word each simple operator
   fixes the result, hence it is Weyl invariant. The character formula and
   its exercises use these maps, not a guessed sign or an assumed equality
   of the two Borel conventions. This late geometric comparison is not a
   prerequisite for the separate early Laurent/Haar proof of the formula.

   The signed-string operator's API is ℤ-linearity, the finite-string
   formula, the localization identity and inversion conjugacy with Δ_i.

   **Checks.**

   - For pairing m=0, D_i(eλ)=eλ, with augmentation 1.
   - For m=−1, D_i(eλ)=0; retaining either endpoint would give augmentation 1.
   - For m=−2, D_i(eλ)=−e^(λ+α_i), with augmentation −1;
     replacing Euler cohomology by H⁰ would incorrectly give 0.

   *Needs:* SchemeAndStackFoundations §2.6's projective-line cohomology;
   S1's rank-one quotient; S3.1's line convention; the group ring of the
   actual character lattice. The finite-string algebra is independent of S5;
   only the geometric H⁰ interpretation needs S5's vanishing.

4. Prove D_i²=D_i, the finite braid relations and word-independence for the required push-pull operators, keeping Euler classes distinct from individual H⁰ outside the vanishing range. For dominant λ, S5 supplies the actual no-higher-cohomology/pullback comparison needed to identify char H⁰(X(w),Lλ)=D_i₁…D_ir(eλ). Prove wall/Levi and longest-word cases, including the full Weyl character formula at characteristic0 and the induced/Weyl formal character in characteristicp. Do not replace a positive-characteristic induced module by a simple module.
5. Construct coordinate maps for the complete linear system and the extremal-line orbit, and prove their scheme-theoretic comparison. Basepoint freeness and injectivity on geometric points do not prove a closed immersion in characteristicp. Own the exact stabilizer/separability and closed-immersion argument for the chosen canonical model; for a general highest-weight representation state the actual stabilizer conditions. Test the SL₂ Frobenius representation, where the orbit map can be purely inseparable.

### 3.6 A₂ signed-string character calculation

As a worked test of the integral operators and the geometric comparison,
compute the dominant SL₃ weight λ=2ω₁+5ω₂ using both reduced words121
and212. Fix α₁=ε₁−ε₂ and α₂=ε₂−ε₃. Use the GL₃ lift (7,5,0),
whose restriction has this SL₃ highest weight, and write e^(a,b,c) for its
weight monomials. All weights have a+b+c=12; this slice gives distinct
representatives modulo the diagonal SL₃ character relation. Start at the
lowest monomial χ₀=e^(0,5,7) and use S3.3's positive-denominator Δ_i.

Prove the two first stages explicitly:

`χ₁=Δ₁χ₀=Σ_(j=0)^5 e^(j,5−j,7)`,

`χ₂=Δ₂χ₁=Σ_(j=0)^5 Σ_(k=0)^(j+2) e^(j,5−j+k,7−k)`.

Their augmentations are6 and33, and every displayed weight has
multiplicity1. Collect the signed strings of χ₃=Δ₁χ₂: its coefficient
at (a,b,c) is zero unless a+b+c=12 and 0≤a,b,c≤7; on that support it is

`1+min{2,a,b,c,7−a,7−b,7−c}`.

Thus there are46 weights:21 of multiplicity1,15 of multiplicity2 and10
of multiplicity3, giving dimension81. In particular the zero SL₃ weight,
represented by (4,4,4), has multiplicity3. Compare this actual group-ring
character with the Weyl and induced formal characters of highest weight λ
from the rational-representation supplier; identify the geometric section
modules through S3.3's explicit inversion/opposition maps. Independently
compare the typeA Gelfand–Tsetlin character: enumerate interlacing rows
`7≥u≥5≥v≥0`, `u≥w≥v`, of weight
`(w,u+v−w,12−u−v)`, and prove their multiplicities equal the formula above.
This is a coefficientwise comparison, not just equality of dimensions.

For the other word, set ψ₁=Δ₂χ₀, ψ₂=Δ₁ψ₁ and ψ₃=Δ₂ψ₂.
Prove the stage dimensions1,3,21,81 and ψ₃=χ₃; also prove
Δ₁χ₃=Δ₂χ₃=χ₃ and Weyl invariance on this actual character. At each step
retain the numerator identity
`(1−e^α_i)Δ_iχ=χ−e^α_i s_iχ` and its finite divisibility witness.
Negative coefficients in the flipped/shifted numerator are allowed; the
resulting Demazure characters have nonnegative coefficients. These are
explicit tests of signed-string cancellation, braid order and the
source-convention comparison, rather than an additional character engine.

### Examples

On ℙ¹ the rank-one Euler dimensions for m=0, −1, −2 are 1, 0, −1. For the A₂ weight 2ω₁+5ω₂, both word orders give dimension 81 with 46 weights, as calculated above.

### Dependencies

S1–S2; SchemeAndStackFoundations §2.6; the named rational-representation supplier. Dominant geometric section characters additionally use S5.

## Layer 4: Finite-type LS chains, root operators and section indices (S4)

1. On a fixed finite root datum build the normal path-crystal category using actual partial maps e_i,f_i:B→Option B, weight, ε_i and φ_i, their partial-inverse/weight/string identities, strict morphisms, components, tensor products with stated tie convention, and transport through actual isomorphisms. The paths below supply the objects; no classification of arbitrary abstract edge-labelled graphs is assumed from rank-one identities alone. For the actual finite root datum construct rational PL paths in X⊗ℝ starting at0 with integral endpoint, their finite rational presentations, equivalence under nondecreasing surjective PL reparametrizations, concatenation, reversal, and equality/normalization APIs. On parametrized representatives define addition of the linear central path t↦tχ for χ annihilating every coroot (equivalently W-fixed); this formula is not an operation on arbitrary reparametrization classes. S4.3 constructs the well-defined central transport on distinguished LS representatives. Remove stationary pieces and merge adjacent positively collinear segments before choosing a rational PL presentation. Prove existence of rational normalized presentations and equivalence by common rational subdivisions, with presentation-independent comparison maps; Euclidean arc lengths need not be rational. The constant path is separate. For an LS path retain its distinguished constant-speed-on-directions presentation with slopes in Wλ and prove uniqueness up to the admitted reparametrizations, including the central/zero-weight cases. Neither all rational paths nor all integral-endpoint paths form a finite crystal.
   For the path carrier, the API consists of presentation equivalence,
   reparametrization-invariant endpoints and concatenation, and comparison by
   common rational subdivisions. For the crystal, the API consists of partial
   inverse root maps, weight changes, finite string lengths and strict morphisms.

   **Checks for rational paths.**

   - The constant path has endpoint 0 and no nonzero segment; normalization
     must not divide by its total segment length 0.
   - The straight GL₂ path (t,0) and its subdivision at t=1/2 give the same
     class and endpoint (1,0); treating presentations as paths would distinguish them.
   - For the reparametrization in the worked examples, phi(1/2)=1/4:
     the shifted point (3/4,1/2) has x−2y=−1/4, while the canonical
     shifted point (1,1/2) has x−2y=0.

   **Checks for crystals.**

   - The zero-weight one-point component has no raising or lowering edges
     and both string lengths 0; a loop would violate the weight change.
   - In the SL₂ highest-weight-one string the two weights are 1 and −1:
     lowering takes the first to the second, and raising reverses it.
   - At the lower endpoint the raising string has length 1 and the lowering
     string length 0; exchanging the two lengths gives the wrong endpoint.

   *Needs:* RootSystems Layers 1–3's Weyl/Coxeter theory and Layer 6's integral root data; Mathlib finite lists and rational arithmetic; Littelmann’s path paper, §1.

2. Define running coroot heights H_i(t)=⟨π(t),α_i∨⟩ and the actual raising/lowering operators using record-decreasing/record-increasing segments, equal-height excursions and the final root translation. State the first/last cut-time and tie conventions. Prove presentation/subdivision/reparametrization independence, partial inverses and endpoint changes ±α_i. Before using simplified whole-interval reflections, prove the needed local-minimum integrality on the relevant LS components. Distinguish ambient rational formulas from the normal integral crystal identities ε_i=−min H_i and φ_i=H_i(1)−min H_i.
3. For dominant λ construct the operator component B(λ) of the straight path. Encode it by decreasing cosets τ₁>⋯>τ_s in W/W_λ and rational breaks0=a₀<a₁<⋯<a_s=1. For each internal break a_j require an a_j-chain: a saturated decreasing Bruhat chain of orbit weights ξ₀=τ_jλ,…,ξ_l=τ_(j+1)λ, ξ_h=s_βh ξ_(h−1), β_h positive, ⟨ξ_(h−1),β_h∨⟩<0 and a_j⟨ξ_(h−1),β_h∨⟩ integral. Prove this condition is equivalent to the generated-path definition, with merged repeated directions and the correct coset Bruhat order. Prove finiteness from finite W and bounded break denominators, operator stability, weight/string formulas and a unique highest path. Include λ=0, chamber walls, nontrivial central characters and empty root systems. For a W-fixed character a∈X, let B(μ)^a have weight wt+a and the same root operators and string data; prove it is a normal crystal. For W-fixed χ,σ∈X, construct a strict crystal isomorphism T(λ,χ;σ):B(λ)^(σ+χ)→B(λ+χ)^σ. Its underlying path function is independent of σ; σ=0 gives central transport from the weight-twisted B(λ). First prove that an LS class has a unique parametrized representative whose slopes lie in Wλ, after equal adjacent directions are merged; λ=0 uses the constant representative. Apply π(t)↦π(t)+tχ to that representative, so each slope becomes wλ+χ=w(λ+χ). Prove the unchanged simple-coroot heights give the same operator cut times and root actions. Prove the strict-map identity T(λ,0;σ)=id, the additive composition law T(λ+χ,ψ;σ)∘T(λ,χ;σ+ψ)=T(λ,χ+ψ;σ), and the inverse formula (T(λ,χ;σ))^−1=T(λ+χ,−χ;σ+χ), for all central χ,ψ,σ. These offsets make each displayed source, intermediate object and target identical as weighted crystals. Include λ+χ=0, pure central weights and the empty root system. Do not apply the same pointwise formula to an arbitrary representative of the ambient path quotient.
   First export the reflection/order test on the actual quotient W/W_λ. For a positive root β and an orbit weight uλ, negative pairing ⟨uλ,β∨⟩ gives s_βu<u, positive pairing gives s_βu>u, and zero pairing gives the same weight and coset. Compare the minimal quotient representatives, not arbitrary W labels for equal weights. A weak inequality does not give a strict comparison on a chamber wall.

   For comparable u≥v in this quotient define the positive cover bond b_λ(x,y)=−⟨xλ,β∨⟩=⟨yλ,β∨⟩ when x>y is a cover and yλ=s_βxλ, β positive. Prove existence and uniqueness of its positive root label and integrality/strict positivity of the bond. For a saturated chain C from u to v, let d(C) be the gcd of its bonds. Construct the chain-independent interval gcd d_λ(u,v), with the empty-chain convention d_λ(u,u)=0. Give its combinatorial proof before S5: construct maximal-chain connectivity by rank-two intermediate replacements in every parabolic Bruhat interval using a reflection/deletion-order shelling or an explicit chain-sorting induction from RootSystems' exchange/deletion API; then prove equality of the two local bond gcds for each actual rank-two interval with two intermediates. Carry the actual conjugated root/coroot labels and λ through the A₁×A₁, A₂, B₂/C₂ and G₂ calculations, including singular quotient cases. Some quotient rank-two intervals have only one intermediate; no alternative chain is assumed there. These connectivity and arithmetic lemmas are construction targets here, not assumed consequences of Matsumoto or of abstract diamond shape. Gcd associativity then propagates local equality along the chain moves. Extend the same edge-integrality definition of a saturated a-chain to every rational a; actual internal LS breaks still require 0<a<1. For a=p/q in lowest terms with q>0, prove that one saturated a-chain exists iff q divides d_λ(u,v) iff every saturated chain from u to v is an a-chain. Use the native finite-gcd divisibility API and coprime denominator cancellation. Incomparable endpoints have no chain and are outside this comparable-interval gcd API. Keep actual coroots in nonsimply-laced types. Central translation leaves stabilizers and bonds unchanged; zero/pure-central weights and empty root systems give a singleton quotient. This proof uses no Schubert divisor, vanishing or SMT premise. S7 subsequently compares the already-defined bonds with its geometric multiplicities.

   Prove the convexity API for the distinguished LS representative: π(t)∈t·Conv(Wλ), or equivalently π(t)/t∈Conv(Wλ) for 0<t≤1; at t=0 prove π(0)=0 directly. Write π(t) as the finite sum of its elapsed nonnegative segment durations times slopes in Wλ, with total duration t, and apply the native `Convex.sum_mem`, `subset_convexHull` and `convex_convexHull` APIs to the normalized durations. If 0∈Conv(Wλ), deduce π(t)∈Conv(Wλ); in semisimple finite type establish this premise by averaging the orbit. A nonzero pure central λ has orbit {λ} and π(t)=tλ, so the unscaled containment is not asserted for an arbitrary reductive weight. This parametrized formula concerns the distinguished representative; the unparametrized path image has the corresponding representative-independent containment when its premise holds.

4. Construct the generic finite-type character/component theorem, not just its typeA specialization. Prove the root-operator word-distance bound, linked-path subdivision/gluing lemmas and positive-integer stretching required to compare arbitrary dominant rational PL paths of endpoint λ with the straight component. Prove the tensor-component theorem and translated-chamber multiplicity rule, including the actual tensor-factor convention. Derive the formal Weyl/Demazure characters from these finite sets and the rational representation supplier. In characteristic0 compare with simple rational modules; in characteristicp compare the formal Weyl/induced characters, which need not be the simple L(λ) characters; a crystal graph indexes weights and partial root operators, without asserting that actual Lie generators are single-target on a weight basis. Construct the distinct simple-generator and all-root tests in S4.4a below; the adjoint SL₃ module distinguishes their strengths.

   **S4.4a. Actual simple-generator weight bases.** State the distinct assertions with their maps: a weight basis has each pinned simple lowering F_i send every basis vector to zero or a scalar times one basis vector; requiring both E_i and F_i is stronger, and requiring all root operators is stronger again. These are assertions about actual module endomorphisms. They are not the partial root maps on a crystal's index set. Own the following concrete finite-type comparison and its usable coefficient, kernel, weight, word and change-of-scalar API here. It uses native polynomial/linear-map/submodule constructions and the earlier tensor/dual representation dictionaries from ClassicalGroups and LieHighestWeight; it uses no geometric section basis, Schubert vanishing, canonical-basis theorem or assertion that a crystal graph lifts to monomial Lie matrices.

   Work over a characteristic-zero field k, with the source specialization k=ℂ, V=k³, and R=k[x₁,x₂,x₃,y₁,y₂,y₃]. The x variables represent V and the y variables V*. Construct the actual GL₃ action on R and the comparison R_(2,1)≃Sym²(V)⊗V*, with its inverse on monomials, equivariance, scalar-extension and normalization laws. In an abstract symmetric-tensor contraction, explicitly compare its scalar to the polynomial differential contraction. Define T=R_(2,1) by the native weighted-homogeneous submodule of bidegree (2,1), C=Σ_i∂x_i∂y_i:T→R_(1,0), and M=ker C. For E_ab use D_ab=x_a∂x_b−y_b∂y_a. Prove all gl₃ commutator equations, invariance of bidegree, C D_ab=D_ab C on the indicated graded pieces and hence stability of M. Export restrictions to sl₃ and its diagonal Cartan, not an unrelated abstract module with the same dimension. Give the18 monomial coordinates, the3×18 contraction matrix and its exact rank3; for example C(x_i²y_i)=2x_i. Construct explicit kernel coordinates, coefficient/extraction maps and inverses, proving dim M=15.

   The acceptance theorem is `no_singleTargetLowerings`, for every field k
   of characteristic zero and every basis index type. Its four supporting
   definitions are `contractionKernel`, `matrixUnitAction`,
   `IsCartanWeightBasis` and `HasSingleTargetLowerings`. The first two are
   defined over every field; only the obstruction theorem assumes characteristic
   zero. The theorem is a deduction from the explicit polynomial identities
   and two-dimensional weight-space argument below.

   The contraction kernel is the intersection of the native bidegree-(2,1)
   homogeneous submodule with the kernel of Σᵢ ∂xᵢ∂yᵢ. Its API comprises:

   - Membership is exactly bidegree (2,1) and zero differential contraction.
   - Each matrix-unit action preserves this submodule.
   - In characteristic zero it has dimension 15 and commutes with extension of fields.

   **Checks.**

   - x₁²y₃ has bidegree (2,1) and contraction 0, so belongs to the kernel.
   - x₁²y₁ has contraction 2x₁, so is excluded in characteristic zero;
     in characteristic 2 its contraction is 0, excluding an unstated characteristic-free obstruction.
   - The polynomial 1 has contraction 0 but bidegree (0,0), so is excluded;
     the zero polynomial belongs, as it does to every homogeneous submodule.

   The matrix-unit action has source and target the six-variable polynomial
   module, with formula D_ab=x_a∂x_b−y_b∂y_a. Its API comprises:

   - D_ab is k-linear, preserves bidegree and commutes with contraction.
   - The commutator is [D_ab,D_cd]=δ_bc D_ad−δ_da D_cb.
   - On bidegree (2,1), the sum of the three diagonal actions is the identity.

   **Checks.**

   - D₂₁(x₁²y₃)=2x₁x₂y₃, fixing the lowering direction.
   - D₂₁(y₂)=−y₁, fixing the contragredient sign.
   - D₁₁(x₁²y₃)=2x₁²y₃, whereas D₃₃(x₁²y₃)=−x₁²y₃;
     the diagonal sum is therefore the original polynomial, not zero.

   The Cartan-weight-basis predicate requires each basis vector to be an
   eigenvector for D₁₁−D₂₂ and D₂₂−D₃₃, with eigenvalues in k. Its API comprises:

   - No integral weight labels are assumed; characteristic zero and the
     monomial decomposition imply the integral GL₃ labels on this carrier.
   - Rescaling a basis vector by a nonzero scalar preserves its eigenvalues.
   - Equivariant linear isomorphisms transport the simultaneous-eigenvector condition.

   **Checks.**

   - x₁²y₃ has eigenvalues (2,1), from GL₃ weight (2,0,−1).
   - A−B has weight (0,0,1) and eigenvalues (0,−1); multiplying it by 2
     leaves these eigenvalues unchanged in characteristic zero.
   - x₁²y₃+(A−B) is not a first-Cartan eigenvector: its two coefficients
     would require the same eigenvalue to be both 2 and 0.

   The single-target condition requires, for each of the two lowerings and
   each basis vector, a scalar and one target basis index. Its API comprises:

   - Coefficient zero permits zero images without a nonzero-edge hypothesis.
   - Nonzero rescaling of basis vectors or either lowering preserves the condition.
   - A nonzero chronological word image starting on a basis line stays on a basis line.

   **Checks.**

   - In the natural rank-one string, F(x₁)=x₂ and F(x₂)=0 both meet the
     condition; demanding a nonzero coefficient would reject its last vector.
   - The zero vector has zero image, while the highest vector of this kernel
     has nonzero F₁ image 2x₁x₂y₃; replacing F₁ by the zero map changes the object.
   - The words 1122, 1212 and 1221 give first-two-coordinate determinants
     16, 32 and 16 in a plane of dimension 2, contradicting three target basis lines.

   *Needs:* Mathlib `MvPolynomial.weightedHomogeneousSubmodule`,
   `MvPolynomial.pderiv`, `LinearMap.ker`, `Module.Basis`; the polynomial
   highest-line and word identities of this subsection.

   The highest vector is v=x₁²y₃ of GL₃ weight (2,0,−1). Put F₁=D₂₁=x₂∂x₁−y₁∂y₂ and F₂=D₃₂=x₃∂x₂−y₂∂y₃, with E₁=D₁₂ and E₂=D₂₃. Prove v≠0, v∈M and E₁v=E₂v=0. Construct the monomial weight decomposition and prove M∩ker E₁∩ker E₂=kv, not merely that v is one highest vector. Construct a15-element independent spanning selection from actual F₁/F₂ words on v, with exact coefficients and mutually inverse linear coordinate maps; there is no claim that all such word vectors form a basis. Deduce irreducibility constructively: a nonzero invariant submodule decomposes into these actual finite weight spaces by polynomial spectral projections of the commuting diagonal operators; a maximal weight in its support for a functional positive on the simple roots yields a nonzero common E-kernel vector. That line is kv, and the explicit lowering spanning result forces the submodule to be M. Compare, after this construction, with the existing highest-weight module of sl₃ weight 2ω₁+ω₂ and GL₃ weight (2,0,−1). Highest-weight classification and the Weyl dimension formula are comparisons, not substitutes for the kernel, cyclicity or linear-independence maps.

   Retain the full central weight: D₁₁+D₂₂+D₃₃ acts as1 on T. Prove the two sl₃ diagonal differences determine the GL₃ weight on this fixed-central-weight carrier. Every sl₃ weight basis therefore lies in the actual monomial-weight decomposition; integrality of the GL₃ labels is a conclusion from that decomposition, not an extra hypothesis imposed on a proposed basis. At μ=(0,0,1), construct the exact weight-space equality
   `M_μ={aA+bB+cC₀ : a+b+2c=0}`,
   where A=x₁x₃y₁, B=x₂x₃y₂ and C₀=x₃²y₃. Prove A,B,C₀ are independent in the ambient polynomial ring, and the displayed kernel plane has dimension2. Distinguish C₀, a monomial, from the contraction C.

   Words are chronological from left to right:1122 means F₂(F₂(F₁(F₁v))). Compute as polynomial equalities
   `1122(v)=−8B+4C₀`,
   `1212(v)=2A−6B+2C₀`,
   `1221(v)=4A−4B`.
   Prove each is nonzero, belongs to M_μ, and every pair is linearly independent: their first-two-coordinate determinants are16,32,16. They satisfy1122(v)−2·1212(v)+1221(v)=0, so no claim of three independent vectors in dimension2 is made. Give the argument for every proposed weight basis: the one-dimensional highest-weight space forces v to be a nonzero scalar times a basis vector; successive single-target F_i maps then force each nonzero word image to be a basis line. The three pairwise distinct lines inside M_μ contradict its dimension2. Thus even the simple-lowering-only assertion fails; the versions also demanding simple raising or all roots fail a fortiori. The zero outputs in the single-target condition are explicitly allowed. The zero/trivial module, rank-one strings and modules that do admit such bases are not asserted to fail. Prove transport of these conditions under actual module intertwiners and changes of coefficient field. Rescaling the two pinned simple lowerings by nonzero a,b multiplies all three displayed words by the same a²b², so the obstruction is independent of that rescaling. The rational coefficient construction extends to every characteristic-zero field; no positive-characteristic conclusion is inferred, since the displayed coefficients and ranks can change there.

   Separately construct the adjoint sl₃ regression in its native trace-zero matrix carrier. The six off-diagonal E_ab together with H₁=E₁₁−E₂₂ and H₂=E₂₂−E₃₃ are a weight basis and every E₁,E₂,F₁,F₂ adjoint action sends a member to zero or one scalar multiple of another member; give all32 brackets. This basis refutes using the adjoint module as a simple-generator counterexample. For the all-root condition, the opposite root pairs force the three distinct Cartan lines kH₁,kH₂,k(H₁+H₂) in a two-dimensional space, so no weight basis can satisfy it. Prove that latter assertion by forced lines for an arbitrary weight basis, rather than only failure of this displayed basis. These polynomial and adjoint calculations are independently specified examples; they do not identify an unspecified path diagram. The ordinary LS/path character, tensor and geometric-section programmes of S4–S9 are retained with their existing owners and order.

5. Construct fixed-chain simplices and their face identifications after equal adjacent directions are merged. The finite LS set is the subset satisfying the break-chain integrality conditions; it is not the whole continuum of a simplex. Give the six-vertex S₃ Bruhat-chain complex and its four maximal tetrahedra, distinguishing this realization from the fixed-λ finite path set. The type-A root-datum specialization is S9.5, after the generic construction. No concrete tableau theorem is a premise of this generic component theorem.
6. After S5 and the divisor calculation S7.1–2, construct geometric path sections in all tensor degrees and their defining-chain API. Use the Schubert poset, extremal sections and the actual codimension-one valuations with Chevalley bonds to build the chain-indexed LS lattice/filtration. Prove the normalized leaves are one-dimensional and identify their indices and character count with S4.1–5. Construct sections lifting those leaves and prove triangular spanning/independence, reduced-word compatibility, weight and restriction support. This is the geometric finite-flag filtration application, not an assumed generic quantum Frobenius/canonical-basis theorem. If a distribution/contraction model is also used for a comparison, prove its exact integral/denominator and specialization maps separately; it is not needed as an unstated premise of this geometric construction.
7. Print the opposition/dual dictionary. Set κ=−w₀λ and θ(w)=w₀ww₀. Conjugating G/B− to G/B+ by the chosen longest representative sends X(w) to the positive-Borel X(θ(w)) and pulls the positive-Borel line with fibre−κ back to L(λ), with the actual linearization comparison. In the positive-Borel convention, LS path sections indexed by π∈B(κ) have weight−π(1) and survive on X(θ(w)) exactly when their initial direction is≤θ(w). Transporting gives weight−w₀π(1) on the chosen X(w). For partial flags use the actual minimal-coset projection W/W_P→W/W_λ before making this comparison; do not compare indices in different stabilizer quotients as though they were equal. Prove the terminal-direction formulation in the notebooks by explicit opposition/reversal, rather than equating their untransported symbols w. The point and longest-word tests must recover the single fibre λ and the full ∇λ.

### Examples

For λ=0 the LS component is a singleton with weight 0. A pure central λ has π(t)=tλ: at t=1/2 it lies in (1/2)Conv{λ}, but not in {λ} when λ≠0. The contraction-kernel example has dimension 15 and forces three distinct lines in one weight plane of dimension 2.

### Dependencies

RootSystems finite root-data and Coxeter theory; Mathlib polynomial and submodule APIs for S4.4a; Littelmann’s path paper, §1 and its character/component theorems. S4.6–7 additionally use S5 and S7.1–2.

## Layer 5: Splitting, normality, restriction and cohomology (S5)

1. In characteristicp>0 construct the actual Frobenius module F_*O and O-linear Cartier trace on smooth root-coordinate charts. Identify Hom_O(F_*O,O) with F_*(ω^(1−p)) using the specified duality/pullback convention. On affine coordinates the normalized trace selects exponents congruent to p−1 modulo p; it is p^−1-linear over a perfect field and sends the chosen normalized anticanonical section to1. Prove independence under changes of root charts and line trivializations. Construct the section from the algebraic Steinberg module and its normalized extremal pairing before using geometric vanishing or SMT.
2. Prove the resulting splitting is compatible with every standard and opposite Schubert ideal by actual B-canonical/rank-one root-subgroup calculations and word induction. For an ideal I the required statement is σ(F_*I)⊂I, not just reducedness of its zero set. Prove closure under finite sums/intersections of compatible ideals, then conclude scheme-theoretic intersections and reduced unions in this family are reduced in positive characteristic. Item6 constructs their characteristic-zero mixed-family comparison. The rank-one, point, empty and whole-flag ideals are explicit tests. Do not infer arbitrary Richardson transversality from this reducedness statement.
3. Carry out the construction on the derived simply connected cover, where ρ and the Steinberg weight exist in the actual character lattice. Prove the induced map of flags is an fpqc quotient isomorphism and transport the splitting/ideal identities, even when the central kernel is nonreduced. No étale-cover or differential-isomorphism assumption is substituted for that quotient argument. Keep actual line linearizations when passing between isogeny types.
4. Prove normality of each Schubert variety. Construct geometrically connected fibres of the reduced-word map by the actual rank-one gallery/partial-flag induction, with the closed fibre pieces and their intersections; do not infer connectedness merely from a fixed-point count. Apply proper Stein factorization and finite normalization to prove geometric unibranchness. In characteristicp prove the needed weak-normality consequence of Frobenius purity: principal ideals are Frobenius closed, and a finite universal-homeomorphic normalization in the total fraction ring must equal the original ring. Combine this with the constructed unibranchness; splitting alone is not a normality theorem. Item6 constructs the corresponding characteristic-zero/integral comparison from the actual identified integral fibres, before using the characteristic-zero conclusions of this paragraph. Once X(w) is normal, prove π_*O_Z=O_X(w) by the actual proper birational/Stein comparison. Reduced unions need not be normal; retain their actual ideal exact sequences.
5. In positive characteristic, for dominant λ first prove H^q(Z,π*Lλ)=0 for q>0 by the actual rank-one/word splitting calculation: construct a stable splitting along a boundary-supported ample divisor, prove the required iterated splitting and tensor/pushforward maps, and combine it with nefness and Serre vanishing. Construct the ample combination with positive coefficients on every word-boundary component from the iterated projective bundles; compatibility with the reduced boundary alone is not sufficient. Deduce R^qπ_*O_Z=0 for q>0 by twisting with all sufficiently high powers of an ample line on X(w), using projection formula, coherent Leray and Serre to detect the vanishing direct-image sheaves. This deduction does not use the same direct-image theorem as its premise. Then prove H^q(X(w),Lλ)=0, restriction surjectivity from the full flag, and the same statements for finite reduced unions of Schubert varieties for one fixed Borel (or for their common opposite-Borel transforms). Compare H⁰ on X(w) and Z using the already proved π_*O statement. For ample λ use Frobenius iteration and Serre vanishing with the actual ideal sequence. For merely nef/dominant λ, including0, prove the needed parabolic projection/fibre O-cohomology and pullback comparison; ampleness is not silently assumed. Include empty unions, H⁰(point,L)=its fibre and H⁰(O_Y)=k for a nonempty common-Borel Schubert union Y. Mixed standard/opposite compatible unions retain S5.2's ideal and reducedness conclusions, but their section comparison uses the actual ideal/cohomology exact sequence and proved vanishing hypotheses. It does not assert dominant restriction surjectivity or a common-Borel path basis for every mixed union: in P¹, Y={0,∞} and λ=0 give H⁰(O_Y)=k² and the diagonal restriction k→k², with H¹(I_Y)=k.
6. Construct the integral Schubert closure and base-change comparison here. Start with S1.0’s smooth projective integral full flag F/ℤ and each smooth iterated-P¹ word model Z/ℤ of S2, their multiplication map π:Z→F and the open root-cell isomorphism; the schematic Schubert closure is not yet assumed to commute with base change. Choose λ in the actual character lattice strictly positive off the chosen parabolic, so Lλ is ample on that flag, and set A_m=H⁰(Z,π*Lλ^(⊗m)), m≥0. First prove the characteristic-p vanishing of these actual nef pullback bundles for every m≥0 by item5's stable ample-divisor splitting construction, not by splitting alone. Do the same on F. Construct derived cohomology/base-change on these smooth proper integral sources using their flat bundles, actual coherent complexes and the finite affine Čech comparison. Prove the complexes are perfect over ℤ; the positive-characteristic fibre vanishing and constant Euler ranks then give finite-free H⁰, no higher cohomology, and the required arbitrary-ring base-change maps. This step uses neither flatness nor fibre identification of a putative Schubert closure.

   Construct every restriction map H⁰(F,Lλ^(⊗m))→A_m, including m=0. Their reductions at each prime are surjective by the independently proved characteristic-p Schubert restriction and word direct-image comparisons. The cokernel is a finite ℤ-module; its reduction at every prime is zero, so it is zero. Prove this argument with the actual H⁰ base-change identifications. The resulting graded algebra map is surjective in every degree. Prove finite generation of A via its finite coherent module over the ample section algebra on F, construct Proj A and its closed immersion into F, and compare the morphism from Z given by the pulled-back ample line. Identify its scheme-theoretic image with the schematic root-cell closure using the open-cell isomorphism and the actual homogeneous kernel, not just an equality of geometric point sets. Prove A is normal from the normal integral Z and its invertible sheaf, using the intersection-of-local-valuation or total-line-space argument; hence its Proj is normal. This establishes the characteristic-zero normality needed in item4, as well as the integral fibre/section comparison. Treat partial flags with an actual ample character of their lattice and the specified projection, not an assumed fundamental weight outside that lattice.

   For the mixed standard/opposite comparison, construct its additional homological inputs on these same Schubert and opposite Schubert loci. The word boundary has affine-space complement; prove the stable ample-boundary splitting plus strong F-regularity of that regular affine complement gives global F-regularity. Push the actual Frobenius retractions through the proper word map with π_*O=O to obtain global F-regularity of field Schubert images, and prove their Cohen–Macaulay consequence at the stated F-finite/perfect-field hypotheses. Use the identified flat integral models and the precise openness/spreading comparison to obtain the characteristic-zero Cohen–Macaulay statement. Prove proper standard/opposite intersection and Tor independence in the smooth flag by the actual root-cell dimension and Cohen–Macaulay intersection calculation; construct the corresponding flat integral Richardson model and its fibre ideals before spreading reducedness to characteristic0. Finite compatible mixed unions/intersections require their actual ideal-lattice and exact-sequence/base-change induction. Neither flatness of an intersection nor base change of an arbitrary ideal intersection is assumed for free. These constructions give reducedness/ideal comparisons, not the false all-dominant mixed-union section-surjectivity theorem.

   Export the resulting finite-free section/restriction modules, saturated homogeneous ideals and arbitrary-base-change maps on these integral Schubert schemes. For common-Borel unions use their actual ideal/section exact sequences and the field restriction/vanishing theorem to construct and compare the integral union; do not normalize a reducible union or infer fibrewise reducedness from saturation alone. Establish the characteristic-zero and arbitrary-field versions of items4–5 on the identified schemes; descend geometric conclusions from perfect algebraic closures by their actual faithfully flat comparison. Construct the relative split Schubert bundles by pullback and the twisted forms by effective descent for specified torsors preserving the Schubert family and its line linearizations. Prove their fibre and cohomology comparisons using the base-change maps just constructed; no closure/base-change conclusion is a premise for the smooth-source H⁰ argument.

7. Construct the all-word coherent comparison with the actual image
   X(δ(Q)) from S2, including nonreduced Q. Use the reduced-word instances
   of items4–6 first; no assertion that π_Q is birational is made. Prove
   O_X→Rπ_Q*O_Z is a quasi-isomorphism, with its actual unit, equivariance,
   field-change and restriction comparisons. Give the rank-one induction:
   for w=δ(Q), factor the next crank through
   Y=X(w)×_(G/P_i−)G/B−. The map Z_(Qi)→Y is the flat base change of
   π_Q along the P¹-bundle Y→X(w), so proper flat base change transports
   its already proved O-direct-image comparison. If ws_i<w, the image
   X(w) is saturated for the rank-one projection; the other map Y→X(w)
   is a P¹-bundle. Construct its unit and higher-O-vanishing by the rank-one
   projective-bundle calculation and descent. If ws_i>w, compare Y with
   the reduced word for w followed by i. Its proper reduced-word resolution
   of X(ws_i) has the item4–6 direct-image comparison, while its map to Y
   has the same flat-base-change comparison. The derived composition and
   Leray maps then give the comparison for Y→X(ws_i). Prove these factor
   and base-change squares on the actual flag/word schemes, rather than
   treating the gallery as an abstract equality of point sets.

   Apply projection formula to any specified line bundle L on the flag
   to construct RΓ(X(δ(Q)),L)≃RΓ(Z_Q,π_Q*L), naturally and equivariantly.
   For dominant λ, items5–6 supply the corresponding higher-cohomology
   vanishing on the image and hence on the word model. This constructs the
   actual H⁰ restriction/pullback isomorphism as well as its higher-degree
   comparison; equality of dimensions or of Euler characters is insufficient.
   The empty word and Q=(i,i) are explicit tests. Before S9's Lefschetz trace
   application, compare the specified torus-linearized bundle and section
   action through this same isomorphism. Generic fixed-map traces remain
   at IndexTheory I8; they are not a premise of this algebraic comparison.

### Examples

For Y={0,∞} in ℙ¹, H⁰(O_Y)=k² and restriction of constants is the diagonal k→k², so mixed-union surjectivity fails. For ℙ¹ over ℤ and m=0,1,2, H⁰(O(m)) has ranks 1,2,3, unchanged after reduction modulo 2 or 3.

### Dependencies

S1–S3; coherent cohomology, duality, Serre vanishing and Stein factorization from SchemeAndStackFoundations; the independent algebraic Steinberg representation; the integral-model contract specified in S5.6.

## Layer 6: Coordinate rings and all-degree standard monomials (S6)

1. Construct the natural graded map from the homogeneous coordinate algebra of a chosen Plücker/highest-line embedding to ⊕_(m≥0)H⁰(X,L^(⊗m)), with actual multiplication and restriction maps. Keep degree0, reduced unions and all m≥0. Establish its kernel, saturation, surjectivity in every degree and the section/Proj comparison; a projective embedding alone does not identify these two graded rings. For non-ample dominant λ compare with the contracted partial flag image instead of falsely asserting an embedding of the full flag.
2. For typeA Grassmannians and flags consume GG's polynomial maximal-minor/flag-minor straightening bases, certified orders and initial algebra. Identify every coordinate minor with the actual determinant universal section and its dual T-weight. Prove the complete homogeneous ideal and geometric Schubert restriction ideal, standard-on-X(w) basis and Schubert-union support criterion. The scheme ideal, section restriction and multigrading are part of this comparison; algebraic pointwise vanishing over a field is not the full relative scheme proof.
3. Give the source's minuscule induction in full on G/P_λ with its actual ample minuscule polarization; full-flag pullbacks use the already proved parabolic cohomology comparison before any Serre argument. The extremal section divisor is a reduced lower-dimensional Schubert union; multiplication gives 0→O_X(m−1)→O_X(m)→O_D(m)→0. Prove the union intersection ideals are reduced by S5 before using Mayer–Vietoris. Prove both the higher-cohomology descent from actual Serre vanishing and the H¹/restriction/dimension step by the exact maps and standard sections. An unexplained dimension count cannot assume the restriction surjectivity being proved. The m=0 boundary case and all nonnegative twists stay included.
4. For arbitrary finite root type and dominant λ use S4's geometric path sections and defining chains. For an ordered tuple of dominant shapes, a standard product is one whose successive path directions admit a common decreasing lift in W with the specified stabilizer quotients; build its canonical minimal/maximal defining-chain tests and equivalence with the path concatenation criterion. Prove spanning by a well-founded triangular straightening and independence by the normalized filtration. Pairwise weak standardness is not substituted for a common defining chain. Export every multidegree, the single-shape Veronese rings, Demazure character and restriction formulas, and a basis on a finite reduced common-Borel Schubert union by sections standard on at least one component.
5. Give the compatible ideal and multiplication API: for the fixed-Borel Schubert family, basis vectors failing its support test span the vanishing ideal, ideal intersections/sums match its reduced unions/intersections, and restriction maps are coordinate projections in that compatible basis. Mixed standard/opposite intersections keep their actual S5.2 ideal identities; any section basis or surjectivity comparison there requires its own proved restriction/vanishing hypothesis, not this fixed-Borel assertion. For each normal Schubert variety and the full flag, prove projective normality and normal generation in the ample/actual embedding lane using these all-degree maps and integrality, not by defining the section ring to be the coordinate ring. Reduced unions retain their all-degree coordinate/section comparison and normal-generation theorem, but are not asserted normal without an actual normality hypothesis; a reducible union can fail normality along its intersections. For the source's toric degeneration consume GG's Rees/SAGBI comparison and identify the initial algebra; an associated graded toric algebra does not make the original flag algebra toric. General path-based degenerations may be unions of toric components and must keep their actual fan/valuation hypotheses.

### Examples

For Gr(2,4), the six Plücker coordinates satisfy p12*p34−p13*p24+p14*p23=0. Degree 0 has dimension 1 and degree 1 has dimension 6; the toric initial algebra is compared by degeneration, not identified with the original multiplication.

### Dependencies

S1–S5 and S7.1–2 for geometric path sections; GroebnerGeometry G5 for the polynomial minor and straightening theory; the named projective-scheme and coherent suppliers.

## Layer 7: Chevalley divisors and incidence multiplicities (S7)

1. Choose the normalized extremal section nonzero on C(w). For v=w s_β with β>0 and ℓ(v)=ℓ(w)−1, prove that its divisor along X(v) has coefficient ⟨λ,β∨⟩. Show support, valuation at the codimension-one local ring, actual rank-one transverse parameter and compatibility with the chosen left/right quotient and weight. Equivalently express it using the transported extremal weight at v; prove the equality of these formulas rather than guessing the source's β side.
2. Distinguish the effective Cartier divisor of the full section from individual Schubert boundary Weil divisors, which need not be Cartier. In the minuscule lane all nonzero coefficients are1 and recover the reduced hyperplane/Pieri boundary used in S6. For general λ retain multiplicities in the cycle/class formula and use an actual coherent boundary filtration; do not tensor a fictitious invertible O(−X(v)) for every component. Include zero coefficients, λ=0 and the empty divisor.
3. Construct the flag-specific Chow-to-integral-cohomology comparison from the generic algebraic cycles/localization/refined-intersection API of SchemeAndStackFoundations §5 and the existing LieGroups flag CW/cohomology carrier. Prove the affine-cell filtration spans the Chow group by Schubert closures, and prove independence using opposite-cycle intersection and degree. Send a Schubert generator to the ambient homology class obtained by pushing the complex-oriented fundamental class of its reduced-word resolution; identify its coefficient1 on the open cell and the corresponding CW generator. Prove the pairing, divisor/Chern class and parabolic projection laws, yielding the flag comparison and its ring compatibility. This is an application-specific construction, not a claim that AVB's proposed general Betti cycle-class programme already exists. Compare the source Chevalley–Pieri degree calculation, including positivity and the actual multiplicities. General singular intersections retain their refined-intersection hypotheses; the transverse complex Grassmannian point-count comparison of TPC remains at its existing owner.

### Examples

On ℙ¹ the root curve has degree 1 against O(1) and degree m against O(m). A type-A simple cover with minuscule fundamental weight has bond 1; replacing every divisor multiplicity by 1 would lose higher pairings.

### Dependencies

S1–S3; S5 normality and cohomology; S4.3 cover bonds; SchemeAndStackFoundations §5 cycles and intersections; LieGroups flag topology.

## Layer 8: Algebraic flag K-rings and characteristic maps (S8)

1. Consume the generic coherent/exact Grothendieck and perfect-complex owners. On smooth projective G/P verify the hypotheses of the supplied regular/quasi-projective finite-resolution comparison and identify its vector-bundle K₀≃coherent G₀ maps. Do not assert this equality on singular Schubert varieties. Their structure sheaves define ambient classes by proper coherent pushforward and the regular ambient resolution. Export the supplied products, duals, tensor twists, derived proper pushforwards and Tor/flat/perfect-range pullbacks on these flag objects, and construct their actual equivariant character/Schubert comparisons.
2. Construct c:ℤ[X]=R(T)→K₀(G/B−), eλ↦[Lλ], its augmentation, restriction and Weyl comparisons. If the derived group of G is simply connected, prove the integral presentation R(T)⊗_(R(G))ℤ≅K₀(G/B−), with ℤ carrying dimension augmentation. After identifying the character image with R(T)^W, the ideal is generated by f−ε(f), f invariant; it is not the ideal generated by the whole invariant ring, which contains1. Prove the integral basis/rank and actual induction/restriction/projective-bundle or Schubert-filtration comparisons establishing surjectivity and kernel.
3. In the same simply-connected-derived range construct K₀^T(G/B−)≅R(T)⊗_(R(G))R(T), specify which factor is the base character and which gives associated lines, and compare its augmentation to item2. For a partial flag use R(P−)=R(L) and the corresponding character presentation, with the actual Levi Weyl subgroup and bundle comparison. Prove the finite free/basis statements needed for these tensors; do not assume rational invariants imply their integral version.
4. For a general isogeny type retain c and its actual integral image. Use the derived simply connected cover's flag isomorphism to present ordinary K₀ with its larger available line lattice, proving compatibility and independence of the displayed choice. Rational comparison from the original lattice is separate. For PGL₂, its flag is P¹ but the root-character line is O(2); its image misses a primitive integral degree-one class. This is a required counterexample to an unqualified integral original-lattice presentation. Keep central torus characters and augmentation relations explicit.
5. Construct push-pull Demazure operators on these K-groups and compare them with S3's integral character operators, including word/Levi laws. Compute Schubert structure-sheaf and ideal-sheaf bases and pairings using the actual coherent duality and Euler pushforward. Distinguish those bases from line-bundle characters, ordinary cohomology classes and quantum/K-theoretic puzzle rules; none of those extra rules follows from the ordinary TPC puzzle theorem.

### Examples

For ℙ¹, put t=[O(−1)]; then (1−t)²=0, while its rank is 1. The point flag has K-ring ℤ. These distinguish the rank map from the full flag K-ring.

### Dependencies

S3, S5–S7; SchemeAndStackFoundations coherent/perfect K-theory and Euler pushforward; the actual line-character map and stated isogeny hypotheses.

## Layer 9: Complex realization, fixed-map traces and existing comparisons (S9)

### 9.0 Coherent analytification and proper comparison

Construct complex analytic spaces as locally ringed spaces locally isomorphic
to zero loci of coherent holomorphic ideals in open subsets of finite-dimensional
complex vector spaces, with the quotient sheaf, not just the reduced zero set.
Allow non-Hausdorff spaces for gluing. Construct their morphisms, open and closed
subspaces, fibre products and gluing. For every locally finite-type complex
scheme X, construct its analytification a_X:Xᵃⁿ→X by its representing property
for morphisms of locally ringed ℂ-spaces from analytic spaces. Prove independence
of affine presentations, open gluing and compatibility with fibre products.
The underlying points are X(ℂ); separated finite-type X gives a Hausdorff,
second-countable space. Identify smooth charts with their holomorphic charts;
this does not construct the additional fixed-model tangent/connection interfaces
(SGA1, Exposé XII, Theorem 1.1 and §§2–3, retyped pp. 239–247).

- At a complex point, the algebraic-to-analytic local-ring map is faithfully
  flat and induces an isomorphism on completed local rings.
- Closed immersions retain their defining ideals and nilpotents; open
  immersions and fibre products have their universal comparison maps.
- Define coherent analytification by a_X*F on the native module-sheaf carrier, using RealAnalyticGeometry R3.2’s coherence predicate.
  Prove exactness, faithful detection of zero coherent sheaves, and tensor,
  locally free dual, coherent Hom and local Ext comparisons. Construct the
  natural cohomology and higher-direct-image exchange maps by adjunction and
  Leray, compatible with composition and coherent exact sequences (SGA1,
  Exposé XII, Proposition 1.3.1 and §4.1, pp. 241, 247–248).

**Checks.**

- Affine n-space for n=0,1,2 gives a point, ℂ and ℂ², with coordinate maps
  the identity; the completed stalk at the origin is ℂ, ℂ[[z]], ℂ[[z₁,z₂]].
- Spec ℂ[ε]/(ε²) has one analytic point but a two-dimensional structure ring:
  ε²=0 and ε≠0 on both sides. Reduction would give dimension 1 instead.
- The nodal curve xy=0 has completed local ring ℂ[[x,y]]/(xy), with nonzero
  x and y but xy=0; a manifold-only construction cannot model this stalk.

*Needs:* ComplexKahlerGeometry K3–K4 (holomorphic germs, Weierstrass division
and sheaves); SchemeAndStackFoundations Layers 1–2 (locally ringed spaces,
module sheaves, gluing and derived cohomology); RealAnalyticGeometry R3.2
(native coherence and coherent kernels). Extend coherence from ambient
holomorphic germs to their coherent ideal quotients here, and construct the
finite-presentation and completion comparison in the proof of SGA1 XII.1.1.

Prove coherent GAGA in its general proper form. For any proper morphism
f:X→Y of locally finite-type complex schemes, any coherent O_X-module F
and q≥0, the canonical exchange map
(R^q f_*F)ᵃⁿ→R^q fᵃⁿ_*(Fᵃⁿ) is an isomorphism. For a proper complex scheme X,
analytification gives an equivalence Coh(X)≃Coh(Xᵃⁿ), compares all coherent
cohomology and Ext groups, and respects tensor products and proper pushforward.
Singularities and nilpotents are allowed (SGA1, Exposé XII, Theorems 4.2 and
4.4, Corollary 4.3, retyped pp. 248–251; SerreGAGA, §12, Theorems 1–3,
pp. 19–20, for the projective starting case).

A proof route constructs the analytic projective-twist cohomology and finite
twist presentations, then uses descending cohomological induction for projective
morphisms and Chow modification with coherent support dévissage for proper ones.
Develop the required analytic coherent cohomology first: coherent quotients of
ambient holomorphic sheaves and exact coherent direct image for closed analytic
immersions. For a closed analytic subspace of a Stein manifold, identify its
coherent cohomology with that of its coherent direct image and apply
RealAnalyticGeometry R3.2’s Cartan B. Apply this general comparison to the
projective cover, and construct the Laurent-series Čech comparison for twists over a polydisc
base, and finite twist presentations of coherent sheaves on projective analytic
space (SerreGAGA, §§13–17, pp. 20–27; SGA1 XII.4.2, projective-case proof).
The proper equivalence uses coherent Hom and Ext¹ comparison to algebraize
extension classes in support induction; an extension is not replaced by its
split direct sum. SchemeAndStackFoundations §4.12 supplies Chow modification.

- Identity and composition of proper morphisms commute with the same exchange
  maps, as do the long exact sequences of coherent cohomology.
- Compare the algebraic and analytic base-change morphisms for cartesian squares;
  conclude an isomorphism when the algebraic base-change theorem applies,
  for example for flat change of base. No arbitrary underived base-change
  isomorphism is asserted.
- Equivariant structures transport by naturality in the action and cocycle
  maps; for proper X this compares the actual cohomology representations,
  rather than just their dimensions.

**Checks.**

- For f=id the exchange in degree 0 is the identity, and higher direct images
  are zero; the zero coherent sheaf gives zero in every degree.
- For ℙ¹ over ℂ, O(−2) has H⁰=0 and H¹=ℂ on both sides. Over the base ℂ[s],
  R¹π_*O(−2)=O, whose analytification allows the holomorphic coefficient exp(s).
- The proper dual-number point has H⁰ with basis 1,ε and zero higher groups.
  In contrast on affine ℂ, the endomorphism exp(z) of the analytic trivial line
  is not algebraic; properness cannot be dropped from full faithfulness.
- Over A=ℂ[t], an extension 0→O(−2)→E→O→0 on ℙ¹_A with class t
  has cohomology complex [A→A] with differential multiplication by t.
  H⁰ is zero over A but becomes ℂ at t=0; the underived degree-zero
  base-change map 0→ℂ is not an isomorphism, on either side of GAGA.

*Needs:* the analytic-space and coherent-pullback construction above;
SchemeAndStackFoundations §§2.2, 2.6, 4.12 (coherent pushforward, projective
cohomology and Chow modification); RealAnalyticGeometry R3.2 (Cartan A/B). This comparison precedes the flag
specialization and uses no Schubert vanishing or standard monomial theorem.

### 9.1 Flag and word specializations

1. Over ℂ compare the actual algebraic flag, Schubert and word schemes with their analytic/topological carriers, actions, tautological/associated bundles and maps. Use S9.0’s analytification and projective coherent GAGA at the actual objects. Identify the compact homogeneous flag model and its rank-one factors through LieGroups, and compare typeA subspace/quotient/Plücker models with ModularCurves §0G and TopologicalKTheory T1.5. Ordinary relative forms and field changes retain their actual algebraic hypotheses; the complex comparison is not their substitute.

   For the flag and word models, compare their homogeneous root charts,
   equivariant actions and associated-line transitions with the corresponding
   analytic charts. These are the specified flag and word comparisons of S9.1.

2. Consume the following map-level holomorphic Lefschetz interface from IndexTheory's fixed-map trace construction. If f:M→M is holomorphic on a compact Hausdorff second-countable finite-dimensional boundaryless complex manifold, all fixed points are isolated with det_ℂ(1−df_x)≠0, E is a holomorphic vector bundle and φ:f*E→E is a specified holomorphic bundle map, then the alternating trace of φ∘f* on coherent/Dolbeault cohomology is Σ_x tr(φ_x)/det_ℂ(1−df_x). The generic construction owns positive-time heat smoothing/trace class, cohomological supertrace and the local graph/diagonal calculation; arbitrary pullback is not assumed L²-bounded and f need not be an isometry.
3. For section action (g·s)(x)=g_Es(g^−1x), apply that formula with f=g^−1 and φ=g_E on pulled-back fibres. The differential pullback has the eigenvalues of df, not automatically their inverses. At e of G/B−, tangent weight+α for t gives df for t^−1 with weight−α; the denominator is1−e^(−α) and the fibre contributes eλ. For the word model use S2's actual subword weights to prove χ_T(Z,π*Lλ)=Σ_ε e^(w_rλ)/∏_j(1−e^(−β_j)) in the stated localization. Prove for generic t that its fixed points are exactly those sections and every denominator is nonzero. A finite whole-torus fixed locus does not make the expression defined for every t.
4. Sum the rank-one contributions to obtain S3's exact Demazure recurrence and compare with the independently constructed algebraic Euler/vanishing argument. Prove polynomial cancellation of the localization formula and its integral character meaning. The full longest-word result recovers the Weyl character formula in the stated characteristic-zero analytic lane. It does not prove positive-characteristic geometric vanishing by itself.


5. Specialize S4.1–5 to the full type-A root datum, retaining the GLₙ central
lattice and its actual SLₙ restriction. Prove that its simple coroot heights
are adjacent coordinate differences, with the same endpoint, concatenation,
root-operator and central-transport laws. For GL₂ the straight path t↦(t,0)
has height t and lowers to t↦(0,t); a central shift by (1,1) preserves the
height and changes the endpoint to (2,1).

*Needs:* S4.1–5; RootSystems Layer 6's type-A datum and ReductiveGroups' actual central character lattice.


6. Compare the resulting integral full-flag CW classes with the Schubert Chow/degree comparison of S7.3; no new Grassmannian characteristic-map owner is introduced. As the compact-normalizer application, for compact connected K and maximal torus T use the actual free finite covering K/T→K/N(T) with deck W, AlgebraicTopology Stage5.3's singular-cohomology transfer over ℚ and the flag's even-cell Euler characteristic |W|. Prove H⁰(K/N(T);ℚ)=ℚ and all positive-degree groups vanish. Over ℤ averaging is unavailable: for SU₂ identify K/N(T)=ℝP² and compute H⁰=ℤ, H²=ℤ/2 and other positive cohomology zero. The generic compact BG/BT invariant/Chern–Weil comparison remains at CharacteristicClasses C5; the source's invariant-degree/Coxeter-exponent and exterior-cohomology formulas require that owner's actual invariant-theory/transgression interfaces and are not inferred from this rational-normalizer calculation.

7. Construct the compact moment-Morse comparison with [HamiltonianReduction R2a](../HamiltonianReduction/README.md) on its SAME homogeneous coadjoint orbit. For compact connected K, a real dominant μ∈t and H=K_μ, use LieGroups Layer8 and S9.1 to identify K/H with the analytic partial flag G/P− whose Levi roots vanish on μ. No integrality or prequantization of μ is required for this diffeomorphism; an associated line still requires the actual character lattice. Compare the inclusion derivative, root-plane coordinates, T action and the actual KKS form. At p∈O_μ∩t construct the invariant complex structure by J_flag|E_α=sign(α(p))J_α on the tangent planes α(p)≠0 and prove that it is the integrable structure transported from this flag. Then ω(v,J_flag w)=B(v,w)/|α(p)| on those planes. Extend the equality equivariantly and construct the positive K-invariant Kähler metric, rather than assume the arbitrary metric used for the Morse chart has this property.

   For regular X in the negative chamber, prove grad(f_X)=J_flag X_O and the complete negative-gradient flow is the complexified action exp(−itX). Construct its coordinate action in the actual root-subgroup charts and prove its unstable manifolds are the standard B− cells C(w), of complex dimension ℓ(w), with backward limit wμ; its stable manifolds are the opposite cells. The compact flow model is being compared to those root-coordinate cells, not used to define the algebraic Schubert schemes. For positive X, retain index(f_X)=dim(O_μ)−2ℓ(w) and use −f_X for the same index-2ℓ(w) model. Zero stabilizer roots are omitted on partial flags, and central components change only the height constant. Prove the convergence/limit and cell-coordinate statements and the parabolic projection when μ lies on a wall, with X still regular in the chosen chamber, not just agreement of cell counts or characters. If instead X lies on a wall, use R2a's centralizer-orbit Morse–Bott strata and their negative normal bundles; do not assert the same isolated-critical-point/Bruhat-cell statement for that height. An arbitrary invariant metric need not have these Bruhat unstable manifolds.

   Compare the MorseTheory M2 negative-handle characteristic maps and the existing LieGroups/TopK flag characteristic maps by actual relative-pair maps, root-coordinate orientations and compatible finite filtrations. Distinct-value height choices and simultaneous critical levels must give the same labelled comparison under the constructed handle-continuation maps. Use the complex orientation of each negative root-plane sum; check independence from torus choices of normalizer representatives, whose root-plane rotations have positive real determinant. Compare the resulting integral cellular/singular generators with S7.3's pushed-forward resolution classes and their coefficient1 on the open cells, including the boundary/attaching-map comparison. A singular Schubert closure need not be a ball and is not declared to be the image of an embedded Morse disc. Export the finite even-cell Poincaré polynomial Σ_(w∈W/W_μ)q^(2ℓ(w)), torsion-free integral groups and |W/W_μ| Euler characteristic with these actual comparison maps. Multiplicative Schubert/cohomology formulas retain their S7 construction and the named downstream applications; they do not follow merely from a vanishing cellular differential.

   This is a later application of HR R2a, the independent compact LieGroups foundations, the existing root-cell/complex-realization maps and MorseTheory's generic attachments. It is not a prerequisite for LieGroups Layer6 conjugacy, S4's generic LS engine, ReflectionInvariantTheory §§1–3 polynomiality, or CharacteristicClasses C5/C5a Borel/compact cohomology. Retain S9.6's normalizer/Weyl transfer and SU₂/ℝP² test at that single owner.

8. For a complex reductive G and parabolic P−, specialize S9.1's tensor-compatible
analytification of locally free sheaves to S3.1's algebraic associated lines.
Construct the holomorphic associated-line model by the same fibre character
and compare its transition functions, fibre at eP− and G action with the
analytification. Prove that the algebraic fibre/associated-line unit and counit
become the holomorphic ones, naturally for equivariant isomorphisms, tensor,
dual and parabolic pullback. This is the algebraic-to-holomorphic adapter;
it does not reconstruct the ordinary Picard group or the compact character-to-degree map.

- The comparison sends the fibre class [1,z] to the same fibre element z.
- The tensor comparison sends [g,z]⊗[g,w] to [g,zw], and duality negates the character.
- Restriction along a parabolic projection preserves the associated character and these maps.

**Checks.**

- For SL₂/B−, the weight-one character gives O(1) on both sides and root degree +1.
- The zero character gives the trivial line, with tensor unit mapped to 1.
- For a torus the flag is a point; characters 0 and 1 give the same ordinary
  line but distinct equivariant fibres, so forgetting the action cannot be an equivariant inverse.

*Needs:* S3.1's algebraic equivariant-line equivalence; S9.1's locally free
GAGA comparison; LieGroups
Layer 8's homogeneous complex flag.

### Examples

For the proper dual-number point, algebraic and analytic H⁰ both retain ℂ[ε]/(ε²), with ε nonzero. For SU₂ the normalizer quotient is ℝP²: rational positive cohomology vanishes but integral H² is ℤ/2. For the point partial flag, its Poincaré polynomial is 1.

### Dependencies

S1–S8 at the targets that use them; S9.0 for coherent analytification and proper GAGA; LieGroups Layer 8; IndexTheory I8; HamiltonianReduction R2a; AlgebraicTopology Stage 5.3 and MorseTheory M2.

## Worked examples

- The upper-left B_(n−1) action on complete complex flags requires a
  separate supplier contract: the open-orbit chart and its inverse, all thirteen
  GL₃ orbit representatives, their stabilizers and dimensions, and comparison
  of their subspace flags with S1's incidence and Borel conventions. LieGroups
  Layer 8 supplies the full-Borel Bruhat decomposition, whose GL₃ case has six
  cells; it does not supply this smaller-block action. The thirteen-orbit
  contract is a gap, not a consequence of the ordinary Bruhat theorem
  (Knutson semester1, p. 49 and pp. 173–176).
- TypeA: the six minors of an actual two-frame in k⁴, their signs/change of frame, the Gr(2,4) Plücker quadric, coordinate-chart inverse, Schubert ideals, dimensions and all-degree bases. Include signed determinant-one SL representatives, the full block-monomial normalizer/stabilizer dictionary, the symplectic antidiagonal-form block parabolic and the source root-action/contragredient wedge signs. Include zero subspace/full subspace and the determinant line; claims that a tautological subbundle has no global sections need the correct nontrivial-rank range.
- **A fixed-plane stabilizer on a Grassmannian.** Over a field k, fix
  V=k^n, 0≤k₀≤n and a specified k₀-plane U⊂V; write P=Stab_GL(V)(U).
  Use the existing Grassmannian and tautological subbundle S, and the
  actual map S→(V/U)⊗O. For
  max(0,2k₀−n)≤d≤k₀ define the locally closed rank-exact stratum O_d
  by rank(S→V/U)=k₀−d. Its geometric points are exactly the k₀-planes
  W with dim(U∩W)=d. Prove each stratum is one P-orbit and give actual
  transporter matrices: extend a basis of U∩W to adapted bases of U,W,V,
  and map the resulting adapted bases for two planes to one another while
  preserving U. Give the inverse and check the block-matrix equations;
  over k this also proves transitivity on the k-rational points.

  Choose V=U⊕U' and bases u₁,…,u_k₀ and v₁,…,v_(n−k₀). The plane
  W_d=span(u₁,…,u_d,v₁,…,v_(k₀−d)) is an explicit representative.
  Compare these representatives and transporter maps with ReductiveGroups Layer 7b's actual
  parabolic double-coset map, obtaining
  (S_k₀×S_(n−k₀))\S_n/(S_k₀×S_(n−k₀))≃{d:max(0,2k₀−n)≤d≤k₀}.
  Prove the number of orbits is min(k₀,n−k₀)+1. Choose an adapted full
  flag when comparing with S1's Borel conventions; conjugation must carry
  its stabilizer and all the representative maps, not just the count.

  Let Z_d be the closed determinantal scheme cut out by the
  (k₀−d+1)-minors of S→V/U. If this size exceeds the source or target
  rank, there are no such minors and the ideal is zero; in particular
  Z_0=Gr(k₀,V) whenever d=0 is admissible. Prove these schemes are geometrically
  reduced and irreducible by comparison, in an adapted full flag, with
  S1's existing single-flag Schubert rank-condition schemes and their
  reduced closures. Their underlying closed sets satisfy
  closure(O_d)=|Z_d|=⋃_(e≥d)|O_e|, over the admissible e, and
  closure(O_e)⊆closure(O_d) iff d≤e. Prove density and the order using
  the rank charts and actual one-parameter plane degenerations; a count
  of double cosets alone does not determine closure order. This displayed
  union is a stratification of underlying sets, not a scheme union of
  the locally closed strata. Keep determinantal ideals, reducedness and
  field-extension comparisons on the existing scheme carriers.

  For k₀=0 or k₀=n there is exactly one plane and one orbit, including
  n=0; for n=1 these are the only cases. No positive-rank matrix minor
  or nonempty choice of complement vectors is required in these cases.

- For 1≤r≤dimV and nonzero θ∈ΛʳV, prove decomposability iff (ι_ηθ)∧θ=0 for every η∈Λ^(r−1)V*, by constructing the vector-valued contraction-image subspace and its basis. Include θ=0 as the affine-cone origin separately. For r=0 use Λ⁰V=k and its unique projective point, without that vector-valued contraction criterion; for r>dimV the exterior power is zero and its projectivization is empty. Compare this basis-free criterion with the already owned polynomial Plücker ideal and the actual universal image, retaining the exterior-algebra signs in every characteristic.
- For the rank-d tautological subbundle on the full flag over an algebraically closed field, prove H⁰(S_d)=0 when 0<d<N, and explicitly handle d=0 and d=N. Identify H⁰(S_d*) and its determinant sections through the actual induced-module/evaluation map. Multiplication of fundamental section spaces gives the Cartan-product quotient, not an unqualified isomorphism with the entire tensor product.
- For nonempty integral finite-type projective X and nonempty open U, compare the homogeneous degree-zero fraction field with the actual function field k(X)=k(U), and dimX=trdeg_k k(X) over a field. The local regular-section ring O(U) is not itself that fraction field; give the homogeneous affine-chart/homogenization maps and apply them to the Schubert cell dimension calculations.
- The complete flag→incidence product→Plücker→positive Veronese→Segre composite has its actual closed immersion and line pullback. Zero exponents contract flag directions and are not automatically embeddings; strictly positive relevant coefficients give the intended ample partial/full-flag model.
### The three-dimensional incidence flag and its eight-dimensional representation
 Over ℂ fix V=ℂ³ and
  its ordered basis. Write v=(a,b,c) and
  ω=x(e₂∧e₃)+y(e₃∧e₁)+z(e₁∧e₂). Identify the actual complete flag
  (L,P) with ([v],[ω]) in P(V)×P(Λ²V), where L=ℂv and P is the
  plane represented by ω. Construct the scheme/analytic comparison and
  inverse, with incidence equation `v∧ω=0`, hence `ax+by+cz=0`.
  Under Segre this is a linear equation in the nine coordinates
  ax,ay,az,bx,by,bz,cx,cy,cz; retain the Segre quadratic relations.

  Construct the GL(V)-equivariant isomorphism
  `V⊗Λ²V≃End(V)⊗det(V)` by sending v⊗ω to the map
  `u↦v⊗(u∧ω)`. Prove that its trace is v∧ω. The flag's image thus
  lies in P(sl(V)⊗det(V)), a projective7-space inside the ambient
  projective8-space. Prove its linear span is exactly sl(V)⊗det(V):
  obtain the off-diagonal matrix units from incident coordinate pairs
  and diagonal differences from rank-one trace-zero matrices together
  with those units. This is an eight-dimensional submodule, with
  GL₃ highest weight (2,1,0), not the whole nine-dimensional tensor.

  Identify the section representation separately. Twist the incidence
  hypersurface ideal sequence by O(1,1), and use the existing projective
  coherent-cohomology calculation to prove H¹(O) of the product vanishes.
  Restriction then identifies H⁰(Flag(V),O(1,1)) with the quotient of
  `(V⊗Λ²V)*` by the one-dimensional incidence-equation line, hence with
  `(sl(V)⊗det(V))*`. Construct its restriction/evaluation maps, kernel and
  equivariance; its highest weight is (0,−1,−2) for ordinary dual action.
  Preserve this dual distinction when applying S3's line convention.
  Compare negative determinant twists, which change the GL₃ module
  while preserving the underlying projective flag embedding. These maps
  supply BorelWeil pp4–5's explicit8-versus9 calculation.
- For the finite chain/convexity API include a single cover, an equal endpoint with gcd0, incomparable endpoints, the arithmetic a-chain criterion with denominator1 (outside the internal LS break range), a chamber-wall stabilizer, nonsimply-laced rank-two bonds, and a pure central straight path. The wall case must give equality of cosets when the coroot pairing vanishes; the pure central case must retain the scaled convexity statement.
- For central transport in GL₂, take π(t)=(t,0), χ=(1,1) and the increasing rational PL reparametrization φ(t)=t/2 for t≤1/2 and φ(t)=3t/2−1/2 for t≥1/2. The paths π and π∘φ represent the same class. The shifted π lies on x=2y, whereas (π∘φ)(1/2)+(1/2)χ=(3/4,1/2) does not. Verify this regression against an ambient quotient-level central action, and recover B(λ)→B(λ+χ) through the canonical LS representative instead.
- For SL₂ use P¹, O(m), the m+1 character string and degree m. In characteristicp compare induced, Weyl and simple modules, including the pth symmetric-power/Frobenius stabilizer example and the n=4,p=3 binomial cyclicity counterexample. A unique highest line need not imply a module is generated by that line.
- **The word121 blowup of the three-dimensional full flag.** Fix a
  three-dimensional vector space V over a field and an initial plane P₀.
  Number the simple changes so that1 changes a line and2 changes a plane.
  Compare S2's actual word121 carrier with triples
  (L₁,P,L), where L₁≤P₀, L₁≤P and L≤P, and all lines/planes have their
  stated ranks. Construct the two-sided scheme and equivariant comparison,
  including the initial flag convention and base change; the final map is
  (L₁,P,L)↦(L,P) in F=Flag(1,2;V). Off C={(L,P₀):L≤P₀}, its inverse is
  L₁=P∩P₀. Construct this intersection as a rank-one subbundle on the open
  P≠P₀, with its regular inverse maps, rather than a pointwise dimension rule.

  Use StableReduction Layers2/4's relative Proj/Rees blowup construction,
  affine charts and universal property. Over B=Gr(2,V)≃P(V*), the incidence
  pairs (L₁,P) with L₁≤P₀∩P identify with Bl(P₀,B). In a chart at P₀ write
  the moving plane as the graph z=ux+vy relative to P₀. The incidence
  equation is ux+vy=0 on P(P₀); identify its line coordinate [x:y] with
  the blowup direction [−y:x], so the two Rees charts have equations
  v=u·r and u=v·s, with r·s=1 on their overlap. Give the actual chart
  isomorphisms, both inverses and transition maps, valid over every field
  including characteristic2; no analytic argument or division by2 is used.

  The projection F→B is the projective bundle of lines in the universal
  plane, hence flat. Prove the flat-base-change comparison of the Rees
  algebras degree by degree and their relative Proj, using the same
  StableReduction supplier, and apply it to the ideal of P₀. This constructs
  BS(121)≃F×_B Bl(P₀,B)≃Bl_C F over F. Record the ideal of C, its pullback
  invertibility, exceptional Cartier divisor, universal factorization and
  compatibility with the open inverse; a proper birational map with P¹
  fibres alone does not establish this blowup identity.

  The center C is P(P₀)≃P¹. Compute N(C/F) from the smooth projection to
  B: it is the constant rank-two bundle T(P₀)B⊗O_C. Construct this
  identification from the chart differentials and their transition maps.
  Thus the exceptional divisor is P_C(N(C/F))≃P¹×P¹, with the first
  factor the final line L and the second the choice L₁/blowup direction;
  its projection to C forgets L₁. Prove the exceptional normal line is the
  tautological O(−1) in the second factor. This supplies the actual
  trivialization requested by the example, rather than inferring it from
  a section. Compare with all eight fixed subwords and the existing
  four-tetrahedron model, preserving their actual Borel/action conventions.
  Compare the two zero-weight adjoint path indices without inventing unread diagram labels. Retain the separate S4.4a adjoint simple-generator positive test and15-dimensional trace-kernel negative test, with their actual operators and chronological words.
- For general root type retain parabolic projection, minuscule versus nonminuscule divisor multiplicities, all-degree Demazure/path bases, scheme-theoretic reduced union/intersection and the degree/Chevalley formula. Kac–Moody and general quantum-group/canonical-basis statements are separate source programmes; the finite-type engine here is not a proof of them. Integral divided-power and rational-module source assertions are consumed from the exact RG owner, not silently reproved by geometric characteristic-zero arguments.

## Downstream consumers

TensorProductCombinatorics §8.3 owns the coordinate-path and operator comparison
with S4.1–5, and its Layer 6 owns the complex Grassmannian Schubert/puzzle
applications. These applications consume this roadmap's general theory. GeometricQuantization
§§3.3–3.4 consumes S9.1/S9.7's partial-flag, Kähler and root-oriented cell
comparisons for its ordinary Picard and forgetful-map conclusions.

AlgebraicModuliForArithmeticGeometry §1.3 consumes S1.1’s locally free flag
incidence construction; its general coherent-quotient programme remains distinct.
ShimuraData §§3.8 and 3.14–18 consumes S1.0’s relative quotients, S2’s integral
word models and S5.6’s integral Schubert comparisons for its compact-dual and
arithmetic applications. ComplexComparisonPartII C−1/C0/C1.9/C2 consumes
S9.0’s analytic-space, coherent-pullback and proper GAGA foundation for its
further comparison applications. These uses do not supply a premise back to
this roadmap. FormalConnectionsOpers §2.4’s fixed-model smooth comparison is
also downstream of this coherent analytification foundation.

## References

Proof routes include the original Knutson Bott–Samelson/Demazure handouts and algebraic-varieties notes for these applications; Littelmann's *Paths and root operators in representation theory* for the finite path/linking construction; Lakshmibai–Littelmann–Magyar's *Standard monomial theory for Bott–Samelson varieties*, author preprint dated 12 October 2000, Theorem 4 (§1.3, p. 7) and Theorem 6 (§1.4, p. 9), for the standard bases and section/vanishing comparisons; and the root-coordinate/splitting/coherent constructions stated in S5. For the finite saturated-chain bond theorem use Chirivì–Fang–Littelmann, [*LS algebras, valuations and Schubert varieties*, arXiv:2203.12992v1, Definition 2.1 (p. 4) and §7.1 (p. 18)](https://arxiv.org/abs/2203.12992v1), in its dominant-weight/minimal-parabolic-coset setting; construct its chain-independent gcd through the combinatorial targets of S4.3. Each cited generic foundation retains its single owner.

Source keys: LLM denotes the cited 12 October 2000 author preprint, with
Theorem 4 at LLM line 263 and Theorem 6 at LLM line 338. CFL denotes
arXiv:2203.12992v1, with Definition 2.1 at CFL line 188 and the Schubert
bond specialization at CFL line 960. The latter uses a dominant weight and
minimal representatives in the parabolic Weyl quotient; its characteristic-zero
geometric application does not supply positive-characteristic splitting.


For the relative parabolic quotients and integral root charts, use Brian
Conrad, *Reductive group schemes*, Theorem 2.3.6, pp. 72–73, Theorem 5.1.13,
p. 143 and Corollaries 5.2.8–5.2.9, pp. 155–157 (ConradReductive lines 2993,
6011, 6512 and 6551). For coherent analytification and proper GAGA, use
*Revêtements étales et groupe fondamental (SGA 1)*, arXiv:math/0206203v2,
Exposé XII, Theorem 1.1, Proposition 1.3.1, Theorems 4.2 and 4.4 and
Corollary 4.3 (SGA1 lines 9399, 9479, 9738, 9805 and 9801).
Jean-Pierre Serre, *Géométrie algébrique et géométrie analytique*, Annales de
l’Institut Fourier 6 (1956), §12, Theorems 1–3, pp. 19–20, and §§13–17,
pp. 20–27, gives the projective proof (SerreGAGA lines 735, 741 and 746).
The scheme-theoretic nilpotent generality is taken from SGA1.
