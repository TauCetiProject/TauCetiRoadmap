# Type-A Hecke algebras, braid traces, and positive quotients

This roadmap develops finite type-A Hecke algebras as reusable objects: presentations and bases,
module theory, compatible Markov traces, positive trace quotients, and their link and subfactor
applications. The algebraic Ocneanu trace and positivity are separate theorems on specified carriers.

## Scope and conventions

Work over a commutative coefficient ring `R` with a chosen unit `q : Rˣ`. The finite type-A
Hecke algebra `Hₙ(q)` is the quotient of the braid-group algebra on generators `T₁,…,Tₙ₋₁` by
`(Tᵢ−q)(Tᵢ+q⁻¹)=0`, equivalently
`Tᵢ²=(q−q⁻¹)Tᵢ+1`, together with the braid and distant-commutation relations. The tower map
`Hₙ(q) → Hₙ₊₁(q)` sends each generator to the identically indexed generator. Fix this convention
once; compare it with the native Jimbo relation and state every change of generators explicitly.

Use the actual quotient construction rather than a structure with a relation-valued field: let
`Raw_R = FreeAlgebra R ℕ`, impose the quadratic, adjacent-braid and distant-commutation equalities
as a relation `r_q : Raw_R → Raw_R → Prop`, and set `H∞(q)=RingQuot(r_q)`. The relation quotient's
universal algebra map out of `Raw_R` supplies the generator images. Use the convention that `H_n(q)`
has `n−1` generators and corresponds to braids on `n` strands. In the infinite quotient, let
`S_n = Algebra.adjoin R (range (i : Fin (n−1) ↦ T_i))`; the inclusions `S_n ≤ S_(n+1)` are
induced by the nested ranges. Prove the finite-presentation/PBW comparison `H_n(q) ≃ₐ[R] S_n`
and injectivity into `H∞`; concretely `S_n=heckeStage q (n−1)` in the prototype. Prose
`T_1,…,T_(n−1)` is one-based and corresponds to Lean `finiteT q n i` with `i.val=label−1`.
For `x∈H_n`, the new Markov generator `T_n` is Lean index `n−1` in `H_(n+1)`.
The projection stage `A_(τ,n)` with `n` generators corresponds to `H_(n+1)`.
At `n=0,1`, the truncated `Fin(n−1)` presentation has no generators and is canonically `R`.
Do not identify the adjoined stages with finite presentations before
proving that comparison. This is the concrete carrier shape in `Suggested.lean`; its basis and
injectivity theorems remain proof targets, not assumed properties. The prototype also defines the independent finite presentation, its universal map,
strand maps and its proved factorization to the native Jimbo representation.

This area owns the universal finite type-A q-Hecke algebra, its tower and algebraic traces. It does
not replace the native Jimbo representation, Turaev weighted-trace construction, or ordinary
Temperley–Lieb diagram algebra. It supplies their universal type-A Hecke interface and proves the
comparison maps. Ordinary TL and its positive quotient/Markov trace remain in
[TemperleyLiebOperatorAlgebras](https://github.com/TauCetiProject/TauCetiRoadmap/blob/ed1b1e8ba58e1ea36c3873d0c8607461298a2e91/TauCetiRoadmap/TemperleyLiebOperatorAlgebras/README.md).
Generic subfactor inclusion, index and relative-entropy APIs belong to [Subfactors](https://github.com/TauCetiProject/TauCetiRoadmap/blob/52da2001938fc3f5a9b3e8ce3c2c9b5c33b7ef51/TauCetiRoadmap/Subfactors/README.md). The rank-one quantum-group material in [QuantumGroups](../QuantumGroups/README.md) supplies only its stated rank-one interfaces. H4a does not assume that it supplies the higher-rank or signed-color representation theory: for finite color sets, H4a either constructs the required type-A modules in full or proves the equivalent finite checked-`R` decomposition and branching directly. The latter route owns the complete finite-color word-space decomposition, its q-Pieri matrices and the comparison with the specified first-site density.

## H1. The finite Hecke tower and its module theory

Construct `Hₙ(q)` by generators and relations, the unit-preserving tower maps, and the canonical
braid-group homomorphism. Prove its universal property, functoriality in coefficient maps and units,
and the basis theorem with one basis vector `T_w` for every `w ∈ Sₙ`. Build the type-A
length/reduced-word API on `Equiv.Perm (Fin n)` and prove the required Matsumoto reduced-word
comparison before defining `T_w`; consume existing Coxeter/adjacent-transposition APIs. Multiplication by a simple
transposition must be given by the length-increase/length-decrease rule, including the coefficient
`q−q⁻¹` in the descent case. Supply rank `n!`, the `q=±1` group-algebra equivalences (both have `T_i²=1`), and the canonical
comparison with `TauCeti.KnotTheory.jimbo` after factoring its braid representation through the
quadratic relation. Do not identify an arbitrary Jimbo tensor representation with the regular
Hecke module.

Over any field, put `[r]_{q²}=1+q²+⋯+q^{2(r−1)}`. The split-semisimplicity
criterion is exactly `∏_{r=1}^n [r]_{q²} ≠ 0`;
prove this criterion from the cellular/Specht forms rather than summarizing it as “q is generic.”
Then construct its simple modules indexed by partitions of `n`,
standard-tableau bases, a fixed Specht-module construction (with its chosen tableau basis and normalization), dimensions, and the Wedderburn decomposition.
Prove restriction and induction branching along `Hₙ ⊂ Hₙ₊₁` by adding/removing one box, with
multiplicity-one maps and their compatibility with the chosen tableau bases. At roots of unity,
separate the cellular/Specht modules, their bilinear forms and radicals, simple heads, blocks, and
the semisimple quotient. Never extend generic matrix units through a vanishing denominator.
Prove the `H_n`-bimodule decomposition `H_(n+1)=H_n+H_n T_n H_n` for `n≥1` and give
left and right `H_n`-module bases of rank `n+1` from the minimal coset representatives. These
are the induction and recursive-trace suppliers. Consume the relevant symmetric-group/Schur–Weyl APIs where they apply at `q=1`; do not duplicate
their ordinary symmetric-group theory.

For the complex specialization `q=√Q`, `Q>0`, define the cocenter as the quotient
complex vector space of `H_n(q)` by the linear span of commutators `xy−yx`; this span is
not an algebra ideal. Write `g_i=qT_i`, so `(g_i+1)(g_i−Q)=0`, and define
`ζ_m=g_(m−1)⋯g_1`, `ζ_1=1`. For every partition `λ` of `n`, define `ζ_λ` by placing these
cycle words on the consecutive disjoint strand blocks of sizes `λ_1,λ_2,…`, with explicit
tower and block embeddings. Prove `cycleBlock_cocenterBasis`: their cocenter classes form a
basis. Export `trace_eq_of_cycleBlock_values`: two complex-linear trace functionals on
`H_n(q)` agree if they agree on every `ζ_λ`. Prove compatibility under tower and block
embeddings. Export `towerTrace_eq_of_cycleChain_values`: normalized compatible tower traces
which are multiplicative on disjoint strand blocks agree everywhere when their values on
every `ζ_m` agree. State the block-multiplicativity hypothesis explicitly; equality on cycle
chains alone does not determine an arbitrary nonmultiplicative trace. These finite-Hecke
cocenter and comparison interfaces are owned by H1; H2 and H3 consume them.


For generic semisimple complex fibers, define normalized Jucys--Murphy elements in the declared g_i=√Q T_i convention by J_1=1, J_(i+1)=Q⁻¹ g_i J_i g_i; prove commutation, self-adjointness for Q>0, the tableau eigenvalue Q^(column−row) for the fixed Specht basis, and exact branching spectral projections. For Q≠1 also define the rescaled elements L_i=(J_i−1)/(Q−1). Prove the recurrence L_1=0 and L_(i+1)=Q⁻¹g_iL_i g_i+Q⁻¹g_i; its specialization at Q=1 is the additive Jucys--Murphy recurrence. Use the L_i contents to state a continuous Q→1 comparison, but do not obtain Q=1 path projections by dividing by Q−1. State root-of-unity limitations separately: the split-semisimplicity condition is
`∏_(d=1)^n [d]_Q≠0`; multiplicative Jucys--Murphy eigenvalues separate paths only when `Q≠1`
and the eigenvalues of the addable boxes of each fixed preceding partition are distinct. Prove that for a partition of size m−1 their nonzero content differences have absolute value at most m, and that Q^d≠1 for 1≤d≤n guarantees separation at every step m≤n. The split-semisimplicity criterion with Q≠1 implies this condition. At Q=1 use the
group-algebra/Schur--Weyl route and the rescaled additive elements; at other roots use the
separately defined cellular quotient. Prove the finite generic Hecke q-Frobenius character formula (Ram's formula) on the cycle-block basis, with exact Q-dependent coefficients and proof of the cycle-value/character identity; H3/H4 consume it, since a cocenter basis alone does not determine Schur character weights. In the ordinary symmetric-function carrier, prove power sums generate Λ_ℚ by Newton's triangular identities and extend scalars to ℂ; Layer 7's elementary/complete-function generation is not a substitute for this interface.

### Positive-real parabolic Pieri and orthogonal shuffle carriers

For `Q>0`, prove the ordinary parabolic induction rule
`Ind_(H_k⊗H_l)^(H_(k+l))(triv_k⊗S^ν)=⊕_(Λ/ν horizontal k-strip) S^Λ`,
with multiplicity one and `g_i=Q` on `triv_k`. This is broader than one-box
restriction. Construct its ordinary Hilbert carrier explicitly: on the orthonormal
basis of `k`-subsets of `1,…,k+l`, tensored with a unitary `H_l` module `U`, let
selected/selected pairs have scalar `Q`, rest/rest pairs act by the corresponding
consecutive generator of `U`, and mixed pairs in the order
(selected/rest,rest/selected) have block `[[Q−1,−√Q],[−√Q,0]]`.
Call this module `Sh_k(U)`; verify all Hecke relations. The initial mask
`{1,…,k}` carries `triv_k⊗U`. The induced-module map sending `h⊗u` to `h`
acting on this mask is triangular on minimal shuffle coset words, with nonzero
leading coefficient `(−√Q)^length`; the PBW coset basis proves it is an
isomorphism. Its norm is the specified orthonormal-mask norm, not an unspecified
norm transported through an algebraic isomorphism. A unitary intertwiner of rest
modules extends by identity on masks and preserves the first-site mask projection.

Supply Pieri in this carrier by the following finite-dimensional deformation.
Give the regular PBW carrier the inner product
`⟨g_v,g_w⟩=δ_(v,w)Q^length(w)`. Left and right simple multiplication are
self-adjoint; in the orthonormal basis `Q^(−length(w)/2)g_w`, their entries are
`√Q`, `Q−1`, or zero and depend continuously on `Q∈(0,∞)`. Left and right
multiplication commute. The additive JM recurrence above gives eigenvalues
`[c]_Q=(Q^c−1)/(Q−1)`, extended by `[c]_1=c`. For consecutive contents,
`[c+1]_Q−[c]_Q=Q^c>0`; therefore every preceding-partition Lagrange path
projector is continuous and orthogonal through `Q=1`. Define it recursively on
that preceding path, rather than separating coincident contents from unrelated
paths. Their sums give continuous central Young projectors with the same labels.

Fix a path `t` to `ν⊢l`. Right multiplication by `e_t(Q)` is a continuous
orthogonal projection on the regular `H_l` carrier, commuting with all left
generators, with simple range `H_l e_t≅S^ν`. In `Sh_k(H_l^regular)`, the
projection `B_ν=1_masks⊗right(e_t)` commutes with every full generator. Thus
`z_Λ(Q)B_ν(Q)` is a continuous orthogonal projection on one fixed
finite-dimensional Hilbert space. Its rank is integer-valued continuous and
hence constant on `(0,∞)`. At `Q=1`, multiplication of each mask by the sign
`(−1)^(number of rest-before-selected pairs)` turns the mixed minus-swaps into
ordinary swaps, so this is the actual symmetric-group induction.

Consume [SchurWeyl Layer7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/149fe79fc7f66b28ec635f15ec6553c7eff79b17/TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md#layer-7-symmetric-functions-the-frobenius-characteristic-and-rsk)'s native finite-variable
horizontal-Pieri clause (`hsymm_mul_schurPoly`, `YoungDiagram.InterlacedBy`) and
its stable Frobenius/induction clause: Specht-to-Schur, the actual block embedding
`S_k×S_l↪S_(k+l)` through `Equiv.Perm.sumCongr` and the sum/Fin equivalence,
external-product class functions and `ch(Ind(f⊠g))=ch(f)ch(g)`. Since the row
Specht module is trivial and `s_(k)=h_k` by one-row Jacobi–Trudi, these give
`ch(Ind(triv_k⊠S^ν))=h_k s_ν=Σ_(Λ/ν horizontal k-strip)s_Λ`.
Consequently `rank(z_Λ B_ν)` is `f^Λ` on those strips and zero otherwise.
Rank constancy and `dim S^Λ=f^Λ` prove the required positive-real Pieri rule
with its orthogonal decomposition. Include `k=0` and `l=0`. This construction
stays in finite-dimensional positive-real Hecke algebras; it asserts no
root-of-unity deformation, higher-rank quantum-group theorem or signed
supergroup semisimplicity. The ordinary representation-theory suppliers remain
with SchurWeyl; the Hecke parameter transport belongs here.

## H2. Algebraic Ocneanu trace and braid closure

On the algebraic union over a commutative ring `R`, construct the normalized `R`-linear trace
`tr_z`, for arbitrary `q∈Rˣ` and `z∈R`, with
`tr_z(1)=1`, `tr_z(xy)=tr_z(yx)`, compatibility under tower inclusions, and the last-strand
Markov rule `tr_z(x Tₙ)=z tr_z(x)` in the declared generator convention. Prove existence and
uniqueness at this algebraic level without claiming positivity. Also prove block multiplicativity
`tr_z(x·sh_a(y))=tr_z(x)tr_z(y)` for `x∈H_a`, `y∈H_b`, with the disjoint block embedding
and strand shift `sh_a` explicit; H1's cycle-chain comparison consumes this theorem. Define the trace radical at each
finite stage as the kernel of `x ↦ (y ↦ tr_z(xy))`, prove it is a two-sided ideal, and give the
quotient and compatibility APIs. Keep a degenerate one-dimensional representation of a relation
quotient separate from a compatible, nontrivial positive trace on a tower.

For a chosen coefficient specialization, let γ_n:BraidGroup(n)→H_n be the braid representation into the n-strand Hecke algebra. Let a=tr_z(γ_(n+1)(σ_n)) and b=tr_z(γ_(n+1)(σ_n^(−1))) be the two stabilization constants, independent of n by the tower trace rule, when they are units. Choose λ,C with λ²=b/a and Cλa=1=Cλ^(−1)b, and define F_n(β)=C^(n−1)λ^(w(β))tr_z(γ_n(β)). Prove F_n is unchanged by conjugation and both Markov stabilizations, so it descends along the native MarkovEquiv relation; define P_braid on the braid closure by this descended value. H2 proves the skein identity and normalized Ocneanu-trace formula for P_braid, including writhe and strand-number normalizations; compare its finite-color realization separately with the native weighted Jimbo trace. H2 does not import the geometric P_L invariant. GeometricTopology Layer4 owns the link carrier, geometric closure and Markov theorem, and the skein-defined P_L; after those foundations, it proves the geometric comparison P_L=P_braid. The dependency is one-way: native Markov-trace APIs → H2 algebraic braid invariant → GeometricTopology comparison.
If `xγ+yγ⁻¹+zI=0`, prove the resulting skein parameters are `(x/λ,yλ,z)`.
State coefficient extensions needed to choose the roots; use the universal polynomial comparison
for specializations where the normalized expression admits a regular extension;
prove regularity at each requested zero-factor specialization before evaluating it.

Under the native Jimbo convention `T²=(q−q⁻¹)T+1`, the skein sign is dictated by
`T−T⁻¹=q−q⁻¹`. Verify the two-strand unlink and both one-crossing closures in the comparison.
Use the existing positive/negative weighted partial traces and uncrossed-strand factor to prove
the general finite-colour Turaev stabilization and normalization comparison. The algebraic trace
on the full Hecke tower and its finite-colour realization are separate objects.

The p. 88 course-note specialization is not copied verbatim as a theorem statement. The printed source gives `P_b(e^α, −e^(−α), 2i sinh θ)`. The separately stated skein convention and
the displayed two-eigenvalue operator identity require a plus sign on the second parameter under
the convention used here:

```text
e^α γ + e^(−α) γ⁻¹ + 2 i sinh(θ) I = 0.
```

The minus-sign printed specialization gives the wrong two-strand unlink value. Keep the printed
formula in source provenance and make a separately proved corrected-parameter theorem; do not
silently rewrite one into the other. The source prints `tan θ` in this parameter line; the separately derived stabilization identity uses `tanh θ`. Preserve that source-versus-derived discrepancy.
However, the displayed two-eigenvalue representation and both Markov stabilization constants yield
the mathematical compatibility target `η=½(1−tanh(α)tanh(θ))` under the declared real
hyperbolic parameterization. This derived target is distinct from the source's printed `tan θ` and
must be proved from the representation/trace equations. Fix the eigenprojection explicitly:
`γ=i exp(−α)T`, `q=exp(−θ)`, and `e` is the eigenprojection for `i exp(−α−θ)`; hence
`γ=i[exp(−α−θ)e−exp(−α+θ)(1−e)]`. For `cosh α cosh θ≠0`, prove that equality of the
positive and negative stabilization constants is equivalent to
`η=cosh(α−θ)/(2cosh α cosh θ)=½(1−tanh α tanh θ)`. Here η is free before this equality
is imposed. Swapping the eigenprojections changes η to `1−η` and changes the sign in the
hyperbolic expression. When also `sinh θ≠0`, prove their common constant is
`−i sinh θ/cosh α` and take `λ=1`, `C=i cosh α/sinh θ` in the normalization above.
Do not replace the source's printed `tan θ` with the derived `tanh θ` identity. The parameter domains and the full “if and only if” classification still require proof against the
specified positive state carrier; neither formula alone settles it.

## H3. Positivity, quotient carriers, and the two exceptional regimes

Specify the algebra, involution, tower, and state carrier before any positivity statement. On a
unital *-algebra with a normalized positive tracial state `μ`, define `⟨x,y⟩=μ(x* y)`, conjugate-linear in the
first variable and linear in the second, matching Mathlib; quotient by its null ideal and prove the induced trace is faithful. On the
real-parameter complex specialization, define the real-parameter involution `Tᵢ*=Tᵢ` with conjugation on scalars; on the unit-circle
specialization, specify `Tᵢ*=Tᵢ⁻¹` with conjugation on scalars. The inverse in the quotient is
`Tᵢ−(q−q⁻¹)I`; generators in `FreeAlgebra` are not units. First prove this two-sided inverse,
then use the quotient universal property to construct the conjugate-linear antihomomorphism to
the opposite algebra, verifying the reversed relations and involutivity. Equivalently construct
the star map from a free group algebra with unit generators. These are distinct parameter fibers;
prove both maps in their stated fibers. The repeated-root fibers `q=±i` remain in H1's algebraic
scope: separately prove that imposing a unitary generator makes their C*-quotient scalar;
there is no projection change of generators through `q+q⁻¹=0`. Instantiate
the GNS Hilbert spaces, left regular representations and weak closures from the cited
operator-algebra suppliers; prove the specific Hecke inclusions and conditional-expectation
formulas on their coherent finite positive blocks. Prove positivity at every finite stage and compatibility
across the tower. A condition that a universal C*-algebra is nonzero is not a substitute for a
positive normalized trace on this specified carrier.

Treat the projection characters `eᵢ ↦ 0` and `eᵢ ↦ 1` separately. Under the Hecke convention
`(Tᵢ−q)(Tᵢ+q⁻¹)=0`, the scalar Hecke characters are `Tᵢ ↦ −q⁻¹` and `Tᵢ ↦ q` at these two
projection endpoints, respectively, if the comparison uses `Tᵢ=q eᵢ−q⁻¹(1−eᵢ)`. Prove this
generator comparison and the full quotient map rather than identifying the carriers by notation.
These one-dimensional representations exist for arbitrary parameters and do not establish a
nontrivial Markov tower or the interior classification `0<η<1`.

Keep two projection carriers distinct. The ordinary Jones/Temperley–Lieb quotient `A_n` in
Jones §11 is generated by self-adjoint projections `e_i` with distant commutation and
both adjacent relations `e_i e_(i+1)e_i=τe_i` and `e_(i+1)e_i e_(i+1)=τe_(i+1)`.
Balanced plus either relation gives the other; either relation alone is insufficient. With
`τ⁻¹=2+t+t⁻¹`, `g_i=t e_i−(1−e_i)` and `T_i=q⁻¹g_i` at `t=q²`, this quotient adds to the Hecke relations the extra relation

```text
g_i g_(i+1) g_i + g_i g_(i+1) + g_(i+1) g_i + g_i + g_(i+1) + 1 = 0.  (Jones (11.6))
```

The relation is not implied by the type-A Hecke relations: it selects the Jones quotient (at the
group-algebra specialization, the simple labels have at most two columns). Conversely, recovering
`e_i=(T_i+q⁻¹)/(q+q⁻¹)` requires `q+q⁻¹` to be a unit; state this hypothesis for an algebra
isomorphism and prove the generator change, rather than treating the two carriers as definitionally
equal. In this normalization `τ=(q+q⁻¹)⁻²`. Jones's trace has `tr(1)=1` and
`tr(x e_(n+1))=τ tr(x)`, so the Markov parameter on this ordinary Jones tower is `η=τ`.

The p. 88 course-note carrier instead has the balanced relation
`e_i e_(i+1)e_i−τe_i = e_(i+1)e_i e_(i+1)−τe_(i+1)`. It equates the two defects and is not
the individual Jones relation above. For that carrier define its unital *-algebra, universal
C*-completion, finite stages `A_(τ,n)`, and the positive normalized tracial state
`μ:A_τ→ℂ` with `μ(w e_(n+1))=η μ(w)` for `w∈A_(τ,n)`. Prove any quotient/comparison map to
ordinary TL; do not transfer the TL classification to every balanced-algebra state.

For the ordinary Jones projection tower, the positive trace parameters combine the continuous
Powers-state range `0<τ≤1/4` (real `t>0`, `τ=t/(1+t)²`) and the discrete values
`τ=(4 cos²(π/m))⁻¹`, `m≥3` (unit-circle parameter `t=e^{±2πi/m}`). The index is `τ⁻¹`, giving
`[4,∞) ∪ {4 cos²(π/m):m≥3}`. The §12 sentence lists the discrete part; read it with the §11 Powers
construction and §14 existence statement, not as the complete range alone. Transport the owner's positive forms, radicals, faithful quotient traces and weak-closure
comparisons through the explicit Hecke-to-native-TL quotient map. The normalized projection
is `δ⁻¹U_i` with `τ=δ⁻²`; the positive-loop convention and the native spin trace's
`δ=−(q+q⁻¹)` require the stated `q↦−q` comparison. This roadmap does not redevelop the
ordinary TL positivity theorem. At exceptional roots consume its trace-radical quotient.

Do not claim that this Jones projection theorem classifies every positive trace on every Hecke
quotient or the p. 88 balanced carrier. In the balanced presentation, the scalar characters
`e_i↦0` and `e_i↦1` exist for every `τ`, so universal-algebra nonzeroness is not the positive
normalized-state theorem. Moreover `e_i↦1−e_i` preserves the balanced relation and sends a Markov
parameter `η` to `1−η` at fixed `τ`. Consequently, retain the source's one-sided exceptional
parameter list as provenance, and prove the exhaustive list by including complementary states and the middle case. Prove the `m=4` value `η=1/2` using the positive Jones/Ising trace. Keep the separate relation `τ=η(1−η)` confined to the source's stated limit
family, not as a universal identity for the two parameters.

Prove the full balanced-to-Hecke presentation isomorphism before transporting any
classification. For `τ≠0`, choose `t≠0` with `τ⁻¹=2+t+t⁻¹` (so `t≠−1`) and put
`g_i=(1+t)e_i−1`. Prove the idempotence/quadratic equivalence and the exact identity

```text
g_i g_j g_i−g_j g_i g_j
 = (1+t)^3 [(e_i e_j e_i−τe_i)−(e_j e_i e_j−τe_j)],  j=i+1.
```

The inverse is `e_i=(g_i+1)/(1+t)`. Prove distant commutation and both composite maps on
generators, and star compatibility: `g_i*=g_i` for positive real `t`, `g_i*=g_i⁻¹` for
`|t|=1`, with conjugation on scalars in both cases. Prove the `t↔t⁻¹` comparison preserves
the classified parameters (`a_d(t⁻¹)=a_d(t)`); the choice of root is harmless only after this
comparison. This is a statement about the balanced presentation, not the ordinary TL quotient.
For the native Hecke trace `tr_z`, prove `η=(z+q⁻¹)/(q+q⁻¹)`. Show a positive Markov trace
on the algebraic presentation gives bounded GNS projection operators: use
`μ(x* e_i x)≤μ(x* x)` to prove `‖π(e_i)‖≤1`. This identifies positivity on the algebraic
presentation with factoring over its universal C*-representation. A nontrivial Markov state
means `η∉{0,1}`.

For the complete balanced-carrier trace classification, use Wenzl's parameter `Q=q²` and
projection `e_i^W=(Q−g_i)/(1+Q)` with `g_i=q T_i`. The generator comparison gives
`e_i^W=1−e_i` and therefore `η_W=1−η`. Prove this comparison and its preservation of the
relations and trace before transporting the classification. Define, for `d∈ℤ\{0}`,

```text
a_d(Q) = (1−Q^(d+1))/((1+Q)(1−Q^d)),  Q∈ℂˣ, Q≠−1, Q^d≠1;
a_d(1) = (d+1)/(2d).
```

Prove the removable-limit formula, `a_d+a_(−d)=1`, and the trace-weight formulas using Schur
specializations. For `Q>0` the normalized positive Markov traces on the full Hecke tower are
exactly those whose projection parameter belongs to

```text
[min(1/(1+Q), Q/(1+Q)), max(1/(1+Q), Q/(1+Q))]
  ∪ {a_d(Q) : d∈ℤ, d≠0}.
```

The interval is closed; at `Q=1` it is the singleton `{1/2}`. Give the generating identity after division coefficientwise by `Q−1`, so its `Q=1` specialization is substantive: `tr(ζ_1)=1` and, for `m≥2`, `tr(ζ_m)=Σ_iα_i^m+(−1)^(m−1)Σ_jβ_j^m`. For the regular point `α=β=0, γ=1`, this gives zero for every `m≥2`; the `m=1` equation is `p_1=1`. Include the scalar states at
`a_1=1` and `a_(−1)=0`, identify finite-stage trace radicals, and prove the row/column support
restriction for the discrete traces in Wenzl's convention. In the native convention, `η=a_k`,
`k>0` has at most `k` rows, and `k<0` has at most `|k|` columns. At
`Q=exp(±2πi/l)`, `l≥3`, the parameters in Wenzl's convention are

```text
η_W=a_(−k)(Q),  1≤k≤l−1,
```

so the native projection has `η=a_k(Q)`. Prove
`a_k(Q)=sin((k+1)π/l)/(2cos(π/l)sin(kπ/l))` and `a_(l/2)(Q)=1/2` for even `l`.
The native ordinary Jones trace is `η=τ=a_(−2)(Q)=a_(l−2)(Q)`; the `k=2` trace is its
projection complement. Construct the quotient using paths in the Young graph
that stay in the `(k,l)` alcove: at most `k` rows and `λ₁−λ_k≤l−k`, with paths and determinant
column shifts specified, rather than imposing only an endpoint constraint. Prove positivity of
the Schur weights, the trace radical, coherent branching, and the faithful positive quotient.
The `l=3` case consists of scalar endpoints; separate these from the `2≤k≤l−2`, `l≥4` factor
cases. Prove necessity as well as sufficiency, including that other unit-circle parameters have
only the scalar Markov states. These are the full Hecke positive-state theorems, with the
ordinary TL state recovered by the explicit quotient comparison.

Translate this classification to the hyperbolic parameters by proving the relation `η=½(1−tanh α tanh θ)` from the two eigenprojections and the positive and negative stabilization constants. State the domain `θ>0`, `α∈ℝ` on the positive-real family, `q=e^(−θ)`, `Q=e^(−2θ)`, and `η=½(1−tanh α tanh θ)`, with the interval endpoint and complement maps. For the exceptional line state `α=kθ+πi/2`, `k∈ℤ∖{0}`, and prove from the Hecke/Wenzl projection change that its native trace parameter is `a_(−k)(Q)` (while `a_k(Q)` is the complementary trace). For the exceptional point state `θ=πi/l`, `α=(k/l+½)πi`, `l≥3`, `1≤k≤l−1`, `Q=e^(−2πi/l)`, and compute both conventions directly: `tanh α=−i cot(kπ/l)` and `tanh θ=i tan(π/l)`, so the native parameter `η=½(1−tanh α tanh θ)` is `a_(−k)(Q)`, while the Wenzl projection parameter is `η_W=1−η=a_k(Q)`. Keep these labels attached to their stated projection conventions; do not infer or force a `k`-label from a separate classification. Include the middle value for even `l`, the complementary states, and the exact endpoint statement for the limit family. These parameter identifications are proof obligations against the declared projection map, not labels inferred from formula resemblance. The source's
printed one-sided bound is retained in provenance; the definitive theorem must include the
full `1≤k≤l−1` range in the projection convention just stated. The separate boundary relation
`τ=η(1−η)` describes the endpoints of the closed real interval, together with their scalar
limits; prove that identification rather than imposing it on every trace.

Complete the balanced projection presentation at `τ=0`, which has no finite invertible-q
change of generators: prove adjacent projections commute, identify the universal C*-algebra
with continuous functions on `{0,1}^ℕ`, and construct the unique Bernoulli-product Markov state
for each `0≤η≤1`. Its GNS closure is commutative. For nonreal `τ`, real `τ<0`, and real `τ≥1`,
prove all generators coincide by the adjoint relation and `(e_i−e_(i+1))³=(1−τ)(e_i−e_(i+1))`;
use the C*-norm bound `‖e_i−e_(i+1)‖≤1` and self-adjoint functional calculus to treat the
real cases, including `τ=1`. Identify the universal C*-algebra with `ℂ²`. The Markov rule
then gives `η=μ(e_i)=μ(e_i²)=η²`, so its only normalized Markov states are the two scalar
characters. No such collapse is asserted for the universal algebraic *-presentation alone. For the remaining positive real parameters outside the full Hecke positive-state
range, derive the same Markov-state exclusion from the Hecke comparison. This is a theorem
about normalized Markov states; scalar characters prevent any unrestricted “nonzero iff”
assertion about the universal algebra.

### Atomic tensor models for every positive-real Markov trace

Use the `g_i` convention from H1. On `ℓ²(J)⊗ℓ²(J)`, for a nonempty countable ordered alphabet
`J` with each label designated positive or negative, construct the bounded operator `R_Q`
from its action on the orthonormal tensor basis:

- for `i=j`, the scalar is `Q` on a positive label and `−1` on a negative label;
- for `i<j`, `R_Q(b_i⊗b_j)=(Q−1)b_i⊗b_j−√Q b_j⊗b_i`;
- for `i>j`, `R_Q(b_i⊗b_j)=−√Q b_j⊗b_i`.

Prove self-adjointness, the norm bound `‖R_Q‖≤max(Q,1)`, and the quadratic, braid, and
distant-commutation relations. The two-label block is `[[Q−1,−√Q],[−√Q,0]]`; prove the
braid identity by reducing each basis triple to at most three ordered labels with their
signs, then extend from the dense tensor span by boundedness. Relate `g_i↦R_(Q,i)` to the
native normalized generators by `T_i↦Q^(-1/2)R_(Q,i)` and the declared projection map.

For the all-positive finite alphabet, prove the full comparison with native Jimbo operators. In native increasing order, the two-color block of q·jimboGenerator is [[0,q],[q,Q−1]], whereas H3 uses [[Q−1,−√Q],[−√Q,0]]. Reverse the color order. For q=√Q, conjugate additionally by the diagonal word unitary U_n e_w=(−1)^(inv(w))e_w, where inv counts strict inversions; for q=−√Q, color reversal alone gives the required block. Prove the identities on arbitrary word spaces, the compatibility on tower generator images and the corresponding trace-GNS comparisons. At the g-level both choices give the same R_Q; at the T-level the q=−√Q route uses the sign-twist isomorphism H(√Q)≃H(−√Q), T_i↦−T_i, taking z↦−z and preserving the projection parameter η. This comparison is for the all-positive carrier; construct the signed extension from its displayed H3 matrices.

Pin the density as well as the generator. Native Turaev enhancement has jimboWeight(q,a)=q^(r−1−2a) for 0≤a<r and gives a scalar right/last-site slice. H4a's first-site/shifted-tail convention instead uses the normalized inverse enhancement jimboWeight(q⁻¹,a); after reversing colors it is exactly D_r=diag(Q^(r−1),…,1)/Z_r(Q). Prove both slice identities. For r=2 in native order and density diag(Q,1)/(Q+1), the left-slice diagonal entries of q·jimboGenerator are (Q²+Q−1)/(Q+1) and Q/(Q+1), while the right-slice entries are both Q²/(Q+1). The normalized inverse enhancement interchanges the two density entries and makes the left slice scalar. Prove the two densities give the same abstract Hecke trace by symmetric Schur weights and reversal conjugation with T_(w₀); carry the sided slice distinction through the operator-level expectations and generator-labeled tail identification.

The linear order on `J` is part of the representation data and is not the order of the nonincreasing Thoma lists in general. For the finite positive sector with weights `{1,Q,…,Q^(r−1)}/Z_r(Q)`, use R-order probabilities `p_j=Q^(r−j)/Z_r(Q)` (j=1,…,r); for the finite negative sector use `p_j=Q^(j−1)/Z_r(Q)`. For countably many sectors choose the whole order so positives satisfy `p_j=Q p_(j+1)` and negatives satisfy `p_(j+1)=Q p_j`: when `Q>1`, positive labels of type `ω` precede negative labels of type `ω*`; when `0<Q<1`, negative labels of type `ω` precede positive labels of type `ω*`. Keep the Thoma parameter lists nonincreasing as abstract lists and specify their bijections to this R-order separately. At the sector junction verify the left-slice scalarity directly.

For a finite or countable set of supported colors with atomic weights `p_i>0` and `Σ_i p_i=1`, construct the trace-class density `D=diag(p_i)`. Zero-weight labels are omitted from the support.
Prove that `D^⊗n` commutes with the Hecke image and that `Tr(D^⊗n·)` gives compatible
normalized positive traces. Consume [VonNeumannAlgebras V2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/35847ab4e112983b041cea50b15848e736f3264e/TauCetiRoadmap/VonNeumannAlgebras/README.md#v2-elementary-algebra-corners-and-tensors)'s reference-vector incomplete Hilbert tensor product for the repeated pair (H, ξ_D), where H=K⊗conj(K), K=ℓ²(J), and ξ_D=Σ_i√p_i b_i⊗conj(b_i) for p_i>0, Σ_i p_i=1. The finite-prefix embeddings are v↦v⊗ξ_D; H3 does not redevelop this generic carrier. The local algebra `B(K)` acts on the first tensor factor; the vector state is the faithful product state `Tr(D·)`, `D=diag(p_i)`. Prove local matrix coefficients are square-summable, the local algebras act normally, and the product vector is cyclic and separating for the product von Neumann algebra. Restrict the Hecke representation to the cyclic subspace generated by the product reference vector, and prove that this restricted representation is its trace-GNS representation. Prove that the faithful normal tracial restriction to the Hecke weak closure gives a generator-preserving normal isomorphism with the abstract trace-GNS weak closure. The Hecke algebra need not act cyclically on the entire ambient product-state Hilbert space. Define all generator-labeled tails through these maps. The modular group acts locally by `x↦D^{it}xD^(−it)`; identify it as the one-parameter subgroup of the diagonal phase action with coordinates `p_i^{it}`. Prove the phase-fixed algebra is contained in the state centralizer, so the restricted state is tracial there. Equality with a larger modular centralizer requires its own inclusion comparison theorem.

Write `α` for the positive-label weights and `β` for the negative-label weights, in
nonincreasing order. Prove the cycle-trace generating identity

`1+(Q−1)Σ_(m≥1)tr(ζ_m)x^m
 = exp((Q−1)γx) · ∏_i (1−α_i x)/(1−Qα_i x) · ∏_j (1+Qβ_j x)/(1+β_j x)`.

For the countable passage, bound every degree-`m` contribution in absolute value by
`C_Q^(m−1)p_(i_1)⋯p_(i_m)`, where `C_Q=max(1,Q,|Q−1|)`, and use the total probability mass1.
The exponential factor is the residual mass `γ=1−Σα_i−Σβ_j`; equivalently, after setting
`p₁=1` and `p_m=Σ_iα_i^m+(−1)^(m−1)Σ_jβ_j^m` for `m≥2`, the logarithm of the right side is
`(Q−1)x+Σ_(m≥2)(Q^m−1)p_m x^m/m`. This is the form that includes `γ>0`; omitting the
exponential is valid only when `γ=0`.
Derive the super-Newton-sum formula by taking logarithms. Use H1's named cocenter comparison
and separated-block multiplicativity to identify the trace on every finite algebra and on
the complete algebraic tower.

For the entire faithful closed interval at `Q≠1`, put `s=Q−(Q+1)η_W`, `c=Q−1−s`.
For `Q>1`, the positive Thoma list is `α_i=s/Q^i` and the negative list is `β_i=c/Q^i` for `i≥1`; realize them in the left-tail R-order by the positive `ω` block followed by the negative `ω*` block. For `0<Q<1`, the Thoma lists are `α_i=(−c)Q^(i−1)`, `β_i=(−s)Q^(i−1)`; realize them in R-order by negative `ω` followed by positive `ω*`. The stated order satisfies both adjacent left-slice recurrences. Prove this list-to-alphabet bijection, including vanishing sectors and the junction slice. Prove positivity, normalization, and the Markov trace
identity via the generating product `(1+cx)/(1−sx)` and H1's comparison theorem. Include
both endpoints, where one sequence vanishes. For every `r≥1`, put
`Z_r(Q)=Σ_(j=0)^(r−1)Q^j`. In positive R-order use `p_j=Q^(r−j)/Z_r(Q)`, and in negative R-order use `p_j=Q^(j−1)/Z_r(Q)`; these are the same unordered geometric weights, placed in the order required by the first-site/shifted-tail convention, not universally sorted nonincreasing. Use the positive weights for `η_W=a_(−r)(Q)` and the negative weights for `a_r(Q)`, where

`a_(−r)(Q)=(Q^r−Q)/((Q+1)(Q^r−1))`, `a_r(Q)=1−a_(−r)(Q)` for `Q≠1`.

Prove the removable limits `a_(−r)(1)=(r−1)/(2r)` and `a_r(1)=(r+1)/(2r)`. At `Q=1`
use the finite atomic models for these discrete traces, and the regular `S_∞` trace for the
collapsed interval point `η_W=1/2`; prove this exhausts H3's classification. The latter has
Thoma parameter `γ=1` and is a separate carrier from the atomic-density `γ=0` construction.
Handle `r=1` as the scalar characters. H4 computes the actual tail inclusion, commutant,
corner indices and inclusion-relative entropy for every family after these trace/model
comparisons; a trace identity alone does not identify any of those invariants.

## H4. Hecke trace factors, tail inclusions, index and relative entropy

Use [VonNeumannAlgebras V0–V2,V6,V8,V10–V11,V13](https://github.com/TauCetiProject/TauCetiRoadmap/blob/35847ab4e112983b041cea50b15848e736f3264e/TauCetiRoadmap/VonNeumannAlgebras/README.md)
for GNS, tracial L², spatial tensor products, slice maps/commutation, state centralizers, Takesaki expectations, group von Neumann models and hyperfinite weak closures, and [Subfactors S2,S4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/52da2001938fc3f5a9b3e8ce3c2c9b5c33b7ef51/TauCetiRoadmap/Subfactors/README.md)
for expectations, dimensions, Jones index, commuting-square towers and corner comparisons.
The generic operator-algebra theory stays with those owners. Construct the specific Hecke
instances, verifying the hypotheses from H3's positive path weights. Define
`B_n=π(H_n(q))`, where `Q=q²`, `A_(m,n)=Alg{π(e_(m+1)),…,π(e_(n−1))}`, and
`B=(⋃ B_n)''`, `A_m=(⋃ A_(m,n))''`, for `m≥1`. The subfactor generator labels in this
paragraph are Wenzl's one-based labels. Replacing each generator by its complement gives the
same unital tail algebras and must agree with the native-projection construction.

For `Q=exp(±2πi/l)`, `l≥4`, `2≤k≤l−2`, with the trace whose Wenzl projection parameter is
`a_(−k)(Q)` (native `q=±exp(±πi/l)` with the matching sign in `Q=q²`), put `d=sin(kπ/l)/sin(π/l)`. Prove `A_m` and `B` are hyperfinite II₁ factors,

```text
[B:A_m] = d^(2m),       A_m′∩B = B_m.
```

Construct the finite-dimensional expectations, periodic inclusion matrices and Perron–Frobenius
weights that prove the index and relative-commutant identities. For a minimal projection `p`
in the block labelled by `λ` in `B_m`, let

```text
d_λ = ∏_(1≤r<s≤k)
        sin((λ_r−λ_s+s−r)π/l)/sin((s−r)π/l).
```

Prove tr(p)=d_λ/d^m. In the finite Markov/basic-construction tower, compute both the ordinary trace and normalized dual trace of every path projection p; prove both equal d_λ/d^m using the same Perron–Frobenius weights and branching identities. This establishes τ′(p)=τ(p), including extremality of the relevant tower inclusion before applying the corner-index formula. Then prove [pBp:A_m p]=d_λ² and irreducibility of this corner inclusion. The reduced label has `λ_k=0` and `λ₁≤l−k`; determinant-column shifts preserve
`d_λ` and are compared explicitly with full `(k,l)` path labels. Every reduced admissible label
must occur at a finite level. At `k=2,m=1`, recover Jones's discrete index values
`4cos²(π/l)`; the m-step tail index is `(4cos²(π/l))^m`.
At `k=1` or `k=l−1`, H3's GNS algebra is `ℂ`; realize an index-one inclusion in `R` by the
identity inclusion, with no assertion that the scalar GNS representation is itself II₁.

At `Q=1` do not use the full diagonal-phase fixed-point argument: uniform one-site density makes that phase fixed algebra strictly larger than the Hecke closure. For each finite-color trace with `k≥2`, set `V=ℂ^k`, `E=B(V)^{\bar⊗ℕ}` with its product normalized trace, and let `PU(k)` act diagonally by the projective fundamental action induced by `Ad(V)` on every tensor factor. This action on each `B(V)` factor is effective. Prove tail minimality directly by site permutations. The algebra A=E_tail^{PU(k)} contains every finite permutation unitary of sites 2,3,… . For x∈A′∩E, commuting with those unitaries means invariance under their conjugation action. Using product-trace L² approximation by bounded local tensors and permutations moving any finite tail support away from the approximant, prove that the fixed algebra of all these tail permutations is B(V)_1⊗1. Hence A′∩E=B(V)_1⊗1; intersecting with B=E^{PU(k)} gives A′∩B=B(V)^{PU(k)}=ℂ by irreducibility of the projective fundamental action. On the tail alone the same argument gives A′∩E_tail=ℂ. These are the required minimality and irreducibility inputs. The fixed algebra is the weak closure of the symmetric-group image: on `V^⊗n`, Schur–Weyl gives `V^⊗n≅⊕_{λ⊢n,ℓ(λ)≤k} S^λ⊗S_λ(V)` and `B_n=End_{SU(k)}(V^⊗n)=ℂ[S_n]`; the central `SU(k)` kernel acts by scalars on `V^⊗n`, so this commutant is exactly the commutant of the induced projective `PU(k)` action. Finite-stage density then gives `B=E^{PU(k)}`. For the shifted tail use `E_tail=B(V)^{\bar⊗{2,3,…}}` and `A=E_tail^{PU(k)}`; the tail copy is generated by permutations of sites `2,…,n`, so its finite branching is `S_n↓S_(n−1)` with multiplicity one. The product trace gives path-projection weights `dim S_λ(V)/k^n`, central weights `f^λ dim S_λ(V)/k^n`, and edge probabilities `dim S_λ(V)/(k dim S_μ(V))` for `λ=μ+□`; the identity `k dim S_μ(V)=Σ_{λ=μ+□}dim S_λ(V)` normalizes each row. Use these formulas to verify that this is the Wassermann fixed-point inclusion associated with the projective fundamental representation of `PU(k)` (equivalently, the fundamental representation of `SU(k)` with its scalar center acting trivially on `B(V)`). For this specified PU(k) inclusion, use the proved tail minimality, Schur–Weyl identifications and the projective fundamental matrix coefficients to construct its basic construction/quasi-basis and prove index k². The target is this concrete inclusion for every k≥2. The entropy target is then `2 log k` by Subfactors S2a. For the sign twist `T_i↦−T_i`, transpose partitions and use the at-most-`k`-column support; the complement preserves the unital tail algebra.

For the regular trace at `Q=1`, use `B=L(S_∞)` with its canonical trace and `A=L(H)`, where `H={σ∈S_∞:σ(1)=1}≅S_∞` acts on the remaining sites. The subgroup conditional expectation has Jones index `[S_∞:H]=∞`, since the left-coset basis is infinite. Prove irreducibility directly: Fourier coefficients of `x∈L(H)'∩L(S_∞)` are constant on `H`-conjugacy classes; every nonidentity finite-support permutation has an infinite such class (move its finite support among infinitely many points of the complement), so square-summability forces all nonidentity coefficients to vanish. Thus `A'∩B=ℂ`. For entropy, apply Subfactors S2a's atomic-relative-commutant theorem, which has no finite-index hypothesis: irreducibility leaves the single atom `1` of trace `1`, and its corner index is `[B:A]=∞`, giving `H(B|A)=∞`. Verify the canonical group trace and trace-preserving subgroup expectation required by that theorem. The regular point has Plancherel path law and the separate permutation-RSK row/column limits stated below. H4a remains restricted to `Q≠1`.

Consume [Subfactors S2a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/52da2001938fc3f5a9b3e8ce3c2c9b5c33b7ef51/TauCetiRoadmap/Subfactors/README.md#s2a-relative-entropy-of-finite-tracial-inclusions)'s
relative inclusion entropy and Pimsner–Popa atomic-relative-commutant formula,
including its faithful-normal trace-preserving expectation hypotheses. Verify
these hypotheses on the Hecke inclusions before applying those theorems.
Prove the root-family inclusions above have
`H(B|A_m)=2m log d`: for `m=1` use irreducibility, and for general `m` verify the corner
index/weight equality in the atomic formula. For each irreducible corner compute `H=2log d_λ`.
Prove the `Q=1` finite-colour entropy `2log k` and the regular-trace entropy `∞` by their actual
inclusion hypotheses. The entropy is the relative entropy of the inclusion. Any entropy theorem
for a shift requires constructing that automorphism and its own dynamical entropy definition.

For every positive-real trace family from H3, including reducible and scalar cases, construct the tail inclusion, relative commutant, minimal corner weights, index and relative entropy. For `Q≠1` atomic families use H4a's full-torus fixed algebra and its atomic corner theorem only after the color-projection estimate is proved. At `Q=1`, use the separate finite-color Schur--Weyl and regular group routes stated above; do not invoke H4a. Include the scalar endpoint calculation for the literal source assignment `τ=α, η=0`, together with all the explicit nontrivial real, root-of-unity and `Q=1` families; the source-notation paragraph below records the printed subscript and its endpoint interpretation.

### H4a. Full phase fixed algebras and color projections

For a positive-real atomic tensor model from H3 with `Q≠1`, let `J` be its countable color set, with strictly positive weights `w_j` summing to 1. This theorem does not apply to the uniform `Q=1` finite-color models. Let `K=ℓ²(J)`, `D=diag(w_j)`, and let `E` be the infinite spatial tensor-product von Neumann algebra in the faithful product-state GNS representation with state `φ=⊗Tr(D·)`. Let `T^J` act at each site by `u_z b_j=z_j b_j`. Its normal action preserves `φ`. Define `F=E^(T^J)`, `A=E_tail^(T^J)`, and `B=W*(R_1,R_2,…)` for the actual generator-labeled H3 representation.

The ambient `E` has the Powers product state and is generally type III for nonuniform `D`; do not call `φ` a trace on `E`. The modular action of `φ` is contained in the diagonal phase action, so its restriction to `F`, and hence to `A`, is tracial. Each `R_i` preserves the color multiplicity vector of the two adjacent tensor factors, giving `B⊆F`.

First propagate a first-site projection to every site. The tensor shift `S:E→E_tail⊆E`, defined on local tensors by `x_1⊗⋯⊗x_n↦1⊗x_1⊗⋯⊗x_n`, extends to a normal `φ`-preserving endomorphism in the stationary product-state GNS representation. Prove `S(R_i)=R_(i+1)`, hence `S(B)⊆B`; its iterates send each assumed `P_j=E_jj⊗1` to the corresponding color projection at every site. With all site projections in `B`, sandwich each `R_i` between two-site color projections. For distinct adjacent colors the nonzero swap coefficient yields the corresponding matrix unit. Adjacent swaps connect any pair of finite words with the same color multiplicity vector, so these balanced matrix units span each finite-site `T^J`-fixed algebra. Kaplansky density followed by normal Haar averaging gives `F⊆B`, hence `B=F`; apply the shifted argument to obtain `A` as the full phase fixed algebra.

For the tail irreducibility calculation, take `x∈A'∩E_tail` and approximate both `x` and `x*` in product-state `L²` by bounded local `x_n`. For a local test `y`, choose a finite site permutation `σ` moving the support of `y` away from that of `x_n`. This permutation preserves the product state and belongs to `A`, hence fixes `x`. Product independence gives `φ(x_nσ(y))=φ(x_n)φ(y)`, and nontracial Cauchy–Schwarz bounds the error by `‖x*−x_n*‖₂‖y‖₂`. Passing to the limit and using density of local `y` shows `φ(xy)=φ(x)φ(y)` for all `y`; faithfulness gives `x=φ(x)1`. The same proof on the full chain gives `A'∩E_tail=ℂ` and `B'∩E=ℂ`. It follows that `A` and `B` are factors, `A'∩B=ℓ∞(J)` with minimal atoms `P_j`, and `P_jBP_j=P_j⊗A`.

The inclusion expectation is the restriction of the normal slice map `φ_D⊗id:B(K)⊗E_tail→E_tail`. Prove torus equivariance sends `B` into `A`, and verify faithfulness, trace preservation and bimodularity on the fixed-point inclusion. Prove both invariants using their distinct Subfactors suppliers. For finite `J` of cardinality `r≥2`, the relative commutant has atoms `P_j`; the positive slice expectation satisfies `E(x)≥w_min Σ_j P_jxP_j≥(w_min/r)x` for `x≥0`, so the Pimsner–Popa bound gives finite index. Each corner inclusion is the identity, so the Subfactors S2 local-index formula gives `[B:A]=Σ_j 1/w_j`. For infinite `J`, the relative commutant `ℓ∞(J)` is infinite-dimensional, which precludes finite Jones index; hence `[B:A]=∞=Σ_j1/w_j`. The entropy formula is the separate [Subfactors S2a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/52da2001938fc3f5a9b3e8ce3c2c9b5c33b7ef51/TauCetiRoadmap/Subfactors/README.md#s2a-relative-entropy-of-finite-tracial-inclusions) atomic-corner theorem. For the singleton case `J={j}`, `B=A=ℂ`, so `[B:A]=1` and `H(B|A)=0`; do not call this scalar carrier a II₁ factor. For `|J|≥2`, verify the fixed algebras are II₁ factors (the finite-site balanced word projections give infinite dimension for finite `J`, and the same argument applies for infinite `J`). Then

```text
[B:A] = Σ_j 1/w_j,
H(B|A) = 2 Σ_j −w_j log(w_j).
```

Use extended-value conventions. For infinitely many positive geometric weights the index diverges while Shannon entropy is finite. Positive and negative labels with equal numerical weights remain distinct atoms because their `T^J` characters differ. This theorem applies to each Hecke family after H4a proves the color projections and H3 proves the exact GNS comparison.

#### Finite positive colors from the owned fundamental type-A quantum model

For `r≥2` and `Q>0`, `Q≠1`, the fundamental-color model may be derived from `U_Q(sl_r)` in Sawin's quantum-trace convention, or from the direct checked-`R` decomposition specified in the following signed-color target. The named QuantumGroups interfaces are rank-one and do not supply the higher-rank package. If the quantum-group route is used, construct the type-A quantized enveloping Hopf *-algebra and every finite-dimensional type-1 module indexed by a dominant integral highest weight that occurs in tensor powers; give the compact real form, raising and lowering operators, coproduct, module characters, tensor-product decomposition, monodromy eigenvalues and normalized Clebsch maps. Also construct the fundamental module, positive invariant quantum trace, normalized checked-`R` operator, quantum exterior-square idempotent and partial quantum trace; state exact formulas and prove the identities used below. A fundamental-module calculation alone does not supply the other modules or the signed countable-color decomposition. Then define `E_n=End(V^⊗n)`, `M_n=End_{U_Q(sl_r)}(V^⊗n)`, and `K_n=End_{U_Q(h)}(V^⊗n)`. Embed each stage by `x↦x⊗1`. Give `E=⋃E_n` its compatible normalized quantum trace and form its GNS weak closure `E_Q` with faithful normal state `φ`; only the fixed algebra is tracial. Prove the following ingredients in the specified carrier, rather than importing a finite-level equality that is false in general:

- Establish positivity and compatibility of the quantum traces and identify the finite-stage torus fixed algebras `K_n=E_n^T`.
- Prove the weight-lattice random-walk estimates used in Sawin's weak-closure theorem: mass in every bounded weight region tends to zero; Weyl-character estimates control high-weight tails; and the highest-weight modules have uniform bounded-depth comparison maps with the norm bounds for raising and lowering operators.
- For `x∈K_n`, construct bounded `x_m∈M_m` approximating `x⊗1` in quantum-trace `L²`, by defining `x_m` first on highest-weight vectors and extending it to their bounded-depth descendants. Control the low-weight and high-weight-tail subspaces by the preceding estimates. Deduce `K_n⊆M_Q`, where `M_Q=(⋃M_n)''` and `K_Q=(⋃K_n)''`; the reverse inclusion follows from `M_n⊆K_n`. Thus `M_Q=K_Q=(E_Q)^T`. The density step is in the infinite weak closure: do not assert `K_n=M_n` at finite level.
- Prove the type-A fundamental checked-`R` criterion: every weight of `V` has multiplicity one; the summands of `V_λ⊗V` are `V_(λ+μ_i)`; and their classical Casimir eigenvalues are pairwise distinct. Use the Casimir criterion to prove the algebra generated by the quantum checked `R`-matrices is `M_n` at every finite stage. This step is specific to the fundamental `sl_r` representation; `R_n=M_n` fails for general quantum-group representations.

Choose and state the fundamental weight basis and its linear order explicitly. Compute the normalized quantum trace directly from Sawin's `q^{-t}` formula, including the longest-Weyl `Q↔Q⁻¹` comparison, and identify its one-site density in the positive R-order as `D_r=diag(Q^(r−1),…,Q,1)/Z_r(Q)`; for the negative sector use the reversed-density/conjugate Hecke automorphism. Verify these exact basis-order and parameter conventions rather than infer them from a consecutive-ratio slogan. The Hecke eigenprojection onto `Λ²_Q V` has normalized trace

```text
qdim(Λ²_Q V) / qdim(V)^2
  = Σ_(1≤i<j≤r) p_i p_j
  = (Q^r−Q)/((1+Q)(Q^r−1)) = a_(−r)(Q)
```

Compute the partial quantum trace of this projection to prove its Hecke Markov rule. Compare its two eigenvalues and normalized checked-`R` matrix with H3's explicit `R_Q` block, including the sign/order of the off-diagonal entries and the scaling `g_i=√Q T_i`. Prove both finite families are normalized compatible Markov traces with parameter `a_(−r)(Q)`; H2 uniqueness then identifies the traces on every finite stage and gives a generator-preserving trace-GNS unitary. Apply the full phase-fixed-algebra and corner proof in the fundamental quantum-group carrier, where Sawin's theorem supplies each literal first-site weight projection. Transport the generator-labeled inclusion, tail, relative-commutant atoms, corners and weights abstractly through the trace-GNS unitary; a GNS unitary is not asserted to identify literal basis projections in the two tensor models.

For `Q>1`, prove the parameter/order comparison using Sawin's longest-Weyl-element isomorphism from `U_Q` to `U_(Q⁻¹)` and the corresponding reversed fundamental weight basis. For the negative discrete trace `a_r(Q)`, use the Hecke automorphism `g_i↦Q−1−g_i`, equivalently `T_i↦−T_i⁻¹`; prove it swaps the two spectral projections, sends `η_W` to `1−η_W`, and transports row Young-edge limits to column limits by partition transpose. This yields the finite negative-color projections with the complementary trace parameter. The finite-color trace, full phase fixed algebra, tail atoms, corners and invariant formulas then apply to both signs.

#### The signed Schur path law and countably many signed colors

Use the nonincreasing Thoma parameters `α₁≥α₂≥⋯≥0`, `β₁≥β₂≥⋯≥0`, with `γ=1−Σ_i α_i−Σ_j β_j≥0`; ties are allowed. Let `Λ_ℂ` and its ordinary Schur basis `s_λ` be the stable symmetric-function carrier owned by [RepresentationTheory/SchurWeyl Layer 7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/149fe79fc7f66b28ec635f15ec6553c7eff79b17/TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md#layer-7-symmetric-functions-the-frobenius-characteristic-and-rsk). Consume the existing native finite suppliers `TauCeti.diagramOf`, `TauCeti.standardCount`, `TauCeti.StandardYoungTableau`, `TauCeti.frobeniusCharacteristic`, `schurPoly`, `psumPart`, `hsymmInt`, `TauCeti.rowInsert`, and `TauCeti.rowInsertEquiv`, together with the partition/diagram dictionary and finite Specht theory from Layers 0–6. Consume Layer 7's stable power-sum/Schur basis, Frobenius map and ordinary RSK targets as that layer establishes them. Do not redevelop finite `S_n` representation theory or ordinary Schur identities here. H4a owns the Hecke-to-Thoma parameter adapter, the signed specialization/path measure, its LLN adapter, and the resulting operator projections; the Schur–Weyl roadmap does not own Hecke traces or this signed extension. The dependency graph is acyclic: SchurWeyl Layers 0–7, Exchangeability's empirical-frequency API, and Hecke H1/H3 feed H4a; VonNeumannAlgebras and Subfactors supply its GNS, conditional-expectation, index and entropy foundations; none of those consumers depend back on this Hecke layer.

For each such pair define the ring specialization `ev_(α,β):Λ_ℂ→ℂ` by

```text
p₁ ↦ 1,
p_m ↦ Σ_i α_i^m + (−1)^(m−1) Σ_j β_j^m   (m≥2),
s_λ(α;β) := ev_(α,β)(s_λ).
```

The residual mass `γ` is represented by the condition `p₁=1` while its contribution to every `p_m`, `m≥2`, is zero. Prove finite-truncation continuity of this specialization and its Schur values. Build the signed Schur path measure rather than assuming positivity or coherence: for `γ=0`, construct signed words on the even/positive and odd/negative countable alphabet with letter probabilities `α_i,β_j`; implement super row insertion (positive letters weak along rows and strict down columns, negative letters strict along rows and weak down columns) and its inverse with a standard recording tableau. Prove the signed RSK weight identity: the total probability of insertion shape `λ` is `f^λs_λ(α;β)`, and each fixed standard recording path to `λ` has probability `s_λ(α;β)`. For `γ>0`, add a non-atomic even dust alphabet of mass `γ`; prove the same specialization by finite atomic approximations whose individual dust weights tend to zero. Equivalently, obtain the coherent path measure as the projective limit of those finite-alphabet signed RSK measures. This proves `s_λ(α;β)≥0`, `Σ_(λ⊢n) f^λs_λ=1`, the edge transition `π_(λ,Λ)=s_Λ(α;β)/s_λ(α;β)` when `s_λ>0`, and zero mass for vertices with `s_λ=0`.

Identify this Young-graph measure with each generic real H3 trace, not with a new `Q`-dependent shape law. For `Q>0` in the semisimple real Hecke tower (and the group-algebra tower at `Q=1`), use H1's finite Hecke irreducibles, multiplicity-one Young branching, primitive path idempotents and central idempotents to prove

```text
tr(e_t) = s_λ(α;β)       for a Young path t ending at λ,
tr(z_λ) = f^λ s_λ(α;β)  for the central shape projection z_λ.
```

Derive this adapter from H1's finite cocenter/cycle-block comparison and the exact Hecke trace parameter convention in Neretin/VK; do not infer it merely from equality of generator traces. Neretin's cycle representatives have `Q`-dependent trace values, but the corresponding central Young path law has the ordinary signed Schur transitions above. For the H3 full interval at `Q≠1`, the geometric parameter sequences have `γ=0`; the collapsed `Q=1` regular trace has `α=β=0, γ=1` and is the Plancherel path law. The root-of-unity fusion traces and their non-semisimple finite quotients remain in the preceding finite-color/fusion targets; do not use generic semisimple Young idempotents for them.

Prove the Thoma shape limits on this constructed carrier. Prove the signed Greene identities for the chosen super-insertion convention and deduce, for each fixed `k`, almost surely,

```text
(λ₁(n)+⋯+λ_k(n))/n → α₁+⋯+α_k,
(λ′₁(n)+⋯+λ′_k(n))/n → β₁+⋯+β_k.
```

Pass from each fixed finite alphabet to the countable alphabet using the `ℓ¹` tail-mass bound. Consume Exchangeability's named target `ConditionallyIIDWith.tendsto_empiricalMeasure_apply_ae_forall` for simultaneous almost-sure frequencies of the countable singleton letters. For the nonatomic dust, prove its individual frequencies vanish and its contribution has no positive linear row or column frequencies. Subtract successive partial-sum limits to obtain, for every fixed `i,j`, almost surely,

```text
λ_i(n)/n → α_i,       λ'_j(n)/n → β_j.
```

With H1's Jucys–Murphy eigenvalue `Q^(c(□))`, `c(□)=column−row`, deduce the signed addable-edge limits

```text
(addable row-i content)/n = (λ_i+1−i)/n → α_i,
(addable column-j content)/n = (j−λ'_j−1)/n → −β_j.
```
For `Q≠1`, the geometric weights are strictly decreasing within each nonzero sector, so each fixed nonzero signed atom is isolated; opposite sectors remain isolated even when `α_i=β_j`. Specify bounded windows by applying them to the normalized content `log_Q(J_i)/n`; at finite stages this is the spectral calculus of the positive Jucys–Murphy eigenvalue `Q^c`, not a window applied to `Q^(c/n)`.

Use the full finite-stage algebras and their shifted-tail branching for the color-projection convergence theorem.

Work in the state centralizer `C=E_φ`, on which `φ` is a faithful finite trace. The first-site color projection `P_a` lies in `C`, and every finite Hecke image does as well. Fix `q=√Q>0` and the representation `ρ_n:H_n(q)→B_n` by `ρ_n(T_i)=q⁻¹R_i`, equivalently `ρ_n(g_i)=R_i` for `g_i=qT_i`. For `n≥2`, let `B_n⊆C` be this image, generated by `R₁,…,R_(n−1)`, with the convention that `H_n` has `n` strands and `n−1` generators. Let `Tail_n⊆B_n` be the shifted copy of `H_(n−1)(q)` under `T_i↦q⁻¹R_(i+1)` (equivalently `g_i↦R_(i+1)`) for `1≤i≤n−2`; it is generated by `R₂,…,R_(n−1)`. This is the tail inclusion, distinct from the natural prefix inclusion generated by `R₁,…,R_(n−2)`. In the abstract tower, verify that `δ_n=T₁T₂⋯T_(n−1)` satisfies `δ_n T_i δ_n⁻¹=T_(i+1)` for `1≤i≤n−2`; this identifies the shifted inclusion with the standard multiplicity-free Young branching, while preserving the generator labels in the tensor model. Prove `P_a` commutes with `Tail_n`, since it acts on the first tensor factor. The expectations `E_(B_n):C→B_n` are the `φ`-preserving finite-stage expectations, and their martingale limit is `E_B:C→B` in `L²(C,φ)`.

On a generic semisimple real Hecke fiber, use multiplicity-free restriction along `Tail_n⊂B_n`. For `λ⊢n−1` and `Λ⊢n` with `Λ/λ` one box, let `z^tail_λ` be the central idempotent of the shifted tail copy and `z^full_Λ` the central idempotent of the full stage, interpreted in the positive quotient; omit zero-trace blocks. The orthogonal tail-branching edge projections are

```text
q_(λ,Λ) = ρ_n(z^tail_λ) z^full_Λ ∈ B_n,
Σ_(λ,Λ) q_(λ,Λ) = 1,
Tail_n' ∩ B_n = span{q_(λ,Λ)}.
```

By bimodularity of `E_(B_n)` over `B_n`, `E_(B_n)(P_a)` also commutes with `Tail_n`; the multiplicity-free relative-commutant description therefore gives the exact expansion

```text
E_(B_n)(P_a) = Σ_(λ,Λ) c_(a,n)(λ,Λ) q_(λ,Λ),
c_(a,n)(λ,Λ) = φ(P_a q_(λ,Λ)) / φ(q_(λ,Λ))
```

for positive-weight edges, with coefficient zero on zero-weight edges. Define `F_(n,a)` as the sum of the `q_(λ,Λ)` whose added box has scaled content `c(box)/n` in a fixed bounded signed window around `+α_i` for positive color `i`, or around `−β_j` for negative color `j`; choose disjoint windows using the strict geometric spacing within each present sector, with the sign separating equal opposite-sector weights. Handle absent-sector endpoints by omitting their nonexistent windows.

Independently of the direct-countable closure proof below, make the finite joint edge law an explicit H4a-owned representation target in the actual tensor model. For every finite alphabet with r positive and s negative colors, start from the explicit two-color blocks of H3 on K_(r,s)^{⊗n}. Construct the joint spectral projections of the commuting Hecke Jucys–Murphy elements and recursively choose a basis of each preceding-path range using the actual checked-R matrices on ordered color words. At every one-box step, prove the resulting q-Pieri/Clebsch columns are orthogonal, complete on the new range, and normalized in the ordinary tensor Hilbert norm; fix phases by the first nonzero coordinate. Prove the complete decomposition into hook-partition Hecke modules, multiplicity spaces, highest-weight labels and characters, and one-box branching from the displayed matrices. If a higher-rank type-1 U_Q(sl_r) or signed quantum-group model is used instead, construct all finite-dimensional highest-weight modules, raising and lowering operators, coproduct, characters, monodromy eigenvalues and orthonormal Clebsch maps. No rank-one QuantumGroups API, ordinary signed RSK statement, or unproved quantum-supergroup semisimplicity supplies this decomposition. The signed RSK theorem supplies the marginal shape law and content limits.

Make the signed tableau indexing concrete. A path of length n is a chain of hook partitions ∅=λ^(0)⊂λ^(1)⊂⋯⊂λ^(n), with λ^(m)_(r+1)≤s for an alphabet of r positive and s negative letters. These finite-alphabet recursions use only a finite ordered word list; they do not enumerate a countable ω+ω* alphabet lexicographically. Its word multiplicity basis is indexed by semistandard signed tableaux of that shape: positive letters are weak along rows and strict down columns; negative letters are strict along rows and weak down columns, with the selected total order fixing ties. Prove these tableaux index a basis of the multiplicity space, and that restriction from n to n−1 removes exactly one box with the stated signed content eigenvalue. Derive this hook Schur–Weyl/q-Pieri assertion from the actual finite matrices, rather than importing the ordinary tableau rule.

Pin the construction, not only the name of its output. In the finite word basis define Y_1=I and Y_(m+1)=Q^(−1)R_mY_mR_m; expand the recursion into ordered products of the explicit H3 two-color matrices and prove the joint path spectrum from H1. On a preceding-path range define each path projector by the finite Lagrange product over the distinct eigenvalues of Y_1,…,Y_n, with denominators proved nonzero on the stated generic semisimple fiber. In coordinates its entries are the entries of
`P_t=∏_(m=1)^n ∏_(u∈Spec(Y_m), u≠Q^(c_m(t)))(Y_m−uI)/(Q^(c_m(t))−u)`.
Order color words lexicographically. For the k-th nonzero residual from word w_k, give the actual column formula
`v_(t,k)=P_t e_(w_k)−Σ_(j<k)⟨u_(t,j),P_t e_(w_k)⟩u_(t,j)`, `u_(t,k)=v_(t,k)/‖v_(t,k)‖`,
omitting zero residuals and fixing each phase by its first nonzero coordinate. Thus each coefficient is a finite expression in H3 matrix entries, path eigenvalues Q^(c_m), spectral denominators and earlier columns. Prove orthogonality, completeness and the highest-weight/multiplicity interpretation from this recursion.

For `λ⊢n−1`, `Λ⊢n`, and a positive-trace edge, let `q_(λ,Λ)=ρ_n(z^tail_λ)z^full_Λ`, with the shifted-tail path basis produced by the same recursion on sites `2,…,n`. For each color `a`, compute the coefficient by the exact finite matrix formula

```text
c_(a,n)(λ,Λ) = φ(P_a q_(λ,Λ))/φ(q_(λ,Λ))
 = [Σ_ℓ Σ_(u∈J^(n−1)) w_a (∏_(h=2)^n w_(u_h)) |⟨b_a⊗u, ξ_ℓ⟩|²]
   / [Σ_ℓ Σ_(v∈J^n) (∏_(h=1)^n w_(v_h)) |⟨v, ξ_ℓ⟩|²],
```

where `{ξ_ℓ}` is the recursively constructed orthonormal basis of the edge range. Establish the ratio identity, orthogonality and completeness of the edge ranges, and positivity of its denominator exactly on positive-weight edges. The formula is a matrix-entry identity for the actual product density; it is not an additional normalization of the basis vectors.

##### Direct countable color-projection theorem

For the complete continuous atomic family `Q≠1`, prove the projection theorem
directly in its countable product state. Write `t=Q_*⁻¹∈(0,1)` and
`α_i=A t^(i−1)`, `β_j=B t^(j−1)`, where `A,B≥0` and `A+B=1−t`.
These are H3's same complete Thoma lists, in its specified R-order; a vanished
sector is omitted. The finite positive/negative discrete models retain their
separate preceding realization theorem. The present route proves the full
signed/countable conclusion, without replacing the actual state by normalized
retained-color states. The estimates below are countable-state estimates;
no uniform finite-alphabet truncation estimate is needed or asserted.

First take `Q>1`, `A>0`, and let `P` be the literal first-site projection for
the FIRST positive color, of weight `A`, least in R-order. Establish the
actual normalized overlap, its all-shape weighted estimate, the branch estimate
and literal membership in that order. Recover every other color afterwards by
the explicit remaining-alphabet construction below. An edge projection, a Schur
shape frequency and a first-site color projection are distinct objects throughout.

**Complete countable hook product and branch masses.** For arbitrary
nonnegative `A,B`, not necessarily normalized, prove

```text
s_λ(A,At,…;B,Bt,…)
 = t^(n(λ)) ∏_(i,j∈λ) (A+B t^(j−i))/(1−t^(h_λ(i,j))).       (H)
```

Here `n(λ)=Σ_i(i−1)λ_i`, `h_λ(i,j)=λ_i−j+λ'_j−i+1`.
A finite polynomial argument supplies the identity, including countable
convergence. The degree-d Jacobi–Trudi specialization
`p_m=(1−u^m)/(1−t^m)` is polynomial in `u`. At `u=t^M`,
`M≥length λ`, the ordinary finite geometric bialternant/Vandermonde
calculation gives

```text
t^(n(λ)) ∏_(i<j≤M)
 (1−t^(λ_i−λ_j+j−i))/(1−t^(j−i))
 = t^(n(λ)) ∏_(i,j∈λ)(1−t^(M+j−i))/(1−t^h).
```

For the finite cancellation, in each row i the hook lengths together with
`λ_i−λ_j+j−i`, `i<j≤M`, partition `1,…,λ_i+M−i`.
Scanning columns from right to left shows each drop in column height skips
exactly one of the listed row differences. With
`(t;t)_r=∏_(d=1)^r(1−t^d)`, this gives the hook denominator
`∏_i(t;t)_(λ_i+M−i)/∏_(i<j)(1−t^(λ_i−λ_j+j−i))`;
the numerator is `∏_i(t;t)_(λ_i+M−i)/(t;t)_(M−i)` and
`∏_i(t;t)_(M−i)=∏_(i<j)(1−t^(j−i))`. Thus the identity
holds at infinitely many distinct `u=t^M`, hence polynomially for all u.
Put `u=−B/A`, multiply by `A^d`, and use polynomial continuity at `A=0`.
The power sums are exactly `(A^m+(−1)^(m−1)B^m)/(1−t^m)`, so this
is the declared complete signed specialization. All positive-mass edges have
positive denominator; one-sector endpoint identities use ordinary/transpose
support and omit zero-mass blocks.

For an addable row a set `d_j=λ_j+1−j` for EVERY j, with zero parts
retained, `c=d_a`, and `Δ_j=|d_a−d_j|`. Dividing(H) gives

```text
P_a(λ)=∏_(j<a)(1−t^(Δ_j−1))/(1−t^Δ_j)
       ·∏_(j>a)(1−t^(Δ_j+1))/(1−t^Δ_j),
r_a=s_(λ+e_a)/s_λ=(A+B t^c)t^(a−1)P_a
                 =α_a P_a+B t^λ_a P_a.                    (B)
```

For `L≥max(a,length λ)`, the zero-row tail in P is exactly
`1/(1−t^(c+L))`; `c+L>0`. Thus the infinite product and the ratio are
specified, with no bound on the number of rows or hook lengths. Transpose
interchanges A,B and proves the corresponding negative-column ratio.

**The actual all-shadow event.** For a supported positive color a choose
`0<u<α_a<v` so `[u,v]` contains no other positive frequency. Let
`DirectGood(n,a,G)` for `λ⊢n−1` mean: row a is actually addable;
`d_a∈[nu+G,nv−G]`; and EVERY `d_j`, `j≠a`, lies outside
`(nu−G,nv+G)`. Include blocked rows and all zero rows. Endpoints may be
assigned consistently by closed inequalities. All actual addable boxes are
among these same-sector shadows, so the window selects exactly one edge.
There is no test on infinitely many opposite-sector zero-column ghosts;
the signed hook factor already incorporates that sector. On this event

```text
Δ_j≥2G,   Δ_j≥|j−a|,   λ_a≥G.
```

For `G≥1`, define `C_P=2/[√t(1−√t)(1−t)]`. Then

```text
0<P_a≤1/(1−t),
|P_a−1|≤C_P t^G,
|r_a−α_a|≤[α_a C_P+B/(1−t)]t^G.                            (B1)
```

Indeed each j<a factor is `1−u_j`, `u_j≤t^(Δ_j−1)`, and each
j>a factor is `1+v_j`, `v_j≤t^Δ_j`. The two gap bounds imply
`t^Δ_j≤t^G t^(|j−a|/2)`, hence the sum of the absolute factor
perturbations is at most `2t^G/[√t(1−√t)]`. The factors before a are
at most one; those after a decrease with Δ and their product is bounded by
`∏_(k≥1)(1−t^(k+1))/(1−t^k)=1/(1−t)`. The telescoping difference
of finite products, followed by the convergent tail limit, proves(B1).

Prove `Prob(DirectGood(n,a,nδ))→1` for a fixed sufficiently small δ>0
from the actual signed Schur law. Choose δ with α_a inside
`[u+3δ,v−3δ]`, every other positive limit outside `[u−3δ,v+3δ]`,
and `δ<u/4`. Choose fixed `K≥a` with `1/(K+1)<u/2`.
For all j>K, deterministically
`d_j/n≤λ_j/n≤(n−1)/(nj)≤1/j<u/2<u−δ`.
For j≤K the finite collection of fixed-row LLNs gives every margin with
probability tending to one. For a>1, the strict geometric gap gives
`λ_(a−1)>λ_a` with high probability, hence addability; row1 is always
addable. This controls all infinitely many row shadows without a growing
finite-color cutoff. Transpose supplies the separate column statement.

**Ordinary-Hilbert overlap in the actual signed carrier.** Fix exactly k
occurrences of the selected first positive color in n sites and put `l=n−k`.
An actual orthonormal word is uniquely a k-subset mask and its ordered rest
subword. This is a Hilbert unitary onto
`ℓ²({S⊆{1,…,n}:|S|=k})⊗K_rest^⊗l`. The generator matrices are
EXACTLY `Sh_k(K_rest^⊗l)` from H1's parabolic supplier: the selected block
has scalar Q, mixed blocks are `[[Q−1,−√Q],[−√Q,0]]`, and rest/rest
acts by the consecutive rest generator. The literal P is `1_(1∈S)⊗1`.
A unitary rest-module decomposition extends by identity on masks and preserves
P. Arbitrary rest signs are therefore spectator multiplicities of ordinary
finite Hecke simples, with no assumed signed-supergroup decomposition.

Use the FIRST-site JM recursion

```text
X_1=1,    X_n=Q⁻¹R_1 X_(n−1)^tail R_1.
```

Generator reversal of H1's ordinary JM preserves central Young labels; prove
this by the finite braid longest-element conjugation. It centralizes the
shifted tail and has eigenvalue `Q^content(Λ/λ)` on its full/tail edge.
Writing `E_rest=1−P`, prove the exact ordinary-Hilbert operator identity

```text
E_rest X_n E_rest=I_(tail masks of size k)⊗X_l(rest).          (JM)
```

When l=0 the compressed space is zero; for k=0 it is the defining rest
identity. Induct on n, on every first-rest mask. If physical site2 is selected,
the rightmost R_1 has zero diagonal on rest/selected and must swap with
coefficient `−√Q`. The tail operator keeps site1 selected. To survive the
final E_rest, site2 must return rest and the left R_1 must swap back.
The tail's first-rest compression is the inductive identity, the mask is
restored, and the two swaps cancel Q⁻¹. If site2 is rest, the right R_1 is
the first rest generator. A tail output with site2 selected is killed by the
final E_rest, again by the zero diagonal; on the surviving rest output,
induction gives the remaining rest JM recursion. Thus the output is
`Q⁻¹g_1^rest X_(l−1)^(rest tail)g_1^rest=X_l(rest)`.
The two cases have no cross terms and preserve every later mask coordinate.
The selected color being least in R-order is essential to this proof.

For a rest simple `S^ν`, fix a tail shape λ and write its isotypic space
unitarily as `S^λ⊗M_λ`. P and X act on M_λ. If ν interlaces λ
(`λ_j≥ν_j≥λ_(j+1)`), the first-selected subspace is
`Sh_(k−1)(S^ν)`, so H1's ordinary parabolic Pieri makes P on M_λ
an actual rank-one ORTHOGONAL projection `vv*`, `‖v‖=1`.
Full Pieri and one-box restriction give X the simple active eigenvalues
`x_a=Q^(λ_a+1−a)` for `Λ=λ+e_a` interlacing ν. Identity(JM) and
rest restriction give its orthogonal-complement compression the active
eigenvalues `y_j=Q^(ν_j−j)` when `μ=ν−e_j` and λ/μ is a
horizontal strip. These are spectra of the actual operators, not a count
of formal dimensions.

Pad λ to length R and ν to R−1. Precisely,
`J={j:ν_j>λ_(j+1)}` and `I={1}∪{j+1:j∈J}` are the complement
and full spectra. The inequalities imply actual removability/addability:
`ν_j>λ_(j+1)≥ν_(j+1)` and `λ_j≥ν_j>λ_(j+1)`.
For j outside J, `y_j=x_(j+1)` is an inactive matched pair. Thus
`|I|=|J|+1`; padded zeros introduce only cancelling pairs.
The orthogonal rank-one resolvent cofactor identity gives

```text
⟨v,(z−X)⁻¹v⟩=det(z−E_rest X E_rest|v^⊥)/det(z−X)
             =∏_(j∈J)(z−y_j)/∏_(i∈I)(z−x_i).
```

Residues at x_a are the ACTUAL probabilities `‖E_(x_a)v‖²`.
Insert the inactive matched pairs and divide each factor by x_a to obtain

```text
D_a(λ,ν)=∏_(j=1)^(R−1)(1−t^(λ_a−ν_j+j−a+1))
         /∏_(i=1,i≠a)^R(1−t^(λ_a−λ_i+i−a)).               (D)
```

No denominator exponent is zero for a partition λ: it is negative for i<a
and positive for i>a. On interlacing ν, inactive branches have a zero
numerator and active branches give the orthogonal compression scalar, hence
`0≤D_a≤1`. If ν interlaces `Λ=λ+e_1` but not λ, exactly
`ν_1=Λ_1=λ_1+1`; the first-selected tail range is absent and D_1 is
zero, also given by its first numerator factor. Treat this separately rather
than asserting rank one there. k=0 has P=0; l=0 has the single all-selected
row edge with scalar1, agreeing with the cancelled formula. This establishes
the Hilbert normalization without an unproved isometry of a Clebsch map.

**Restore the actual signed/countable density.** On each rest isotypic
component choose a unitary finite-Hecke decomposition

```text
K_rest^⊗l=⊕_ν S^ν⊗M_ν,
D_rest^⊗l=⊕_ν I_(S^ν)⊗d_ν,   Tr(d_ν)=s_ν(rest).
```

The last equality follows from the declared primitive-path marginal dictionary
by normalizing the remaining mass `1−A>0`: its geometric parameters are
`At/(1−A), B/(1−A)`, again summing to `1−t`. The normalized rest model
is therefore another actual H3 model. Multiply its degree-l trace by
`(1−A)^l` and use Schur homogeneity. For this unnormalized rest alphabet
`p_1=1−A`; do not reset it to1. This is not inferred from(D).
Under the mask unitary the density is `A^k I_masks⊗D_rest^⊗l`.
Each full/tail/rest edge contributes `A^k f^λ s_ν(rest)` and its
P-compression contributes that factor times D_1. Cancelling f^λ against
the full edge trace `f^λs_Λ(A;B)` proves the literal coefficient identity

```text
c_1(λ,Λ)=Σ_(ν interlaces Λ) π_Λ(ν)D_1(λ,ν),
π_Λ(ν)=A^(n−|ν|)s_ν(At;B)/s_Λ(A;B),   Λ=λ+e_1.             (W)
```

Even-letter Schur branching makes π a probability law. At fixed n there are
finitely many k and rest shapes, while the multiplicity spaces may be infinite;
normal nonnegative weighted traces pass to the countable carrier. Opposite
signs with equal numerical weights remain distinct letters. Thus(W) is the
actual first-site coefficient, not only a Schur marginal or matched rank.

**Uniform all-shape weighted tail.** In π fix `ν_2,ν_3,…`; then
`x=ν_1` ranges over the entire integer interval `[Λ_2,Λ_1]`.
The homogeneous hook ratio(H),(B), now with remaining parameters At,B, gives

```text
weight(x+1)/weight(x)=[t+(B/A)t^x] P_1(ν),
P_1(ν)≤1/(1−t^(x−ν_2+1)).
```

The inequality follows by comparing its factors to the telescoping product
with every lower row equal to ν_2. Therefore for `x≥Λ_2+L` the ratio
is at most `[t+(B/A)t^L]/[1−t^(L+1)]`. Put `ρ=(1+t)/2` and
choose a finite integer L0≥0 such that

```text
[(B/A)+ρt] t^L0≤(1−t)/2.
```

This makes the ratio at most ρ above `Λ_2+L0`. Its starting weight is
a term of the conditional normalizer, so a geometric sum, then averaging
over all lower rows, proves for every integer M≥0

```text
π_Λ(ν_1≥Λ_2+L0+M)≤ρ^M/(1−ρ).                              (T)
```

If the starting point exceeds Λ_1 the event is empty. Zero weights are
omitted; for A>0 the positive geometric remainder makes supported weights
positive. This bound is uniform in n, the ENTIRE partition, all interlacing
coordinates and blocked shadows, with B=0 included.

For the top edge write `H=Λ_1−Λ_2=λ_1−λ_2+1`. Every numerator
factor j≥2 in D_1 is at least its paired denominator factor i=j, since
`ν_j≤Λ_j=λ_j`; the final unpaired denominator is less than one.
Consequently the actual overlap satisfies
`1−D_1≤t^(Λ_1−ν_1)`. Split(W) at
`ν_1≥Λ_2+floor(H/2)` and use(T) on the upper part:

```text
1−c_1≤t^(H/2)
       +min(1,ρ^(max(0,floor(H/2)−L0))/(1−ρ)).              (M)
```

This is a weighted trace bound. It does not assert that every vector in the
edge range has small leakage or that `(1−P)q_edge` has small operator norm.

**Explicit constants, loss and literal membership.** For row1 on
DirectGood the exact shadow identity is
`H=d_1−d_2=λ_1−λ_2+1≥2G`, also when row2 is blocked or zero.
Set

```text
C_P=2/[√t(1−√t)(1−t)],
C_B=max(A C_P+B/(1−t),t⁻¹),
C_M=1+ρ^(−L0−1)/(1−ρ),
κ=log(ρ)/log(t)>0,    C_loss=C_B+2C_M.
```

On DirectGood, for ALL G≥0,

```text
|r_*−A|≤C_B t^G,
r_*(1−c_*)≤C_M ρ^G=C_M t^(κG),
ell_λ:=Σ_(Λ)r_(λ,Λ)(c_1(λ,Λ)−f(λ,Λ))²≤C_loss ρ^G.         (L)
```

For G≥1 the branch bound is(B1); for G<1, `|r_*−A|≤1` and the
`t⁻¹` term covers it. For `G≥L0+1`, `floor(H/2)≥G−1` in(M)
and `t≤ρ` prove the mixed bound; for `G≤L0+1` the trivial
`r_*(1−c_*)≤1` is dominated by the displayed C_M. Thus no further
unspecified constant or shape restriction is hidden. The transition is the
actual normalized Schur probability, so r_*≤1.

Here f is the indicator of the positive A-window, and on DirectGood there
is exactly one f=1 edge. Positivity and the actual conditional color identity
`Σ_Λ r_(λ,Λ)c_1(λ,Λ)=A` give

```text
ell_λ≤A−r_*+2r_*(1−c_*)≤|r_*−A|+2r_*(1−c_*).
```

On its complement ell_λ≤1. Average with the actual tail Schur law and
put G=nδ to obtain
`Loss_n≤C_loss ρ^(nδ)+Prob(not DirectGood(n,1,nδ))→0`.
This proves both required estimates and the full loss in the complete
countable state; it uses no retained mass, finite-color typicality or
normalization by an omitted tail.

Use the finite tracial centralizer C and its exact edge expansion above.
For the window projection F_n in B_n,
`‖E_(B_n)(P)−F_n‖₂²=Loss_n`. Consume
[VonNeumannAlgebras V11](https://github.com/TauCetiProject/TauCetiRoadmap/blob/35847ab4e112983b041cea50b15848e736f3264e/TauCetiRoadmap/VonNeumannAlgebras/README.md#v11-weights-connes-invariants-and-continuous-cores)'s trace-specialized Takesaki expectation and composition laws,
and [V6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/35847ab4e112983b041cea50b15848e736f3264e/TauCetiRoadmap/VonNeumannAlgebras/README.md#v6-tracial-standard-form-and-semifinite-factors)'s tracial standard form/bounded L² completeness. Derive the needed
martingale limit explicitly: E_(B_n) is the orthogonal GNS projection onto
`L²(B_n)`; the projections are increasing and converge to the projection
onto `L²(B)`, since the union B_n is strongly dense in B by
[V1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/35847ab4e112983b041cea50b15848e736f3264e/TauCetiRoadmap/VonNeumannAlgebras/README.md#v1-operator-topologies-and-the-bicommutant-theorem)'s bounded Kaplansky density. Thus E_(B_n)(P)→E_B(P) in L².
The bounded projections F_n have the same limit, and bounded L² multiplication
shows E_B(P)²=E_B(P). Faithfulness now gives

```text
E_B((P−E_B(P))*(P−E_B(P)))=E_B(P)−E_B(P)²=0,
```

hence the LITERAL `P=E_B(P)∈B`. No membership of P was assumed in its
coefficient, gap or expectation calculation. In the standard representation,
bounded L² convergence gives strong convergence F_n→P.

##### Deleting an already recovered first positive colour

Let P be the first positive colour projection, of weight p=A in(0,1), and suppose P belongs to B. The tensor shift is normal and preserves the Hecke algebra, so every site P_i belongs to B. Put E_i=1-P_i. Write q=sqrt(Q). The actual block gives the partial isometry

    V_i= -q^(-1) (E_i P_(i+1)) R_i (P_i E_(i+1)) in B.

On a deleted-colour/remaining-colour pair it is the LITERAL swap (1,b)->(b,1), with coefficient+1, for every remaining b. Its adjoint reverses this swap. Thus V_i*V_i=P_i E_(i+1), V_i V_i*=E_i P_(i+1). This uses only the already known P and R; it does not require knowing any remaining-colour projection. Both projections, R_i, and V_i preserve colour multiplicities, hence lie in the state centralizer.

Fix m>=1. For every increasing S=(j_1<...<j_m), with L=j_m, let

    C_S=product_(i in S) E_i product_(1<=i<=L,i notin S) P_i.

It specifies the FIRST m remaining-colour positions. These projections are pairwise orthogonal. Their sum is1 strongly: in the product state, fewer than m remaining positions has probability0 since1-p>0; faithfulness converts zero complementary state mass to the zero projection. This also follows from the convergent negative-binomial sum below.

Use adjacent V_i and V_i* to stably move the remaining letters at j_1,...,j_m to positions1,...,m. Each step crosses one deleted and one remaining letter. The resulting W_S in B is a partial isometry with initial C_S and final

    D_(m,L)=E_1...E_m P_(m+1)...P_L.

It preserves the order of all remaining letters, is the literal basis-word packing permutation on that range, and is in the state centralizer. The same stable packing is used for all m.

For x in B(K_rest^tensor m), extended by zero off the E_1...E_m range, define

    iota_m(x)=strong-sum_S W_S* [x tensor P^(tensor(L-m))] W_S.

Every summand is supported on C_S; therefore the sum exists strongly, is bounded by ||x||, and defines a unital *-homomorphism on the virtual m-site algebra. Refining the partition by the (m+1)-st remaining position gives exactly

    iota_(m+1)(x tensor1)=iota_m(x).

This is a basis-word identity, since stable packing preserves remaining-letter order. It constructs the whole virtual local tensor algebra, not only diagonal functions.

Let phi_rest be the normalized product state on remaining colours, with weights w_b/(1-p). By centralizer cyclicity for W_S,

    phi(W_S* [x tensor P^(L-m)] W_S)
       =(1-p)^m p^(L-m) phi_rest^m(x).

There are binomial(L-1,m-1) masks with last position L. The sum

    sum_(L>=m) binomial(L-1,m-1) (1-p)^m p^(L-m)=1

proves phi(iota_m(x))=phi_rest^m(x). The map preserves * and both state L2 norms.

For completeness, it extends normally to the full remaining product von Neumann algebra. For a bounded x, take its bounded local product-expectation approximants x_n, which converge in the state L2 norm together with their adjoints. Their images are uniformly bounded and state-L2 Cauchy. On the ambient standard-form Hilbert space, the product vector is separating, hence cyclic for the commutant. For any y' in that commutant,

    ||[iota(x_n)-iota(x_m)]y' Omega||
       <=||y'|| ||[iota(x_n)-iota(x_m)]Omega|| ->0.

Uniform boundedness then gives strong convergence on the whole Hilbert space; apply the same argument to adjoints. The resulting strong-* limit is independent of approximants, respects products, and preserves the faithful state. Monotone convergence of the state and faithfulness give normality. This is an explicit normal injective *-homomorphism; no assumed ambient cyclicity for the smaller algebra is used.

The virtual adjacent checked-R generator is iota_(r+1)(R_r^rest). Its packed block is

    [E_1...E_(r+1) P_(r+2)...P_L] R_r,

which lies in B and preserves the packed range. Conjugating by W_S and summing proves iota(R_r^rest) belongs to B. Hence normality gives iota(B_rest) subset B.

The first-positive membership theorem just proved applies to the normalized remaining model and gives its literal first-site first-positive projection P_b^rest in B_rest. Its image is

    iota(P_b^rest)=strong-sum_(j>=1) P_1...P_(j-1) (P_b)_j.

Multiplication by E_1 kills all j>1 terms and leaves (P_b)_1. Thus the NEXT literal first-site positive colour projection belongs to B. This is a proof of the necessary recovery step, not an assumption that the virtual first site is the original first site.

After deleting the first positive weight A, the normalized remaining geometric parameters are

    A_new=At/(1-A), B_new=B/(1-A),
    A_new+B_new=1-t.

The specified R-order remains positive omega followed by negative omega-star. Thus the same proved first-positive theorem applies again. Finite iteration recovers every fixed positive colour, while retaining the entire countable remaining alphabet at each step. No n-dependent finite truncation or vanishing retained-word mass occurs.

##### A compatible inversion gauge on the independently defined phase-fixed algebra

Let F be the full phase-fixed algebra, defined independently of B. On an n-letter word define J_n=(-1)^(inv(word)). For a local balanced matrix unit |u><v| with equal colour multiplicities, inv(u tail)-inv(v tail)=inv(u)-inv(v), because all inversions between the prefix and tail depend only on those common multiplicities. Hence conjugation by J_n is COMPATIBLE under x->x tensor1 on every local balanced matrix unit. These units span the finite phase-fixed algebras, and Haar averaging plus local approximation gives their weak density in F.

Each J_n commutes with the product density. The compatible conjugations therefore extend to a state-preserving normal *-automorphism of F, by the same bounded L2/adjoint approximation argument above. Every site colour projection is fixed. This construction does not assume F=B and does not claim J_n converges to a unitary on the entire ambient tensor algebra. Such a global unitary is unnecessary.

##### Recovering the negative sector at Q>1

Replace each generator by Q-1-R_i; this generates exactly the same unital algebra B. Relabel colours by reversing their total order and swap their positive/negative parity. The new positive sector is the OLD negative omega-star sector reversed into omega, with first weight B, and the new negative sector is the OLD positive omega sector reversed into omega-star, with first Thoma weight A.

Under the one-site order-reversing relabeling, the complement generator has block [[Q-1,+sqrt(Q)],[+sqrt(Q),0]] on the NEW ascending pair. Apply the compatible inversion gauge to change the off-diagonal sign to negative. Equal old-negative letters now have eigenvalue Q and equal old-positive letters eigenvalue-1. These are EXACTLY the required new signed checked-R matrices at the SAME Q, with geometric parameters (B,A). The phase-fixed state-preserving isomorphism sends the old B to the new B and literal old-negative colour projections to the corresponding new-positive ones.

If B>0, apply the first-positive theorem and the proved deletion construction in this new model to recover every old-negative projection. If B=0 there are no supported negative colours. This argument is independent of already recovering any positive projection in the original model; it merely uses the generator complement, order reversal, parity swap, and compatible phase-fixed gauge.

##### Reducing Q<1 to Q'>1

For Q<1 put Q'=1/Q. Keep the total colour order, swap parity, and consider -R_i/Q. On an ascending pair its block is [[Q'-1,+sqrt(Q')],[+sqrt(Q'),0]]. The same inversion gauge changes the off-diagonal sign to negative. Equal old-positive colours acquire eigenvalue-1, and equal old-negative colours acquire eigenvalue Q'. Thus this is the canonical new checked-R model with parameter Q'>1. The old Q<1 order was negative omega followed by positive omega-star, so after parity swap it is exactly the new positive omega / negative omega-star order. The geometric t is unchanged (t=Q=Q'^(-1)); the two Thoma lists exchange roles.

The state-preserving phase-fixed isomorphism takes B_old to B_new because each transformed generator is a nonzero scalar multiple of its new generator. It fixes literal colour projections up to their explicit relabeling. Therefore recovery of every projection for Q'>1 gives recovery for Q<1. The case Q=1 uses the separate finite-color and regular group branches below.

The construction recovers EVERY supported signed color at the literal first site,
for the complete continuous family and all `Q>0,Q≠1`. It proves the hypotheses
of the stationary-shift and balanced-matrix-unit argument above, hence `B=F`
and its generator-labeled tail equality. The finite discrete and scalar families
retain their preceding realization routes. All inclusion, relative-commutant,
corner, index and entropy calculations then apply on their stated carriers.
No conclusion about Q=1 or a unit-root fiber is inferred by deformation of this
infinite countable proof.

At `Q=1`, use the separate finite-color Schur–Weyl models for the two discrete traces and the regular `S_∞` carrier for the collapsed point. The latter uses the same specialization `α=β=0, γ=1` and ordinary Plancherel coherent law. Prove for each fixed `i,j` that `λ_i(n)/n→0` and `λ′_j(n)/n→0` almost surely by permutation-RSK and the Plancherel path law; this is not obtained from the `Q≠1` quantum-group weak-closure theorem. For the source projection parameter `η=0`, prove that every `e_i` is zero in the trace-GNS quotient; for `η=1`, prove that every `e_i` is one. In both cases identify the ambient algebra and its shifted tail with `ℂ`, and compute index `1` and relative entropy `0`. Compare these scalar endpoint statements and the nontrivial parameter families above with the source notation in the provenance paragraph below.

## Native comparison targets

At the pinned Tau Ceti source, `TauCeti.KnotTheory.jimboGenerator_mul_self` gives the Hecke
quadratic relation, `jimboGenerator_braid` gives the braid relation, and `jimbo` is a braid-group
representation. `jimboWeightedTrace` and its conjugation/skein lemmas are the finite-color Turaev
route. Its weighted partial-trace identities already prove the positive and negative crossing
contractions (`sum_jimboGenerator_coeff_mul_weight` and
`sum_jimboUnit_inv_coeff_mul_weight`); `jimboWeightedTrace_strandIncl` already proves the
uncrossed-strand factor. What remains is their general trace-level stabilization integration and
the writhe/strand-number normalization, not those local identities. The native Temperley–Lieb
`markovTrace` supplies the diagram-specialized trace. This roadmap proves explicit maps and
comparison theorems; these declarations are not a universal Hecke algebra, a generic Ocneanu trace,
or a positive-trace classification.

Mathlib's abstract Hecke-pair and double-coset convolution APIs concern a different carrier. They
do not supply this finite type-A q-Hecke presentation. The nearest owned operator-algebra
dependencies are the ordinary TL positivity roadmap and the general Subfactors roadmap. The
type-A Hecke material proves the presentation, trace and representation comparison maps without duplicating their diagram, GNS, or inclusion
foundations.

## Source notation for the final Wenzl remark

The final remark on printed p. 246 reads `R_(α,0)`, whereas printed p. 245 denotes the trace-GNS weak closure by `R_(τ,η)` and states it is `ℂ` at `η=0,1`. Under the literal assignment `τ=α, η=0`, the endpoint computation above gives the scalar identity inclusion, index `1` and relative entropy `0`. The print therefore does not specify a nontrivial Wenzl parameter fibre under the literal `(τ,η)=(α,0)` assignment. Preserve also the unresolved possibility that the subscript uses the hyperbolic parameter slots `(α,θ)` of H2. Under that interpretation, setting `θ=0` at a fixed finite real `α` gives `Q=e^(−2θ)=1` and the derived native projection parameter `η=½(1−tanh α tanh θ)=1/2`, hence the regular middle trace. This interpretation does not identify `(τ,η)` with `(α,θ)`. Do not choose between these readings from the subscript alone. The mathematical comparison targets use the explicit Hecke/Markov parameter maps and the real, root-of-unity and `Q=1` inclusions stated in H3–H4; both literal source alternatives are retained as qualified provenance.

## References and convention comparisons

- S. Sawin, *Subfactors Constructed from Quantum Groups*, Amer. J. Math. 117 (1995), no. 6, 1349–1369, [DOI 10.2307/2375022](https://doi.org/10.2307/2375022), especially §1, Theorem 1, §3, Theorem 3 and Proposition 9. The finite type-A fundamental checked-`R` equality uses the Casimir criterion; general quantum-group representations do not have this equality.
- V. Féray and P.-L. Méliot, *Asymptotics of q-Plancherel measures*, Probab. Theory Related Fields 152 (2012), 589–624, [arXiv:1001.2180](https://arxiv.org/abs/1001.2180), Theorem 1: for `0<q<1`, row limits are `(1−q)q^(i−1)`; transpose gives the `q>1` column statement. This is an independent endpoint check of the geometric Thoma specialization.
- Yu. A. Neretin, *Some remarks on traces on the infinite-dimensional Iwahori–Hecke algebra*, [arXiv:2101.02133](https://arxiv.org/abs/2101.02133), §§1.6–1.7 and §3.1 for the signed character and product model. Its larger diagonal/site-permutation algebra is not thereby identified with the Hecke weak closure.
- S. V. Kerov, *A q-analogue of the hook walk algorithm*, §4.2 “Random knot tableaux,” printed pp. 128–129, for the coherent Young-graph transition `s_Λ(α;β)/s_λ(α;β)` shared by characters of `S_∞` and `H_∞(Q)`, `Q>0`; Yu. A. Neretin, *Some remarks on traces on the infinite-dimensional Iwahori–Hecke algebra*, Theorem 1.1, equations (1.7)–(1.8), and §3.3, for the exact `Q`-dependent Hecke-cycle trace and its `α,β,γ` parameterization.
- For the finite symmetric-group carrier consumed by H4a, use [RepresentationTheory/SchurWeyl Layer 7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/149fe79fc7f66b28ec635f15ec6553c7eff79b17/TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md#layer-7-symmetric-functions-the-frobenius-characteristic-and-rsk), which owns symmetric functions, the Frobenius map, standard tableaux and ordinary RSK; H4a owns only the signed specialization and Hecke/Young-path/operator adapters. The empirical singleton-frequency API is owned by [Exchangeability](../../Completed/Exchangeability/README.md#layer-6-directing-measures-and-de-finetti-representation).

- V. F. R. Jones, *Hecke Algebra Representations of Braid Groups and Link Polynomials*,
  Ann. Math.126 (1987),335–388, [DOI10.2307/1971403](https://doi.org/10.2307/1971403),
  Theorem5.1 for algebraic Ocneanu traces; §§11–14 for the ordinary Jones quotient and its
  positive trace. The latter concerns the extra relation (11.6).
- H. Wenzl, *Hecke algebras of type A_n and subfactors*, *Invent. Math.* 92 (1988), 349–383, [DOI 10.1007/BF01404457](https://doi.org/10.1007/BF01404457), §§2–3 for tableau representations, positive trace classification and subfactor examples. Preserve the literal discrepancies checked on printed pp. 379–383: Theorem 3.6(b) and the p. 380 setup print `q=e^{±2πi/l}`, while Theorem 3.7 prints `q=e^{±πi/l}`; Theorem 3.7(a) prints denominator `sin²(π/l)`, while its m>1 proof and printed pp. 381–382 give `sin^(2m)(π/l)`. The context-supported target uses angle `2π/l` and denominator exponent `2m`; this is an explicit mathematical correction, not a claim about an author's erratum. The p. 380 setup labels its discrete parameter `a_k(q)`, whereas Theorem 3.6(b) states `a_(−k)(q)`; retain this sign discrepancy and prove the native/Wenzl projection-convention dictionary rather than suppressing either line. Distinguish our native `q` in `Q=q²` from Wenzl's symbol; do not silently identify them.
- P. Freyd et al., *A new polynomial invariant of knots and links*, Bull.AMS12 (1985),239–246,
  as transcribed on course-note physical pp. 87–89. The printed parameter line contains `tan θ` and the tuple
  `P_b(e^α,−e^(−α),2i sinh θ)`. The negative second HOMFLY parameter is also transcribed. The
  printed exceptional set is `(4 cos(π/n))^(−1)` with unsquared cosine, and the exceptional-point bound is `1≤k≤[(m−1)/2]` with literal square brackets. Preserve these literals; the squared-cosine and full complementary-state theorem follows from the algebraic/positive-trace argument in H3. The target theorems above derive
  their mathematical conventions from the operator blocks and both stabilization identities.
