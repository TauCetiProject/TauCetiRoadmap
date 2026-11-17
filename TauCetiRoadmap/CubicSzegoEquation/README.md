# Roadmap: the cubic Szegő equation

**Summary.** Develop the Hamiltonian evolution

\[
  i\partial_t u = \Pi(|u|^2u)
\]

on the nonnegative-frequency Hardy space of the circle. Starting from the global
\(H^{1/2}\) Cauchy theory, build the antilinear Hankel operator and its Lax pair,
the commuting spectral invariants and invariant finite-rank rational manifolds.
On the three-complex-dimensional constrained manifold \(\widetilde M(1)\),
derive the explicit flow and the high-Sobolev norm-growth example. The roadmap
specifies the cubic Szegő equation, not a general theory of nonlinear
Schrödinger equations.

## Scope and ownership

The primary source is Gérard and Grellier's *The cubic Szegő equation*. This
roadmap formalizes its global \(H^{1/2}\) flow, the Hankel-operator Lax
representation, the finite-rank completely integrable hierarchy, and the
explicit \(\widetilde M(1)\) dynamics and instability. The specified targets
are the mathematical content of those results, not a transcription of the
paper's proofs.

The [Toeplitz operators roadmap](../OperatorTheory/ToeplitzOperators/README.md)
owns the Hardy and Toeplitz operator calculus. Its current Tau Ceti suppliers
include the boundary Hardy subspace and projection; this roadmap consumes that
carrier and constructs the cubic equation's antilinear Hankel operator. The
two Hankel operators must not be conflated: Tau Ceti's
\(H_a=(1-\Pi)M_a|_{H^2}\) is complex-linear with negative-frequency codomain,
whereas the source's
\[
  H_u h = \Pi(u\overline h)
\]
is antilinear, has \(H^2\) codomain, and has Fourier matrix
\(\widehat u(j+k)\). Construct the conjugation/Hardy identification explicitly;
do not claim that one operator is already the other.

The [operator ideals roadmap](../OperatorTheory/OperatorIdeals/README.md)
supplies the Hilbert–Schmidt and trace-class interfaces. Use the existing Tau
Ceti Hilbert–Schmidt and Hardy APIs where their carriers and hypotheses match.
The Hilbert–Schmidt identity for \(H_u\), its antilinear operator algebra, and
the Lax generator are this roadmap's adapters and targets.

The half-line Dirac and SU(1,1) nonlinear Fourier transform in
[DiracScatteringAndNonlinearFourierTransform](../DiracScatteringAndNonlinearFourierTransform/README.md)
is not a prerequisite: the cubic Szegő equation is posed on the circle and its
Hardy projection is the circle Fourier projection. It is not a target here to
build Dirac scattering or a nonlinear Fourier transform.

This roadmap does not cover the cubic nonlinear Schrödinger equation, the
Grushin equation, the complete classification of traveling waves, inverse
spectral/action-angle coordinates, or a flow on \(BMO_+\). It makes no claim
that a bounded orbit has unbounded Sobolev norm: the norm-growth target is a
family of smooth initial data and times tending to infinity.

## Conventions

- Identify \(S^1\) with `AddCircle (1 : ℝ)` and use the normalized Haar
  probability measure. Write \(z(t)=\exp(2\pi i t)\), \(e_n=z^n\), and
  \(\widehat u(n)=\int_{S^1}u\overline{e_n}\). This is the period-one
  convention in `OperatorTheory/ToeplitzOperators`.
- \(H^2_+\) is the closed span of \(e_n\), \(n\geq0\), in circle \(L^2\);
  \(\Pi\) is the orthogonal projection onto it. Every projection and Fourier
  coefficient in this roadmap uses that normalization.
- Represent \(H^{1/2}_+\) by sequences \((\widehat u(n))_{n\geq0}\) with
  \[
    \|u\|_{H^{1/2}}^2
      = \sum_{n\geq0}(n+1)|\widehat u(n)|^2 < \infty.
  \]
  Equivalently, use the \(\ell^2\) sequence
  \((\sqrt{n+1}\,\widehat u(n))_{n\geq0}\). This is the norm \(Q(u)+M(u)\)
  in the source.
- The \(L^2\) inner product is conjugate-linear in its first argument. The
  operator \(H_u\) is complex-antilinear and real-linear; \(H_u^2\) is
  complex-linear. State all operator domains and codomains explicitly.
- For \(s\geq0\), use
  \(\|u\|_{H^s}^2=\sum_{n\geq0}(n+1)^{2s}|\widehat u(n)|^2\). Translate the
  paper's linear-in-the-first inner product to Mathlib's convention; in
  particular its symplectic form is
  \(\omega(u,v)=-4\,\operatorname{Im}\langle u,v\rangle\) here.
- The conserved mass and momentum are
  \(Q(u)=\sum_{n\geq0}|\widehat u(n)|^2\) and
  \(M(u)=\sum_{n\geq0}n|\widehat u(n)|^2\). Use \(D e_n=n e_n\).
- The source's \(M(N)\) consists of reduced \(A/B\) with
  \(\deg A\leq N-1\), \(\deg B\leq N\), \(B(0)=1\), and either
  \(\deg A=N-1\) or \(\deg B=N\); \(A,B\) are coprime and \(B\) has no zero
  on the closed unit disk. The rank is the complex dimension of the range
  of the antilinear Hankel operator. The constrained manifold
  \(\widetilde M(N)\) has the source's definition
  \(\{u\in M(N+1):1\in\operatorname{range}(H_u)\}\).
- A solution is continuous with values in \(H^{1/2}_+\), and its time
  derivative in the equation is an \(L^2\)-valued derivative. Do not silently
  assert differentiability in \(H^{1/2}\).

## Exact supplier contracts

### Mathlib

- `fourier`, `fourierCoeff`, `fourierBasis`, and
  `span_fourierLp_closure_eq_top` in
  `Mathlib/Analysis/Fourier/AddCircle.lean` supply normalized Fourier
  coefficients, the circle basis and density.
- `Lp ℂ 2`, `lp` at exponent \(2\), Parseval and the Hilbert-space inner
  product supply the circle and sequence carriers. The weighted coefficient
  equivalence above is constructed here.
- `Submodule.orthogonalProjectionOnto` supplies projection onto the closed
  Hardy subspace. `ContinuousLinearMap.holderL` supplies only those products
  whose stated \(L^p\) exponents meet its hypotheses; it does not by itself
  prove the endpoint \(H^{1/2}\) estimates.

### Tau Ceti and roadmap dependencies

- The current Tau Ceti Fourier/Hardy implementation supplies circle Fourier
  and Hardy operations: `TauCeti.hardySubmodule`, `TauCeti.HardySpace`,
  `TauCeti.hardyBasis`, and its orthogonal projection are in
  `TauCeti/Analysis/Fourier/Hardy/Basic.lean`. Its `TauCeti.hankel` in
  `TauCeti/Analysis/Fourier/Hardy/Hankel.lean` is complex-linear into the
  negative-frequency complement, not the source's antilinear \(H_u\).
  `TauCeti.toeplitz`, `TauCeti.norm_toeplitz`, and
  `TauCeti.isCompactOperator_toeplitz_comp_sub_toeplitz_toLp` are part of the
  existing `TauCeti/Analysis/Fourier/Hardy` API. Consume them only for the
  symbols and operator types they state.
- The current operator-ideal API supplies Hilbert–Schmidt and trace-class
  families, including `TauCeti.OperatorIdealFamily.hilbertSchmidt`, adjoints,
  ideal bounds and compactness. Use the Hilbert–Schmidt family for the
  column-energy formula below; the source-specific antilinear \(H_u\) still
  needs its own real-linear construction and comparison.
- `OperatorTheory/ToeplitzOperators` owns the Hardy subspace, Fourier unitary,
  projection and Toeplitz operators. `OperatorTheory/OperatorIdeals` owns the
  general Hilbert–Schmidt and trace-class theory. This roadmap depends on those
  contracts, not on changes to Mathlib.
- No dependency is placed on the open Dirac/scattering PR: its upper-half-plane
  Hardy and scattering carriers do not supply the circle equation.

## Layer 1: the circle Hardy and \(H^{1/2}\) carriers

Build the weighted coefficient representation and its continuous inclusion
into \(H^2_+\). Prove the coefficient formula for \(\Pi\), Parseval, completeness
and compatibility with the native circle \(L^2\) carrier. Prove the
Trudinger-type estimate
\[
  \|u\|_{L^p(S^1)} \leq C\sqrt p\,\|u\|_{H^{1/2}}
  \qquad(2\leq p<\infty),
\]
with a constant independent of \(p\). Establish the multiplication and
projection bounds needed to interpret \(u\mapsto\Pi(|u|^2u)\) as an \(L^2\)
vector field on \(H^{1/2}_+\), and its local Lipschitz estimates in \(H^s_+\)
for \(s>1/2\).

**Checks.**

- \(e_n\) has \(H^{1/2}\)-norm squared \(n+1\); in particular \(e_0\) and
  \(e_1\) have squared norms \(1\) and \(2\).
- \(\Pi(e_{-1})=0\), \(\Pi(e_0)=e_0\), and \(\Pi(e_1)=e_1\).
- The cubic term is \(L^2\)-valued for every \(H^{1/2}\) input; do not infer
  that it is \(H^{1/2}\)-valued.

*Source:* Gérard–Grellier, §2, pp. 768–770 and Appendix 3, §10.3,
pp. 808–809.

## Layer 2: the Cauchy problem and global flow

For \(s>1/2\), prove local well-posedness in \(H^s_+\) by the locally
Lipschitz cubic vector field. Prove conservation of \(Q\), \(M\), and the
Hamiltonian
\[
  E(u)=\int_{S^1}|u|^4.
\]
Use \(Q+M=\|u\|_{H^{1/2}}^2\), the Brezis–Gallouët estimate and Grönwall to
continue every \(H^s\) solution globally.

For initial data in \(H^{1/2}_+\), construct global weak solutions by
approximation from \(H^s_+\), prove uniqueness using the Trudinger estimate,
and show strong continuity and continuous dependence in \(H^{1/2}_+\).
Prove the group law and time reversal for the resulting global flow. The
headline target is the source's Theorem 2.1: for every \(u_0\in H^{1/2}_+\)
there is a unique \(u\in C(\mathbb R,H^{1/2}_+)\) solving the equation with
\(u(0)=u_0\); the flow map is continuous, and \(H^s_+\) regularity persists
for \(s>1/2\).

**Checks.**

- For \(u_0=c e_0\), \(u(t)=c\,e^{-i|c|^2t}e_0\).
- For \(u_0=e_n\), \(u(t)=e^{-it}e_n\), since \(\Pi(|e_n|^2e_n)=e_n\).
- \(Q+M\) is preserved. Use this equality, not \(Q\) alone, as the
  \(H^{1/2}\) bound.
- State the \(H^{1/2}\) uniqueness argument for weak solutions; a uniqueness
  proof only for \(s>1/2\) does not discharge the headline theorem.

*Source:* Gérard–Grellier, Theorem 2.1, pp. 768–770; the Brezis–Gallouët
estimate is Appendix 2, §10.2, pp. 807–808.

## Layer 3: analytic Hankel operators and the Lax pair

For \(u\in H^{1/2}_+\), define the real-linear operator
\[
  H_u:H^2_+\to H^2_+,\qquad H_u(h)=\Pi(u\overline h).
\]
Prove complex-antilinearity, symmetry for the real inner product, and the
Fourier formula
\[
  \widehat{H_u h}(k)=\sum_{\ell\geq0}\widehat u(k+\ell)
       \overline{\widehat h(\ell)}.
\]
Show that \(H_u\) is Hilbert–Schmidt and
\[
  \|H_u\|_{\mathrm{HS}}^2
    =\sum_{n\geq0}(n+1)|\widehat u(n)|^2=Q(u)+M(u).
\]
Prove the product identity, with the exact operator order,
\[
  H_{\Pi(|u|^2u)}
    =T_{|u|^2}H_u+H_uT_{|u|^2}-H_u^3.
\]
For \(u\in C(\mathbb R,H^s_+)\), \(s>1/2\), prove the Lax equation
\[
  \partial_tH_u=[B_u,H_u],\qquad
  B_u=\frac{i}{2}H_u^2-iT_{|u|^2},
\]
and prove \(B_u\) is skew-adjoint in the real Hilbert-space formulation.
Integrate the operator equation to unitary equivalence of \(H_{u(t)}\) and
\(H_{u(0)}\). Define
\[
  J_n(u)=\langle 1,H_u^n1\rangle
\]
in Mathlib's conjugate-linear-first convention, and derive the source's
identities \(dJ_{2k}/dt=0\) and \(i\,dJ_{2k-1}/dt=J_{2k+1}\) from the Lax
commutator and \(B_u(1)=-\frac{i}{2}H_u^2(1)\). Use isospectrality for
singular-value and trace consequences, not as the sole proof of conservation
of \(J_{2k}\). Specify the real/complex scalar structures at each step; the
antilinear \(H_u\) is not a complex-linear operator on \(H^2_+\).

**Checks.**

- For \(u=e_0\), \(H_u\) has rank one and Hilbert–Schmidt norm squared \(1\).
- For \(u=e_1\), \(H_u\) has rank two and Hilbert–Schmidt norm squared \(2\).
- The source identity has the order
  \(T_{|u|^2}H_u+H_uT_{|u|^2}-H_u^3\); changing the order or the last sign
  fails on finite Fourier sums.
- Along smooth solutions the singular values are constant by isospectrality;
  the even \(J_{2n}\) are constant by the Lax identity and the evolution of
  \(1\).
- \(J_2=Q\) and \(J_4=(E+Q^2)/2\).

*Source:* Gérard–Grellier, Theorem 3.1, pp. 770–772; Corollaries 1–3,
pp. 772–773.

## Layer 4: finite-rank manifolds and commuting Hamiltonians

For \(N\geq1\), define \(M(N)\) by the rational functions in the conventions.
Prove that \(M(N)\) is a smooth complex manifold of dimension \(2N\) and that
its elements are exactly the symbols for which \(H_u\) has complex rank \(N\).
Prove invariance of \(M(N)\) under the cubic flow from the Lax equation.
Write the reduced ODE in rational coordinates on the locus of distinct poles,
and prove compatibility across the charts where poles collide.

Define the sequence \(J_n(u)=\langle 1,H_u^n1\rangle\), translating the
paper's inner product to Mathlib's conjugate-linear-first convention. Prove
that for \(s>1\) the Hamiltonian vector fields of \(J_{2n}\) generate global
flows on \(H^s_+\), their Hankel operators have Lax equations, and
\[
  \{J_{2n},J_{2p}\}=0.
\]
Prove the source's genericity statements: outside closed measure-zero subsets,
\(J_2,J_4,\ldots,J_{4N}\) are independent on \(M(N)\), and the restricted
Hamiltonian flow is Liouville integrable. Prove that \(\widetilde M(N)\) is
the corresponding complex manifold of dimension \(2N+1\), and that outside a
closed measure-zero subset \(J_2,J_4,\ldots,J_{4N+2}\) are independent there,
the separate \(2N+1\)-integral count. Deduce quasi-periodicity for generic
initial data in both manifolds; do not conflate the two dimension counts.

The rank criterion uses the finite-rank Hankel/Kronecker theorem. Its converse
must account for zero poles and repeated poles, not only the generic chart.
The invariant manifold and integrability targets are the source's Theorems
4.1 and 1.2, with the commuting and independence proofs in §8. The global
hierarchy flows and Poisson commutation are Corollary 8; generic independence
and quasi-periodicity are Corollary 9.

**Checks.**

- \(M(1)\) contains the nonzero constants and has Hankel rank one.
- Rank \(N\) means complex rank \(N\), not real rank \(N\); the operator is
  antilinear over \(\mathbb C\).
- The rank-two symbol \(z\) lies in \(M(2)\), not \(M(1)\).
- On the generic rational chart
  \(u(z)=\sum_{j=1}^N\alpha_j/(1-p_jz)\), the reduced equations preserve
  distinct-pole coordinates' rational-function class and all source
  invariants.

*Source:* Gérard–Grellier, Theorem 4.1, pp. 773–775; Theorem 1.2, p. 766;
§8, pp. 788–791; Proposition 11, Appendix 4, pp. 809–810.

## Layer 5: explicit \(\widetilde M(1)\) dynamics and Sobolev norm growth

Define \(\widetilde M(1)\) using the preceding invariant-manifold layer and
prove that its elements have the source's form
\[
  u(z)=\frac{az+b}{1-pz},\qquad a,b,p\in\mathbb C,\quad
  a\ne0,\quad |p|<1,\quad a+bp\ne0.
\]
Derive the finite-dimensional ODE and its conserved quantities. Solve it
explicitly, including the stationary case and the oscillation of \(|p(t)|\)
in the nonstationary case. Prove the exact extrema of \(|p(t)|\) from the
invariants and use them to bound the \(H^s\) norm on each fixed trajectory
for \(s>1/2\).

Then prove the source's instability statement: there are smooth initial data
\(u_0^\epsilon\in\widetilde M(1)\), \(0<\epsilon<1\), converging in
\(C^\infty(S^1)\) to \(z\) and times \(t_\epsilon\to\infty\) such that, for
every \(s>1/2\),
\[
  \|u^\epsilon(t_\epsilon)\|_{H^s}\longrightarrow\infty
  \quad\text{as }\epsilon\to0.
\]
Establish the source's explicit example \(u_0^\epsilon=z+\epsilon\), the
time \(t_\epsilon=\pi/(\epsilon\sqrt{4+\epsilon^2})\), and the bound
\(\|u^\epsilon(t_\epsilon)\|_{H^s}\geq K_s t_\epsilon^{2s-1}\) for each fixed
\(s>1/2\) and sufficiently small \(\epsilon\), with the source's quantifiers.
This is growth across a family of trajectories; also prove the source's bound
on each individual trajectory so the two assertions are not confused.

**Checks.**

- For the stationary branch \(u_0=a(z-p)/(1-\overline p z)\), \(a\ne0\), the
  solution is \(e^{-iQt}u_0\) and \(|u_0|^2=Q\) on the circle.
- For \(u_0^\epsilon=z+\epsilon\), the data converge to \(z\) in every
  \(C^k\) norm, while the selected times tend to infinity and the \(H^s\)
  norms tend to infinity for each fixed \(s>1/2\).
- Do not conclude that one initial datum has an unbounded \(H^s\) orbit from
  this family statement.

*Source:* Gérard–Grellier, Theorem 1.3, pp. 766–767; Proposition 7 and
Corollary 5, §6, pp. 783–785.

## Dependencies and ordering

1. Use Mathlib's circle Fourier basis and projection, and
   `OperatorTheory/ToeplitzOperators`'s normalized \(H^2_+\) carrier before
   the weighted \(H^{1/2}\) construction.
2. The \(H^{1/2}\) estimates and global Cauchy theorem precede the
   Hilbert–Schmidt formula and the flow-level Lax equation.
3. The Hankel rank criterion precedes rational manifolds; Lax isospectrality
   proves their invariance.
4. The conserved hierarchy and symplectic structure precede finite-dimensional
   Liouville integrability.
5. The \(\widetilde M(1)\) chart and reduced ODE precede explicit dynamics and
   Sobolev norm growth.

Every item above is a required target. No target is conditional on upstream
Mathlib work; use Mathlib's existing carriers and vocabulary, and keep Tau
Ceti's implementation in Tau Ceti.

## References

- P. Gérard and S. Grellier, [*The cubic Szegő equation*](https://doi.org/10.24033/asens.2133),
  *Annales scientifiques de l'École Normale Supérieure*, Série 4, 43(5)
  (2010), 761–810. The article and PDF are available from
  [Numdam](https://www.numdam.org/articles/10.24033/asens.2133/). Theorem
  locators in this roadmap refer to the published pagination: Theorem 2.1,
  pp. 768–770; Theorem 3.1, pp. 770–772; Theorem 4.1, pp. 773–775;
  Theorem 1.2, p. 766 and §8, pp. 788–791; Theorem 1.3, pp. 766–767 and
  §6.2, pp. 784–785.
- Theorems using the Hardy, Toeplitz, Fourier or operator-ideal carriers also
  consume the supplier contracts named under [Exact supplier contracts](#exact-supplier-contracts);
  the paper's conventions for \(H_u\), the circle Fourier coefficients and
  the \(H^{1/2}\) norm control every adapter.
